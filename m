From: Maarten Lankhorst <dev-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
Subject: [PATCH] arm/tegra: Enable watchdog support for tegra114 and tegra124.
Date: Tue, 17 Nov 2015 11:15:45 +0100
Message-ID: <564AFE51.6060601@mblankhorst.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This allows the watchdog timer to work on my tegra124.

tegra_wdt specifies: compatible = "nvidia,tegra30-timer";

But the dtsi was only setting tegra20-timer, fix this
by adding tegra30-timer explicitly. This allows
the watchdog to work on my Jetson TK1.

Signed-off-by: Maarten Lankhorst <dev-FcfepWsj2zOByvU0x3ry2g@public.gmane.org>
---
XXX: Should this be Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org to add the missing device on older kernels?

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index d845bd1448b5..4e05623acc1e 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -150,7 +150,7 @@
 	};
 
 	timer@60005000 {
-		compatible = "nvidia,tegra114-timer", "nvidia,tegra20-timer";
+		compatible = "nvidia,tegra114-timer", "nvidia,tegra30-timer", "nvidia,tegra20-timer";
 		reg = <0x60005000 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 68669f791c8b..1d84b8986807 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -208,7 +208,7 @@
 	};
 
 	timer@0,60005000 {
-		compatible = "nvidia,tegra124-timer", "nvidia,tegra20-timer";
+		compatible = "nvidia,tegra124-timer", "nvidia,tegra30-timer", "nvidia,tegra20-timer";
 		reg = <0x0 0x60005000 0x0 0x400>;
 		interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
