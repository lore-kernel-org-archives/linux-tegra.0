From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 07/11] arm64: tegra: Enable SDHCI controllers on P3110
Date: Thu, 23 Feb 2017 18:30:49 +0100
Message-ID: <20170223173053.19701-7-thierry.reding@gmail.com>
References: <20170223173053.19701-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223173053.19701-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The P3110 processor module wires one of the SDHCI controllers to an on-
board eMMC and exposes another set of SD/MMC signals on the connector to
support an external SD/MMC card. A third controller is connected to the
SDIO pins of an M.2 KEY E connector.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi | 42 ++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
index 1a9ac73b4ecb..b18e166527d8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi
@@ -7,6 +7,8 @@
 	compatible = "nvidia,p3310", "nvidia,tegra186";
 
 	aliases {
+		sdhci0 = "/sdhci@3460000";
+		sdhci1 = "/sdhci@3400000";
 		serial0 = &uarta;
 		i2c0 = "/bpmp/i2c";
 		i2c1 = "/i2c@3160000";
@@ -72,6 +74,32 @@
 		status = "okay";
 	};
 
+	/* SDMMC1 (SD/MMC) */
+	sdhci@3400000 {
+		status = "okay";
+
+		cd-gpios = <&gpio TEGRA_MAIN_GPIO(P, 6) GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpio TEGRA_MAIN_GPIO(P, 4) GPIO_ACTIVE_LOW>;
+
+		vqmmc-supply = <&vddio_sdmmc1>;
+		vmmc-supply = <&vdd_sd>;
+	};
+
+	/* SDMMC3 (SDIO) */
+	sdhci@3440000 {
+		status = "okay";
+	};
+
+	/* SDMMC4 (eMMC) */
+	sdhci@3460000 {
+		status = "okay";
+		bus-width = <8>;
+		non-removable;
+
+		vqmmc-supply = <&vdd_1v8_ap>;
+		vmmc-supply = <&vdd_3v3_sys>;
+	};
+
 	hsp@3c00000 {
 		status = "okay";
 	};
@@ -333,5 +361,19 @@
 
 			vin-supply = <&vdd_1v8>;
 		};
+
+		vdd_sd: regulator@2 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+
+			regulator-name = "SD_CARD_SW_PWR";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+
+			gpio = <&gpio TEGRA_MAIN_GPIO(P, 5) GPIO_ACTIVE_HIGH>;
+			enable-active-high;
+
+			vin-supply = <&vdd_3v3_sys>;
+		};
 	};
 };
-- 
2.11.1
