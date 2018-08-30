From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2] ARM: tegra: tegra20: Fix mixed tabs-spaces indentation
Date: Thu, 30 Aug 2018 19:21:53 +0200
Message-ID: <20180830172153.20653-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-tegra@vger.kernel.org

Fix indentation and alignment when spaces were used instead of tabs.
This fixes checkpatch errors like:

    ERROR: code indent should use tabs where possible
    #306: FILE: arch/arm/boot/dts/tegra20-paz00.dts:306:
    +^I^I         <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;$

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

Changes since v1:
1. Add Marcel's ack.
---
 arch/arm/boot/dts/tegra20-colibri.dtsi | 2 +-
 arch/arm/boot/dts/tegra20-paz00.dts    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-colibri.dtsi b/arch/arm/boot/dts/tegra20-colibri.dtsi
index e7b9ab09908a..fa1af2dc276c 100644
--- a/arch/arm/boot/dts/tegra20-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra20-colibri.dtsi
@@ -541,7 +541,7 @@
 
 	sound {
 		compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
-			         "nvidia,tegra-audio-wm9712";
+			     "nvidia,tegra-audio-wm9712";
 		nvidia,model = "Colibri T20 AC97 Audio";
 
 		nvidia,audio-routing =
diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index ef245291924f..7d8aef6ebd3a 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -303,7 +303,7 @@
 		request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		slave-addr = <138>;
 		clocks = <&tegra_car TEGRA20_CLK_I2C3>,
-		         <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
+			 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 		resets = <&tegra_car 67>;
 		reset-names = "i2c";
@@ -599,8 +599,8 @@
 			GPIO_ACTIVE_HIGH>;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
-		         <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
-		         <&tegra_car TEGRA20_CLK_CDEV1>;
+			 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
-- 
2.14.1
