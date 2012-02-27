From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 09/20] tegra: fdt: Add additional USB binding
Date: Mon, 27 Feb 2012 12:52:42 -0800
Message-ID: <1330375973-10681-10-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds a property to indicate a port which can switch between host and device
mode.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Add dr_mode property to control host/device/otg mode
- Add nvidia,has-legacy-mode property per review comments

 doc/device-tree-bindings/usb/tegra-usb.txt |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/doc/device-tree-bindings/usb/tegra-usb.txt b/doc/device-tree-bindings/usb/tegra-usb.txt
index 035d63d..b7174a3 100644
--- a/doc/device-tree-bindings/usb/tegra-usb.txt
+++ b/doc/device-tree-bindings/usb/tegra-usb.txt
@@ -11,3 +11,15 @@ Required properties :
  - phy_type : Should be one of "ulpi" or "utmi".
  - nvidia,vbus-gpio : If present, specifies a gpio that needs to be
    activated for the bus to be powered.
+
+Optional properties:
+  - dr_mode : dual role mode. Indicates the working mode for
+   nvidia,tegra20-ehci compatible controllers.  Can be "host", "peripheral",
+   or "otg".  Default to "host" if not defined for backward compatibility.
+      host means this is a host controller
+      peripheral means it is device controller
+      otg means it can operate as either ("on the go")
+  - nvidia,has-legacy-mode : boolean indicates whether this controller can
+    operate in legacy mode (as APX 2500 / 2600). In legacy mode some
+    registers are accessed through the APB_MISC base address instead of
+    the USB controller.
-- 
1.7.7.3
