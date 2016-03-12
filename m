From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH V2 4/4] Add option --usb-timeout=<value>
Date: Fri, 11 Mar 2016 17:02:32 -0800
Message-ID: <1457744552-30966-5-git-send-email-jimmzhang@nvidia.com>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457744552-30966-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

RCM communication sometimes fails if the USB timeout is short. The default
timeout is 1000ms. Increase the timeout value to avoid this issue. The exact
cause is not yet diagnosed.

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c | 8 ++++++++
 src/usb.c  | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/src/main.c b/src/main.c
index cb12138ae66c..acda0b1b607f 100644
--- a/src/main.c
+++ b/src/main.c
@@ -89,6 +89,7 @@ static void set_platform_info(nv3p_platform_info_t *info);
 static uint32_t get_op_mode(void);
 
 static nv3p_platform_info_t *g_platform_info = NULL;
+extern uint32_t usb_timeout;
 
 enum cmdline_opts {
 	OPT_BCT,
@@ -107,6 +108,7 @@ enum cmdline_opts {
 	OPT_SIGNED_MSGS_FILE,
 	OPT_SOC,
 	OPT_DOWNLOAD_SIGNED_MSGS,
+	OPT_USB_TIMEOUT,
 	OPT_END,
 };
 
@@ -157,6 +159,8 @@ static void usage(char *progname)
 	fprintf(stderr, "\t\tSpecify Tegra SoC chip model number, ie, 124.\n");
 	fprintf(stderr, "\t--download-signed-msgs\n");
 	fprintf(stderr, "\t\tDownload signed messages\n");
+	fprintf(stderr, "\t--usb-timeout=<timeout_ms>\n");
+	fprintf(stderr, "\t\tSpecify usb transfer timeout value in ms, 0 for unlimited timeout\n");
 	fprintf(stderr, "\n");
 }
 
@@ -261,6 +265,7 @@ int main(int argc, char **argv)
 		[OPT_SIGNED_MSGS_FILE] = {"signed-msgs-file", 1, 0, 0},
 		[OPT_SOC]        = {"soc", 1, 0, 0},
 		[OPT_DOWNLOAD_SIGNED_MSGS] = {"download-signed-msgs", 0, 0, 0},
+		[OPT_USB_TIMEOUT] = {"usb-timeout", 1, 0, 0},
 		[OPT_END]        = {0, 0, 0, 0}
 	};
 	// parse command line args
@@ -318,6 +323,9 @@ int main(int argc, char **argv)
 			case OPT_DOWNLOAD_SIGNED_MSGS:
 				download_signed_msgs = true;
 				break;
+			case OPT_USB_TIMEOUT:
+				usb_timeout = strtoul(optarg, NULL, 0);
+				break;
 			case OPT_HELP:
 			default:
 				usage(argv[0]);
diff --git a/src/usb.c b/src/usb.c
index 8a367426b29c..fbce09f94da9 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -39,6 +39,7 @@
 
 #define USB_XFER_MAX 4096
 
+uint32_t usb_timeout = USB_TIMEOUT;
 //
 // returns 1 if the specified usb device matches the vendor id
 //
@@ -307,7 +308,7 @@ int usb_write(usb_device_t *usb, uint8_t *buf, int len)
 	while (len) {
 		chunk_size = MIN(len, USB_XFER_MAX);
 		ret = libusb_bulk_transfer(usb->handle, usb->endpt_out, buf,
-					   chunk_size, &actual_chunk, USB_TIMEOUT);
+					   chunk_size, &actual_chunk, usb_timeout);
 		if (ret != LIBUSB_SUCCESS) {
 			dprintf("libusb write failure: %d: %s\n", ret, libusb_error_name(ret));
 			return EIO;
@@ -334,7 +335,7 @@ int usb_read(usb_device_t *usb, uint8_t *buf, int len, int *actual_len)
 	while (len) {
 		chunk_size = MIN(len, USB_XFER_MAX);
 		ret = libusb_bulk_transfer(usb->handle, usb->endpt_in, buf,
-					   chunk_size, &actual_chunk, USB_TIMEOUT);
+					   chunk_size, &actual_chunk, usb_timeout);
 		if (ret != LIBUSB_SUCCESS) {
 			dprintf("libusb read failure: %d: %s\n", ret, libusb_error_name(ret));
 			return EIO;
-- 
1.9.1
