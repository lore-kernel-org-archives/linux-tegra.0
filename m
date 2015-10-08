From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [tegrarcm PATCH 1/3] Move all USB device matching logic into usb_match()
Date: Thu,  8 Oct 2015 12:38:28 -0600
Message-ID: <1444329510-23848-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This consolidates the matching logic into one place, which will make
future enhancements to the logic simpler.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/usb.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/src/usb.c b/src/usb.c
index b0a7a8822aa2..71234d77d7b1 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -45,16 +45,32 @@
 static int usb_match(libusb_device *dev, uint16_t venid, uint16_t *devid)
 {
 	struct libusb_device_descriptor desc;
+
 	if (libusb_get_device_descriptor(dev, &desc)) {
 		dprintf("libusb_get_device_descriptor\n");
 		return 0;
 	}
-	if (desc.idVendor == venid) {
-		*devid = desc.idProduct;
-		return 1;
+	if (desc.idVendor != venid) {
+		dprintf("non-NVIDIA USB device: 0x%x:0x%x\n",
+			desc.idVendor, desc.idProduct);
+		return 0;
+	}
+	switch (desc.idProduct & 0xff) {
+	case USB_DEVID_NVIDIA_TEGRA20:
+	case USB_DEVID_NVIDIA_TEGRA30:
+	case USB_DEVID_NVIDIA_TEGRA114:
+	case USB_DEVID_NVIDIA_TEGRA124:
+		break;
+	default:
+		dprintf("non-Tegra NVIDIA USB device: 0x%x:0x%x\n",
+			desc.idVendor, desc.idProduct);
+		return 0;
 	}
 
-	return 0;
+	dprintf("device matches\n");
+	*devid = desc.idProduct;
+
+	return 1;
 }
 
 static void usb_check_interface(const struct libusb_interface_descriptor *iface_desc,
@@ -155,17 +171,10 @@ usb_device_t *usb_open(uint16_t venid, uint16_t *devid)
 
 	for (i = 0; i < cnt; i++) {
 		libusb_device *device = list[i];
+
 		if (usb_match(device, venid, devid)) {
-			if ((*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
-			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30 ||
-			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114 ||
-			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
-				found = device;
-				break;
-			} else {
-				dprintf("non-tegra NVIDIA USB device: 0x%x\n",
-					*devid);
-			}
+			found = device;
+			break;
 		}
 	}
 
-- 
1.9.1
