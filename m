From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v1 5/8] tegrarcm: Better usb debug messages
Date: Tue, 17 Mar 2015 17:38:58 -0700
Message-ID: <1426639141-12060-7-git-send-email-jimmzhang@nvidia.com>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Print more explict messages when usb transition failed.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/nv3p.c | 2 +-
 src/usb.c  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/nv3p.c b/src/nv3p.c
index 7f8c72994396..7c7ef1c2f60c 100644
--- a/src/nv3p.c
+++ b/src/nv3p.c
@@ -848,7 +848,7 @@ static int nv3p_read(usb_device_t *usb, uint8_t *buf, int len)
 	if (len > bytesleft) {
 		ret = usb_read(usb, packet, sizeof(packet), &actual_len);
 		if (ret) {
-			dprintf("USB read failed\n");
+			dprintf("USB read failed: %d\n", ret);
 			return ret;
 		}
 
diff --git a/src/usb.c b/src/usb.c
index 8c9c72f38b1a..ed2ff28eef8d 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -231,7 +231,7 @@ int usb_write(usb_device_t *usb, uint8_t *buf, int len)
 		ret = libusb_bulk_transfer(usb->handle, usb->endpt_out, buf,
 					   chunk_size, &actual_chunk, USB_TIMEOUT);
 		if (ret != LIBUSB_SUCCESS) {
-			dprintf("write failure: %d\n", ret);
+			dprintf("libusb write failure: %d: %s\n", ret, libusb_error_name(ret));
 			return EIO;
 		}
 		if (actual_chunk != chunk_size) {
@@ -258,7 +258,7 @@ int usb_read(usb_device_t *usb, uint8_t *buf, int len, int *actual_len)
 		ret = libusb_bulk_transfer(usb->handle, usb->endpt_in, buf,
 					   chunk_size, &actual_chunk, USB_TIMEOUT);
 		if (ret != LIBUSB_SUCCESS) {
-			dprintf("read failure: %d\n", ret);
+			dprintf("libusb read failure: %d: %s\n", ret, libusb_error_name(ret));
 			return EIO;
 		}
 		len -= chunk_size;
-- 
1.8.1.5
