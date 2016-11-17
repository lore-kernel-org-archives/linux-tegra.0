From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 5/9] arm64: tegra: Add SDHCI controllers on Tegra186
Date: Thu, 17 Nov 2016 18:11:27 +0100
Message-ID: <20161117171131.20062-5-thierry.reding@gmail.com>
References: <20161117171131.20062-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117171131.20062-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra186 has a total of four SDHCI controllers that each support SD 4.2
(up to UHS-I speed), SDIO 4.1 (up to UHS-I speed), eSD 2.1, eMMC 5.1 and
SDHOST 4.1 (up to UHS-I speed).

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 44 ++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index b1a77d78d202..1aca69f24fb0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -163,6 +163,50 @@
 		status = "disabled";
 	};
 
+	sdmmc1: sdhci@3400000 {
+		compatible = "nvidia,tegra186-sdhci";
+		reg = <0x0 0x03400000 0x0 0x10000>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA186_CLK_SDMMC1>;
+		clock-names = "sdhci";
+		resets = <&bpmp TEGRA186_RESET_SDMMC1>;
+		reset-names = "sdhci";
+		status = "disabled";
+	};
+
+	sdmmc2: sdhci@3420000 {
+		compatible = "nvidia,tegra186-sdhci";
+		reg = <0x0 0x03420000 0x0 0x10000>;
+		interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA186_CLK_SDMMC2>;
+		clock-names = "sdhci";
+		resets = <&bpmp TEGRA186_RESET_SDMMC2>;
+		reset-names = "sdhci";
+		status = "disabled";
+	};
+
+	sdmmc3: sdhci@3440000 {
+		compatible = "nvidia,tegra186-sdhci";
+		reg = <0x0 0x03440000 0x0 0x10000>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA186_CLK_SDMMC3>;
+		clock-names = "sdhci";
+		resets = <&bpmp TEGRA186_RESET_SDMMC3>;
+		reset-names = "sdhci";
+		status = "disabled";
+	};
+
+	sdmmc4: sdhci@3460000 {
+		compatible = "nvidia,tegra186-sdhci";
+		reg = <0x0 0x03460000 0x0 0x10000>;
+		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&bpmp TEGRA186_CLK_SDMMC4>;
+		clock-names = "sdhci";
+		resets = <&bpmp TEGRA186_RESET_SDMMC4>;
+		reset-names = "sdhci";
+		status = "disabled";
+	};
+
 	gic: interrupt-controller@3881000 {
 		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-- 
2.10.2
