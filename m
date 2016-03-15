From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH V3 2/4] Add option --gen-signed-msgs and --signed-msgs-file to generate signed blobs
Date: Mon, 14 Mar 2016 19:42:45 -0700
Message-ID: <1458009767-26615-3-git-send-email-jimmzhang@nvidia.com>
References: <1458009767-26615-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458009767-26615-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This feature allows generation of signed blobs that can later be used
to communicate with a PKC-enabled Tegra device without access to the
PKC. Option --bootloader, --soc and --pkc are also required when generating
the blob.

Example:
tegrarcm --gen-signed-msgs --signed-msgs-file rel_1001.bin \
        --bootloader u-boot.bin --loadaddr 0x83d88000 --soc 124 \
        --pkc rsa_priv.der

Where generated signed message files are:

a) rel_1001.bin.qry
b) rel_1001.bin.ml
c) rel_1001.bin.bl

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 259 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 240 insertions(+), 19 deletions(-)

diff --git a/src/main.c b/src/main.c
index f175b19655a8..93daef4867c2 100644
--- a/src/main.c
+++ b/src/main.c
@@ -61,10 +61,14 @@
 // tegra124 miniloader
 #include "miniloader/tegra124-miniloader.h"
 
-static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char *pkc_keyfile);
-static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry);
+static int initialize_rcm(uint16_t devid, usb_device_t *usb,
+		 const char *pkc_keyfile, const char *signed_msgs_file);
+static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
+		char *mlfile, uint32_t mlentry, const char *signed_msgs_file);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
+static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
+			uint32_t entry, const char *signed_msgs_file);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 			       uint32_t size, uint32_t entry);
 static void dump_platform_info(nv3p_platform_info_t *info);
@@ -73,6 +77,8 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr,
 			       const char *pkc_keyfile);
 static int read_bct(nv3p_handle_t h3p, char *filename);
+static int sign_blob(const char *blob_filename, const char *pkc_keyfile,
+				const char *signed_msgs_file);
 
 static void set_platform_info(nv3p_platform_info_t *info);
 static uint32_t get_op_mode(void);
@@ -92,6 +98,9 @@ enum cmdline_opts {
 #ifdef HAVE_USB_PORT_MATCH
 	OPT_USBPORTPATH,
 #endif
+	OPT_SIGN_MSGS,
+	OPT_SIGNED_MSGS_FILE,
+	OPT_SOC,
 	OPT_END,
 };
 
@@ -134,7 +143,12 @@ static void usage(char *progname)
 	fprintf(stderr, "\t--pkc=<key.ber>\n");
 	fprintf(stderr, "\t\tSpecify the key file for secured devices. The private key should be\n");
 	fprintf(stderr, "\t\tin DER format\n");
-
+	fprintf(stderr, "\t--gen-signed-msgs\n");
+	fprintf(stderr, "\t\tGenerate signed messages for pkc secured devices\n");
+	fprintf(stderr, "\t--signed-msgs-file=<msg_file_prefix>\n");
+	fprintf(stderr, "\t\tSpecify message files prefix\n");
+	fprintf(stderr, "\t--soc=<tegra soc #>\n");
+	fprintf(stderr, "\t\tSpecify Tegra SoC chip model number, ie, 124.\n");
 	fprintf(stderr, "\n");
 }
 
@@ -168,6 +182,29 @@ static void parse_usb_port_path(char *argv0, char *path, uint8_t *match_bus,
 }
 #endif
 
