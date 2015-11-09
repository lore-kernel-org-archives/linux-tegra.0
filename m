From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [tegrarcm PATCH 2/2] Add support for communicating with secured production devices
Date: Mon,  9 Nov 2015 18:19:46 +0100
Message-ID: <1447089586-24826-3-git-send-email-alban.bedel@avionic-design.de>
References: <1447089586-24826-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447089586-24826-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the support code needed to sign the RCM with RSA-PSS as needed
to communicate with secured production devices. This mode is enabled
by passing the --key command line argument. If such a key is set the
RCM messages will be signed with it.

This has only been tested on t124 and currently only allow reaching the
miniloader stage. The miniloader do works enouth to load the BCT and
bootloader via USB, but the handoff to the bootloader isn't working
yet.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 src/Makefile.am |  2 ++
 src/main.c      | 22 +++++++++++-----
 src/rcm.c       | 20 +++++++++++---
 src/rcm.h       |  2 +-
 src/rsa-pss.cpp | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/rsa-pss.h   | 15 +++++++++++
 6 files changed, 132 insertions(+), 10 deletions(-)
 create mode 100644 src/rsa-pss.cpp
 create mode 100644 src/rsa-pss.h

diff --git a/src/Makefile.am b/src/Makefile.am
index 4b54885..3dad0e6 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -8,6 +8,8 @@ tegrarcm_SOURCES = \
 	nv3p.c \
 	debug.c \
 	rcm.c \
+	rsa-pss.cpp \
+	rsa-pss.h \
 	aes-cmac.cpp \
 	aes-cmac.h \
 	debug.h \
diff --git a/src/main.c b/src/main.c
index b024562..eec7f27 100644
--- a/src/main.c
+++ b/src/main.c
@@ -60,7 +60,7 @@
 // tegra124 miniloader
 #include "miniloader/tegra124-miniloader.h"
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb);
+static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile);
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
@@ -81,6 +81,7 @@ enum cmdline_opts {
 	OPT_VERSION,
 	OPT_MINILOADER,
 	OPT_MINIENTRY,
+	OPT_KEYFILE,
 #ifdef HAVE_USB_PORT_MATCH
 	OPT_USBPORTPATH,
 #endif
@@ -123,6 +124,10 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tminiloader\n");
 	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
 	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
+	fprintf(stderr, "\t--key=<key.ber>\n");
+	fprintf(stderr, "\t\tSpecify the key file for secured devices. The key should be\n");
+	fprintf(stderr, "\t\tin DER format\n");
+
 	fprintf(stderr, "\n");
 }
 
@@ -175,6 +180,7 @@ int main(int argc, char **argv)
 	int do_read = 0;
 	char *mlfile = NULL;
 	uint32_t mlentry = 0;
+	char *keyfile = NULL;
 #ifdef HAVE_USB_PORT_MATCH
 	bool match_port = false;
 	uint8_t match_bus;
@@ -191,6 +197,7 @@ int main(int argc, char **argv)
 		[OPT_VERSION]    = {"version", 0, 0, 0},
 		[OPT_MINILOADER] = {"miniloader", 1, 0, 0},
 		[OPT_MINIENTRY]  = {"miniloader_entry", 1, 0, 0},
+		[OPT_KEYFILE]    = {"key", 1, 0, 0},
 #ifdef HAVE_USB_PORT_MATCH
 		[OPT_USBPORTPATH]  = {"usb-port-path", 1, 0, 0},
 #endif
@@ -229,6 +236,9 @@ int main(int argc, char **argv)
 			case OPT_MINIENTRY:
 				mlentry = strtoul(optarg, NULL, 0);
 				break;
+			case OPT_KEYFILE:
+				keyfile = optarg;
+				break;
 #ifdef HAVE_USB_PORT_MATCH
 			case OPT_USBPORTPATH:
 				parse_usb_port_path(argv[0], optarg,
@@ -308,7 +318,7 @@ int main(int argc, char **argv)
 			error(1, errno, "USB read truncated");
 
 		// initialize rcm
-		ret2 = initialize_rcm(devid, usb);
+		ret2 = initialize_rcm(devid, usb, keyfile);
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
@@ -369,7 +379,7 @@ int main(int argc, char **argv)
 	return 0;
 }
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb)
+static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile)
 {
 	int ret;
 	uint8_t *msg_buff;
@@ -381,13 +391,13 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb)
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
 	    (devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30) {
 		dprintf("initializing RCM version 1\n");
-		ret = rcm_init(RCM_VERSION_1);
+		ret = rcm_init(RCM_VERSION_1, keyfile);
 	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
 		dprintf("initializing RCM version 35\n");
-		ret = rcm_init(RCM_VERSION_35);
+		ret = rcm_init(RCM_VERSION_35, keyfile);
 	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
 		dprintf("initializing RCM version 40\n");
-		ret = rcm_init(RCM_VERSION_40);
+		ret = rcm_init(RCM_VERSION_40, keyfile);
 	} else {
 		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
 		return errno;
diff --git a/src/rcm.c b/src/rcm.c
index cb53d8f..c7f0f8d 100644
--- a/src/rcm.c
+++ b/src/rcm.c
@@ -32,6 +32,7 @@
 #include <errno.h>
 #include "rcm.h"
 #include "aes-cmac.h"
+#include "rsa-pss.h"
 
 static int rcm_sign_msg(uint8_t *buf);
 static int rcm1_sign_msg(uint8_t *buf);
@@ -72,8 +73,9 @@ static uint32_t rcm_get_msg_buf_len(uint32_t payload_len);
 
 static uint32_t rcm_version = 0;
 static uint32_t message_size = 0;
+static const char *rcm_keyfile = NULL;
 
-int rcm_init(uint32_t version)
+int rcm_init(uint32_t version, const char *keyfile)
 {
 	int ret = -EINVAL;
 
@@ -92,6 +94,9 @@ int rcm_init(uint32_t version)
 		message_size = sizeof(rcm40_msg_t);
 		ret = 0;
 	}
+
+	rcm_keyfile = keyfile;
+
 	return ret;
 }
 
