From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 08/73] ARM: tegra: Add missing host1x properties
Date: Tue, 16 Jun 2020 15:51:33 +0200
Message-ID: <20200616135238.3001888-9-thierry.reding@gmail.com>
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

The host1x device tree bindings require the clock- and interrupt-names
properties to be present, so add them where missing.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra114.dtsi | 2 ++
 arch/arm/boot/dts/tegra124.dtsi | 2 ++
 arch/arm/boot/dts/tegra20.dtsi  | 2 ++
 arch/arm/boot/dts/tegra30.dtsi  | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
index be048aa553ee..a0ac9ea9ec9d 100644
--- a/arch/arm/boot/dts/tegra114.dtsi
+++ b/arch/arm/boot/dts/tegra114.dtsi
@@ -22,7 +22,9 @@ host1x@50000000 {
 		reg = <0x50000000 0x00028000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA114_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index fc124343658e..1afed8496c95 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -89,7 +89,9 @@ host1x@50000000 {
 		reg = <0x0 0x50000000 0x0 0x00034000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 7319df2fcd3e..f0a172c61b26 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -35,7 +35,9 @@ host1x@50000000 {
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA20_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 
diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 0b58863e570e..27000f0ba35b 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -115,7 +115,9 @@ host1x@50000000 {
 		reg = <0x50000000 0x00024000>;
 		interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>, /* syncpt */
 			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>; /* general */
+		interrupt-names = "syncpt", "host1x";
 		clocks = <&tegra_car TEGRA30_CLK_HOST1X>;
+		clock-names = "host1x";
 		resets = <&tegra_car 28>;
 		reset-names = "host1x";
 		iommus = <&mc TEGRA_SWGROUP_HC>;
-- 
2.24.1
