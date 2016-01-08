From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 8/9] clk: tegra: pll: Fix PLLE SS config
Date: Fri, 8 Jan 2016 13:45:13 -0500
Message-ID: <1452278714-10751-9-git-send-email-rklein@nvidia.com>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Kuo <mkuo@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Mark Kuo <mkuo@nvidia.com>

Fix PLLE spread spectrum configuration so it aligns with downstream
kernel.

Signed-off-by: Mark Kuo <mkuo@nvidia.com>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index d9c3109b75bd..6ac3f843e7ca 100644
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
@@ -1401,7 +1407,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	val |= PLLE_MISC_IDDQ_SW_CTRL;
 	val &= ~PLLE_MISC_IDDQ_SW_VALUE;
 	val |= PLLE_MISC_PLLE_PTS;
-	val |= PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK;
+	val &= ~(PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK);
 	pll_writel_misc(val, pll);
 	udelay(5);
 
@@ -1428,7 +1434,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	val = pll_readl(PLLE_SS_CTRL, pll);
 	val &= ~(PLLE_SS_CNTL_CENTER | PLLE_SS_CNTL_INVERT);
 	val &= ~PLLE_SS_COEFFICIENTS_MASK;
-	val |= PLLE_SS_COEFFICIENTS_VAL;
+	val |= PLLE_SS_COEFFICIENTS_VAL_TEGRA114;
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	val &= ~(PLLE_SS_CNTL_SSC_BYP | PLLE_SS_CNTL_BYPASS_SS);
 	pll_writel(val, PLLE_SS_CTRL, pll);
@@ -2035,7 +2041,7 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	val |= PLLE_MISC_IDDQ_SW_CTRL;
 	val &= ~PLLE_MISC_IDDQ_SW_VALUE;
 	val |= PLLE_MISC_PLLE_PTS;
-	val |= PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK;
+	val &= ~(PLLE_MISC_VREG_BG_CTRL_MASK | PLLE_MISC_VREG_CTRL_MASK);
 	pll_writel_misc(val, pll);
 	udelay(5);
 
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
