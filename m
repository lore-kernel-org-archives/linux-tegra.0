From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] clk: tegra: Use definition for pll_u override bit
Date: Mon, 21 Dec 2015 12:56:32 +0000
Message-ID: <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The definition, PLLU_BASE_OVERRIDE, for the pll_u OVERRIDE bit is defined
but not used and when the OVERRIDE bit is cleared in tegra210_pll_init()
the code directly uses the bit number. Therefore, use the definition,
PLLU_BASE_OVERRIDE when clearing the OVERRIDE bit.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 791215747863..6f043c5e2394 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2520,7 +2520,7 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 
 	/* PLLU_VCO */
 	val = readl(clk_base + pll_u_vco_params.base_reg);
-	val &= ~BIT(24); /* disable PLLU_OVERRIDE */
+	val &= ~PLLU_BASE_OVERRIDE; /* disable PLLU_OVERRIDE */
 	writel(val, clk_base + pll_u_vco_params.base_reg);
 
 	clk = tegra_clk_register_pllre("pll_u_vco", "pll_ref", clk_base, pmc,
-- 
2.1.4
