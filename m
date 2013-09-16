From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 10/11] tegrarcm: Add command to pass miniloader in from file
Date: Mon, 16 Sep 2013 15:24:57 -0700
Message-ID: <1379370298-20404-11-git-send-email-amartin@nvidia.com>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add --miniloader and --miniloader_entry commands which allow passing
in the miniloader from a file and specifying the miniloader entry
address from the command line instead of using built-in miniloader.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 110 +++++++++++++++++++++++++++++++++++++++++-------------
 src/tegrarcm.1.in |   6 +++
 2 files changed, 91 insertions(+), 25 deletions(-)

diff --git a/src/main.c b/src/main.c
index cf55748..f50006f 100644
--- a/src/main.c
+++ b/src/main.c
@@ -61,6 +61,7 @@
 #include "miniloader/tegra124-miniloader.h"
 
 static int initialize_rcm(uint16_t devid, usb_device_t *usb);
+static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
@@ -78,6 +79,8 @@ enum cmdline_opts {
 	OPT_ENTRYADDR,
 	OPT_HELP,
 	OPT_VERSION,
+	OPT_MINILOADER,
+	OPT_MINIENTRY,
 	OPT_END,
 };
 
@@ -106,6 +109,11 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tPrint this help information\n");
 	fprintf(stderr, "\t--version\n");
 	fprintf(stderr, "\t\tPrint version information and exit\n");
+	fprintf(stderr, "\t--miniloader=mlfile\n");
+	fprintf(stderr, "\t\tRead the miniloader from file instead of using built-in\n");
+	fprintf(stderr, "\t\tminiloader\n");
+	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
+	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
 	fprintf(stderr, "\n");
 }
 
@@ -117,7 +125,7 @@ int main(int argc, char **argv)
 	usb_device_t *usb;
 	nv3p_platform_info_t info;
 	nv3p_handle_t h3p;
-	int ret;
+	int ret, ret2;
 	int c;
 	int option_index = 0;
 	char *bctfile = NULL;
@@ -126,6 +134,8 @@ int main(int argc, char **argv)
 	uint32_t entryaddr = 0;
 	uint16_t devid;
 	int do_read = 0;
+	char *mlfile = NULL;
+	uint32_t mlentry = 0;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -134,6 +144,8 @@ int main(int argc, char **argv)
 		[OPT_ENTRYADDR]  = {"entryaddr", 1, 0, 0},
 		[OPT_HELP]       = {"help", 0, 0, 0},
 		[OPT_VERSION]    = {"version", 0, 0, 0},
+		[OPT_MINILOADER] = {"miniloader", 1, 0, 0},
+		[OPT_MINIENTRY]  = {"miniloader_entry", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 
@@ -163,6 +175,12 @@ int main(int argc, char **argv)
 				print_version(argv[0]);
 				exit(0);
 				break;
+			case OPT_MINILOADER:
+				mlfile = optarg;
+				break;
+			case OPT_MINIENTRY:
+				mlentry = strtoul(optarg, NULL, 0);
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
@@ -229,8 +247,15 @@ int main(int argc, char **argv)
 		else
 			error(1, errno, "USB read truncated");
 
-		// initialize rcm and download the miniloader to start nv3p
-		initialize_rcm(devid, usb);
+		// initialize rcm
+		ret2 = initialize_rcm(devid, usb);
+		if (ret2)
+			error(1, errno, "error initializing RCM protocol");
+
+		// download the miniloader to start nv3p
+		ret2 = initialize_miniloader(devid, usb, mlfile, mlentry);
+		if (ret2)
+			error(1, errno, "error initializing miniloader");
 
 		// device may have re-enumerated, so reopen USB
 		usb_close(usb);
@@ -293,9 +318,6 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb)
 	int msg_len;
 	uint32_t status;
 	int actual_len;
