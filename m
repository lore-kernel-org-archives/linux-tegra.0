From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH V2 3/4] Add option --download-signed-msgs to download signed blobs
Date: Fri, 11 Mar 2016 17:02:31 -0800
Message-ID: <1457744552-30966-4-git-send-email-jimmzhang@nvidia.com>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457744552-30966-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This feature allows user to download signed messages to devices
secured with PKC.

Example:
tegrarcm --download-signed-msgs --signed-msgs-file rel_1001.bin \
   --bct=jetson-tk1-bct.bct --bootloader=u-boot.bin --loadaddr=0x83d88000

Where the following blob files are downloaded to device sequentially:

a) rel_1001.bin.qry
b) rel_1001.bin.ml
c) rel_1001.bin.bl

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 257 +++++++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 191 insertions(+), 66 deletions(-)

diff --git a/src/main.c b/src/main.c
index 17046e1efd6a..cb12138ae66c 100644
--- a/src/main.c
+++ b/src/main.c
@@ -64,20 +64,23 @@
 #define FILENAME_MAX_SIZE 256
 
 static int initialize_rcm(uint16_t devid, usb_device_t *usb,
-		 const char *pkc_keyfile, const char *signed_msgs_file);
+		const char *pkc_keyfile, const char *signed_msgs_file,
+		bool download_signed_msgs);
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
-		char *mlfile, uint32_t mlentry, const char *signed_msgs_file);
+		char *mlfile, uint32_t mlentry, const char *signed_msgs_file,
+		bool download_signed_msgs);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
 static int create_miniloader_rcm(uint8_t *miniloader, uint32_t size,
 			uint32_t entry, const char *signed_msgs_file);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
-			       uint32_t size, uint32_t entry);
+				uint32_t size, uint32_t entry,
+				bool download_signed_msgs);
 static void dump_platform_info(nv3p_platform_info_t *info);
 static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
-			       uint32_t entry, uint32_t loadaddr,
-			       const char *pkc_keyfile);
+			uint32_t entry, uint32_t loadaddr,
+			const char *pkc_keyfile, const char *signed_msgs_file);
 static int read_bct(nv3p_handle_t h3p, char *filename);
 static int sign_blob(const char *blob_filename, const char *pkc_keyfile,
 				const char *signed_msgs_file);
@@ -103,6 +106,7 @@ enum cmdline_opts {
 	OPT_SIGN_MSGS,
 	OPT_SIGNED_MSGS_FILE,
 	OPT_SOC,
+	OPT_DOWNLOAD_SIGNED_MSGS,
 	OPT_END,
 };
 
@@ -151,6 +155,8 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tSpecify message files prefix\n");
 	fprintf(stderr, "\t--soc=<tegra soc #>\n");
 	fprintf(stderr, "\t\tSpecify Tegra SoC chip model number, ie, 124.\n");
+	fprintf(stderr, "\t--download-signed-msgs\n");
+	fprintf(stderr, "\t\tDownload signed messages\n");
 	fprintf(stderr, "\n");
 }
 
@@ -236,6 +242,7 @@ int main(int argc, char **argv)
 	bool sign_msgs = false;
 	char *signed_msgs_file = NULL;
 	uint32_t soc = 0;
+	bool download_signed_msgs = false;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -253,6 +260,7 @@ int main(int argc, char **argv)
 		[OPT_SIGN_MSGS] = {"gen-signed-msgs", 0, 0, 0},
 		[OPT_SIGNED_MSGS_FILE] = {"signed-msgs-file", 1, 0, 0},
 		[OPT_SOC]        = {"soc", 1, 0, 0},
+		[OPT_DOWNLOAD_SIGNED_MSGS] = {"download-signed-msgs", 0, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 	// parse command line args
@@ -307,6 +315,9 @@ int main(int argc, char **argv)
 			case OPT_SOC:
 				soc = strtoul(optarg, NULL, 0);
 				break;
+			case OPT_DOWNLOAD_SIGNED_MSGS:
+				download_signed_msgs = true;
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -355,12 +366,36 @@ int main(int argc, char **argv)
 		}
 	}
 
+	/* error check */
+	if (download_signed_msgs == true) {
+		/* must have signed_msgs_file option */
+		if (signed_msgs_file == NULL) {
+			fprintf(stderr, "signed msgs filename must be"
+					" specified\n");
+			goto usage_exit;
+		}
+
+		/* can not have pkc keyfile */
+		if (pkc_keyfile) {
+			fprintf(stderr, "No pkc keyfile is needed\n");
+			goto usage_exit;
+		}
+
+		/* can not load in unsigned ml */
+		if (mlfile) {
+			fprintf(stderr, "can not have option --miniloader\n");
+			goto usage_exit;
+		}
+	}
+
 	/*
 	 * option --signed-msgs-file needs to work with option
-	 *  --gen-signed-msgs
+	 *   either --gen-signed-msgs or --download-signed-msgs
 	 */
