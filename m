From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] clk: tegra: Capitalization fixes
Date: Wed,  3 Jun 2020 13:19:22 +0200
Message-ID: <20200603111923.3545261-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, LABBE Corentin <clabbe@baylibre.com>, Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

HW, XUSB and PLL are abbreviations and should be all-uppercase.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 0b212cf2e794..583d2ac61e9e 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -1663,7 +1663,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	udelay(1);
 
-	/* Enable hw control of xusb brick pll */
+	/* Enable HW control of XUSB brick PLL */
 	val = pll_readl_misc(pll);
 	val &= ~PLLE_MISC_IDDQ_SW_CTRL;
 	pll_writel_misc(val, pll);
@@ -1686,7 +1686,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	val |= XUSBIO_PLL_CFG0_SEQ_ENABLE;
 	pll_writel(val, XUSBIO_PLL_CFG0, pll);
 
-	/* Enable hw control of SATA pll */
+	/* Enable HW control of SATA PLL */
 	val = pll_readl(SATA_PLL_CFG0, pll);
 	val &= ~SATA_PLL_CFG0_PADPLL_RESET_SWCTL;
 	val |= SATA_PLL_CFG0_PADPLL_USE_LOCKDET;
-- 
2.24.1
