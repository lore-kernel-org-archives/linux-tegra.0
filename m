From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 06/11] tegrarcm: Assume nv3p server is running if RCM doesn't respond
Date: Mon, 9 Sep 2013 13:15:56 -0700
Message-ID: <1378757761-20939-7-git-send-email-amartin@nvidia.com>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Change the initialization logic so that if RCM protocol isn't
repsonding but a tegra recovery USB is reported, assume the nv3p
server is already running.  This allows things like enumeration of
devices via nv3p without having to reset into RCM mode to talk to the
device again.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 161 ++++++++++++++++++++++++++++++++++++-------------------------
 1 file changed, 94 insertions(+), 67 deletions(-)

diff --git a/src/main.c b/src/main.c
index c898437..926a35d 100644
--- a/src/main.c
+++ b/src/main.c
@@ -60,6 +60,7 @@
 // tegra124 miniloader
 #include "miniloader/tegra124-miniloader.h"
 
+static int initialize_rcm(uint16_t devid, usb_device_t *usb);
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
@@ -95,11 +96,9 @@ static void usage(char *progname)
 int main(int argc, char **argv)
 {
 	// discover devices
-	uint8_t *msg_buff;
 	uint64_t uid[2];
 	int actual_len;
 	usb_device_t *usb;
-	uint32_t status;
 	nv3p_platform_info_t info;
 	nv3p_handle_t h3p;
 	int ret;
@@ -110,10 +109,6 @@ int main(int argc, char **argv)
 	uint32_t loadaddr = 0;
 	uint32_t entryaddr = 0;
 	uint16_t devid;
-	uint8_t *miniloader;
-	uint32_t miniloader_size;
-	uint32_t miniloader_entry;
-	int msg_len;
 
 	static struct option long_options[] = {
 		[OPT_BCT]        = {"bct", 1, 0, 0},
@@ -193,15 +188,72 @@ int main(int argc, char **argv)
 	printf("device id: 0x%x\n", devid);
 
 	ret = usb_read(usb, (uint8_t *)uid, sizeof(uid), &actual_len);
+	if (!ret) {
+		if (actual_len == 8)
+			printf("uid:  0x%016" PRIx64 "\n", uid[0]);
+		else if (actual_len == 16)
+			printf("uid:  0x%016" PRIx64 "%016" PRIx64 "\n",
+			       uid[1], uid[0]);
+		else
+			error(1, errno, "USB read truncated");
+
+		// initialize rcm and download the miniloader to start nv3p
+		initialize_rcm(devid, usb);
+
+		// device may have re-enumerated, so reopen USB
+		usb_close(usb);
+		usb = usb_open(USB_VENID_NVIDIA, &devid);
+		if (!usb)
+			error(1, errno, "could not open USB device");
+	}
+
+	// now that miniloader is up, start nv3p protocol
+	ret = nv3p_open(&h3p, usb);
+	if (ret)
+		error(1, errno, "3p open failed");
+
+	// get platform info and dump it
+	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)&info);
+	if (ret)
+		error(1, errno, "retreiving platform info");
+	ret = wait_status(h3p);
+	if (ret)
+		error(1, errno, "wait status after platform info");
+	dump_platform_info(&info);
+
+	if (info.op_mode != RCM_OP_MODE_DEVEL &&
+	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
+	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
+		error(1, ENODEV, "device is not in developer, open, "
+		      "or pre-production mode, cannot flash");
+
+	// download the BCT
+	ret = download_bct(h3p, bctfile);
+	if (ret) {
+		error(1, ret, "error downloading bct: %s", bctfile);
+	}
+
+	// download the bootloader
+	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr);
 	if (ret)
-		error(1, ret, "USB transfer failure");
-	if (actual_len == 8)
-		printf("uid:  0x%016" PRIx64 "\n", uid[0]);
-	else if (actual_len == 16)
-		printf("uid:  0x%016" PRIx64 "%016" PRIx64 "\n",
-		       uid[1], uid[0]);
-	else
-		error(1, errno, "USB read truncated");
+		error(1, ret, "error downloading bootloader: %s", blfile);
+
+	nv3p_close(h3p);
+	usb_close(usb);
+
+	return 0;
+}
+
+static int initialize_rcm(uint16_t devid, usb_device_t *usb)
+{
+	int ret;
+	uint8_t *msg_buff;
+	int msg_len;
+	uint32_t status;
+	int actual_len;
+	uint8_t *miniloader;
+	uint32_t miniloader_size;
+	uint32_t miniloader_entry;
 
 	// initialize RCM
 	if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
@@ -215,30 +267,41 @@ int main(int argc, char **argv)
 		dprintf("initializing RCM version 40\n");
 		ret = rcm_init(RCM_VERSION_40);
 	} else {
-		error(1, ENODEV, "unknown tegra device: 0x%x", devid);
+		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
+		return errno;
+	}
+	if (ret) {
+		fprintf(stderr, "RCM initialize failed\n");
+		return ret;
 	}
