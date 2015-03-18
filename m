From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 2/8] tegrarcm: Add support for loading cpu ucode
Date: Tue, 17 Mar 2015 17:38:54 -0700
Message-ID: <1426639141-12060-3-git-send-email-jimmzhang@nvidia.com>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Denver CPU in Tegra132 requires microcode to be loaded before CPU
initialization. There are two microcode files required, preboot ucode
"preboot_cr.bin" and cpu ucode "mts_cr.bin".  Add support for loading
ucode either by the filenames or by directory name from the command line.
Use default directory "/lib/firmware/nvidia/tegra132/denver-ucode" when
neither filename nor directory name is given in command line.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/Makefile.am                       |   2 +
 src/main.c                            | 292 ++++++++++++++++++++++++++++++++--
 src/miniloader/tegra132-mts.h         |  12 ++
 src/miniloader/tegra132-preboot-mts.h |  11 ++
 src/nv3p.c                            |  19 +++
 src/nv3p.h                            |   9 ++
 src/rcm.h                             |   1 +
 src/tegrarcm.1.in                     |   7 +
 8 files changed, 342 insertions(+), 11 deletions(-)
 create mode 100644 src/miniloader/tegra132-mts.h
 create mode 100644 src/miniloader/tegra132-preboot-mts.h

diff --git a/src/Makefile.am b/src/Makefile.am
index d0d45cad4fee..ba167f0dcc6c 100644
--- a/src/Makefile.am
+++ b/src/Makefile.am
@@ -19,6 +19,8 @@ tegrarcm_SOURCES = \
 	miniloader/tegra114-miniloader.h \
 	miniloader/tegra124-miniloader.h \
 	miniloader/tegra132-miniloader.h \
+	miniloader/tegra132-preboot-mts.h \
+	miniloader/tegra132-mts.h \
 	usb.h
 
 man_MANS = tegrarcm.1
diff --git a/src/main.c b/src/main.c
index 24d3bf81191f..6e708761adf9 100644
--- a/src/main.c
+++ b/src/main.c
@@ -63,16 +63,26 @@
 // tegra132 miniloader
 #include "miniloader/tegra132-miniloader.h"
 
+// tegra132 preboot mts
+#include "miniloader/tegra132-preboot-mts.h"
+
+// tegra132 mts
+#include "miniloader/tegra132-mts.h"
+
 static int initialize_rcm(uint16_t devid, usb_device_t *usb);
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry);
+static int initialize_preboot(usb_device_t *usb, char *pbfile, uint32_t pbentry, char *mtsdir);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
-static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
-			       uint32_t size, uint32_t entry);
+static int send_buf(nv3p_handle_t h3p, uint8_t *buf, uint64_t total);
+static int download_binary(uint32_t cmd, usb_device_t *usb,
+			   uint8_t *miniloader, uint32_t size, uint32_t entry);
 static void dump_platform_info(nv3p_platform_info_t *info);
 static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr);
+static int download_mts(nv3p_handle_t h3p, char *filename,
+			uint32_t loadaddr, uint16_t devid, char *mtsdir);
 static int read_bct(nv3p_handle_t h3p, char *filename);
 
 enum cmdline_opts {
@@ -84,6 +94,11 @@ enum cmdline_opts {
 	OPT_VERSION,
 	OPT_MINILOADER,
 	OPT_MINIENTRY,
+	OPT_PREBOOT,
+	OPT_PREBOOTENTRY,
+	OPT_MTS,
+	OPT_MTSENTRY,
+	OPT_MTSDIR,
 	OPT_END,
 };
 
@@ -117,6 +132,18 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tminiloader\n");
 	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
 	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
+	fprintf(stderr, "\t--preboot=pbfile\n");
+	fprintf(stderr, "\t\tRead the preboot ucode from given file\n");
+	fprintf(stderr, "\t--preboot-entry=<pbentry>\n");
+	fprintf(stderr, "\t\tSpecify the entry point for the preboot ucode\n");
+	fprintf(stderr, "\t--mts=mtsfile\n");
+	fprintf(stderr, "\t\tRead the cpu ucode from given file\n");
+	fprintf(stderr, "\t--mts-entry=<mtsentry>\n");
+	fprintf(stderr, "\t\tSpecify the entry point for the cpu ucode\n");
+	fprintf(stderr, "\t--mts-dir=full_mts_directory\n");
+	fprintf(stderr, "\t\tRead ucode files from given location with pre-defined\n");
+	fprintf(stderr, "\t\tfile name preboot_cr.bin and mts_cr.bin. mts-dir takes\n");
+	fprintf(stderr, "\t\tprecedence over mts and preboot options\n");
 	fprintf(stderr, "\n");
 }
 
