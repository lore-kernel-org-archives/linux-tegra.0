From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 24/73] ARM: tegra: Add missing clock-names for SDHCI controllers
Date: Tue, 16 Jun 2020 15:51:49 +0200
Message-ID: <20200616135238.3001888-25-thierry.reding@gmail.com>
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

The Tegra SDHCI controllers need to have a clock-names property
according to the bindings.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra124.dtsi | 4 ++++
 arch/arm/boot/dts/tegra20.dtsi  | 4 ++++
 arch/arm/boot/dts/tegra30.dtsi  | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 3840019ed5c6..175d0bcd7a2b 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -839,6 +839,7 @@ mmc@700b0000 {
 		reg = <0x0 0x700b0000 0x0 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -849,6 +850,7 @@ mmc@700b0200 {
 		reg = <0x0 0x700b0200 0x0 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -859,6 +861,7 @@ mmc@700b0400 {
 		reg = <0x0 0x700b0400 0x0 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -869,6 +872,7 @@ mmc@700b0600 {
 		reg = <0x0 0x700b0600 0x0 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA124_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 90393d8f5ebc..ccd2995aef83 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -813,6 +813,7 @@ mmc@c8000000 {
 		reg = <0xc8000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -823,6 +824,7 @@ mmc@c8000200 {
 		reg = <0xc8000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -833,6 +835,7 @@ mmc@c8000400 {
 		reg = <0xc8000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -843,6 +846,7 @@ mmc@c8000600 {
 		reg = <0xc8000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA20_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 9a8c07ccbb30..f838e4775cf6 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -856,6 +856,7 @@ mmc@78000000 {
 		reg = <0x78000000 0x200>;
 		interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC1>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 14>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -866,6 +867,7 @@ mmc@78000200 {
 		reg = <0x78000200 0x200>;
 		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC2>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 9>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -876,6 +878,7 @@ mmc@78000400 {
 		reg = <0x78000400 0x200>;
 		interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC3>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 69>;
 		reset-names = "sdhci";
 		status = "disabled";
@@ -886,6 +889,7 @@ mmc@78000600 {
 		reg = <0x78000600 0x200>;
 		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 		clocks = <&tegra_car TEGRA30_CLK_SDMMC4>;
+		clock-names = "sdhci";
 		resets = <&tegra_car 15>;
 		reset-names = "sdhci";
 		status = "disabled";
-- 
2.24.1