-	uint8_t *miniloader;
-	uint32_t miniloader_size;
-	uint32_t miniloader_entry;
 
 	// initialize RCM
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
@@ -347,27 +369,65 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb)
 	printf("RCM version: %d.%d\n", RCM_VERSION_MAJOR(status),
 	       RCM_VERSION_MINOR(status));
 
-	printf("downloading miniloader to target...\n");
-	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20) {
-		miniloader = miniloader_tegra20;
-		miniloader_size = sizeof(miniloader_tegra20);
-		miniloader_entry = TEGRA20_MINILOADER_ENTRY;
-	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30) {
-		miniloader = miniloader_tegra30;
-		miniloader_size = sizeof(miniloader_tegra30);
-		miniloader_entry = TEGRA30_MINILOADER_ENTRY;
-	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
-		miniloader = miniloader_tegra114;
-		miniloader_size = sizeof(miniloader_tegra114);
-		miniloader_entry = TEGRA114_MINILOADER_ENTRY;
-	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
-		miniloader = miniloader_tegra124;
-		miniloader_size = sizeof(miniloader_tegra124);
-		miniloader_entry = TEGRA124_MINILOADER_ENTRY;
+	return 0;
+}
+
+static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char *mlfile, uint32_t mlentry)
+{
+	int fd;
+	struct stat sb;
+	int ret;
+	uint8_t *miniloader;
+	uint32_t miniloader_size;
+	uint32_t miniloader_entry;
+
+	// use prebuilt miniloader if not loading from a file
+	if (mlfile) {
+		fd = open(mlfile, O_RDONLY, 0);
+		if (fd < 0) {
+			dprintf("error opening %s for reading\n", mlfile);
+			return errno;
+		}
+		ret = fstat(fd, &sb);
+		if (ret) {
+			dprintf("error on fstat of %s\n", mlfile);
+			return ret;
+		}
+		miniloader_size = sb.st_size;
+		miniloader = (uint8_t *)malloc(miniloader_size);
+		if (!miniloader) {
+			dprintf("error allocating %d bytes for miniloader\n", miniloader_size);
+			return errno;
+		}
+		if (read(fd, miniloader, miniloader_size) != miniloader_size) {
+			dprintf("error reading from miniloader file");
+			return errno;
+		}
+		miniloader_entry = mlentry;
 	} else {
-		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
-		return ENODEV;
+		if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20) {
+			miniloader = miniloader_tegra20;
+			miniloader_size = sizeof(miniloader_tegra20);
+			miniloader_entry = TEGRA20_MINILOADER_ENTRY;
+		} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30) {
+			miniloader = miniloader_tegra30;
+			miniloader_size = sizeof(miniloader_tegra30);
+			miniloader_entry = TEGRA30_MINILOADER_ENTRY;
+		} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
+			miniloader = miniloader_tegra114;
+			miniloader_size = sizeof(miniloader_tegra114);
+			miniloader_entry = TEGRA114_MINILOADER_ENTRY;
+		} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
+			miniloader = miniloader_tegra124;
+			miniloader_size = sizeof(miniloader_tegra124);
+			miniloader_entry = TEGRA124_MINILOADER_ENTRY;
+		} else {
+			fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
+			return ENODEV;
+		}
 	}
+	printf("downloading miniloader to target at address 0x%x (%d bytes)...\n",
+		miniloader_entry, miniloader_size);
 	ret = download_miniloader(usb, miniloader, miniloader_size,
 				  miniloader_entry);
 	if (ret) {
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 7993110..f747fd8 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -73,6 +73,12 @@ Print the version number and exit.
 .B \-\-help
 Print help text and exit.
 .TP
+.B \-\-miniloader \fImlfile\fP
+Read the miniloader from the specified file instead of using the
+built-in one.
+.TP
+.B \-\-miniloader_entry \fImlentry\fP
+Specify the entry address of the miniloader.
 
 .SH EXAMPLES
 To download u-boot firmware to a Tegra20 seaboard:
-- 
1.8.1.5
