From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 34/73] ARM: tegra: The Tegra30 SDHCI is not backwards-compatible
Date: Tue, 16 Jun 2020 15:51:59 +0200
Message-ID: <20200616135238.3001888-35-thierry.reding@gmail.com>
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

The SDHCI on Tegra30 is in fact not backwards-compatible with the
instantiation found on earlier SoCs. Drop the misleading compatible
string.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra30.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index bedab43016c7..3c7ee0b871c0 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -854,7 +854,7 @@ tegra_i2s4: i2s@70080700 {
 	};
 
 	mmc@78000000 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC1>;
@@ -865,7 +865,7 @@ mmc@78000000 {
 	};
 
 	mmc@78000200 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC2>;
@@ -876,7 +876,7 @@ mmc@78000200 {
 	};
 
 	mmc@78000400 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
@@ -887,7 +887,7 @@ mmc@78000400 {
 	};
 
 	mmc@78000600 {
-		compatible = "nvidia,tegra30-sdhci", "nvidia,tegra20-sdhci";
+		compatible = "nvidia,tegra30-sdhci";
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC4>;
-- 
2.24.1
