From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/8] arm64: tegra: p2597: Add basic power supplies
Date: Mon,  6 Jun 2016 18:36:31 +0200
Message-ID: <20160606163637.14234-2-thierry.reding@gmail.com>
References: <20160606163637.14234-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160606163637.14234-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index a2480c0c7e72..27bb835d6bcb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1270,6 +1270,61 @@
 		cd-gpios = <&gpio TEGRA_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
 	};
 
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd_sys_mux: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+			regulator-name = "VDD_SYS_MUX";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_5v0_sys: regulator@1 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+			regulator-name = "VDD_5V0_SYS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+			gpio = <&pmic 1 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_sys_mux>;
+		};
+
+		vdd_3v3_sys: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+			regulator-name = "VDD_3V3_SYS";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+			gpio = <&pmic 3 GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_sys_mux>;
+
+			regulator-enable-ramp-delay = <160>;
+			regulator-disable-ramp-delay = <10000>;
+		};
+
+		vdd_5v0_io: regulator@3 {
+			compatible = "regulator-fixed";
+			reg = <3>;
+			regulator-name = "VDD_5V0_IO_SYS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
-- 
2.8.3
