From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
Date: Fri, 4 Mar 2016 15:44:45 -0800
Message-ID: <1457135087-967-3-git-send-email-jimmzhang@nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This option along with "--pkc <keyfile>" allows user to generate signed
query version rcm, miniloader rcm and signed bootloader (flasher). With
these signed blob, user will then be able to run tegrarcm on a fused system
without keyfile.

Command syntax:
 $ ./tegrarcm --ml_rcm <ml_rcm_blob> --pkc <keyfile>

Example:
1. connect usb cable to recovery mode usb port
2. put target in recovery mode
3. run command as below:
$ sudo ./tegrarcm --ml_rcm t124_ml_rcm.bin --pkc rsa_priv.der

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 194 ++++++++++++++++++++++++++++++++++++++++++++++++++++---------
 src/rcm.c  |   8 +--
 2 files changed, 172 insertions(+), 30 deletions(-)

diff --git a/src/main.c b/src/main.c
index fedeab2e1402..8a5a7680837e 100644
--- a/src/main.c
+++ b/src/main.c
@@ -61,10 +61,16 @@
 // tegra124 miniloader
 #include "miniloader/tegra124-miniloader.h"
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile);
-static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry);
+#define FILENAME_MAX_SIZE 256
+
+static int initialize_rcm(uint16_t devid, usb_device_t *usb,
+		 const char *keyfile, const char *ml_rcm_file);
+static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
+		char *mlfile, uint32_t mlentry, const char *ml_rcm_file);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
+static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
+			uint32_t entry, const char *ml_rcm_file);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 			       uint32_t size, uint32_t entry);
 static void dump_platform_info(nv3p_platform_info_t *info);
@@ -73,6 +79,7 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr,
 			       const char *pkc_keyfile);
 static int read_bct(nv3p_handle_t h3p, char *filename);
+static int sign_blob(const char *blob_filename, const char *keyfile);
 
 enum cmdline_opts {
 	OPT_BCT,
@@ -87,6 +94,7 @@ enum cmdline_opts {
 #ifdef HAVE_USB_PORT_MATCH
 	OPT_USBPORTPATH,
 #endif
+	OPT_CREATE_ML_RCM,
 	OPT_END,
 };
 
@@ -129,7 +137,8 @@ static void usage(char *progname)
 	fprintf(stderr, "\t--pkc=<key.ber>\n");
 	fprintf(stderr, "\t\tSpecify the key file for secured devices. The key should be\n");
 	fprintf(stderr, "\t\tin DER format\n");
-
+	fprintf(stderr, "\t--ml_rcm=ml_rcm_file\n");
+	fprintf(stderr, "\t\tSave rcm message prefixed miniloader\n");
 	fprintf(stderr, "\n");
 }
 
@@ -189,6 +198,7 @@ int main(int argc, char **argv)
 	uint8_t match_ports[PORT_MATCH_MAX_PORTS];
 	int match_ports_len;
 #endif
+	char *ml_rcm_file = NULL;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -203,6 +213,7 @@ int main(int argc, char **argv)
 #ifdef HAVE_USB_PORT_MATCH
 		[OPT_USBPORTPATH]  = {"usb-port-path", 1, 0, 0},
 #endif
+		[OPT_CREATE_ML_RCM] = {"ml_rcm", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -249,6 +260,9 @@ int main(int argc, char **argv)
 				match_port = true;
 				break;
 #endif
+			case OPT_CREATE_ML_RCM:
+				ml_rcm_file = optarg;
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -268,29 +282,43 @@ int main(int argc, char **argv)
 		else {
 			fprintf(stderr, "%s: Unknown command line argument: %s\n",
 				argv[0], argv[optind]);
-			usage(argv[0]);
-			exit(EXIT_FAILURE);
+			goto usage_exit;
 		}
 		optind++;
 	}
 
