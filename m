From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 3/4] Add option --signed
Date: Fri, 4 Mar 2016 15:44:46 -0800
Message-ID: <1457135087-967-4-git-send-email-jimmzhang@nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This option allows user to specify and download signed rcm messages and bootloader
to device. This option must come along with option "--miniloader".

Example:
$ sudo ./tegrarcm --miniloader t124_ml_rcm.bin --signed --bct test.bct --bootloader u-boo

Signed-of-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 221 +++++++++++++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 171 insertions(+), 50 deletions(-)

diff --git a/src/main.c b/src/main.c
index 8a5a7680837e..a991ecdf9d8a 100644
--- a/src/main.c
+++ b/src/main.c
@@ -64,23 +64,30 @@
 #define FILENAME_MAX_SIZE 256
 
 static int initialize_rcm(uint16_t devid, usb_device_t *usb,
-		 const char *keyfile, const char *ml_rcm_file);
+		const char *keyfile, const char *ml_rcm_file,
+		const char *ml_file, bool pkc_signed);
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
-		char *mlfile, uint32_t mlentry, const char *ml_rcm_file);
+		char *mlfile, uint32_t mlentry, const char *ml_rcm_file,
+		bool pkc_signed);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
 static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
 			uint32_t entry, const char *ml_rcm_file);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
-			       uint32_t size, uint32_t entry);
+			       uint32_t size, uint32_t entry, bool pkc_signed);
 static void dump_platform_info(nv3p_platform_info_t *info);
 static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr,
-			       const char *pkc_keyfile);
+			       const char *pkc_keyfile, bool pkc_signed);
 static int read_bct(nv3p_handle_t h3p, char *filename);
 static int sign_blob(const char *blob_filename, const char *keyfile);
 
+static void set_platform_info(nv3p_platform_info_t *info);
+static uint32_t get_op_mode(void);
+
+static nv3p_platform_info_t *g_platform_info = NULL;
+
 enum cmdline_opts {
 	OPT_BCT,
 	OPT_BOOTLOADER,
@@ -95,6 +102,7 @@ enum cmdline_opts {
 	OPT_USBPORTPATH,
 #endif
 	OPT_CREATE_ML_RCM,
+	OPT_SIGNED_ML,
 	OPT_END,
 };
 
@@ -137,6 +145,8 @@ static void usage(char *progname)
 	fprintf(stderr, "\t--pkc=<key.ber>\n");
 	fprintf(stderr, "\t\tSpecify the key file for secured devices. The key should be\n");
 	fprintf(stderr, "\t\tin DER format\n");
+	fprintf(stderr, "\t--signed\n");
+	fprintf(stderr, "\t\tSpecify rsa signed miniloader\n");
 	fprintf(stderr, "\t--ml_rcm=ml_rcm_file\n");
 	fprintf(stderr, "\t\tSave rcm message prefixed miniloader\n");
 	fprintf(stderr, "\n");
@@ -191,7 +201,7 @@ int main(int argc, char **argv)
 	int do_read = 0;
 	char *mlfile = NULL;
 	uint32_t mlentry = 0;
-	char *pkc = NULL;
+	char *pkc_keyfile = NULL;
 #ifdef HAVE_USB_PORT_MATCH
 	bool match_port = false;
 	uint8_t match_bus;
@@ -199,6 +209,7 @@ int main(int argc, char **argv)
 	int match_ports_len;
 #endif
 	char *ml_rcm_file = NULL;
+	bool pkc_signed = false;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -214,6 +225,7 @@ int main(int argc, char **argv)
 		[OPT_USBPORTPATH]  = {"usb-port-path", 1, 0, 0},
 #endif
 		[OPT_CREATE_ML_RCM] = {"ml_rcm", 1, 0, 0},
+		[OPT_SIGNED_ML]    = {"signed", 0, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -250,7 +262,7 @@ int main(int argc, char **argv)
 				mlentry = strtoul(optarg, NULL, 0);
 				break;
 			case OPT_PKC:
-				pkc = optarg;
+				pkc_keyfile = optarg;
 				break;
 #ifdef HAVE_USB_PORT_MATCH
 			case OPT_USBPORTPATH:
@@ -263,6 +275,9 @@ int main(int argc, char **argv)
 			case OPT_CREATE_ML_RCM:
 				ml_rcm_file = optarg;
 				break;
+			case OPT_SIGNED_ML:
+				pkc_signed = true;
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -290,7 +305,7 @@ int main(int argc, char **argv)
 	/* error check */
 	if (ml_rcm_file) {
 		/* ml_rcm option must also come along with pkc option */
-		if (pkc == NULL) {
+		if (pkc_keyfile == NULL) {
 			fprintf(stderr, "PKC key file must be specified\n");
 			goto usage_exit;
 		}
@@ -302,6 +317,18 @@ int main(int argc, char **argv)
 		}
 	}
 
+	/* signed ml must be loaded in from external blob file */
+	if ((pkc_signed == true) && (mlfile == NULL)) {
+		fprintf(stderr, "Signed miniloader file must be specified\n");
+		goto usage_exit;
+	}
+
+	/* if signed already, no pkc keyfile is needed. */
+	if ((pkc_signed == true) && pkc_keyfile) {
+		fprintf(stderr, "No pkc keyfile is needed\n");
+		goto usage_exit;
+	}
+
 	/* specify bct file if no ml_rcm option */
 	if ((bctfile == NULL) && (ml_rcm_file == NULL)) {
 		fprintf(stderr, "BCT file must be specified\n");
@@ -348,19 +375,20 @@ int main(int argc, char **argv)
 			error(1, errno, "USB read truncated");
 
 		// initialize rcm
-		ret2 = initialize_rcm(devid, usb, pkc, ml_rcm_file);
+		ret2 = initialize_rcm(devid, usb, pkc_keyfile,
+					ml_rcm_file, mlfile, pkc_signed);
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
 		// download the miniloader to start nv3p or create ml rcm file
 		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry,
-						ml_rcm_file);
+						ml_rcm_file, pkc_signed);
 		if (ret2)
 			error(1, errno, "error initializing miniloader");
 
 		/* if creating ml_rcm, sign bl as well, then exit */
 		if (ml_rcm_file) {
-			sign_blob(blfile, pkc);
+			sign_blob(blfile, pkc_keyfile);
 			goto done;
 		}
 
@@ -399,6 +427,7 @@ int main(int argc, char **argv)
 	if (ret)
 		error(1, errno, "wait status after platform info");
 	dump_platform_info(&info);
+	set_platform_info(&info);
 
 	if (info.op_mode != RCM_OP_MODE_DEVEL &&
 	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
@@ -415,7 +444,8 @@ int main(int argc, char **argv)
 	}
 
 	// download the bootloader
-	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr, pkc);
+	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr,
+				pkc_keyfile, pkc_signed);
 	if (ret)
 		error(1, ret, "error downloading bootloader: %s", blfile);
 
