From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 09/11] tegrarcm: Add readbct support
Date: Mon, 16 Sep 2013 15:24:56 -0700
Message-ID: <1379370298-20404-10-git-send-email-amartin@nvidia.com>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a new command "readbct" which will read the BCT from the target
system and write it to bctfile.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 119 ++++++++++++++++++++++++++++++++++++++++++++++--------
 src/nv3p.c        |  10 +++--
 src/nv3p.h        |  16 ++++++++
 src/tegrarcm.1.in |  17 +++++++-
 4 files changed, 141 insertions(+), 21 deletions(-)

diff --git a/src/main.c b/src/main.c
index 80de04c..cf55748 100644
--- a/src/main.c
+++ b/src/main.c
@@ -69,6 +69,7 @@ static void dump_platform_info(nv3p_platform_info_t *info);
 static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr);
+static int read_bct(nv3p_handle_t h3p, char *filename);
 
 enum cmdline_opts {
 	OPT_BCT,
@@ -88,6 +89,14 @@ static void print_version(char *progname)
 static void usage(char *progname)
 {
 	fprintf(stderr, "usage: %s [options] --bct=bctfile --bootloader=blfile --loadaddr=<loadaddr>\n", progname);
+	fprintf(stderr, "       %s [options] --bct=bctfile readbct\n", progname);
+	fprintf(stderr, "\n");
+	fprintf(stderr, "Commands:\n");
+	fprintf(stderr, "\treadbct\n");
+	fprintf(stderr, "\t\tRead the BCT from the target device and write to bctfile\n");
+	fprintf(stderr, "\n");
+	fprintf(stderr, "\tDefault operation if no command is specified will download BCT and\n");
+	fprintf(stderr, "\tbootloader to device and start execution of bootloader\n");
 	fprintf(stderr, "\n");
 	fprintf(stderr, "Options:\n");
 	fprintf(stderr, "\t--entryaddr=<entryaddr>\n");
@@ -116,6 +125,7 @@ int main(int argc, char **argv)
 	uint32_t loadaddr = 0;
 	uint32_t entryaddr = 0;
 	uint16_t devid;
+	int do_read = 0;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -152,6 +162,7 @@ int main(int argc, char **argv)
 			case OPT_VERSION:
 				print_version(argv[0]);
 				exit(0);
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -165,29 +176,43 @@ int main(int argc, char **argv)
 		}
 	}
 
+	while (optind < argc) {
+		if (!(strcmp(argv[optind], "readbct")))
+			do_read = 1;
+		else {
+			fprintf(stderr, "%s: Unknown command line argument: %s\n",
+				argv[0], argv[optind]);
+			usage(argv[0]);
+			exit(EXIT_FAILURE);
+		}
+		optind++;
+	}
+
 	if (bctfile == NULL) {
 		fprintf(stderr, "BCT file must be specified\n");
 		usage(argv[0]);
 		exit(EXIT_FAILURE);
 	}
-	if (blfile == NULL) {
-		fprintf(stderr, "bootloader file must be specified\n");
-		usage(argv[0]);
-		exit(EXIT_FAILURE);
-	}
-	if (loadaddr == 0) {
-		fprintf(stderr, "loadaddr must be specified\n");
-		usage(argv[0]);
-		exit(EXIT_FAILURE);
-	}
-	if (entryaddr == 0) {
-		entryaddr = loadaddr;
-	}
-
 	printf("bct file: %s\n", bctfile);
-	printf("booloader file: %s\n", blfile);
-	printf("load addr 0x%x\n", loadaddr);
-	printf("entry addr 0x%x\n", entryaddr);
+
+	if (!do_read) {
+		if (blfile == NULL) {
+			fprintf(stderr, "bootloader file must be specified\n");
+			usage(argv[0]);
+			exit(EXIT_FAILURE);
+		}
+		if (loadaddr == 0) {
+			fprintf(stderr, "loadaddr must be specified\n");
+			usage(argv[0]);
+			exit(EXIT_FAILURE);
+		}
+		if (entryaddr == 0) {
+			entryaddr = loadaddr;
+		}
+		printf("booloader file: %s\n", blfile);
+		printf("load addr 0x%x\n", loadaddr);
+		printf("entry addr 0x%x\n", entryaddr);
+	}
 
 	usb = usb_open(USB_VENID_NVIDIA, &devid);
 	if (!usb)
