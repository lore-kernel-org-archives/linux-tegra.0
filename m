From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 04/10] ARM: tegra: Add Tegra124 eDP support
Date: Thu, 19 Dec 2013 17:06:16 +0100
Message-ID: <1387469182-14398-5-git-send-email-treding@nvidia.com>
References: <1387469182-14398-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387469182-14398-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 0a4e5271b5f9..39d77aa936f9 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -44,6 +44,32 @@
 			resets = <&tegra_car 26>;
 			reset-names = "dc";
 		};
+
+		sor@54540000 {
+			compatible = "nvidia,tegra124-sor";
+			reg = <0x54540000 0x00040000>;
+			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_SOR0>,
+				 <&tegra_car TEGRA124_CLK_PLL_D_OUT0>,
+				 <&tegra_car TEGRA124_CLK_PLL_DP>,
+				 <&tegra_car TEGRA124_CLK_CLK_M>;
+			clock-names = "sor", "parent", "dp", "safe";
+			resets = <&tegra_car 182>;
+			reset-names = "sor";
+			status = "disabled";
+		};
+
+		dpaux@545c0000 {
+			compatible = "nvidia,tegra124-dpaux";
+			reg = <0x545c0000 0x00040000>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&tegra_car TEGRA124_CLK_DPAUX>,
+				 <&tegra_car TEGRA124_CLK_PLL_DP>;
+			clock-names = "dpaux", "parent";
+			resets = <&tegra_car 181>;
+			reset-names = "dpaux";
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller@50041000 {
-- 
1.8.4.2
