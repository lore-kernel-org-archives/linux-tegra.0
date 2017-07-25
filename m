From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 08/14] clk: tegra: change post IDDQ release delay to 5us
Date: Tue, 25 Jul 2017 13:34:09 +0300
Message-ID: <1500978856-5981-9-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Increase delay after PLL IDDQ release to 5us per PLL specifications.

based on work by Alex Frid <afrid@nvidia.com>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1c36b8a..695ccb4 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -363,7 +363,7 @@ static void _clk_pll_enable(struct clk_hw *hw)
 		val = pll_readl(pll->params->iddq_reg, pll);
 		val &= ~BIT(pll->params->iddq_bit_idx);
 		pll_writel(val, pll->params->iddq_reg, pll);
-		udelay(2);
+		udelay(5);
 	}
 
 	if (pll->params->reset_reg) {
-- 
1.9.1