@@ -464,7 +494,8 @@ static int save_to_file(const char *filename, const uint8_t *msg_buff,
 }
 
 static int initialize_rcm(uint16_t devid, usb_device_t *usb,
-			const char *keyfile, const char *ml_rcm_file)
+			const char *keyfile, const char *ml_rcm_file,
+			const char *ml_file, bool pkc_signed)
 {
 	int ret = 0;
 	uint8_t *msg_buff;
@@ -509,6 +540,54 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb,
 		goto done;
 	}
 
+	/* use signed query_rcm for option --signed */
+	if (pkc_signed == true) {
+		int fd;
+		struct stat sb;
+
+		/* form query_rcm name by adding .qry ext to ml_file */
+		if (ml_file == NULL) {
+			fprintf(stderr, "Missing ml file\n");
+			ret = -1;
+			goto done;
+
+		}
+		ret = create_name_string(ml_file, query_filename,
+					query_rcm_ext);
+		if (ret)
+			goto done;
+
+		printf("Download signed query version rcm from file %s\n",
+			query_filename);
+		free(msg_buff);			// allocated by rcm_create_msg
+		msg_buff = NULL;
+
+		fd = open(query_filename, O_RDONLY, 0);
+		if (fd < 0) {
+			fprintf(stderr, "error opening %s for reading\n",
+				query_filename);
+			return errno;
+		}
+		ret = fstat(fd, &sb);
+		if (ret) {
+			fprintf(stderr, "error on fstat of %s\n",
+				query_filename);
+			return ret;
+		}
+		msg_buff = (uint8_t *)malloc(sb.st_size);
+		if (!msg_buff) {
+			fprintf(stderr, "error allocating %zd bytes for query"
+				" rcm\n", sb.st_size);
+			return errno;
+		}
+		if (read(fd, msg_buff, sb.st_size) != sb.st_size) {
+			fprintf(stderr,"error reading from %s\n",
+				query_filename);
+			free(msg_buff);
+			return errno;
+		}
+	}
+
 	// write query version message to device
 	msg_len = rcm_get_msg_len(msg_buff);
 	if (msg_len == 0) {
@@ -542,7 +621,8 @@ done:
 }
 
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
-		 char *mlfile, uint32_t mlentry, const char *ml_rcm_file)
+		char *mlfile, uint32_t mlentry, const char *ml_rcm_file,
+		bool pkc_signed)
 {
 	int fd;
 	struct stat sb;
@@ -552,6 +632,28 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
 	uint32_t miniloader_entry;
 
 	// use prebuilt miniloader if not loading from a file
+	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20) {
+		miniloader = miniloader_tegra20;
+		miniloader_size = sizeof(miniloader_tegra20);
+		miniloader_entry = TEGRA20_MINILOADER_ENTRY;
+	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30) {
+		miniloader = miniloader_tegra30;
+		miniloader_size = sizeof(miniloader_tegra30);
+		miniloader_entry = TEGRA30_MINILOADER_ENTRY;
+	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
+		miniloader = miniloader_tegra114;
+		miniloader_size = sizeof(miniloader_tegra114);
+		miniloader_entry = TEGRA114_MINILOADER_ENTRY;
+	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
+		miniloader = miniloader_tegra124;
+		miniloader_size = sizeof(miniloader_tegra124);
+		miniloader_entry = TEGRA124_MINILOADER_ENTRY;
+	} else {
+		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
+		return ENODEV;
+	}
+
+	// if loading from a file
 	if (mlfile) {
 		fd = open(mlfile, O_RDONLY, 0);
 		if (fd < 0) {
@@ -573,30 +675,13 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
 			dprintf("error reading from miniloader file");
 			return errno;
 		}
-		miniloader_entry = mlentry;
-	} else {
-		if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20) {
-			miniloader = miniloader_tegra20;
-			miniloader_size = sizeof(miniloader_tegra20);
-			miniloader_entry = TEGRA20_MINILOADER_ENTRY;
-		} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30) {
-			miniloader = miniloader_tegra30;
-			miniloader_size = sizeof(miniloader_tegra30);
-			miniloader_entry = TEGRA30_MINILOADER_ENTRY;
-		} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
-			miniloader = miniloader_tegra114;
-			miniloader_size = sizeof(miniloader_tegra114);
-			miniloader_entry = TEGRA114_MINILOADER_ENTRY;
-		} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
-			miniloader = miniloader_tegra124;
-			miniloader_size = sizeof(miniloader_tegra124);
-			miniloader_entry = TEGRA124_MINILOADER_ENTRY;
-		} else {
-			fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
-			return ENODEV;
-		}
 	}
 