@@ -197,7 +202,11 @@ static int rcm35_sign_msg(uint8_t *buf)
 		return -EMSGSIZE;
 	}
 
-	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+	if (rcm_keyfile)
+		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
+			msg->object_sig.rsa_pss_sig, msg->modulus);
+	else
+		cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
 	return 0;
 }
 
@@ -217,7 +226,12 @@ static int rcm40_sign_msg(uint8_t *buf)
 		return -EMSGSIZE;
 	}
 
-	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+	if (rcm_keyfile)
+		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
+			msg->object_sig.rsa_pss_sig, msg->modulus);
+	else
+		cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+
 	return 0;
 }
 
diff --git a/src/rcm.h b/src/rcm.h
index ab4bea2..6be62f7 100644
--- a/src/rcm.h
+++ b/src/rcm.h
@@ -110,7 +110,7 @@ typedef struct {
 #define RCM_OP_MODE_ODM_SECURE      0x4
 #define RCM_OP_MODE_ODM_OPEN        0x5
 
-int rcm_init(uint32_t version);
+int rcm_init(uint32_t version, const char *keyfile);
 uint32_t rcm_get_msg_len(uint8_t *msg);
 int rcm_create_msg(
 	uint32_t opcode,
diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp
new file mode 100644
index 0000000..d43cb44
--- /dev/null
+++ b/src/rsa-pss.cpp
@@ -0,0 +1,81 @@
+#include <iostream>
+using std::cout;
+using std::cerr;
+using std::endl;
+
+#include <iomanip>
+using std::hex;
+
+#include <string>
+using std::string;
+
+#include <cstdlib>
+using std::exit;
+
+#include "cryptlib.h"
+using CryptoPP::Exception;
+
+#include "integer.h"
+using CryptoPP::Integer;
+
+#include "files.h"
+using CryptoPP::FileSource;
+
+#include "queue.h"
+using CryptoPP::ByteQueue;
+
+#include "rsa.h"
+using CryptoPP::RSA;
+using CryptoPP::RSASS;
+
+#include "pssr.h"
+using CryptoPP::PSS;
+
+#include "sha.h"
+using CryptoPP::SHA256;
+
+#include "secblock.h"
+using CryptoPP::SecByteBlock;
+
+#include "osrng.h"
+using CryptoPP::AutoSeededRandomPool;
+
+#include "rsa-pss.h"
+
+extern "C" int rsa_pss_sign(const char *key_file, const unsigned char *msg,
+			int len, unsigned char *sig_buf, unsigned char *modulus_buf)
+{
+	try {
+		AutoSeededRandomPool rng;
+		FileSource file(key_file, true);
+		RSA::PrivateKey key;
+		ByteQueue bq;
+
+		// Load the key
+		file.TransferTo(bq);
+		bq.MessageEnd();
+		key.BERDecodePrivateKey(bq, false, bq.MaxRetrievable());
+
+		// Write the modulus
+		Integer mod = key.GetModulus();
+		for (int i = 0; i < mod.ByteCount(); i++)
+			modulus_buf[i] = mod.GetByte(i);
+
+		// Sign the message
+		RSASS<PSS, SHA256>::Signer signer(key);
+		size_t length = signer.MaxSignatureLength();
+		SecByteBlock signature(length);
+
+		length = signer.SignMessage(rng, msg, len, signature);
+
+		// Copy in reverse order
+		for (int i = 0; i < length; i++)
+			sig_buf[length - i - 1] = signature[i];
+	}
+	catch(const CryptoPP::Exception& e) {
+		cerr << e.what() << endl;
+		return 1;
+	}
+
+	return 0;
+}
diff --git a/src/rsa-pss.h b/src/rsa-pss.h
new file mode 100644
index 0000000..ed3a7ac
--- /dev/null
+++ b/src/rsa-pss.h
@@ -0,0 +1,15 @@
+#ifndef _RSA_PSS_H
+#define _RSA_PSS_H
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+int rsa_pss_sign(const char *key_file, const unsigned char *msg,
+		int len, unsigned char *sig_buf, unsigned char *modulus_buf);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif // _RSA_PSS_H
-- 
2.6.3
