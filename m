From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH V3 1/4] Add support for production devices secured with PKC
Date: Mon, 14 Mar 2016 19:42:44 -0700
Message-ID: <1458009767-26615-2-git-send-email-jimmzhang@nvidia.com>
References: <1458009767-26615-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458009767-26615-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Add the support code needed to sign the RCM messages with RSA-PSS as
needed to communicate with secured production devices. This mode is
enabled by passing a key via the --pkc command line argument. If such
a key is set the RCM messages will be signed with it as well as the
bootloader.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changelog:
V2: * Download bl sig only when op_mode is SECURE_PKC
    * Generate cmac_hash even when --pkc option is present so that
      an unfused board can still run with --pkc option.
    * Added Error Check on either key modulus length or key length
v1: * Added the missing bootloader signature
    * Added the ODM secure PKC mode to the supported operating modes
    * Renamed the --key option to --pkc to avoid potential ambiguities
      if SKB mode is ever supported.
    * Added a copyright header to the new files
---
 src/Makefile.am |   2 +
 src/main.c      |  81 ++++++++++++++++++++++++----
 src/rcm.c       |  18 ++++++-
 src/rcm.h       |  15 +++---
 src/rsa-pss.cpp | 163 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/rsa-pss.h   |  46 ++++++++++++++++
 6 files changed, 307 insertions(+), 18 deletions(-)
 create mode 100644 src/rsa-pss.cpp
 create mode 100644 src/rsa-pss.h

diff --git a/src/Makefile.am b/src/Makefile.am
index 4b548859e075..3dad0e6d5e72 100644
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
index 3db0ed8be506..f175b19655a8 100644
--- a/src/main.c
+++ b/src/main.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2011, NVIDIA CORPORATION
+ * Copyright (c) 2011-2016, NVIDIA CORPORATION
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
@@ -44,6 +44,7 @@
 #include "nv3p.h"
 #include "nv3p_status.h"
 #include "aes-cmac.h"
+#include "rsa-pss.h"
 #include "rcm.h"
 #include "debug.h"
 #include "config.h"
@@ -60,7 +61,7 @@
 // tegra124 miniloader
 #include "miniloader/tegra124-miniloader.h"
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb);
+static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *pkc_keyfile);
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
@@ -69,9 +70,15 @@ static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 static void dump_platform_info(nv3p_platform_info_t *info);
 static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
-			       uint32_t entry, uint32_t loadaddr);
+			       uint32_t entry, uint32_t loadaddr,
+			       const char *pkc_keyfile);
 static int read_bct(nv3p_handle_t h3p, char *filename);
 