-	if (bctfile == NULL) {
+	/* error check */
+	if (ml_rcm_file) {
+		/* ml_rcm option must also come along with pkc option */
+		if (pkc == NULL) {
+			fprintf(stderr, "PKC key file must be specified\n");
+			goto usage_exit;
+		}
+
+		/* ml_rcm option must also come along with bootloader option */
+		if (blfile == NULL) {
+			fprintf(stderr, "bootloader file must be specified\n");
+			goto usage_exit;
+		}
+	}
+
+	/* specify bct file if no ml_rcm option */
+	if ((bctfile == NULL) && (ml_rcm_file == NULL)) {
 		fprintf(stderr, "BCT file must be specified\n");
-		usage(argv[0]);
-		exit(EXIT_FAILURE);
+		goto usage_exit;
 	}
-	printf("bct file: %s\n", bctfile);
 
-	if (!do_read) {
+	if (bctfile)
+		printf("bct file: %s\n", bctfile);
+
+	if ((ml_rcm_file == NULL) && !do_read) {
 		if (blfile == NULL) {
 			fprintf(stderr, "bootloader file must be specified\n");
-			usage(argv[0]);
-			exit(EXIT_FAILURE);
+			goto usage_exit;
 		}
 		if (loadaddr == 0) {
 			fprintf(stderr, "loadaddr must be specified\n");
-			usage(argv[0]);
-			exit(EXIT_FAILURE);
+			goto usage_exit;
 		}
 		if (entryaddr == 0) {
 			entryaddr = loadaddr;
@@ -320,17 +348,25 @@ int main(int argc, char **argv)
 			error(1, errno, "USB read truncated");
 
 		// initialize rcm
-		ret2 = initialize_rcm(devid, usb, pkc);
+		ret2 = initialize_rcm(devid, usb, pkc, ml_rcm_file);
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
-		// download the miniloader to start nv3p
-		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry);
+		// download the miniloader to start nv3p or create ml rcm file
+		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry,
+						ml_rcm_file);
 		if (ret2)
 			error(1, errno, "error initializing miniloader");
 
+		/* if creating ml_rcm, sign bl as well, then exit */
+		if (ml_rcm_file) {
+			sign_blob(blfile, pkc);
+			goto done;
+		}
+
 		// device may have re-enumerated, so reopen USB
 		usb_close(usb);
+
 		usb = usb_open(USB_VENID_NVIDIA, &devid
 #ifdef HAVE_USB_PORT_MATCH
 		, &match_port, &match_bus, match_ports, &match_ports_len
@@ -384,18 +420,59 @@ int main(int argc, char **argv)
 		error(1, ret, "error downloading bootloader: %s", blfile);
 
 	nv3p_close(h3p);
+done:
 	usb_close(usb);
+	return 0;
+
+usage_exit:
+	usage(argv[0]);
+	exit(EXIT_FAILURE);
+}
 
+static int create_name_string(const char *in, char *out, char *ext)
+{
+	int len = strlen(in);
+
+	if ((len + strlen(ext) + 1) >  FILENAME_MAX_SIZE) {
+		fprintf(stderr, "error: name length %zu bytes exceed "
+				"limits for file %s\n",
+			len + strlen(ext) + 1 - FILENAME_MAX_SIZE, in);
+		return -1;
+	}
+	sprintf(out, "%s%s\n", in, ext);
+	*(out + len + strlen(ext)) = 0x0;
 	return 0;
 }
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile)
+static int save_to_file(const char *filename, const uint8_t *msg_buff,
+			const uint32_t length)
 {
-	int ret;
+	FILE *raw_file;
+
+	printf("Create file %s...\n", filename);
+
+	raw_file = fopen(filename, "wb");
+	if (raw_file == NULL) {
+		fprintf(stderr, "Error opening raw file %s.\n", filename);
+		return -1;
+	}
+
+	fwrite(msg_buff, 1, length, raw_file);
+	fclose(raw_file);
+
+	return 0;
+}
+
+static int initialize_rcm(uint16_t devid, usb_device_t *usb,
+			const char *keyfile, const char *ml_rcm_file)
+{
+	int ret = 0;
 	uint8_t *msg_buff;
 	int msg_len;
 	uint32_t status;
 	int actual_len;
+	#define query_rcm_ext	".qry"
+	char query_filename[FILENAME_MAX_SIZE];
 
 	// initialize RCM
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
@@ -420,6 +497,18 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile
 	// create query version message
 	rcm_create_msg(RCM_CMD_QUERY_RCM_VERSION, NULL, 0, NULL, 0, &msg_buff);
 
+	/* create query version rcm file */
+	if (ml_rcm_file) {
+		ret = create_name_string(ml_rcm_file, query_filename,
+					query_rcm_ext);
+		if (ret)
+			goto done;
+
+		ret = save_to_file(query_filename, msg_buff,
+					rcm_get_msg_len(msg_buff));
+		goto done;
+	}
+
 	// write query version message to device
 	msg_len = rcm_get_msg_len(msg_buff);
 	if (msg_len == 0) {
@@ -429,28 +518,31 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *keyfile
 	ret = usb_write(usb, msg_buff, msg_len);
 	if (ret) {
 		fprintf(stderr, "write RCM query version: USB transfer failure\n");
-		return ret;
+		goto done;
 	}
-	free(msg_buff);
-	msg_buff = NULL;
 
 	// read response
 	ret = usb_read(usb, (uint8_t *)&status, sizeof(status), &actual_len);
 	if (ret) {
 		fprintf(stderr, "read RCM query version: USB transfer failure\n");
-		return ret;
+		goto done;
 	}
 	if (actual_len < sizeof(status)) {
 		fprintf(stderr, "read RCM query version: USB read truncated\n");
-		return EIO;
+		ret = EIO;
+		goto done;
 	}
 	printf("RCM version: %d.%d\n", RCM_VERSION_MAJOR(status),
 	       RCM_VERSION_MINOR(status));
 
-	return 0;
+done:
+	if (msg_buff)
+		free(msg_buff);
+	return ret;
 }
 
-static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry)
+static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
+		 char *mlfile, uint32_t mlentry, const char *ml_rcm_file)
 {
 	int fd;
 	struct stat sb;
@@ -504,6 +596,12 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile
 			return ENODEV;
 		}
 	}