-	if (signed_msgs_file && (sign_msgs == false)) {
-		fprintf(stderr, "missing option --gen-signed-msgs\n");
+	if (signed_msgs_file && (sign_msgs == false) &&
+			(download_signed_msgs == false)) {
+		fprintf(stderr, "missing option either --gen-signed-msgs or"
+				" --download-signed-msgs\n");
 		goto usage_exit;
 	}
 
@@ -405,12 +440,13 @@ int main(int argc, char **argv)
 		}
 
 		// init and create signed query version rcm
-		if (initialize_rcm(devid, NULL, pkc_keyfile, signed_msgs_file))
+		if (initialize_rcm(devid, NULL, pkc_keyfile, signed_msgs_file,
+					download_signed_msgs))
 			error(1, errno, "error initializing RCM protocol");
 
 		// create signed download miniloader rcm
 		if (initialize_miniloader(devid, NULL, mlfile, mlentry,
-					signed_msgs_file))
+				signed_msgs_file, download_signed_msgs))
 			error(1, errno, "error initializing miniloader");
 
 		// create bl signature
@@ -441,13 +477,13 @@ int main(int argc, char **argv)
 
 		// initialize rcm
 		ret2 = initialize_rcm(devid, usb, pkc_keyfile,
-					signed_msgs_file);
+					signed_msgs_file, download_signed_msgs);
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
 		// download the miniloader to start nv3p or create ml rcm file
 		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry,
-						signed_msgs_file);
+					signed_msgs_file, download_signed_msgs);
 		if (ret2)
 			error(1, errno, "error initializing miniloader");
 
@@ -503,7 +539,8 @@ int main(int argc, char **argv)
 	}
 
 	// download the bootloader
-	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr, pkc_keyfile);
+	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr,
+				pkc_keyfile, signed_msgs_file);
 	if (ret)
 		error(1, ret, "error downloading bootloader: %s", blfile);
 
