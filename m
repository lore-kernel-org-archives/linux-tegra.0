From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: [PATCH 2/4] ARM: tegra: add CEC support to tegra124.dtsi
Date: Sat, 15 Jul 2017 14:47:51 +0200
Message-ID: <20170715124753.43714-3-hverkuil@xs4all.nl>
References: <20170715124753.43714-1-hverkuil@xs4all.nl>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170715124753.43714-1-hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>

Add support for the Tegra CEC IP to tegra124.dtsi and enable it on the
Jetson TK1.

Signed-off-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts |  4 ++++
 arch/arm/boot/dts/tegra124.dtsi           | 12 +++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 7bacb2954f58..c22c0e6dc3d9 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -67,6 +67,10 @@
 		};
 	};
 
+	tegra_cec {
+		status = "okay";
+	};
+
 	gpu@0,57000000 {
 		/*
 		 * Node left disabled on purpose - the bootloader will enable
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 1b10b14a6abd..df7e9e2925f5 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -123,7 +123,7 @@
 			nvidia,head = <1>;
 		};
 
-		hdmi@54280000 {
+		hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra124-hdmi";
 			reg = <0x0 0x54280000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -851,6 +851,16 @@
 		status = "disabled";
 	};
 
+	tegra_cec {
+		compatible = "nvidia,tegra124-cec";
+		reg = <0x0 0x70015000 0x0 0x00001000>;
+		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA124_CLK_CEC>;
+		clock-names = "cec";
+		hdmi-phandle = <&hdmi>;
+		status = "disabled";
+	};
+
 	soctherm: thermal-sensor@700e2000 {
 		compatible = "nvidia,tegra124-soctherm";
 		reg = <0x0 0x700e2000 0x0 0x600 /* SOC_THERM reg_base */
-- 
2.11.0