@@ -139,6 +166,11 @@ int main(int argc, char **argv)
 	int do_read = 0;
 	char *mlfile = NULL;
 	uint32_t mlentry = 0;
+	char *pbfile = NULL;
+	uint32_t pbentry = 0;
+	char *mtsfile = NULL;
+	uint32_t mtsentry = 0;
+	char *mtsdir = NULL;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -149,6 +181,11 @@ int main(int argc, char **argv)
 		[OPT_VERSION]    = {"version", 0, 0, 0},
 		[OPT_MINILOADER] = {"miniloader", 1, 0, 0},
 		[OPT_MINIENTRY]  = {"miniloader_entry", 1, 0, 0},
+		[OPT_PREBOOT]    = {"preboot", 1, 0, 0},
+		[OPT_PREBOOTENTRY] = {"preboot-entry", 1, 0, 0},
+		[OPT_MTS]        = {"mts", 1, 0, 0},
+		[OPT_MTSENTRY]   = {"mts-entry", 1, 0, 0},
+		[OPT_MTSDIR]     = {"mts-dir", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -184,6 +221,21 @@ int main(int argc, char **argv)
 			case OPT_MINIENTRY:
 				mlentry = strtoul(optarg, NULL, 0);
 				break;
+			case OPT_PREBOOT:
+				pbfile = optarg;
+				break;
+			case OPT_PREBOOTENTRY:
+				pbentry = strtoul(optarg, NULL, 0);
+				break;
+			case OPT_MTS:
+				mtsfile = optarg;
+				break;
+			case OPT_MTSENTRY:
+				mtsentry = strtoul(optarg, NULL, 0);
+				break;
+			case OPT_MTSDIR:
+				mtsdir = optarg;
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -255,6 +307,13 @@ int main(int argc, char **argv)
 		if (ret2)
 			error(1, errno, "error initializing RCM protocol");
 
+		// download the mts_preboot ucode
+		if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA132) {
+			ret2 = initialize_preboot(usb, pbfile, pbentry, mtsdir);
+			if (ret2)
+				error(1, errno, "error initializing preboot mts");
+		}
+
 		// download the miniloader to start nv3p
 		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry);
 		if (ret2)
@@ -304,6 +363,13 @@ int main(int argc, char **argv)
 		error(1, ret, "error downloading bct: %s", bctfile);
 	}
 
+	// download mts
+	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA132) {
+		ret = download_mts(h3p, mtsfile, mtsentry, devid, mtsdir);
+		if (ret)
+			error(1, ret, "error downloading mts: %s", mtsfile);
+	}
+
 	// download the bootloader
 	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr);
 	if (ret)
@@ -377,6 +443,84 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb)
 	return 0;
 }
 
+static int initialize_preboot(usb_device_t *usb, char *pbfile, uint32_t pbentry,
+			char *mtsdir)
+{
+	int fd;
+	struct stat sb;
+	int ret;
+	uint8_t *preboot, *_preboot = NULL;
+	uint32_t pb_size;
+	uint32_t pb_entry;
+	char *_mtsdir = NULL;
+
+	if (!mtsdir && !pbfile) {
+		mtsdir = _mtsdir = (char *)malloc(strlen(TEGRA132_MTS_DIR) + 1);
+		sprintf(mtsdir, "%s", TEGRA132_MTS_DIR);
+	}
+
+	if (mtsdir) {
+		pbfile = (char *)malloc(strlen(mtsdir) + 2
+					 + strlen(TEGRA132_PREBOOT_MTS_FILE));
+		sprintf(pbfile, "%s/%s", mtsdir, TEGRA132_PREBOOT_MTS_FILE);
+		pbentry = TEGRA132_PREBOOT_MTS_ENTRY;
+	}
+
+	// use prebuilt preboot mts if not loading from a file
+	if (pbfile) {
+		fd = open(pbfile, O_RDONLY, 0);
+		if (fd < 0) {
+			fprintf(stderr, "error: %s\n", pbfile);
+			dprintf("error opening %s for reading\n", pbfile);
+			ret = errno;
+			goto done;
+		}
+		ret = fstat(fd, &sb);
+		if (ret) {
+			dprintf("error on fstat of %s\n", pbfile);
+			goto done;
+		}
+		pb_size = sb.st_size;
+		preboot = _preboot = (uint8_t *)malloc(pb_size);
+		if (!preboot) {
+			dprintf("error allocating %d bytes for preboot mts\n", pb_size);
+			ret = errno;
+			goto done;
+		}
+		if (read(fd, preboot, pb_size) != pb_size) {
+			dprintf("error reading from preboot mts file");
+			ret = errno;
+			goto done;
+		}
+		pb_entry = pbentry;
+	} else {
+		dprintf("error opening %s for reading\n", pbfile);
+		ret = errno;
+		goto done;
+	}
+
+	printf("downloading preboot mts to target at address 0x%x (%d bytes)...\n",
+	       pb_entry, pb_size);
+	ret = download_binary(RCM_CMD_DL_MTS, usb, preboot,
+			      pb_size, pb_entry);
+	if (ret) {
+		fprintf(stderr, "Error downloading preboot mts\n");
+		goto done;
+	}
+	printf("preboot mts downloaded successfully\n");
+done:
+	if (_mtsdir)
+		free(_mtsdir);
+
+	if (mtsdir && pbfile)
+		free(pbfile);
+
+	if (_preboot)
+		free(_preboot);
+
+	return ret;
+}
+
 static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry)
 {
 	int fd;
@@ -437,8 +581,8 @@ static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile
 	}
 	printf("downloading miniloader to target at address 0x%x (%d bytes)...\n",
 		miniloader_entry, miniloader_size);
