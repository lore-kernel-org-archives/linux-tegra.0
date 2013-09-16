From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv2 05/11] tegrarcm: Add Tegra124 support
Date: Mon, 16 Sep 2013 15:24:52 -0700
Message-ID: <1379370298-20404-6-git-send-email-amartin@nvidia.com>
References: <1379370298-20404-1-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379370298-20404-1-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add Tegra124 USB device id, miniloader, and chip SKU information.

Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 src/main.c        | 15 +++++++++++++++
 src/nv3p.h        |  3 +++
 src/tegrarcm.1.in |  4 +++-
 src/usb.c         |  3 ++-
 src/usb.h         |  1 +
 5 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/src/main.c b/src/main.c
index ef0c7e9..fa3ea6c 100644
--- a/src/main.c
+++ b/src/main.c
@@ -57,6 +57,9 @@
 // tegra114 miniloader
 #include "miniloader/tegra114-miniloader.h"
 
+// tegra124 miniloader
+#include "miniloader/tegra124-miniloader.h"
+
 static int wait_status(nv3p_handle_t h3p);
 static int send_file(nv3p_handle_t h3p, const char *filename);
 static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
@@ -208,6 +211,9 @@ int main(int argc, char **argv)
 	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
 		dprintf("initializing RCM version 35\n");
 		ret = rcm_init(RCM_VERSION_35);
+	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
+		dprintf("initializing RCM version 40\n");
+		ret = rcm_init(RCM_VERSION_40);
 	} else {
 		error(1, ENODEV, "unknown tegra device: 0x%x", devid);
 	}
@@ -249,6 +255,10 @@ int main(int argc, char **argv)
 		miniloader = miniloader_tegra114;
 		miniloader_size = sizeof(miniloader_tegra114);
 		miniloader_entry = TEGRA114_MINILOADER_ENTRY;
+	} else if ((devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
+		miniloader = miniloader_tegra124;
+		miniloader_size = sizeof(miniloader_tegra124);
+		miniloader_entry = TEGRA124_MINILOADER_ENTRY;
 	} else {
 		error(1, ENODEV, "unknown tegra device: 0x%x", devid);
 	}
@@ -484,6 +494,11 @@ static void dump_platform_info(nv3p_platform_info_t *info)
 		case TEGRA114_CHIP_SKU_T114_1:
 		default: chip_name = "t114"; break;
 		}
+	} else if (info->chip_id.id == 0x40) {
+		switch (info->sku) {
+		case TEGRA124_CHIP_SKU_T124:
+		default: chip_name = "t124"; break;
+		}
 	} else {
 		chip_name = "unknown";
 	}
diff --git a/src/nv3p.h b/src/nv3p.h
index 13d0e0b..2f4c94e 100644
--- a/src/nv3p.h
+++ b/src/nv3p.h
@@ -71,6 +71,9 @@ typedef struct nv3p_state *nv3p_handle_t;
 #define TEGRA114_CHIP_SKU_T114   0x00
 #define TEGRA114_CHIP_SKU_T114_1 0x01
 
+// tegra124 chip sku
+#define TEGRA124_CHIP_SKU_T124   0x00
+
 // boot device type
 #define NV3P_DEV_TYPE_NAND              0x1
 #define NV3P_DEV_TYPE_EMMC              0x2
diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 4b9200d..011d169 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -24,6 +24,8 @@ device.
 .B Tegra30
 .IP \(bu
 .B Tegra114
+.IP \(bu
+.B Tegra124
 
 .SS How to use
 .IP \(em
@@ -53,7 +55,7 @@ the firmware file that will be downloaded and executed.
 .B \-\-loadaddr \fIloadaddr\fP
 Specify the address the bootloader will be loaded at.  This should be
 specified in hex and is typically 0x108000 for a Tegra20 device or
-0x80108000 for a Tegra30 or Tegra114 device.
+0x80108000 for a Tegra30, Tegra114, or Tegra124 device.
 .TP
 .B \-\-entryaddr \fIentryaddr\fP
 Specify the entry address that control will be passed to after the
diff --git a/src/usb.c b/src/usb.c
index 0b33de9..16f3d90 100644
--- a/src/usb.c
+++ b/src/usb.c
@@ -155,7 +155,8 @@ usb_device_t *usb_open(uint16_t venid, uint16_t *devid)
 		if (usb_match(device, venid, devid)) {
 			if ((*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA20 ||
 			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA30 ||
-			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114) {
+			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA114 ||
+			    (*devid & 0xff) == USB_DEVID_NVIDIA_TEGRA124) {
 				found = device;
 				break;
 			} else {
diff --git a/src/usb.h b/src/usb.h
index 03ba18c..a7b36af 100644
--- a/src/usb.h
+++ b/src/usb.h
@@ -35,6 +35,7 @@
 #define USB_DEVID_NVIDIA_TEGRA20 0x20
 #define USB_DEVID_NVIDIA_TEGRA30 0x30
 #define USB_DEVID_NVIDIA_TEGRA114 0x35
+#define USB_DEVID_NVIDIA_TEGRA124 0x40
 
 typedef struct {
 	libusb_device_handle *handle;
-- 
1.8.1.5
