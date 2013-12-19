From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 05/10] ARM: tegra: Add Tegra114 DSI support
Date: Thu, 19 Dec 2013 16:59:29 +0100
Message-ID: <1387468774-14216-6-git-send-email-treding@nvidia.com>
References: <1387468774-14216-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387468774-14216-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add device tree nodes for the DSI controllers found on Tegra114 SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v4:
- add reset and reset-names properties

Changes in v3:
- add #address-cells and #size-cells properties for DSI bus
- update for revised MIPI calibration bindings
- add low-power clocks

Changes in v2:
- use a comment to describe which pads need calibration

 arch/arm/boot/dts/tegra114.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 65e34e7fe6f2..28d2eea46b52 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -71,6 +71,38 @@
 			reset-names = "hdmi";
 			status = "disabled";
 		};
+
+		dsi@54300000 {
+			compatible = "nvidia,tegra114-dsi";
+			reg = <0x54300000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_DSIA>,
+				 <&tegra_car TEGRA114_CLK_DSIALP>,
+				 <&tegra_car TEGRA114_CLK_PLL_D_OUT0>;
+			clock-names = "dsi", "lp", "parent";
+			resets = <&tegra_car 48>;
+			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0x060>; /* DSIA & DSIB pads */
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		dsi@54400000 {
+			compatible = "nvidia,tegra114-dsi";
+			reg = <0x54400000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_DSIB>,
+				 <&tegra_car TEGRA114_CLK_DSIBLP>,
+				 <&tegra_car TEGRA114_CLK_PLL_D2_OUT0>;
+			clock-names = "dsi", "lp", "parent";
+			resets = <&tegra_car 82>;
+			reset-names = "dsi";
+			nvidia,mipi-calibrate = <&mipi 0x180>; /* DSIC & DSID pads */
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 	};
 
 	gic: interrupt-controller@50041000 {
-- 
1.8.4.2
