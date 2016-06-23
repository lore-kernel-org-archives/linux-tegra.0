From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] arm64: tegra: Add VDD_GPU regulator to Jetson TX1
Date: Thu, 23 Jun 2016 16:39:45 +0900
Message-ID: <20160623073945.11642-2-acourbot@nvidia.com>
References: <20160623073945.11642-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623073945.11642-1-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the VDD_GPU regulator (a GPIO-enabled PWM regulator) to the Jetson
TX1 board. This addition allows the GPU to be used provided the
bootloader properly enabled the GPU node.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes since v1:
- Include this patch into the series to make sure it is merged after 1/2,
  otherwise Jetson TX1 will lock when trying to enable the regulator.

 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 983775e637a4..cc9fb5207f9d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -25,6 +25,10 @@
 		};
 	};
 
+	gpu@57000000 {
+		vdd-supply = <&vdd_gpu>;
+	};
+
 	i2c@7000c400 {
 		backlight: backlight@2c {
 			compatible = "ti,lp8557";
@@ -51,4 +55,18 @@
 			};
 		};
 	};
+
+	regulators {
+		vdd_gpu: regulator@100 {
+			compatible = "pwm-regulator";
+			reg = <100>;
+			pwms = <&pwm 1 4880>;
+			regulator-name = "VDD_GPU";
+			regulator-min-microvolt = <710000>;
+			regulator-max-microvolt = <1320000>;
+			enable-gpios = <&pmic 6 GPIO_ACTIVE_HIGH>;
+			regulator-ramp-delay = <80>;
+			regulator-enable-ramp-delay = <1000>;
+		};
+	};
 };
-- 
2.8.3
