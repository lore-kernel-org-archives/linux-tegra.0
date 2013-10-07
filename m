From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] ARM: tegra: Add Tegra114 DSI support
Date: Mon,  7 Oct 2013 13:48:44 +0200
Message-ID: <1381146528-18069-6-git-send-email-treding@nvidia.com>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add device tree nodes for the DSI controllers found on Tegra114 SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 600196a..a79b44b 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -63,6 +63,26 @@
 			clock-names = "hdmi", "parent";
 			status = "disabled";
 		};
+
+		dsi@54300000 {
+			compatible = "nvidia,tegra114-dsi";
+			reg = <0x54300000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_DSIA>,
+				 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "parent";
+			calibrate = <&mipi TEGRA114_MIPI_DSIA>;
+			status = "disabled";
+		};
+
+		dsi@54400000 {
+			compatible = "nvidia,tegra114-dsi";
+			reg = <0x54400000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_DSIB>,
+				 <&tegra_car TEGRA114_CLK_PLL_D2_OUT0>;
+			clock-names = "dsi", "parent";
+			calibrate = <&mipi TEGRA114_MIPI_DSIB>;
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller {
-- 
1.8.4
