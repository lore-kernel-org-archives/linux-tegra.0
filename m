From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2 1/7] clk: tegra: fix pll_a1 iddq register, add pll_a1
Date: Thu, 23 Feb 2017 12:44:38 +0200
Message-ID: <1487846686-6388-2-git-send-email-pdeschrijver@nvidia.com>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

pll_a1 was using CLK_RST_CONTROLLER_PLLA1_MISC_0 for IDDQ control rather
than the correct register CLK_RST_CONTROLLER_PLLA1_MISC_1. Also add pll_a1
to the set of clocks defined for Tegra210.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 2896d2e..2ef8d49 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -1772,7 +1772,7 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	.misc_reg = PLLA1_MISC0,
 	.lock_mask = PLLCX_BASE_LOCK,
 	.lock_delay = 300,
-	.iddq_reg = PLLA1_MISC0,
+	.iddq_reg = PLLA1_MISC1,
 	.iddq_bit_idx = PLLCX_IDDQ_BIT,
 	.reset_reg = PLLA1_MISC0,
 	.reset_bit_idx = PLLCX_RESET_BIT,
@@ -2209,6 +2209,7 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
 	[tegra_clk_pll_c4_out2] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT2, .present = true },
 	[tegra_clk_pll_c4_out3] = { .dt_id = TEGRA210_CLK_PLL_C4_OUT3, .present = true },
 	[tegra_clk_apb2ape] = { .dt_id = TEGRA210_CLK_APB2APE, .present = true },
+	[tegra_clk_pll_a1] = { .dt_id = TEGRA210_CLK_PLL_A1, .present = true },
 };
 
 static struct tegra_devclk devclks[] __initdata = {
-- 
1.9.1