+static void set_platform_info(nv3p_platform_info_t *info);
+static uint32_t get_op_mode(void);
+
+static nv3p_platform_info_t *g_platform_info = NULL;
+
 enum cmdline_opts {
 	OPT_BCT,
 	OPT_BOOTLOADER,
@@ -81,6 +88,7 @@ enum cmdline_opts {
 	OPT_VERSION,
 	OPT_MINILOADER,
 	OPT_MINIENTRY,
+	OPT_PKC,
 #ifdef HAVE_USB_PORT_MATCH
 	OPT_USBPORTPATH,
 #endif
@@ -123,6 +131,10 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tminiloader\n");
 	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
 	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
+	fprintf(stderr, "\t--pkc=<key.ber>\n");
+	fprintf(stderr, "\t\tSpecify the key file for secured devices. The private key should be\n");
+	fprintf(stderr, "\t\tin DER format\n");
+
 	fprintf(stderr, "\n");
 }
 
@@ -175,6 +187,7 @@ int main(int argc, char **argv)
 	int do_read = 0;
 	char *mlfile = NULL;
 	uint32_t mlentry = 0;
+	char *pkc_keyfile = NULL;
 #ifdef HAVE_USB_PORT_MATCH
 	bool match_port = false;
 	uint8_t match_bus;
@@ -191,6 +204,7 @@ int main(int argc, char **argv)
 		[OPT_VERSION]    = {"version", 0, 0, 0},
 		[OPT_MINILOADER] = {"miniloader", 1, 0, 0},
 		[OPT_MINIENTRY]  = {"miniloader_entry", 1, 0, 0},
+		[OPT_PKC]        = {"pkc", 1, 0, 0},
 #ifdef HAVE_USB_PORT_MATCH
 		[OPT_USBPORTPATH]  = {"usb-port-path", 1, 0, 0},
 #endif
@@ -229,6 +243,9 @@ int main(int argc, char **argv)
 			case OPT_MINIENTRY:
 				mlentry = strtoul(optarg, NULL, 0);
 				break;
+			case OPT_PKC:
+				pkc_keyfile = optarg;
+				break;
 #ifdef HAVE_USB_PORT_MATCH
 			case OPT_USBPORTPATH:
 				parse_usb_port_path(argv[0], optarg,
@@ -308,7 +325,7 @@ int main(int argc, char **argv)
 			error(1, errno, "USB read truncated");
 
 		// initialize rcm
-		ret2 = initialize_rcm(devid, usb);
+		ret2 = initialize_rcm(devid, usb, pkc_keyfile);
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
@@ -351,10 +368,12 @@ int main(int argc, char **argv)
 	if (ret)
 		error(1, errno, "wait status after platform info");
 	dump_platform_info(&info);
+	set_platform_info(&info);
 
 	if (info.op_mode != RCM_OP_MODE_DEVEL &&
 	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
 	    info.op_mode != RCM_OP_MODE_ODM_SECURE &&
+	    info.op_mode != RCM_OP_MODE_ODM_SECURE_PKC &&
 	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
 		error(1, ENODEV, "device is not in developer, open, secure, "
 		      "or pre-production mode, cannot flash");
@@ -366,7 +385,7 @@ int main(int argc, char **argv)
 	}
 
 	// download the bootloader
-	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr);
+	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr, pkc_keyfile);
 	if (ret)
 		error(1, ret, "error downloading bootloader: %s", blfile);
 
@@ -376,7 +395,8 @@ int main(int argc, char **argv)
 	return 0;
 }
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb)
+static int initialize_rcm(uint16_t devid, usb_device_t *usb,
+			const char *pkc_keyfile)
 {
 	int ret;
 	uint8_t *msg_buff;
@@ -388,13 +408,13 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb)
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
 	    (devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30) {
 		dprintf("initializing RCM version 1\n");
-		ret = rcm_init(RCM_VERSION_1);
+		ret = rcm_init(RCM_VERSION_1, pkc_keyfile);
 	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
 		dprintf("initializing RCM version 35\n");
-		ret = rcm_init(RCM_VERSION_35);
+		ret = rcm_init(RCM_VERSION_35, pkc_keyfile);
 	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
 		dprintf("initializing RCM version 40\n");
-		ret = rcm_init(RCM_VERSION_40);
+		ret = rcm_init(RCM_VERSION_40, pkc_keyfile);
 	} else {
 		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
 		return errno;
@@ -720,6 +740,7 @@ static void dump_platform_info(nv3p_platform_info_t *info)
 	case RCM_OP_MODE_DEVEL:             op_mode = "developer mode"; break;
 	case RCM_OP_MODE_ODM_OPEN:          op_mode = "odm open mode"; break;
 	case RCM_OP_MODE_ODM_SECURE:        op_mode = "odm secure mode"; break;
+	case RCM_OP_MODE_ODM_SECURE_PKC:    op_mode = "odm secure mode with PKC"; break;
 	default:                            op_mode = "unknown"; break;
 	}
 	printf(" (%s)\n", op_mode);
@@ -813,7 +834,8 @@ out:
 }
 
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
-			       uint32_t entry, uint32_t loadaddr)
+			       uint32_t entry, uint32_t loadaddr,
+			       const char *pkc_keyfile)
 {
 	int ret;
 	nv3p_cmd_dl_bl_t arg;
@@ -849,6 +871,31 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 		return ret;
 	}
 
