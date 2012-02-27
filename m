From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v6 12/20] tegra: usb: fdt: Add additional device tree definitions for USB ports
Date: Mon, 27 Feb 2012 12:52:45 -0800
Message-ID: <1330375973-10681-13-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Remy Bohmer <linux-SYUVB/VFmdasTnJN9+BGXg@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds clock references to the USB part of the device tree for U-Boot,
and marks USB1 as supporting legacy mode (which we disable in the driver).

The USB timing information may vary between boards sometimes, but for
now we hard-code it in C. This is because all current T2x boards use
the same values, we will deal with T3x later and we first need to agree
on the format for this timing information in the fdt and may in fact
decide that it has no place there.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v5:
- Add dr_mode property to control host/device/otg mode
- Add nvidia,has-legacy-mode property per review comments
- Change device tree comment style from // to /* */

Changes in v6:
- Remove dr_mode properties from SOC .dtsi file and move to boards

 arch/arm/dts/tegra20.dtsi |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/dts/tegra20.dtsi b/arch/arm/dts/tegra20.dtsi
index 2c46e11..d6bc9f1 100644
--- a/arch/arm/dts/tegra20.dtsi
+++ b/arch/arm/dts/tegra20.dtsi
@@ -165,6 +165,8 @@
 		reg = <0xc5000000 0x4000>;
 		interrupts = < 52 >;
 		phy_type = "utmi";
+		clocks = <&tegra_car 22>;	/* PERIPH_ID_USBD */
+		nvidia,has-legacy-mode;
 	};
 
 	usb@c5004000 {
@@ -172,6 +174,7 @@
 		reg = <0xc5004000 0x4000>;
 		interrupts = < 53 >;
 		phy_type = "ulpi";
+		clocks = <&tegra_car 58>;	/* PERIPH_ID_USB2 */
 	};
 
 	usb@c5008000 {
@@ -179,6 +182,7 @@
 		reg = <0xc5008000 0x4000>;
 		interrupts = < 129 >;
 		phy_type = "utmi";
+		clocks = <&tegra_car 59>;	/* PERIPH_ID_USB3 */
 	};
 
 };
-- 
1.7.7.3
