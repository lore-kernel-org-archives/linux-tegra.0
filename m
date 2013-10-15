From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 06/13] ARM: tegra: Add Tegra114 DSI support
Date: Tue, 15 Oct 2013 17:27:56 +0200
Message-ID: <1381850883-12722-7-git-send-email-treding@nvidia.com>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381850883-12722-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Add device tree nodes for the DSI controllers found on Tegra114 SoCs.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- use a comment to describe which pads need calibration

 arch/arm/boot/dts/tegra114.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 1ddf024..7905b2e 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -62,6 +62,26 @@
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
+			calibrate = <&mipi 0x060>; /* DSIA & DSIB pads */
+			status = "disabled";
+		};
+
+		dsi@54400000 {
+			compatible = "nvidia,tegra114-dsi";
+			reg = <0x54400000 0x00040000>;
+			clocks = <&tegra_car TEGRA114_CLK_DSIB>,
+				 <&tegra_car TEGRA114_CLK_PLL_D2_OUT0>;
+			clock-names = "dsi", "parent";
+			calibrate = <&mipi 0x180>; /* DSIC & DSID pads */
+			status = "disabled";
+		};
 	};
 
 	gic: interrupt-controller {
-- 
1.8.4