+	// For fused board, the bootloader hash must be sent first
+	if (get_op_mode() == RCM_OP_MODE_ODM_SECURE_PKC) {
+		/* sign and download */
+		if (pkc_keyfile)  {
+			uint8_t rsa_pss_sig[RCM_RSA_SIG_SIZE];
+
+			ret = rsa_pss_sign_file(pkc_keyfile, filename, rsa_pss_sig);
+			if (ret) {
+				dprintf("error signing %s with %s\n",
+					filename, pkc_keyfile);
+				return ret;
+			}
+
+			ret = nv3p_data_send(h3p, rsa_pss_sig, sizeof(rsa_pss_sig));
+			if (ret) {
+				dprintf("error sending bootloader signature\n");
+				return ret;
+			}
+		} else {
+			fprintf(stderr, "Error: missing pkc keyfile to sign"
+				" bootloader\n");
+			return -1;
+		}
+	}
+
 	// send the bootloader file
 	ret = send_file(h3p, filename);
 	if (ret) {
@@ -858,3 +905,17 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 
 	return 0;
 }
+
+static void set_platform_info(nv3p_platform_info_t *info)
+{
+	g_platform_info = info;
+}
+
+static uint32_t get_op_mode(void)
+{
+	if (g_platform_info)
+		return g_platform_info->op_mode;
+
+	fprintf(stderr, "Error: No platform info has been retrieved\n");
+	return 0;
+}
diff --git a/src/rcm.c b/src/rcm.c
index cb53d8f4f56d..aa8acf753586 100644
--- a/src/rcm.c
+++ b/src/rcm.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2011, NVIDIA CORPORATION
+ * Copyright (c) 2011-2016, NVIDIA CORPORATION
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
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
 
@@ -198,6 +203,11 @@ static int rcm35_sign_msg(uint8_t *buf)
 	}
 
 	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+
+	if (rcm_keyfile)
+		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
+			msg->object_sig.rsa_pss_sig, msg->modulus);
+
 	return 0;
 }
 
@@ -218,6 +228,10 @@ static int rcm40_sign_msg(uint8_t *buf)
 	}
 
 	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+	if (rcm_keyfile)
+		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
+			msg->object_sig.rsa_pss_sig, msg->modulus);
+
 	return 0;
 }
 
