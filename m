From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/7] arm64: tegra: Add SOR power-domain for Tegra210
Date: Tue, 9 Aug 2016 16:21:18 +0100
Message-ID: <1470756082-19099-4-git-send-email-jonathanh@nvidia.com>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470756082-19099-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add node for SOR power-domain for Tegra210 and populate the SOR
power-domain phandle for DPAUX, DSI, MIPI-CAL and SOR and nodes that are
dependent on this power-domain.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 807cba26a8be..48fe73276b49 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -34,6 +34,7 @@
 			clock-names = "dpaux", "parent";
 			resets = <&tegra_car 207>;
 			reset-names = "dpaux";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 
 			state_dpaux1_aux: pinmux-aux {
@@ -108,6 +109,7 @@
 			clock-names = "dsi", "lp", "parent";
 			resets = <&tegra_car 48>;
 			reset-names = "dsi";
+			power-domains = <&pd_sor>;
 			nvidia,mipi-calibrate = <&mipi 0x0c0>; /* DSIA & DSIB pads */
 
 			status = "disabled";
@@ -137,6 +139,7 @@
 			clock-names = "dsi", "lp", "parent";
 			resets = <&tegra_car 82>;
 			reset-names = "dsi";
+			power-domains = <&pd_sor>;
 			nvidia,mipi-calibrate = <&mipi 0x300>; /* DSIC & DSID pads */
 
 			status = "disabled";
@@ -178,6 +181,7 @@
 			pinctrl-1 = <&state_dpaux_i2c>;
 			pinctrl-2 = <&state_dpaux_off>;
 			pinctrl-names = "aux", "i2c", "off";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
 
@@ -197,6 +201,7 @@
 			pinctrl-1 = <&state_dpaux1_i2c>;
 			pinctrl-2 = <&state_dpaux1_off>;
 			pinctrl-names = "aux", "i2c", "off";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
 
@@ -209,6 +214,7 @@
 			clock-names = "dpaux", "parent";
 			resets = <&tegra_car 181>;
 			reset-names = "dpaux";
+			power-domains = <&pd_sor>;
 			status = "disabled";
 
 			state_dpaux_aux: pinmux-aux {
@@ -648,6 +654,26 @@
 				#power-domain-cells = <0>;
 			};
 
+			pd_sor: sor {
+				clocks = <&tegra_car TEGRA210_CLK_SOR0>,
+					 <&tegra_car TEGRA210_CLK_SOR1>,
+					 <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_DSIA>,
+					 <&tegra_car TEGRA210_CLK_DSIB>,
+					 <&tegra_car TEGRA210_CLK_DPAUX>,
+					 <&tegra_car TEGRA210_CLK_DPAUX1>,
+					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
+				resets = <&tegra_car TEGRA210_CLK_SOR0>,
+					 <&tegra_car TEGRA210_CLK_SOR1>,
+					 <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_DSIA>,
+					 <&tegra_car TEGRA210_CLK_DSIB>,
+					 <&tegra_car TEGRA210_CLK_DPAUX>,
+					 <&tegra_car TEGRA210_CLK_DPAUX1>,
+					 <&tegra_car TEGRA210_CLK_MIPI_CAL>;
+				#power-domain-cells = <0>;
+			};
+
 			pd_xusbss: xusba {
 				clocks = <&tegra_car TEGRA210_CLK_XUSB_SS>;
 				clock-names = "xusb-ss";
@@ -948,6 +974,7 @@
 		reg = <0x0 0x700e3000 0x0 0x100>;
 		clocks = <&tegra_car TEGRA210_CLK_MIPI_CAL>;
 		clock-names = "mipi-cal";
+		power-domains = <&pd_sor>;
 		#nvidia,mipi-calibrate-cells = <1>;
 	};
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
