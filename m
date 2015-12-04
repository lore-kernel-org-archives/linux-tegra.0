From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/3] clk: tegra: Fix sparse warning for pll_m
Date: Fri, 4 Dec 2015 17:04:23 +0000
Message-ID: <1449248665-22343-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Sparse generates the following warning for the pll_m params structure:

drivers/clk/tegra/clk-tegra210.c:1569:10: warning: Initializer entry
 defined twice
drivers/clk/tegra/clk-tegra210.c:1570:10:   also defined here

Fix this by correcting the index for the MISC1 register.

Fixes: b31eba5ff3f7 ("clk: tegra: Add support for Tegra210 clocks")

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 58514c44ea83..3bd831c2b9db 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1567,7 +1567,7 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.iddq_bit_idx = PLLM_IDDQ_BIT,
 	.max_p = PLL_QLIN_PDIV_MAX,
 	.ext_misc_reg[0] = PLLM_MISC0,
-	.ext_misc_reg[0] = PLLM_MISC1,
+	.ext_misc_reg[1] = PLLM_MISC1,
 	.round_p_to_pdiv = pll_qlin_p_to_pdiv,
 	.pdiv_tohw = pll_qlin_pdiv_to_hw,
 	.div_nmp = &pllm_nmp,
-- 
2.1.4