diff --git a/src/rcm.h b/src/rcm.h
index ab4bea2d8752..d5fef30fd9e2 100644
--- a/src/rcm.h
+++ b/src/rcm.h
@@ -1,5 +1,5 @@
 /*
- * Copyright (c) 2011, NVIDIA CORPORATION
+ * Copyright (c) 2011-2016, NVIDIA CORPORATION
  * All rights reserved.
  *
  * Redistribution and use in source and binary forms, with or without
@@ -50,6 +50,8 @@
 
 // AES block size in bytes
 #define RCM_AES_BLOCK_SIZE      (128 / 8)
+#define RCM_RSA_MODULUS_SIZE	(2048 / 8)
+#define RCM_RSA_SIG_SIZE	RCM_RSA_MODULUS_SIZE
 
 /*
  * Defines the header for RCM messages from the host.
@@ -72,10 +74,10 @@ typedef struct {
 
 typedef struct {
 	uint32_t len_insecure;		// 000-003
-	uint8_t modulus[2048 / 8];	// 004-103
+	uint8_t modulus[RCM_RSA_MODULUS_SIZE];	// 004-103
 	union {
 		uint8_t cmac_hash[RCM_AES_BLOCK_SIZE];
-		uint8_t rsa_pss_sig[2048 / 8];
+		uint8_t rsa_pss_sig[RCM_RSA_SIG_SIZE];
 	} object_sig;			// 104-203
 	uint8_t reserved[16];		// 204-213
 	uint32_t ecid[4];		// 214-223
@@ -89,10 +91,10 @@ typedef struct {
 
 typedef struct {
 	uint32_t len_insecure;		// 000-003
-	uint8_t modulus[2048 / 8];	// 004-103
+	uint8_t modulus[RCM_RSA_MODULUS_SIZE];	// 004-103
 	struct {
 		uint8_t cmac_hash[RCM_AES_BLOCK_SIZE];
-		uint8_t rsa_pss_sig[2048 / 8];
+		uint8_t rsa_pss_sig[RCM_RSA_SIG_SIZE];
 	} object_sig;			// 104-213
 	uint8_t reserved[16];		// 214-223
 	uint32_t ecid[4];		// 224-233
@@ -109,8 +111,9 @@ typedef struct {
 #define RCM_OP_MODE_DEVEL           0x3
 #define RCM_OP_MODE_ODM_SECURE      0x4
 #define RCM_OP_MODE_ODM_OPEN        0x5
+#define RCM_OP_MODE_ODM_SECURE_PKC  0x6
 
-int rcm_init(uint32_t version);
+int rcm_init(uint32_t version, const char *keyfile);
 uint32_t rcm_get_msg_len(uint8_t *msg);
 int rcm_create_msg(
 	uint32_t opcode,
diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp
new file mode 100644
index 000000000000..ab0a680af206
--- /dev/null
+++ b/src/rsa-pss.cpp
@@ -0,0 +1,163 @@
+/*
+ * Copyright (c) 2015-2016, Avionic Design GmbH
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *  * Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *  * Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *  * Neither the name of Avionic Design GmbH nor the names of its
+ *    contributors may be used to endorse or promote products derived
+ *    from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+ * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
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
+#include "filters.h"
+using CryptoPP::StringSink;
+using CryptoPP::SignerFilter;
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
+#include <stdexcept>
+#include "rcm.h"
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
+		// error check
+		if (mod.ByteCount() != RCM_RSA_MODULUS_SIZE)
+			throw std::length_error("incorrect rsa key modulus length");
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
+	catch(std::length_error& le) {
+		cerr << "Error: " << le.what() << endl;
+		return 1;
+	}
+
+	return 0;
+}
+
+extern "C" int rsa_pss_sign_file(const char *key_file, const char *msg_file,
+			unsigned char *sig_buf)
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
+		// Sign the message
+		RSASS<PSS, SHA256>::Signer signer(key);
+		string signature;
+		FileSource src(msg_file, true,
+			new SignerFilter(rng, signer,
+					new StringSink(signature)));
+		int length = signature.length();
+		// error check
+		if (length != RCM_RSA_SIG_SIZE)
+			throw std::length_error("incorrect rsa key length");
+
+		// Copy in reverse order
+		for (int i = 0; i < length; i++)
+			sig_buf[length - i - 1] = signature[i];
+	}
+	catch(const CryptoPP::Exception& e) {
+		cerr << e.what() << endl;
+		return 1;
+	}
+	catch(std::length_error& le) {
+		cerr << "Error: " << le.what() << endl;
+		return 1;
+	}
+
+	return 0;
+}
diff --git a/src/rsa-pss.h b/src/rsa-pss.h
new file mode 100644
index 000000000000..39e88c0f12a8
--- /dev/null
+++ b/src/rsa-pss.h
@@ -0,0 +1,46 @@
+/*
+ * Copyright (c) 2015-1016, Avionic Design GmbH
+ * All rights reserved.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *  * Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *  * Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *  * Neither the name of Avionic Design GmbH nor the names of its
+ *    contributors may be used to endorse or promote products derived
+ *    from this software without specific prior written permission.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
+ * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
+ * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
+ * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
+ * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
+ * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
+ * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
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
+int rsa_pss_sign_file(const char *key_file, const char *msg_file,
+		unsigned char *sig_buf);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif // _RSA_PSS_H
-- 
1.9.1
