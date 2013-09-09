From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 08/11] tegrarcm: Add rip support
Date: Mon, 9 Sep 2013 13:15:58 -0700
Message-ID: <1378757761-20939-9-git-send-email-amartin@nvidia.com>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a new command "--ripbct" which will rip the BCT from the target
system and write it to bctfile.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 97 +++++++++++++++++++++++++++++++++++++++++++++----------
 src/nv3p.c        | 10 ++++--
 src/nv3p.h        | 16 +++++++++
 src/tegrarcm.1.in |  5 +++
 4 files changed, 108 insertions(+), 20 deletions(-)

diff --git a/src/main.c b/src/main.c
index d32f41b..57bbefb 100644
--- a/src/main.c
+++ b/src/main.c
@@ -69,6 +69,7 @@ static void dump_platform_info(nv3p_platform_info_t *info);
 static int download_bct(nv3p_handle_t h3p, char *filename);
 static int download_bootloader(nv3p_handle_t h3p, char *filename,
 			       uint32_t entry, uint32_t loadaddr);
+static int rip_bct(nv3p_handle_t h3p, char *filename);
 
 enum cmdline_opts {
 	OPT_BCT,
@@ -77,6 +78,7 @@ enum cmdline_opts {
 	OPT_ENTRYADDR,
 	OPT_HELP,
 	OPT_VERSION,
+	OPT_RIPBCT,
 	OPT_END,
 };
 
@@ -97,6 +99,8 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tPrint this help information\n");
 	fprintf(stderr, "\t--version\n");
 	fprintf(stderr, "\t\tPrint version information and exit\n");
+	fprintf(stderr, "\t--ripbct\n");
+	fprintf(stderr, "\t\tRead the BCT from the target device and write to bctfile\n");
 	fprintf(stderr, "\n");
 }
 
@@ -116,6 +120,8 @@ int main(int argc, char **argv)
 	uint32_t loadaddr = 0;
 	uint32_t entryaddr = 0;
 	uint16_t devid;
+	int do_rip = 0;
+	int msg_len;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -124,6 +130,7 @@ int main(int argc, char **argv)
 		[OPT_ENTRYADDR]  = {"entryaddr", 1, 0, 0},
 		[OPT_HELP]       = {"help", 0, 0, 0},
 		[OPT_VERSION]    = {"version", 0, 0, 0},
+		[OPT_RIPBCT]     = {"ripbct", 0, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -152,6 +159,9 @@ int main(int argc, char **argv)
 			case OPT_VERSION:
 				print_version(argv[0]);
 				exit(0);
+			case OPT_RIPBCT:
+				do_rip = 1;
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -170,24 +180,25 @@ int main(int argc, char **argv)
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
+	if (!do_rip) {
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
@@ -219,6 +230,14 @@ int main(int argc, char **argv)
 	if (ret)
 		error(1, errno, "3p open failed");
 
+	// rip the BCT
+	if (do_rip) {
+		ret = rip_bct(h3p, bctfile);
+		if (ret)
+			error(1, errno, "error ripping bct");
+		exit(0);
+	}
+
 	// get platform info and dump it
 	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)&info);
 	if (ret)
@@ -593,6 +612,50 @@ static int download_bct(nv3p_handle_t h3p, char *filename)
 }
 
 
+static int rip_bct(nv3p_handle_t h3p, char *filename)
+{
+	int ret;
+	nv3p_bct_info_t bct_info;
+	uint8_t *bct_data;
+	int fd;
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
+	printf("bct length is %d\n", bct_info.length);
+
+	bct_data = (uint8_t *)malloc(bct_info.length);
+	ret = nv3p_data_recv(h3p, bct_data, bct_info.length);
+	if (ret) {
+		dprintf("error retreiving bct data\n");
+		return ret;
+	}
+	printf("bct: 0x%02x 0x%02x 0x%02x 0x%02x\n", bct_data[0], bct_data[1], bct_data[2], bct_data[3]);
+
+	fd = open(filename, O_WRONLY | O_CREAT, 0644);
+	if (fd < 0) {
+		dprintf("error opening %s for reading\n", filename);
+		return errno;
+	}
+
+	if (write(fd, bct_data, bct_info.length) != bct_info.length) {
+		dprintf("short write on %s\n", filename);
+		return errno;
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
index f57f510..5ceba78 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -39,6 +39,7 @@
 
 // commands
 #define NV3P_CMD_GET_PLATFORM_INFO       0x01
+#define NV3P_CMD_GET_BCT                 0x02
 #define NV3P_CMD_DL_BCT                  0x04
 #define NV3P_CMD_DL_BL                   0x06
 #define NV3P_CMD_STATUS                  0x0a
@@ -152,6 +153,20 @@ typedef struct {
 
 
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
@@ -173,5 +188,6 @@ int nv3p_cmd_send(nv3p_handle_t h3p, uint32_t command, void *args);
 int nv3p_cmd_recv(nv3p_handle_t h3p, uint32_t *command,	void **args);
 int nv3p_data_send(nv3p_handle_t h3p, uint8_t *data, uint32_t length);
 void nv3p_ack(nv3p_handle_t h3p);
+int nv3p_data_recv(nv3p_handle_t h3p, uint8_t *data, uint32_t length);
 
 #endif // NV3P_H
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 011d169..1f72c65 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -67,6 +67,11 @@ Print the version number and exit.
 .TP
 .B \-\-help
 Print help text and exit.
+.TP
+.B \-\-ripbct
+Read the BCT from the target device and write it to \fIbctfile\fP.  If
+this option is specified, the --bootloader, --loadaddr, and
+--entryaddr options are ignored.
 
 .SH EXAMPLE
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.8.1.5
