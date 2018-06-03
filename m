From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 4/5] clk: tegra20: Check whether direct PLLM sourcing is turned off for EMC
Date: Mon,  4 Jun 2018 01:36:53 +0300
Message-ID: <20180603223654.23324-5-digetx@gmail.com>
References: <20180603223654.23324-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180603223654.23324-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Ensure that direct PLLM sourcing is turned off for EMC as we don't support
that configuration in the clk driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2bd35418716a..ca4eadb9520e 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -800,7 +800,9 @@ static struct tegra_periph_init_data tegra_periph_nodiv_clk_list[] = {
 
 static void __init tegra20_emc_clk_init(void)
 {
+	const u32 use_pllm_ud = BIT(29);
 	struct clk *clk;
+	u32 emc_reg;
 
 	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
 			       ARRAY_SIZE(mux_pllmcp_clkm),
@@ -812,6 +814,14 @@ static void __init tegra20_emc_clk_init(void)
 				    &emc_lock);
 	clks[TEGRA20_CLK_MC] = clk;
 
+	/* un-divided pll_m_out0 is currently unsupported */
+	emc_reg = readl_relaxed(clk_base + CLK_SOURCE_EMC);
+	if (emc_reg & use_pllm_ud) {
+		pr_err("%s: un-divided PllM_out0 used as clock source\n",
+		       __func__);
+		return;
+	}
+
 	/*
 	 * Note that 'emc_mux' source and 'emc' rate shouldn't be changed at
 	 * the same time due to a HW bug, this won't happen because we're
-- 
2.17.0
