From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] arm64: tegra: Enable DFLL support on Jetson Nano
Date: Sun, 12 Jul 2020 11:25:05 +0100
Message-ID: <20200712102506.23686-3-jonathanh@nvidia.com>
References: <20200712102506.23686-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712102506.23686-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Populate the DFLL node and corresponding PWM pin nodes in order to
enable CPUFREQ support on the Jetson Nano platform.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 9b6346917ea9..2282ea1c6279 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -111,6 +111,22 @@
 		status = "okay";
 	};
 
+	pinmux@700008d4 {
+		dvfs_pwm_active_state: dvfs_pwm_active {
+			dvfs_pwm_pbb1 {
+				nvidia,pins = "dvfs_pwm_pbb1";
+				nvidia,tristate = <TEGRA_PIN_DISABLE>;
+			};
+		};
+
+		dvfs_pwm_inactive_state: dvfs_pwm_inactive {
+			dvfs_pwm_pbb1 {
+				nvidia,pins = "dvfs_pwm_pbb1";
+				nvidia,tristate = <TEGRA_PIN_ENABLE>;
+			};
+		};
+	};
+
 	/* debug port */
 	serial@70006000 {
 		status = "okay";
@@ -584,6 +600,27 @@
 		hvdd-usb-supply = <&vdd_1v8>;
 	};
 
+	clock@70110000 {
+		status = "okay";
+
+		nvidia,cf = <6>;
+		nvidia,ci = <0>;
+		nvidia,cg = <2>;
+		nvidia,droop-ctrl = <0x00000f00>;
+		nvidia,force-mode = <1>;
+		nvidia,sample-rate = <25000>;
+
+		nvidia,pwm-min-microvolts = <708000>;
+		nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */
+		nvidia,pwm-to-pmic;
+		nvidia,pwm-tristate-microvolts = <1000000>;
+		nvidia,pwm-voltage-step-microvolts = <19200>;
+
+		pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
+		pinctrl-0 = <&dvfs_pwm_active_state>;
+		pinctrl-1 = <&dvfs_pwm_inactive_state>;
+	};
+
 	clk32k_in: clock@0 {
 		compatible = "fixed-clock";
 		clock-frequency = <32768>;
-- 
2.17.1
