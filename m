From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/73] ARM: tegra: Add missing clock-names for SDHCI on Tegra114
Date: Tue, 16 Jun 2020 15:51:26 +0200
Message-ID: <20200616135238.3001888-2-thierry.reding@gmail.com>
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

The Tegra SDHCI controller bindings state that the clock-names property
is required, so add the missing properties on Tegra114.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index 450a1f1b12a0..01a81d380f1f 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -649,6 +649,7 @@ sdhci@78000000 {
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -659,6 +660,7 @@ sdhci@78000200 {
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -669,6 +671,7 @@ sdhci@78000400 {
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -679,6 +682,7 @@ sdhci@78000600 {
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA114_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
-- 
2.24.1
