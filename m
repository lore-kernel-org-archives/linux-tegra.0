From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 14/14] clk: tegra: Fix Tegra210 PLLU initialization
Date: Tue, 25 Jul 2017 13:34:15 +0300
Message-ID: <1500978856-5981-15-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid@nvidia.com>

- Added necessary delays in PLLU enable sequence during initialization
- Applied PLLU lock to all secondary gates (PLLU_48M and PLLU_60M were
missing).

Signed-off-by: Alex Frid <afrid@nvidia.com>
Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index fd04b0e..6d7a613 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2554,6 +2554,7 @@ static int tegra210_enable_pllu(void)
 	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
 	reg &= ~BIT(pllu.params->iddq_bit_idx);
 	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
+	udelay(5);
 
 	reg = readl_relaxed(clk_base + PLLU_BASE);
 	reg &= ~GENMASK(20, 0);
@@ -2561,6 +2562,7 @@ static int tegra210_enable_pllu(void)
 	reg |= fentry->n << 8;
 	reg |= fentry->p << 16;
 	writel(reg, clk_base + PLLU_BASE);
+	udelay(1);
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
 
@@ -2800,14 +2802,14 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	/* PLLU_60M */
 	clk = clk_register_gate(NULL, "pll_u_60M", "pll_u_out2",
 				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
-				23, 0, NULL);
+				23, 0, &pll_u_lock);
 	clk_register_clkdev(clk, "pll_u_60M", NULL);
 	clks[TEGRA210_CLK_PLL_U_60M] = clk;
 
 	/* PLLU_48M */
 	clk = clk_register_gate(NULL, "pll_u_48M", "pll_u_out1",
 				CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
-				25, 0, NULL);
+				25, 0, &pll_u_lock);
 	clk_register_clkdev(clk, "pll_u_48M", NULL);
 	clks[TEGRA210_CLK_PLL_U_48M] = clk;
 
-- 
1.9.1
