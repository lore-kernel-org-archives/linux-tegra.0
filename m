From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/4] clk: tegra20: Use common definition of APBDMA clock gate
Date: Wed,  4 Oct 2017 02:02:40 +0300
Message-ID: <92864d5a0b181866153a1cf28425640f3bbe1b17.1507070638.git.digetx@gmail.com>
References: <cover.1507070638.git.digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1507070638.git.digetx@gmail.com>
In-Reply-To: <cover.1507070638.git.digetx@gmail.com>
References: <cover.1507070638.git.digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The APBDMA clock is defined in the common clock gates table that is used
by Tegra30+. Tegra20 can use it too, let's remove the custom definition
and use the common one.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 42740aad8791..87511b8892cd 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -523,6 +523,7 @@ static struct tegra_devclk devclks[] __initdata = {
 
 static struct tegra_clk tegra20_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_ahbdma] = { .dt_id = TEGRA20_CLK_AHBDMA, .present = true },
+	[tegra_clk_apbdma] = { .dt_id = TEGRA20_CLK_APBDMA, .present = true },
 	[tegra_clk_spdif_out] = { .dt_id = TEGRA20_CLK_SPDIF_OUT, .present = true },
 	[tegra_clk_spdif_in] = { .dt_id = TEGRA20_CLK_SPDIF_IN, .present = true },
 	[tegra_clk_sdmmc1] = { .dt_id = TEGRA20_CLK_SDMMC1, .present = true },
@@ -807,11 +808,6 @@ static void __init tegra20_periph_clk_init(void)
 				    clk_base, 0, 3, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_AC97] = clk;
 
-	/* apbdma */
-	clk = tegra_clk_register_periph_gate("apbdma", "pclk", 0, clk_base,
-				    0, 34, periph_clk_enb_refcnt);
-	clks[TEGRA20_CLK_APBDMA] = clk;
-
 	/* emc */
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
-- 
2.14.1