+#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))
+static bool is_soc_supported_for_signed_msgs(uint32_t soc, uint16_t *devid)
+{
+	struct {
+		uint32_t soc;
+		uint16_t usb_devid;
+	} soc_to_devid[] = {
+		{114,	USB_DEVID_NVIDIA_TEGRA114},
+		{124,	USB_DEVID_NVIDIA_TEGRA124},
+	};
+
+	uint32_t i;
+
+	for (i = 0; i < ARRAY_SIZE(soc_to_devid); ++i) {
+		if (soc_to_devid[i].soc == soc) {
+			*devid = soc_to_devid[i].usb_devid;
+			return true;
+		}
+	}
+
+	return false;
+}
+
 int main(int argc, char **argv)
 {
 	// discover devices
@@ -194,6 +231,9 @@ int main(int argc, char **argv)
 	uint8_t match_ports[PORT_MATCH_MAX_PORTS];
 	int match_ports_len;
 #endif
+	bool sign_msgs = false;
+	char *signed_msgs_file = NULL;
+	uint32_t soc = 0;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -208,9 +248,11 @@ int main(int argc, char **argv)
 #ifdef HAVE_USB_PORT_MATCH
 		[OPT_USBPORTPATH]  = {"usb-port-path", 1, 0, 0},
 #endif
+		[OPT_SIGN_MSGS] = {"gen-signed-msgs", 0, 0, 0},
+		[OPT_SIGNED_MSGS_FILE] = {"signed-msgs-file", 1, 0, 0},
+		[OPT_SOC]        = {"soc", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
-
 	// parse command line args
 	while (1) {
 		c = getopt_long(argc, argv, "h0",
@@ -254,6 +296,15 @@ int main(int argc, char **argv)
 				match_port = true;
 				break;
 #endif
+			case OPT_SIGN_MSGS:
+				sign_msgs = true;
+				break;
+			case OPT_SIGNED_MSGS_FILE:
+				signed_msgs_file = optarg;
+				break;
+			case OPT_SOC:
+				soc = strtoul(optarg, NULL, 0);
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -279,12 +330,47 @@ int main(int argc, char **argv)
 		optind++;
 	}
 
-	if (bctfile == NULL) {
+	/* error check */
+	if (sign_msgs == true) {
+		/* must have pkc option */
+		if (pkc_keyfile == NULL) {
+			fprintf(stderr, "PKC key file must be specified\n");
+			goto usage_exit;
+		}
+
+		/* must have signed_msgs_file option */
+		if (signed_msgs_file == NULL) {
+			fprintf(stderr, "signed msgs filename must be"
+				" specified\n");
+			goto usage_exit;
+		}
+
+		/* must have --soc option */
+		if (soc == 0) {
+			fprintf(stderr, "soc model number must be"
+				" specified\n");
+			goto usage_exit;
+		}
+	}
+
+	/*
+	 * option --signed-msgs-file needs to work with option
+	 *  --gen-signed-msgs
+	 */
+	if (signed_msgs_file && (sign_msgs == false)) {
+		fprintf(stderr, "missing option --gen-signed-msgs\n");
+		goto usage_exit;
+	}
+
+	/* specify bct file if no sign_msgs option */
+	if ((bctfile == NULL) && (sign_msgs == false)) {
 		fprintf(stderr, "BCT file must be specified\n");
 		usage(argv[0]);
 		exit(EXIT_FAILURE);
 	}
-	printf("bct file: %s\n", bctfile);
+
+	if (bctfile)
+		printf("bct file: %s\n", bctfile);
 
 	if (!do_read) {
 		if (blfile == NULL) {
@@ -305,6 +391,33 @@ int main(int argc, char **argv)
 		printf("entry addr 0x%x\n", entryaddr);
 	}
 
+	/* if sign_msgs, generate signed msgs, then exit */
+	if (sign_msgs == true) {
+		/*
+		 * validate SoC value
+		 *  currently only verified soc is T124
+		 */
+		if (!is_soc_supported_for_signed_msgs(soc, &devid)) {
+			fprintf(stderr, "Unrecognized soc: %u\n", soc);
+			goto usage_exit;
+		}
+
+		// init and create signed query version rcm
+		if (initialize_rcm(devid, NULL, pkc_keyfile, signed_msgs_file))
+			error(1, errno, "error initializing RCM protocol");
+
+		// create signed download miniloader rcm
+		if (initialize_miniloader(devid, NULL, mlfile, mlentry,
+					signed_msgs_file))
+			error(1, errno, "error initializing miniloader");
+
+		// create bl signature
+		sign_blob(blfile, pkc_keyfile, signed_msgs_file);
+
+		exit(0);
+	}
+
+	/* start nv3p protocol */
 	usb = usb_open(USB_VENID_NVIDIA, &devid
 #ifdef HAVE_USB_PORT_MATCH
 		, &match_port, &match_bus, match_ports, &match_ports_len
@@ -325,17 +438,20 @@ int main(int argc, char **argv)
 			error(1, errno, "USB read truncated");
 
 		// initialize rcm
-		ret2 = initialize_rcm(devid, usb, pkc_keyfile);
+		ret2 = initialize_rcm(devid, usb, pkc_keyfile,
+					signed_msgs_file);
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
-		// download the miniloader to start nv3p
-		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry);
+		// download the miniloader to start nv3p or create ml rcm file
+		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry,
+						signed_msgs_file);
 		if (ret2)
 			error(1, errno, "error initializing miniloader");
 
 		// device may have re-enumerated, so reopen USB
 		usb_close(usb);
+
 		usb = usb_open(USB_VENID_NVIDIA, &devid
 #ifdef HAVE_USB_PORT_MATCH
 		, &match_port, &match_bus, match_ports, &match_ports_len
@@ -391,18 +507,53 @@ int main(int argc, char **argv)
 
 	nv3p_close(h3p);
 	usb_close(usb);
+	return 0;
+
+usage_exit:
+	usage(argv[0]);
+	exit(EXIT_FAILURE);
+}
+
+static int create_name_string(char *out, const char *in, const char *ext)
+{
+	if ((strlen(in) + strlen(ext) + 1) > PATH_MAX) {
+		fprintf(stderr, "error: name length %zu bytes exceed "
+				"limits for file %s\n",
+			strlen(in) + strlen(ext) + 1 - PATH_MAX, in);
+		return -1;
+	}
+	snprintf(out, PATH_MAX, "%s%s", in, ext);
+	return 0;
+}
+
+static int save_to_file(const char *filename, const uint8_t *msg_buff,
+			const uint32_t length)
+{
+	FILE *fp;
+
+	printf("Create file %s...\n", filename);
+
+	fp = fopen(filename, "wb");
+	if (fp == NULL) {
+		fprintf(stderr, "Error opening raw file %s.\n", filename);
+		return -1;
+	}
+
+	fwrite(msg_buff, 1, length, fp);
+	fclose(fp);
 
 	return 0;
 }
 
 static int initialize_rcm(uint16_t devid, usb_device_t *usb,
-			const char *pkc_keyfile)
+			const char *pkc_keyfile, const char *signed_msgs_file)
 {
-	int ret;
+	int ret = 0;
 	uint8_t *msg_buff;
 	int msg_len;
 	uint32_t status;
 	int actual_len;
+	char query_version_rcm_filename[PATH_MAX];
 
 	// initialize RCM
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
@@ -427,6 +578,18 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb,
 	// create query version message
 	rcm_create_msg(RCM_CMD_QUERY_RCM_VERSION, NULL, 0, NULL, 0, &msg_buff);
 
+	/* save query version rcm blob */
+	if (signed_msgs_file) {
+		ret = create_name_string(query_version_rcm_filename,
+					signed_msgs_file, ".qry");
+		if (ret)
+			goto done;
+
+		ret = save_to_file(query_version_rcm_filename, msg_buff,
+					rcm_get_msg_len(msg_buff));
+		goto done;
+	}
+
 	// write query version message to device
 	msg_len = rcm_get_msg_len(msg_buff);
 	if (msg_len == 0) {
@@ -436,28 +599,31 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb,
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
+		 char *mlfile, uint32_t mlentry, const char *signed_msgs_file)
 {
 	int fd;
 	struct stat sb;
@@ -466,7 +632,7 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile
 	uint32_t miniloader_size;
 	uint32_t miniloader_entry;
 
-	// use prebuilt miniloader if not loading from a file
+	// if using miniloader from an external file
 	if (mlfile) {
 		fd = open(mlfile, O_RDONLY, 0);
 		if (fd < 0) {
@@ -511,6 +677,12 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile
 			return ENODEV;
 		}
 	}
+
+	if (signed_msgs_file) {
+		return create_miniloader_rcm(miniloader, miniloader_size,
+				miniloader_entry, signed_msgs_file);
+	}
+
 	printf("downloading miniloader to target at address 0x%x (%d bytes)...\n",
 		miniloader_entry, miniloader_size);
 	ret = download_miniloader(usb, miniloader, miniloader_size,
@@ -636,6 +808,30 @@ fail:
 	return ret;
 }
 
+static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
+			uint32_t entry, const char *signed_msgs_file)
+{
+	uint8_t *msg_buff;
+	int ret = 0;
+	char ml_rcm_filename[PATH_MAX];
+
+	// create RCM_CMD_DL_MINILOADER blob
+	rcm_create_msg(RCM_CMD_DL_MINILOADER, (uint8_t *)&entry, sizeof(entry),
+		       miniloader, size, &msg_buff);
+
+	ret = create_name_string(ml_rcm_filename, signed_msgs_file, ".ml");
+	if (ret)
+		goto done;
+
+	// write to binary file
+	dprintf("Write miniloader rcm to %s\n", ml_rcm_filename);
+
+	ret = save_to_file(ml_rcm_filename, msg_buff,
+				rcm_get_msg_len(msg_buff));
+done:
+	free(msg_buff);
+	return ret;
+}
 
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 			       uint32_t size, uint32_t entry)
@@ -906,6 +1102,31 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 	return 0;
 }
 
+static int sign_blob(const char *blob_filename, const char *pkc_keyfile,
+			const char *signed_msgs_file)
+{
+	int ret;
+	uint8_t rsa_pss_sig[RCM_RSA_SIG_SIZE];
+
+	char signature_filename[PATH_MAX];
+
+	ret = rsa_pss_sign_file(pkc_keyfile, blob_filename, rsa_pss_sig);
+	if (ret) {
+		fprintf(stderr, "error signing %s with %s\n",
+			blob_filename, pkc_keyfile);
+		return ret;
+	}
+
+	/* save signature to signed_msgs_file.bl */
+	ret = create_name_string(signature_filename, signed_msgs_file, ".bl");
+	if (ret)
+		return ret;
+
+	ret = save_to_file(signature_filename, rsa_pss_sig,
+				sizeof(rsa_pss_sig));
+	return ret;
+}
+
 static void set_platform_info(nv3p_platform_info_t *info)
 {
 	g_platform_info = info;
-- 
1.9.1