-	ret = download_miniloader(usb, miniloader, miniloader_size,
-				  miniloader_entry);
+	ret = download_binary(RCM_CMD_DL_MINILOADER, usb, miniloader,
+			      miniloader_size, miniloader_entry);
 	if (ret) {
 		fprintf(stderr, "Error downloading miniloader\n");
 		return ret;
@@ -486,6 +630,44 @@ fail:
 
 
 /*
+* send_buf: send data present in buffer to nv3p server
+*/
+static int send_buf(nv3p_handle_t h3p, uint8_t *buf, uint64_t total)
+{
+	int ret = 0;
+	uint32_t size;
+	uint64_t count;
+	char *spinner = "-\\|/";
+	int spin_idx = 0;
+
+#define NVFLASH_DOWNLOAD_CHUNK (1024 * 64)
+
+	printf("sending data:\n");
+
+	count = 0;
+	while(count != total) {
+		size = (uint32_t)MIN(total - count, NVFLASH_DOWNLOAD_CHUNK);
+
+		ret = nv3p_data_send(h3p, buf, size);
+		if (ret)
+			goto fail;
+
+		count += size;
+		buf += size;
+
+		printf("\r%c %" PRIu64 "/%" PRIu64" bytes sent", spinner[spin_idx],
+		       count, total);
+		spin_idx = (spin_idx + 1) % 4;
+	}
+	printf("\ndata sent successfully\n");
+
+#undef NVFLASH_DOWNLOAD_CHUNK
+
+fail:
+	return ret;
+}
+
+/*
 * send_file: send data present in file "filename" to nv3p server.
 */
 static int send_file(nv3p_handle_t h3p, const char *filename)
@@ -561,29 +743,35 @@ fail:
 }
 
 
