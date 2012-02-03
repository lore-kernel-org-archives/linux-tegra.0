From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 11/18] tegra: usb: fdt: Add USB definitions for Tegra2 Seaboard
Date: Fri,  3 Feb 2012 09:08:20 -0800
Message-ID: <1328288907-16725-12-git-send-email-sjg@chromium.org>
References: <1328288907-16725-11-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328288907-16725-11-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We set up two USB ports, one of which can be host or device.
For some reason the kernel version does enable both ports.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Remove 0x from fdt aliases
- Use "okay" instead of "ok" for fdt node status

Changes in v3:
- Disable USB2 which is not used on Seaboard
- Fix device tree indenting with tabs instead of spaces
- Remove "okay" from nodes since this is the default anyway

Changes in v5:
- Remove support-host-mode property

Changes in v6:
- Remove dr_mode properties from SOC .dtsi file and move to boards

 board/nvidia/dts/tegra2-seaboard.dts |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/dts/tegra2-seaboard.dts
index dde5d03..f00341f 100644
--- a/board/nvidia/dts/tegra2-seaboard.dts
+++ b/board/nvidia/dts/tegra2-seaboard.dts
@@ -11,6 +11,12 @@
 		bootargs = "vmalloc=192M video=tegrafb console=ttyS0,115200n8 root=/dev/mmcblk1p3 rw rootwait";
 	};
 
+	aliases {
+		/* This defines the order of our USB ports */
+		usb0 = "/usb@c5008000";
+		usb1 = "/usb@c5000000";
+	};
+
 	memory {
 		device_type = "memory";
 		reg = < 0x00000000 0x40000000 >;
@@ -32,5 +38,10 @@
 
 	usb@c5000000 {
 		nvidia,vbus-gpio = <&gpio 24 0>; /* PD0 */
+		dr_mode = "otg";
+	};
+
+	usb@c5004000 {
+		status = "disabled";
 	};
 };
-- 
1.7.7.3