+
+	if (ml_rcm_file) {
+		return create_miniloader_rcm(miniloader, miniloader_size,
+				miniloader_entry, ml_rcm_file);
+	}
+
 	printf("downloading miniloader to target at address 0x%x (%d bytes)...\n",
 		miniloader_entry, miniloader_size);
 	ret = download_miniloader(usb, miniloader, miniloader_size,
@@ -629,6 +727,24 @@ fail:
 	return ret;
 }
 
+static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
+			uint32_t entry, const char *ml_rcm_file)
+{
+	uint8_t *msg_buff;
+	int ret = 0;
+
+	// create RCM_CMD_DL_MINILOADER blob
+	rcm_create_msg(RCM_CMD_DL_MINILOADER,
+		       (uint8_t *)&entry, sizeof(entry), miniloader, size,
+		       &msg_buff);
+
+	// write to binary file
+	dprintf("Write miniloader rcm to %s\n", ml_rcm_file);
+
+	ret = save_to_file(ml_rcm_file, msg_buff, rcm_get_msg_len(msg_buff));
+	free(msg_buff);
+	return ret;
+}
 
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 			       uint32_t size, uint32_t entry)
@@ -891,3 +1007,29 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 
 	return 0;
 }
+
+static int sign_blob(const char *blob_filename, const char *keyfile)
+{
+	int ret;
+	uint8_t rsa_pss_sig[2048 / 8];
+
+	#define sign_ext	".sig"
+	char signature_filename[FILENAME_MAX_SIZE];
+
+	ret = rsa_pss_sign_file(keyfile, blob_filename, rsa_pss_sig);
+	if (ret) {
+		fprintf(stderr, "error signing %s with %s\n",
+			blob_filename, keyfile);
+		return ret;
+	}
+
+	/* save signature to blob_filename.sig */
+	ret = create_name_string(blob_filename, signature_filename,
+				sign_ext);
+	if (ret)
+		return ret;
+
+	ret = save_to_file(signature_filename, rsa_pss_sig,
+				sizeof(rsa_pss_sig));
+	return ret;
+}
diff --git a/src/rcm.c b/src/rcm.c
index c7f0f8dddecc..cdf81309ae96 100644
--- a/src/rcm.c
+++ b/src/rcm.c
@@ -202,11 +202,12 @@ static int rcm35_sign_msg(uint8_t *buf)
 		return -EMSGSIZE;
 	}
 
+	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+
 	if (rcm_keyfile)
 		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
 			msg->object_sig.rsa_pss_sig, msg->modulus);
-	else
-		cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
+
 	return 0;
 }
 
@@ -226,11 +227,10 @@ static int rcm40_sign_msg(uint8_t *buf)
 		return -EMSGSIZE;
 	}
 
+	cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
 	if (rcm_keyfile)
 		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
 			msg->object_sig.rsa_pss_sig, msg->modulus);
-	else
-		cmac_hash(msg->reserved, crypto_len, msg->object_sig.cmac_hash);
 
 	return 0;
 }
-- 
1.9.1