-static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
-			       uint32_t size, uint32_t entry)
+static int download_binary(uint32_t cmd, usb_device_t *usb,
+			   uint8_t *binary, uint32_t size, uint32_t entry)
 {
 	uint8_t *msg_buff;
 	int ret;
 	uint32_t status;
 	int actual_len;
 
-	// download the miniloader to the bootrom
-	rcm_create_msg(RCM_CMD_DL_MINILOADER,
-		       (uint8_t *)&entry, sizeof(entry), miniloader, size,
+	// create download message
+	rcm_create_msg(cmd,
+		       (uint8_t *)&entry, sizeof(entry), binary, size,
 		       &msg_buff);
 	ret = usb_write(usb, msg_buff, rcm_get_msg_len(msg_buff));
-	if (ret)
+	if (ret) {
+		dprintf("error sending %x command to target\n", cmd);
 		goto fail;
+	}
 	ret = usb_read(usb, (uint8_t *)&status, sizeof(status), &actual_len);
-	if (ret)
+	if (ret) {
+		dprintf("error reading status from target\n");
 		goto fail;
+	}
 	if (actual_len < sizeof(status)) {
+		dprintf("short read of status\n");
 		ret = EIO;
 		goto fail;
 	}
 	if (status != 0) {
+		dprintf("got bad status: %x\n", status);
 		ret = EIO;
 		goto fail;
 	}
@@ -807,3 +995,85 @@ static int download_bootloader(nv3p_handle_t h3p, char *filename,
 
 	return 0;
 }
+
+static int download_mts(nv3p_handle_t h3p, char *filename,
+			uint32_t loadaddr, uint16_t devid, char *mtsdir)
+{
+	int ret;
+	nv3p_cmd_dl_mts_t arg;
+	int fd;
+	struct stat sb;
+	uint8_t *buf;
+	char *_mtsdir = NULL;
+
+	if (!mtsdir && !filename) {
+		mtsdir = _mtsdir = (char *)malloc(strlen(TEGRA132_MTS_DIR) + 1);
+		sprintf(mtsdir, "%s", TEGRA132_MTS_DIR);
+	}
+
+	if (mtsdir) {
+		filename = (char *)malloc(strlen(mtsdir) + 2
+					 + strlen(TEGRA132_MTS_FILE));
+		sprintf(filename, "%s/%s", mtsdir, TEGRA132_MTS_FILE);
+		loadaddr = TEGRA132_MTS_ENTRY;
+	}
+
+	if (filename) {
+		fd = open(filename, O_RDONLY, 0);
+		if (fd < 0) {
+			fprintf(stderr, "error: %s\n", filename);
+			dprintf("error opening %s for reading\n", filename);
+			ret = errno;
+			goto done;
+		}
+
+		ret = fstat(fd, &sb);
+		if (ret) {
+			dprintf("error on fstat of %s\n", filename);
+			goto done;
+		}
+		close(fd);
+
+		arg.length = sb.st_size;
+		arg.address = loadaddr;
+	} else {
+		dprintf("error opening %s for reading\n", filename);
+		ret = errno;
+		goto done;
+	}
+
+	ret = nv3p_cmd_send(h3p, NV3P_CMD_DL_MTS, (uint8_t *)&arg);
+	if (ret) {
+		dprintf("error sending 3p mts download command\n");
+		goto done;
+	}
+
+	if (filename) {
+		// send the mts file
+		ret = send_file(h3p, filename);
+		if (ret) {
+			dprintf("error downloading mts\n");
+			goto done;
+		}
+	} else {
+		ret = send_buf(h3p, buf, arg.length);
+		if (ret) {
+			dprintf("error downloading mts\n");
+			goto done;
+		}
+	}
+
+	ret = wait_status(h3p);
+	if (ret) {
+		dprintf("error waiting for status on mts dl\n");
+	}
+
+done:
+	if (_mtsdir)
+		free(_mtsdir);
+
+	if (mtsdir && filename)
+		free(filename);
+
+	return ret;
+}
diff --git a/src/miniloader/tegra132-mts.h b/src/miniloader/tegra132-mts.h
new file mode 100644
index 000000000000..9cbc4f0ac77e
--- /dev/null
+++ b/src/miniloader/tegra132-mts.h
@@ -0,0 +1,12 @@
+/*
+ * Copyright (c) 2014 NVIDIA CORPORATION.  All Rights Reserved.
+ *
+ * NVIDIA CORPORATION and its licensors retain all intellectual property
+ * and proprietary rights in and to this software, related documentation
+ * and any modifications thereto.  Any use, reproduction, disclosure or
+ * distribution of this software and related documentation without an express
+ * license agreement from NVIDIA CORPORATION is strictly prohibited.
+ */
+#define TEGRA132_MTS_ENTRY 0x82000000
+#define TEGRA132_MTS_FILE "mts_cr.bin"
+#define TEGRA132_MTS_DIR "/lib/firmware/nvidia/tegra132/denver-ucode"
diff --git a/src/miniloader/tegra132-preboot-mts.h b/src/miniloader/tegra132-preboot-mts.h
new file mode 100644
index 000000000000..b3145fe99d2c
--- /dev/null
+++ b/src/miniloader/tegra132-preboot-mts.h
@@ -0,0 +1,11 @@
+/*
+ * Copyright (c) 2014 NVIDIA CORPORATION.  All Rights Reserved.
+ *
+ * NVIDIA CORPORATION and its licensors retain all intellectual property
+ * and proprietary rights in and to this software, related documentation
+ * and any modifications thereto.  Any use, reproduction, disclosure or
+ * distribution of this software and related documentation without an express
+ * license agreement from NVIDIA CORPORATION is strictly prohibited.
+ */
+#define TEGRA132_PREBOOT_MTS_ENTRY 0x4000f000
+#define TEGRA132_PREBOOT_MTS_FILE "preboot_cr.bin"
diff --git a/src/nv3p.c b/src/nv3p.c
index b2dff4286422..616485f4ce30 100644
--- a/src/nv3p.c
+++ b/src/nv3p.c
@@ -52,6 +52,7 @@
 /*   NV3P_CMD_DL_BCT                 */
 /*   NV3P_CMD_DL_BL                  */
 /*   NV3P_CMD_STATUS                 */
+/*   NV3P_CMD_DL_MTS                 */
 /*-----------------------------------*/
 /* command arguments                 */
 /*                 .                 */
@@ -346,6 +347,16 @@ static void nv3p_write_cmd(nv3p_handle_t h3p, uint32_t command, void *args,
 		WRITE32(tmp, a->entry);
 		break;
 	}
+	case NV3P_CMD_DL_MTS:
+	{
+		nv3p_cmd_dl_mts_t *a = (nv3p_cmd_dl_mts_t *)args;
+		*length = sizeof(nv3p_cmd_dl_mts_t);
+		WRITE32(tmp, *length);
+		WRITE32(tmp, command);
+		WRITE32(tmp, a->length);
+		WRITE32(tmp, a->address);
+		break;
+	}
 	default:
 		dprintf("bad command: 0x%x\n", command);
 		break;
@@ -423,6 +434,7 @@ static int nv3p_get_cmd_return(nv3p_handle_t h3p, uint32_t command, void *args)
 		break;
 	case NV3P_CMD_DL_BCT:
 	case NV3P_CMD_DL_BL:
+	case NV3P_CMD_DL_MTS:
 		break;
 	default:
 		dprintf("unknown command: 0x%x\n", command);
@@ -659,6 +671,13 @@ static int nv3p_get_args(nv3p_handle_t h3p, uint32_t command, void **args,
 		READ32(tmp, a->entry);
 		break;
 	}
+	case NV3P_CMD_DL_MTS:
+	{
+		nv3p_cmd_dl_mts_t *a = (nv3p_cmd_dl_mts_t *)buf;
+		READ32(tmp, a->length);
+		READ32(tmp, a->address);
+		break;
+	}
 	default:
 		dprintf("unknown command: 0x%x\n", command);
 		return EINVAL;
diff --git a/src/nv3p.h b/src/nv3p.h
index 6ee3ef3393a7..fd63f2824cbf 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -43,6 +43,7 @@
 #define NV3P_CMD_DL_BCT                  0x04
 #define NV3P_CMD_DL_BL                   0x06
 #define NV3P_CMD_STATUS                  0x0a
+#define NV3P_CMD_DL_MTS                  0x33
 
 // nack codes
 #define NV3P_NACK_SUCCESS                0x1
@@ -188,6 +189,14 @@ typedef struct {
 	uint32_t entry; // Execution entry point
 } nv3p_cmd_dl_bl_t;
 
+/*
+ * nv3p_cmd_dl_mts_t: downloads the mts ucode.
+ */
+typedef struct {
+	uint32_t length;
+	uint32_t address; // Load address
+} nv3p_cmd_dl_mts_t;
+
 int nv3p_open(nv3p_handle_t *h3p, usb_device_t *usb);
 void nv3p_close(nv3p_handle_t h3p);
 int nv3p_cmd_send(nv3p_handle_t h3p, uint32_t command, void *args);
diff --git a/src/rcm.h b/src/rcm.h
index ab4bea2d8752..7a66045e245d 100644
--- a/src/rcm.h
+++ b/src/rcm.h
@@ -47,6 +47,7 @@
 #define RCM_CMD_QUERY_BR_VERSION   0x5
 #define RCM_CMD_QUERY_RCM_VERSION  0x6
 #define RCM_CMD_QUERY_BD_VERSION   0x7
+#define RCM_CMD_DL_MTS             0xb
 
 // AES block size in bytes
 #define RCM_AES_BLOCK_SIZE      (128 / 8)
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index e0c2cc38d656..23e484e1a4cd 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -81,6 +81,13 @@ built-in one.
 .TP
 .B \-\-miniloader_entry \fImlentry\fP
 Specify the entry address of the miniloader.
+.TP
+.B \-\-preboot \fIpbfile\fP
+Read the preboot mts ucode from the specified file instead of using the
+built-in one.
+.TP
+.B \-\-preboot_entry \fIpbentry\fP
+Specify the entry address of the preboot mts ucode.
 
 .SH EXAMPLES
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.8.1.5
