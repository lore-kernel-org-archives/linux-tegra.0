From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/8] arm64: tegra: p2597: Add SDMMC power supplies
Date: Mon,  6 Jun 2016 18:36:32 +0200
Message-ID: <20160606163637.14234-3-thierry.reding@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
index 27bb835d6bcb..b28aff5e104d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1268,6 +1268,9 @@
 		no-1-8-v;
 
 		cd-gpios = <&gpio TEGRA_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
+
+		vqmmc-supply = <&vddio_sdmmc>;
+		vmmc-supply = <&vdd_3v3_sd>;
 	};
 
 	regulators {
@@ -1323,6 +1326,20 @@
 			regulator-always-on;
 			regulator-boot-on;
 		};
+
+		vdd_3v3_sd: regulator@4 {
+			compatible = "regulator-fixed";
+			reg = <4>;
+			regulator-name = "VDD_3V3_SD";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio TEGRA_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+			vin-supply = <&vdd_3v3_sys>;
+
+			regulator-enable-ramp-delay = <472>;
+			regulator-disable-ramp-delay = <4880>;
+		};
 	};
 
 	gpio-keys {
-- 
2.8.3
