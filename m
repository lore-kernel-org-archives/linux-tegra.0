From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 13/13] arm64: tegra: Add DPAUX pinctrl bindings
Date: Fri, 17 Jun 2016 13:03:47 +0100
Message-ID: <1466165027-17917-14-git-send-email-jonathanh@nvidia.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1466165027-17917-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the DPAUX pinctrl states for the DPAUX nodes defining all three
possible states of "aux", "i2c" and "off". Also add the 'i2c-bus'
node for the DPAUX nodes so that the I2C driver core does not attempt
to parse the pinctrl state nodes.

Populate the nodes for the pinctrl clients of the DPAUX pin controller.
There are two clients for each DPAUX instance, namely the SOR and one of
the I2C adapters. The SOR clients may used the DPAUX pins in either AUX
or I2C modes and so for these devices we don't define any of the generic
pinctrl states (default, idle, etc) because the SOR driver will directly
set the state needed. For I2C clients only the I2C mode is used and so
we can simplify matters by using the generic pinctrl states for default
and idle.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 48 ++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 78bcc87b627d..c4ae0215291a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -37,6 +37,23 @@
 			reset-names = "dpaux";
 			power-domains = <&pd_sor>;
 			status = "disabled";
+
+			state_dpaux1_aux: pinmux_aux {
+				groups = "dpaux-io";
+				function = "aux";
+			};
+
+			state_dpaux1_i2c: pinmux_i2c {
+				groups = "dpaux-io";
+				function = "i2c";
+			};
+
+			state_dpaux1_off: pinmux_off {
+				groups = "dpaux-io";
+				function = "off";
+			};
+
+			i2c-bus { };
 		};
 
 		vi@54080000 {
@@ -156,6 +173,10 @@
 			clock-names = "sor", "parent", "dp", "safe";
 			resets = <&tegra_car 182>;
 			reset-names = "sor";
+			pinctrl-0 = <&state_dpaux_aux>;
+			pinctrl-1 = <&state_dpaux_i2c>;
+			pinctrl-2 = <&state_dpaux_off>;
+			pinctrl-names = "aux", "i2c", "off";
 			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
@@ -171,6 +192,10 @@
 			clock-names = "sor", "parent", "dp", "safe";
 			resets = <&tegra_car 183>;
 			reset-names = "sor";
+			pinctrl-0 = <&state_dpaux1_aux>;
+			pinctrl-1 = <&state_dpaux1_i2c>;
+			pinctrl-2 = <&state_dpaux1_off>;
+			pinctrl-names = "aux", "i2c", "off";
 			power-domains = <&pd_sor>;
 			status = "disabled";
 		};
@@ -187,6 +212,23 @@
 			reset-names = "dpaux";
 			power-domains = <&pd_sor>;
 			status = "disabled";
+
+			state_dpaux_aux: pinmux_aux {
+				groups = "dpaux-io";
+				function = "aux";
+			};
+
+			state_dpaux_i2c: pinmux_i2c {
+				groups = "dpaux-io";
+				function = "i2c";
+			};
+
+			state_dpaux_off: pinmux_off {
+				groups = "dpaux-io";
+				function = "off";
+			};
+
+			i2c-bus { };
 		};
 
 		isp@54600000 {
@@ -484,6 +526,9 @@
 		reset-names = "i2c";
 		dmas = <&apbdma 26>, <&apbdma 26>;
 		dma-names = "rx", "tx";
+		pinctrl-0 = <&state_dpaux1_i2c>;
+		pinctrl-1 = <&state_dpaux1_off>;
+		pinctrl-names = "default", "idle";
 		status = "disabled";
 	};
 
@@ -514,6 +559,9 @@
 		reset-names = "i2c";
 		dmas = <&apbdma 30>, <&apbdma 30>;
 		dma-names = "rx", "tx";
+		pinctrl-0 = <&state_dpaux_i2c>;
+		pinctrl-1 = <&state_dpaux_off>;
+		pinctrl-names = "default", "idle";
 		status = "disabled";
 	};
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
