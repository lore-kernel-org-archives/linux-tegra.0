From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v5 17/19] ARM: tegra: Update sound node clocks in device tree
Date: Fri, 20 Dec 2019 14:27:03 -0800
Message-ID: <1576880825-15010-18-git-send-email-skomatineni@nvidia.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: skomatineni@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, digetx@gmail.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

clk_out_1, clk_out_2, and clk_out_3 are part of Tegra PMC block
and are moved from clock driver to pmc driver with pmc as clock
provider.

clk_out_1 is dedicated for audio mclk on Tegra30 through Tegra210.

This patch updates device tree sound node to use clk_out_1 from
pmc provider as mclk and uses assigned-clock properties to specify
clock parents for clk_out_1 and extern1.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm/boot/dts/tegra114-dalmore.dts      | 8 +++++++-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 8 +++++++-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 8 +++++++-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts   | 8 +++++++-
 arch/arm/boot/dts/tegra124-nyan.dtsi        | 8 +++++++-
 arch/arm/boot/dts/tegra124-venice2.dts      | 8 +++++++-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi  | 8 +++++++-
 arch/arm/boot/dts/tegra30-apalis.dtsi       | 8 +++++++-
 arch/arm/boot/dts/tegra30-beaver.dts        | 8 +++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi       | 8 +++++++-
 arch/arm/boot/dts/tegra30-colibri.dtsi      | 8 +++++++-
 11 files changed, 77 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
index 97a5c3504bbe..d3e032e7d21a 100644
--- a/arch/arm/boot/dts/tegra114-dalmore.dts
+++ b/arch/arm/boot/dts/tegra114-dalmore.dts
@@ -1296,7 +1296,13 @@
 
 		clocks = <&tegra_car TEGRA114_CLK_PLL_A>,
 			 <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA114_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA114_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA114_CLK_EXTERN1>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 0462ed2dd8b8..de499f736bda 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -2009,8 +2009,14 @@
 		nvidia,audio-codec = <&sgtl5000>;
 		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
 			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA124_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA124_CLK_EXTERN1>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index d1e8593ef0d9..d70a86da4ee4 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -2001,8 +2001,14 @@
 		nvidia,audio-codec = <&sgtl5000>;
 		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
 			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA124_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA124_CLK_EXTERN1>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index d5fd642f8b77..aaf8f6a56ca8 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -2058,8 +2058,14 @@
 
 		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
 			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA124_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA124_CLK_EXTERN1>;
 	};
 
 	thermal-zones {
diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 3b10f475037f..9b1af50cd4b8 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -788,9 +788,15 @@
 
 		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
 			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 
+		assigned-clocks = <&tegra_car TEGRA124_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA124_CLK_EXTERN1>;
+
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(I, 7) GPIO_ACTIVE_HIGH>;
 		nvidia,mic-det-gpios =
 				<&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts/tegra124-venice2.dts
index 7309393bfced..8c2ee6e7d6f1 100644
--- a/arch/arm/boot/dts/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/tegra124-venice2.dts
@@ -1266,8 +1266,14 @@
 
 		clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
 			 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA124_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA124_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA124_CLK_EXTERN1>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
index 8b7a827d604d..387b17458e22 100644
--- a/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi
@@ -1189,7 +1189,13 @@
 		nvidia,audio-codec = <&sgtl5000>;
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA30_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra30-apalis.dtsi b/arch/arm/boot/dts/tegra30-apalis.dtsi
index c18f6f61d764..6648506f3aa4 100644
--- a/arch/arm/boot/dts/tegra30-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra30-apalis.dtsi
@@ -1171,7 +1171,13 @@
 		nvidia,audio-codec = <&sgtl5000>;
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA30_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra30-beaver.dts b/arch/arm/boot/dts/tegra30-beaver.dts
index a3b0f3555cd2..45ef6002b225 100644
--- a/arch/arm/boot/dts/tegra30-beaver.dts
+++ b/arch/arm/boot/dts/tegra30-beaver.dts
@@ -2111,7 +2111,13 @@
 
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA30_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 };
diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index 7ce61edd52f5..4b4f49a49394 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -619,8 +619,14 @@
 
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA30_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 
 	gpio-keys {
diff --git a/arch/arm/boot/dts/tegra30-colibri.dtsi b/arch/arm/boot/dts/tegra30-colibri.dtsi
index 1f9198bb24ff..adba554381c7 100644
--- a/arch/arm/boot/dts/tegra30-colibri.dtsi
+++ b/arch/arm/boot/dts/tegra30-colibri.dtsi
@@ -1030,8 +1030,14 @@
 		nvidia,audio-codec = <&sgtl5000>;
 		clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
 			 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA30_CLK_EXTERN1>;
+			 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
+
+		assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+				  <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+					 <&tegra_car TEGRA30_CLK_EXTERN1>;
 	};
 };
 
-- 
2.7.4
