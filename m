From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 39/73] arm64: tegra: Remove extra compatible for Tegra194 SDHCI
Date: Tue, 16 Jun 2020 15:52:04 +0200
Message-ID: <20200616135238.3001888-40-thierry.reding@gmail.com>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616135238.3001888-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The SDHCI on Tegra194 is in fact not compatible with the one found on
Tegra186. Remove the extra compatible string to reflect that.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 4bc187a4eacd..ae438b2c4dd9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -450,7 +450,7 @@ pwm8: pwm@32f0000 {
 		};
 
 		sdmmc1: sdhci@3400000 {
-			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra186-sdhci";
+			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03400000 0x10000>;
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC1>;
@@ -472,7 +472,7 @@ sdmmc1: sdhci@3400000 {
 		};
 
 		sdmmc3: sdhci@3440000 {
-			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra186-sdhci";
+			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03440000 0x10000>;
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC3>;
@@ -495,7 +495,7 @@ sdmmc3: sdhci@3440000 {
 		};
 
 		sdmmc4: sdhci@3460000 {
-			compatible = "nvidia,tegra194-sdhci", "nvidia,tegra186-sdhci";
+			compatible = "nvidia,tegra194-sdhci";
 			reg = <0x03460000 0x10000>;
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA194_CLK_SDMMC4>;
-- 
2.24.1