-	if (ret)
-		error(1, errno, "RCM initialize failed");
 
 	// create query version message
 	rcm_create_msg(RCM_CMD_QUERY_RCM_VERSION, NULL, 0, NULL, 0, &msg_buff);
 
 	// write query version message to device
 	msg_len = rcm_get_msg_len(msg_buff);
-	if (msg_len == 0)
-		error(1, EINVAL, "unknown message length");
+	if (msg_len == 0) {
+		fprintf(stderr, "write RCM query version: unknown message length\n");
+		return EINVAL;
+	}
 	ret = usb_write(usb, msg_buff, msg_len);
-	if (ret)
-		error(1, errno, "write query version - USB transfer failure");
+	if (ret) {
+		fprintf(stderr, "write RCM query version: USB transfer failure\n");
+		return ret;
+	}
 	free(msg_buff);
 	msg_buff = NULL;
 
 	// read response
 	ret = usb_read(usb, (uint8_t *)&status, sizeof(status), &actual_len);
-	if (ret)
-		error(1, ret, "read query version - USB transfer failure");
-	if (actual_len < sizeof(status))
-		error(1, EIO, "read query version - USB read truncated");
+	if (ret) {
+		fprintf(stderr, "read RCM query version: USB transfer failure\n");
+		return ret;
+	}
+	if (actual_len < sizeof(status)) {
+		fprintf(stderr, "read RCM query version: USB read truncated\n");
+		return EIO;
+	}
 	printf("RCM version: %d.%d\n", RCM_VERSION_MAJOR(status),
 	       RCM_VERSION_MINOR(status));
 
@@ -260,57 +323,21 @@ int main(int argc, char **argv)
 		miniloader_size = sizeof(miniloader_tegra124);
 		miniloader_entry = TEGRA124_MINILOADER_ENTRY;
 	} else {
-		error(1, ENODEV, "unknown tegra device: 0x%x", devid);
+		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
+		return ENODEV;
 	}
 	ret = download_miniloader(usb, miniloader, miniloader_size,
 				  miniloader_entry);
-	if (ret)
-		error(1, ret, "Error downloading miniloader");
-	printf("miniloader downloaded successfully\n");
-
-	// device may have re-enumerated, so reopen USB
-	usb_close(usb);
-	usb = usb_open(USB_VENID_NVIDIA, &devid);
-	if (!usb)
-		error(1, errno, "could not open USB device");
-
-	// now that miniloader is up, start nv3p protocol
-	ret = nv3p_open(&h3p, usb);
-	if (ret)
-		error(1, errno, "3p open failed");
-
-	// get platform info and dump it
-	ret = nv3p_cmd_send(h3p, NV3P_CMD_GET_PLATFORM_INFO, (uint8_t *)&info);
-	if (ret)
-		error(1, errno, "retreiving platform info");
-	ret = wait_status(h3p);
-	if (ret)
-		error(1, errno, "wait status after platform info");
-	dump_platform_info(&info);
-
-	if (info.op_mode != RCM_OP_MODE_DEVEL &&
-	    info.op_mode != RCM_OP_MODE_ODM_OPEN &&
-	    info.op_mode != RCM_OP_MODE_PRE_PRODUCTION)
-		error(1, ENODEV, "device is not in developer, open, "
-		      "or pre-production mode, cannot flash");
-
-	// download the BCT
-	ret = download_bct(h3p, bctfile);
 	if (ret) {
-		error(1, ret, "error downloading bct: %s", bctfile);
+		fprintf(stderr, "Error downloading miniloader\n");
+		return ret;
 	}
-
-	// download the bootloader
-	ret = download_bootloader(h3p, blfile, entryaddr, loadaddr);
-	if (ret)
-		error(1, ret, "error downloading bootloader: %s", blfile);
-
-	nv3p_close(h3p);
-	usb_close(usb);
+	printf("miniloader downloaded successfully\n");
 
 	return 0;
 }
 
+
 static int wait_status(nv3p_handle_t h3p)
 {
 	int ret;
-- 
1.8.1.5
