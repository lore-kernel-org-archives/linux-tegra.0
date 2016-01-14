From: Rhyland Klein <rklein@nvidia.com>
Subject: [Patch V2 9/9] clk: tegra: pll: Fix PLLE SS coefficients val
Date: Thu, 14 Jan 2016 14:26:42 -0500
Message-ID: <1452799602-14847-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kuo <mkuo@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Mark Kuo <mkuo@nvidia.com>

The PLLE_SS_COEFFICIENTS_VAL should be different for Tegra210
from Tegra114. Add SoC generation specific versions for Tegra114
and Tegra210 and use those in their respective plle_enable functions.

Signed-off-by: Mark Kuo <mkuo@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index cb28130e6c0a..6ac3f843e7ca 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -86,15 +86,21 @@
 #define PLLE_SS_DISABLE (PLLE_SS_CNTL_BYPASS_SS | PLLE_SS_CNTL_INTERP_RESET |\
 				PLLE_SS_CNTL_SSC_BYP)
 #define PLLE_SS_MAX_MASK 0x1ff
-#define PLLE_SS_MAX_VAL 0x25
+#define PLLE_SS_MAX_VAL_TEGRA114 0x25
+#define PLLE_SS_MAX_VAL_TEGRA210 0x21
 #define PLLE_SS_INC_MASK (0xff << 16)
 #define PLLE_SS_INC_VAL (0x1 << 16)
 #define PLLE_SS_INCINTRV_MASK (0x3f << 24)
-#define PLLE_SS_INCINTRV_VAL (0x20 << 24)
+#define PLLE_SS_INCINTRV_VAL_TEGRA114 (0x20 << 24)
+#define PLLE_SS_INCINTRV_VAL_TEGRA210 (0x23 << 24)
 #define PLLE_SS_COEFFICIENTS_MASK \
 	(PLLE_SS_MAX_MASK | PLLE_SS_INC_MASK | PLLE_SS_INCINTRV_MASK)
-#define PLLE_SS_COEFFICIENTS_VAL \
-	(PLLE_SS_MAX_VAL | PLLE_SS_INC_VAL | PLLE_SS_INCINTRV_VAL)
+#define PLLE_SS_COEFFICIENTS_VAL_TEGRA114 \
+	(PLLE_SS_MAX_VAL_TEGRA114 | PLLE_SS_INC_VAL |\
+	 PLLE_SS_INCINTRV_VAL_TEGRA114)
+#define PLLE_SS_COEFFICIENTS_VAL_TEGRA210 \
+	(PLLE_SS_MAX_VAL_TEGRA210 | PLLE_SS_INC_VAL |\
+	 PLLE_SS_INCINTRV_VAL_TEGRA210)
 
 #define PLLE_AUX_PLLP_SEL	BIT(2)
 #define PLLE_AUX_USE_LOCKDET	BIT(3)
@@ -1428,7 +1434,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	val = pll_readl(PLLE_SS_CTRL, pll);
 	val &= ~(PLLE_SS_CNTL_CENTER | PLLE_SS_CNTL_INVERT);
 	val &= ~PLLE_SS_COEFFICIENTS_MASK;
-	val |= PLLE_SS_COEFFICIENTS_VAL;
+	val |= PLLE_SS_COEFFICIENTS_VAL_TEGRA114;
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	val &= ~(PLLE_SS_CNTL_SSC_BYP | PLLE_SS_CNTL_BYPASS_SS);
 	pll_writel(val, PLLE_SS_CTRL, pll);
@@ -2065,7 +2071,7 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	val = pll_readl(PLLE_SS_CTRL, pll);
 	val &= ~(PLLE_SS_CNTL_CENTER | PLLE_SS_CNTL_INVERT);
 	val &= ~PLLE_SS_COEFFICIENTS_MASK;
-	val |= PLLE_SS_COEFFICIENTS_VAL;
+	val |= PLLE_SS_COEFFICIENTS_VAL_TEGRA210;
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	val &= ~(PLLE_SS_CNTL_SSC_BYP | PLLE_SS_CNTL_BYPASS_SS);
 	pll_writel(val, PLLE_SS_CTRL, pll);
-- 
1.9.1
