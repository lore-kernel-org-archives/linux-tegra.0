From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] arm64: tegra: Add VDD_GPU regulator to Jetson TX1
Date: Fri,  2 Dec 2016 20:57:55 +0100
Message-ID: <20161202195756.16562-2-thierry.reding@gmail.com>
References: <20161202195756.16562-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161202195756.16562-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add the VDD_GPU regulator (a GPIO-enabled PWM regulator) to the Jetson
TX1 board. This addition allows the GPU to be used provided the
bootloader properly enabled the GPU node.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 5fda583351d7..906fb836d241 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -21,6 +21,10 @@
 		reg = <0x0 0x80000000 0x1 0x0>;
 	};
 
+	gpu@57000000 {
+		vdd-supply = <&vdd_gpu>;
+	};
+
 	/* debug port */
 	serial@70006000 {
 		status = "okay";
@@ -291,4 +295,18 @@
 			clock-frequency = <32768>;
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
2.10.2