@@ -219,6 +244,16 @@ int main(int argc, char **argv)
 	if (ret)
 		error(1, errno, "3p open failed");
 
+	// read the BCT
+	if (do_read) {
+		printf("reading BCT from system, writing to %s...", bctfile);
+		ret = read_bct(h3p, bctfile);
+		if (ret)
+			error(1, errno, "error reading bct");
+		printf("done!\n");
+		exit(0);
+	}
+
 	// get platform info and dump it
 	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)&info);
 	if (ret)
@@ -595,6 +630,56 @@ static int download_bct(nv3p_handle_t h3p, char *filename)
 }
 
 
+static int read_bct(nv3p_handle_t h3p, char *filename)
+{
+	int ret;
+	nv3p_bct_info_t bct_info;
+	uint8_t *bct_data;
+	int fd;
+	uint8_t *buf;
+
+	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_BCT, (uint8_t *)&bct_info);
+	if (ret) {
+		dprintf("error sending get bct command\n");
+		return ret;
+	}
+	ret = wait_status(h3p);
+	if (ret) {
+		dprintf("error waiting for status after get bct\n");
+		return ret;
+	}
+
+	bct_data = (uint8_t *)malloc(bct_info.length);
+	ret = nv3p_data_recv(h3p, bct_data, bct_info.length);
+	if (ret) {
+		dprintf("error retreiving bct data\n");
+		return ret;
+	}
+
+	fd = open(filename, O_WRONLY | O_CREAT, 0644);
+	if (fd < 0) {
+		dprintf("error opening %s for reading\n", filename);
+		return errno;
+	}
+
+	buf = bct_data;
+	while(bct_info.length > 0) {
+		ssize_t written = write(fd, buf, bct_info.length);
+		if (written == -1) {
+			if (errno == EINTR)
+				continue;
+			dprintf("error writing to %s\n", filename);
+			return errno;
+		}
+		buf += written;
+		bct_info.length -= written;
+	}
+
+	free(bct_data);
+	close(fd);
+	return 0;
+}
+
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr)
 {
diff --git a/src/nv3p.c b/src/nv3p.c
index b3f6045..b2dff42 100644
--- a/src/nv3p.c
+++ b/src/nv3p.c
@@ -123,7 +123,7 @@ typedef struct nv3p_state {
  * double the currently-largest command size, just to have some wiggle-room
  * (updates to commands without fixing this on accident, etc.)
  */
-#define NV3P_MAX_COMMAND_SIZE  128
+#define NV3P_MAX_COMMAND_SIZE  (2 << 12)
 
 #define NV3P_MAX_ACK_SIZE \
     NV3P_PACKET_SIZE_BASIC + \
@@ -209,7 +209,6 @@ static int nv3p_recv_hdr(nv3p_handle_t h3p, nv3p_header_t *hdr,
 			 uint32_t *checksum );
 static int nv3p_drain_packet(nv3p_handle_t h3p, nv3p_header_t *hdr );
 static void nv3p_nack(nv3p_handle_t h3p, uint32_t code);
-static int nv3p_data_recv(nv3p_handle_t h3p, uint8_t *data, uint32_t length);
 static int nv3p_read(usb_device_t *usb, uint8_t *buf, int len);
 static int nv3p_get_args(nv3p_handle_t h3p, uint32_t command, void **args,
 			 uint8_t *packet );
@@ -321,6 +320,7 @@ static void nv3p_write_cmd(nv3p_handle_t h3p, uint32_t command, void *args,
 
 	switch(command) {
 	case NV3P_CMD_GET_PLATFORM_INFO:
+	case NV3P_CMD_GET_BCT:
 		// no args or output only
 		*length = 0;
 		WRITE32(tmp, *length);
@@ -418,6 +418,9 @@ static int nv3p_get_cmd_return(nv3p_handle_t h3p, uint32_t command, void *args)
 	case NV3P_CMD_GET_PLATFORM_INFO:
 		length = sizeof(nv3p_platform_info_t);
 		break;
+	case NV3P_CMD_GET_BCT:
+		length = sizeof(nv3p_bct_info_t);
+		break;
 	case NV3P_CMD_DL_BCT:
 	case NV3P_CMD_DL_BL:
 		break;
@@ -467,7 +470,7 @@ static int nv3p_recv_hdr(nv3p_handle_t h3p, nv3p_header_t *hdr,
 	return 0;
 }
 
-static int nv3p_data_recv(nv3p_handle_t h3p, uint8_t *data, uint32_t length)
+int nv3p_data_recv(nv3p_handle_t h3p, uint8_t *data, uint32_t length)
 {
 	int ret;
 	uint8_t *tmp;
@@ -629,6 +632,7 @@ static int nv3p_get_args(nv3p_handle_t h3p, uint32_t command, void **args,
 
 	switch(command) {
 	case NV3P_CMD_GET_PLATFORM_INFO:
+	case NV3P_CMD_GET_BCT:
 		// output only
 		break;
 	case NV3P_CMD_STATUS:
diff --git a/src/nv3p.h b/src/nv3p.h
index 2f4c94e..e3498bc 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -39,6 +39,7 @@
 
 // commands
 #define NV3P_CMD_GET_PLATFORM_INFO       0x01
+#define NV3P_CMD_GET_BCT                 0x02
 #define NV3P_CMD_DL_BCT                  0x04
 #define NV3P_CMD_DL_BL                   0x06
 #define NV3P_CMD_STATUS                  0x0a
@@ -155,6 +156,20 @@ typedef struct {
 
 
 /*
+ * nv3p_bct_info_t: holds information about BCT size
+ */
+typedef struct {
+	uint32_t length;
+} nv3p_bct_info_t;
+
+/*
+ * nv3p_cmd_get_bct_t: retrieves the BCT from the device
+ */
+typedef struct {
+	uint32_t length;
+} nv3p_cmd_get_bct_t;
+
+/*
  * nv3p_cmd_dl_bct_t: downloads the system's BCT.
  */
 typedef struct {
@@ -176,5 +191,6 @@ int nv3p_cmd_send(nv3p_handle_t h3p, uint32_t command, void *args);
 int nv3p_cmd_recv(nv3p_handle_t h3p, uint32_t *command,	void **args);
 int nv3p_data_send(nv3p_handle_t h3p, uint8_t *data, uint32_t length);
 void nv3p_ack(nv3p_handle_t h3p);
+int nv3p_data_recv(nv3p_handle_t h3p, uint8_t *data, uint32_t length);
 
 #endif // NV3P_H
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 011d169..7993110 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -40,6 +40,11 @@ Build some firmware for your device (such as u-boot)
 .IP \(em
 Run tegrarcm to download the firmware
 
+.SH COMMANDS
+.TP
+.B readbct
+Read the BCT from the target device and write it to \fIbctfile\fP.
+
 .SH OPTIONS
 .TP
 .B \-\-bct \fIbctfile\fP
@@ -67,8 +72,9 @@ Print the version number and exit.
 .TP
 .B \-\-help
 Print help text and exit.
+.TP
 
-.SH EXAMPLE
+.SH EXAMPLES
 To download u-boot firmware to a Tegra20 seaboard:
 
 .nf
@@ -101,6 +107,15 @@ sending file: u-boot.bin
 u-boot.bin sent successfully
 .fi
 
+To read the BCT from a system:
+
+.nf
+$ sudo tegrarcm --bct ventana.bct readbct
+bct file: ventana.bct
+device id: 0x7820
+reading BCT from system, writing to ventana.bct...done!
+.fi
+
 .SH RETURN VALUE
 If any error occurs a non zero exit status is returned.
 
-- 
1.8.1.5
