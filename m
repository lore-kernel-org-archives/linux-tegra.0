From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 06/11] tegrarcm: Add timeout to USB xfers
Date: Mon, 16 Sep 2013 15:24:53 -0700
Message-ID: <1379370298-20404-7-git-send-email-amartin@nvidia.com>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This prevents tegrarcm from just hanging in the event that the target
gets in some bad state and stops responding to USB (like downloading a
bad BCT).  Set default timeout to 1s which should be plenty long
enough for the max xfer size of 4096 bytes.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/usb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/src/usb.c b/src/usb.c
index 16f3d90..450bc80 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -34,6 +34,9 @@
 #include "usb.h"
 #include "debug.h"
 
+// USB xfer timeout in ms
+#define USB_TIMEOUT 1000
+
 #define USB_XFER_MAX 4096
 
 //
@@ -225,7 +228,7 @@ int usb_write(usb_device_t *usb, uint8_t *buf, int len)
 	while (len) {
 		chunk_size = MIN(len, USB_XFER_MAX);
 		ret = libusb_bulk_transfer(usb->handle, usb->endpt_out, buf,
-					   chunk_size, &actual_chunk, 0);
+					   chunk_size, &actual_chunk, USB_TIMEOUT);
 		if (ret != LIBUSB_SUCCESS) {
 			dprintf("write failure: %d\n", ret);
 			return EIO;
@@ -252,7 +255,7 @@ int usb_read(usb_device_t *usb, uint8_t *buf, int len, int *actual_len)
 	while (len) {
 		chunk_size = MIN(len, USB_XFER_MAX);
 		ret = libusb_bulk_transfer(usb->handle, usb->endpt_in, buf,
-					   chunk_size, &actual_chunk, 0);
+					   chunk_size, &actual_chunk, USB_TIMEOUT);
 		if (ret != LIBUSB_SUCCESS) {
 			dprintf("read failure: %d\n", ret);
 			return EIO;
-- 
1.8.1.5
