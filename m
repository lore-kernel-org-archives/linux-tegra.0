From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: tegra: paz00: Fix some indentation inconsistencies
Date: Mon, 21 Jul 2014 13:59:08 +0200
Message-ID: <1405943948-3209-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Indentation of the clock property used a hodgepodge of tabs and spaces.
Make them more consistent (tabs for indentation followed by spaces for
alignment).

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 9a39a8001f78..d4438e30de45 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -296,7 +296,7 @@
 		request-gpios = <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_HIGH>;
 		slave-addr = <138>;
 		clocks = <&tegra_car TEGRA20_CLK_I2C3>,
-		       	 <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
+		         <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;
 		clock-names = "div-clk", "fast-clk";
 		resets = <&tegra_car 67>;
 		reset-names = "i2c";
@@ -589,8 +589,8 @@
 			GPIO_ACTIVE_HIGH>;
 
 		clocks = <&tegra_car TEGRA20_CLK_PLL_A>,
-		       	 <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
-			 <&tegra_car TEGRA20_CLK_CDEV1>;
+		         <&tegra_car TEGRA20_CLK_PLL_A_OUT0>,
+		         <&tegra_car TEGRA20_CLK_CDEV1>;
 		clock-names = "pll_a", "pll_a_out0", "mclk";
 	};
 };
-- 
2.0.1