@@ -548,7 +585,8 @@ static int save_to_file(const char *filename, const uint8_t *msg_buff,
 }
 
 static int initialize_rcm(uint16_t devid, usb_device_t *usb,
-			const char *pkc_keyfile, const char *signed_msgs_file)
+			const char *pkc_keyfile, const char *signed_msgs_file,
+			bool download_signed_msgs)
 {
 	int ret = 0;
 	uint8_t *msg_buff;
@@ -580,16 +618,55 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb,
 	// create query version message
 	rcm_create_msg(RCM_CMD_QUERY_RCM_VERSION, NULL, 0, NULL, 0, &msg_buff);
 
-	/* save query version rcm blob */
+	/* if signed_msgs_file is given */
 	if (signed_msgs_file) {
+		int fd;
+		struct stat sb;
+
 		ret = create_name_string(query_version_rcm_filename,
 					signed_msgs_file, ".qry");
 		if (ret)
 			goto done;
 
-		ret = save_to_file(query_version_rcm_filename, msg_buff,
+		/* either save query version rcm blob */
+		if (download_signed_msgs == false) {
+			ret = save_to_file(query_version_rcm_filename, msg_buff,
 					rcm_get_msg_len(msg_buff));
-		goto done;
+			goto done;
+		}
+
+		/* or download signed query version rcm blob */
+		printf("download signed query version rcm from file %s\n",
+			 query_version_rcm_filename);
+
+		free(msg_buff); // release memory allocated by rcm_create_msg
+		msg_buff = NULL;
+
+		fd = open(query_version_rcm_filename, O_RDONLY, 0);
+		if (fd < 0) {
+			fprintf(stderr, "error opening %s\n",
+				query_version_rcm_filename);
+			return errno;
+		}
+
+		ret = fstat(fd, &sb);
+		if (ret) {
+			fprintf(stderr, "error on fstat of %s\n",
+				query_version_rcm_filename);
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
+				query_version_rcm_filename);
+			free(msg_buff);
+			return errno;
+		}
 	}
 
 	// write query version message to device
@@ -625,25 +702,68 @@ done:
 }
 
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
-		 char *mlfile, uint32_t mlentry, const char *signed_msgs_file)
+		char *mlfile, uint32_t mlentry, const char *signed_msgs_file,
+		bool download_signed_msgs)
 {
 	int fd;
 	struct stat sb;
 	int ret;
-	uint8_t *miniloader;
+	uint8_t *miniloader = NULL;
+	bool ml_buffer_alloc = false;
 	uint32_t miniloader_size;
 	uint32_t miniloader_entry;
+	char ml_rcm_filename[FILENAME_MAX_SIZE];
+	char *filename = NULL;
+
+	// use prebuilt miniloader if not loading from a file
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
+	// if loading unsigned ml from a file
+	if (mlfile)
+		filename = mlfile;
+
+	// if loading signed ml rcm file
+	if (signed_msgs_file && (download_signed_msgs == true)) {
+		filename = ml_rcm_filename;
+		ret = create_name_string(ml_rcm_filename, signed_msgs_file,
+					".ml");
+		if (ret)
+			goto done;
+
+		/* download signed ml rcm blob */
+		printf("download signed miniloader rcm from file %s\n",
+			 ml_rcm_filename);
+	}
 
-	// if using miniloader from an exteranl file
-	if (mlfile) {
-		fd = open(mlfile, O_RDONLY, 0);
+	// loading ml or signed ml rcm from a file
+	if (filename) {
+		fd = open(filename, O_RDONLY, 0);
 		if (fd < 0) {
-			dprintf("error opening %s for reading\n", mlfile);
+			dprintf("error opening %s\n", filename);
 			return errno;
 		}
 		ret = fstat(fd, &sb);
 		if (ret) {
-			dprintf("error on fstat of %s\n", mlfile);
+			dprintf("error on fstat of %s\n", filename);
 			return ret;
 		}
 		miniloader_size = sb.st_size;
@@ -652,50 +772,37 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb,
 			dprintf("error allocating %d bytes for miniloader\n", miniloader_size);
 			return errno;
 		}
+		ml_buffer_alloc = true;
 		if (read(fd, miniloader, miniloader_size) != miniloader_size) {
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
 
-	if (signed_msgs_file) {
-		return create_miniloader_rcm(miniloader, miniloader_size,
+	// if entry is specified
+	if (mlentry)
+		miniloader_entry = mlentry;
+
+	// if generating ml rcm file
+	if (signed_msgs_file && (download_signed_msgs == false)) {
+		ret = create_miniloader_rcm(miniloader, miniloader_size,
 				miniloader_entry, signed_msgs_file);
+		goto done;
 	}
 
 	printf("downloading miniloader to target at address 0x%x (%d bytes)...\n",
 		miniloader_entry, miniloader_size);
 	ret = download_miniloader(usb, miniloader, miniloader_size,
-				  miniloader_entry);
+				  miniloader_entry, download_signed_msgs);
 	if (ret) {
 		fprintf(stderr, "Error downloading miniloader\n");
 		return ret;
 	}
 	printf("miniloader downloaded successfully\n");
-
-	return 0;
+done:
+	if ((ml_buffer_alloc == true) && miniloader)
+		free(miniloader);
+	return ret;
 }
 
 static int wait_status(nv3p_handle_t h3p)
@@ -836,17 +943,24 @@ done:
 }
 
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
-			       uint32_t size, uint32_t entry)
+				uint32_t size, uint32_t entry,
+				bool download_signed_msgs)
 {
-	uint8_t *msg_buff;
+	uint8_t *msg_buff = NULL;
+	bool msg_buff_alloc = false;
 	int ret;
 	uint32_t status;
 	int actual_len;
 
 	// download the miniloader to the bootrom
-	rcm_create_msg(RCM_CMD_DL_MINILOADER,
-		       (uint8_t *)&entry, sizeof(entry), miniloader, size,
-		       &msg_buff);
+	if (download_signed_msgs == true)	/* signed ml with rcm header */
+		msg_buff = miniloader;
+	else {
+		rcm_create_msg(RCM_CMD_DL_MINILOADER, (uint8_t *)&entry,
+				sizeof(entry), miniloader, size, &msg_buff);
+		msg_buff_alloc = true;
+	}
+
 	ret = usb_write(usb, msg_buff, rcm_get_msg_len(msg_buff));
 	if (ret)
 		goto fail;
@@ -864,7 +978,8 @@ static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
 
 	ret = 0;
 fail:
-	free(msg_buff);
+	if ((msg_buff_alloc == true) && msg_buff)
+		free(msg_buff);
 	return ret;
 }
 
@@ -1032,8 +1147,8 @@ out:
 }
 
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
-			       uint32_t entry, uint32_t loadaddr,
-			       const char *pkc_keyfile)
+			uint32_t entry, uint32_t loadaddr,
+			const char *pkc_keyfile, const char *signed_msgs_file)
 {
 	int ret;
 	nv3p_cmd_dl_bl_t arg;
@@ -1083,14 +1198,24 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			}
 
 			ret = nv3p_data_send(h3p, rsa_pss_sig, sizeof(rsa_pss_sig));
-			if (ret) {
-				dprintf("error sending bootloader signature\n");
+		}
+
+		/* download bl's rsa_pss_sig */
+		if (signed_msgs_file) {
+			char signature_filename[FILENAME_MAX_SIZE];
+
+			ret = create_name_string(signature_filename,
+						signed_msgs_file, ".bl");
+			if (ret)
 				return ret;
-			}
-		} else {
-			fprintf(stderr, "Error: missing pkc keyfile to sign"
-				" bootloader\n");
-			return -1;
+
+			// send the bootloader file
+			ret = send_file(h3p, signature_filename);
+		}
+
+		if (ret) {
+			dprintf("error sending bootloader signature\n");
+			return ret;
 		}
 	}
 
-- 
1.9.1