+	// if entry is specified
+	if (mlentry)
+		miniloader_entry = mlentry;
+
+	// if creating rcm file
 	if (ml_rcm_file) {
 		return create_miniloader_rcm(miniloader, miniloader_size,
 				miniloader_entry, ml_rcm_file);
@@ -605,7 +690,7 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
 	printf("downloading miniloader to target at address 0x%x (%d bytes)...\n",
 		miniloader_entry, miniloader_size);
 	ret = download_miniloader(usb, miniloader, miniloader_size,
-				  miniloader_entry);
+				  miniloader_entry, pkc_signed);
 	if (ret) {
 		fprintf(stderr, "Error downloading miniloader\n");
 		return ret;
@@ -747,7 +832,7 @@ static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
 }
 
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
-			       uint32_t size, uint32_t entry)
+			       uint32_t size, uint32_t entry, bool pkc_signed)
 {
 	uint8_t *msg_buff;
 	int ret;
@@ -755,9 +840,13 @@ static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 	int actual_len;
 
 	// download the miniloader to the bootrom
-	rcm_create_msg(RCM_CMD_DL_MINILOADER,
-		       (uint8_t *)&entry, sizeof(entry), miniloader, size,
-		       &msg_buff);
+	if (pkc_signed == true)		/* signed ml contains rcm message */
+		msg_buff = miniloader;
+	else
+		rcm_create_msg(RCM_CMD_DL_MINILOADER,
+			       (uint8_t *)&entry, sizeof(entry), miniloader, size,
+			       &msg_buff);
+
 	ret = usb_write(usb, msg_buff, rcm_get_msg_len(msg_buff));
 	if (ret)
 		goto fail;
@@ -944,7 +1033,7 @@ out:
 
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr,
-			       const char *pkc_keyfile)
+			       const char *pkc_keyfile, bool pkc_signed)
 {
 	int ret;
 	nv3p_cmd_dl_bl_t arg;
@@ -980,18 +1069,36 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 		return ret;
 	}
 
-	// When using PKC the bootloader hash must be sent first
-	if (pkc_keyfile) {
-		uint8_t rsa_pss_sig[2048 / 8];
+	// For fused board, the bootloader hash must be sent first
+	if (get_op_mode() == RCM_OP_MODE_ODM_SECURE_PKC) {
+		/* sign and download */
+		if (pkc_keyfile)  {
+			uint8_t rsa_pss_sig[2048 / 8];
+
+			ret = rsa_pss_sign_file(pkc_keyfile, filename, rsa_pss_sig);
+			if (ret) {
+				dprintf("error signing %s with %s\n",
+					filename, pkc_keyfile);
+				return ret;
+			}
 
-		ret = rsa_pss_sign_file(pkc_keyfile, filename, rsa_pss_sig);
-		if (ret) {
-			dprintf("error signing %s with %s\n",
-				filename, pkc_keyfile);
-			return ret;
+			ret = nv3p_data_send(h3p, rsa_pss_sig, sizeof(rsa_pss_sig));
+		}
+
+		/* download pkc signature */
+		if (pkc_signed) {
+			#define sign_ext	".sig"
+			char signature_filename[FILENAME_MAX_SIZE];
+
+			ret = create_name_string(filename, signature_filename,
+						sign_ext);
+			if (ret)
+				return ret;
+
+			// send the bootloader file
+			ret = send_file(h3p, signature_filename);
 		}
 
-		ret = nv3p_data_send(h3p, rsa_pss_sig, sizeof(rsa_pss_sig));
 		if (ret) {
 			dprintf("error sending bootloader signature\n");
 			return ret;
@@ -1033,3 +1140,17 @@ static int sign_blob(const char *blob_filename, const char *keyfile)
 				sizeof(rsa_pss_sig));
 	return ret;
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
-- 
1.9.1
