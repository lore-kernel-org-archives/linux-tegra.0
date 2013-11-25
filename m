From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/4] ARM: tegra: add reset properties to Tegra124 DTs
Date: Mon, 25 Nov 2013 15:39:17 -0700
Message-ID: <1385419160-11511-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 936579b806d4..4ed6a3a8e2de 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -36,6 +36,7 @@
 		compatible = "nvidia,tegra124-car";
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	gpio: gpio@6000d000 {
@@ -69,6 +70,8 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTA>;
+		resets = <&tegra_car 6>;
+		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -78,6 +81,8 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTB>;
+		resets = <&tegra_car 7>;
+		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -87,6 +92,8 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTC>;
+		resets = <&tegra_car 55>;
+		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -96,6 +103,8 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTD>;
+		resets = <&tegra_car 65>;
+		reset-names = "serial";
 		status = "disabled";
 	};
 
@@ -105,6 +114,8 @@
 		reg-shift = <2>;
 		interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_UARTE>;
+		resets = <&tegra_car 66>;
+		reset-names = "serial";
 		status = "disabled";
 	};
 
-- 
1.8.1.5
