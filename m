From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] ARM: tegra: Mark Tegra124 HDMI compatible with Tegra114
Date: Sat, 17 May 2014 11:21:20 -0700
Message-ID: <1400350881-22008-1-git-send-email-dgreid@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The HDMI driver that handles Tegra114 can handle Tegra124 as well,
mark Tegra124 as compatible.  This makes HDMI output work on Venice2.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 197e848..fbaf985 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -52,7 +52,8 @@
 		};
 
 		hdmi@0,54280000 {
-			compatible = "nvidia,tegra124-hdmi";
+			compatible = "nvidia,tegra124-hdmi",
+				     "nvidia,tegra114-hdmi";
 			reg = <0x0 0x54280000 0x0 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA124_CLK_HDMI>,
-- 
1.8.1.3.605.g02339dd
