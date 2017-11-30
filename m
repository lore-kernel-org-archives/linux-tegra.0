From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Thu, 30 Nov 2017 16:24:11 +0300
Message-ID: <6264cf17-0850-37dd-ca92-9362521d2db6@gmail.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
 <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
 <f940d9f1-aaec-cf25-24d2-956df63bbbd1@gmail.com>
 <e0fa0df8-aaec-04fe-72b6-21ee1b3c9acb@nvidia.com>
 <95c14859-a2c7-1c61-adba-bd6c16155c01@gmail.com>
 <9d479a38-f40b-0e58-09c3-d06e9ee32a25@nvidia.com>
 <a96d03da-c2a3-1e44-f227-02577f972df6@gmail.com>
 <e69dc6c8-cbca-0498-c9d8-23e9a7ac1ad6@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <e69dc6c8-cbca-0498-c9d8-23e9a7ac1ad6@nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 30.11.2017 14:31, Jon Hunter wrote:
> 
> On 29/11/17 23:13, Dmitry Osipenko wrote:
>> On 30.11.2017 01:55, Jon Hunter wrote:
> 
> ...
> 
>> I've asked you to re-test Tegra114/124 or whatever was failing for you with the
>> PLL_M being marked as critical instead of PCLK. Maybe it was PLL_M that actually
>> caused trouble on Tegra114/124.
> 
> Please share the exact change you would like me to test and I will.

Please try this:

diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 16e0aee14773..58874c1bbf5e 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -194,6 +194,7 @@ static const struct clk_div_table mc_div_table[] = {
 struct clk *tegra_clk_register_mc(const char *name, const char *parent_name,
 				  void __iomem *reg, spinlock_t *lock)
 {
-	return clk_register_divider_table(NULL, name, parent_name, 0, reg,
-					  16, 1, 0, mc_div_table, lock);
+	return clk_register_divider_table(NULL, name, parent_name,
+					  CLK_IS_CRITICAL, reg, 16, 1, 0,
+					  mc_div_table, lock);
 }
diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 11a5066e5c27..5234acd30e89 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -515,7 +515,7 @@ struct clk *tegra_clk_register_emc(void __iomem *base,
struct device_node *np,

 	init.name = "emc";
 	init.ops = &tegra_clk_emc_ops;
-	init.flags = 0;
+	init.flags = CLK_IS_CRITICAL;
 	init.parent_names = emc_parent_clk_names;
 	init.num_parents = ARRAY_SIZE(emc_parent_clk_names);

diff --git a/drivers/clk/tegra/clk-tegra-super-gen4.c
b/drivers/clk/tegra/clk-tegra-super-gen4.c
index 10047107c1dc..4f6fd307cb70 100644
--- a/drivers/clk/tegra/clk-tegra-super-gen4.c
+++ b/drivers/clk/tegra/clk-tegra-super-gen4.c
@@ -166,7 +166,7 @@ static void __init tegra_sclk_init(void __iomem *clk_base,
 				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
 				   &sysrate_lock);
 	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
-				CLK_IS_CRITICAL, clk_base + SYSTEM_CLK_RATE,
+				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
 				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
 	*dt_clk = clk;
 }
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 63087d17c3e2..10f92178b6f2 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1161,6 +1161,7 @@ static const struct of_device_id pmc_match[] __initconst = {
  * breaks
  */
 static struct tegra_clk_init_table init_table[] __initdata = {
+	{ TEGRA114_CLK_EMC, TEGRA114_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA114_CLK_UARTA, TEGRA114_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA114_CLK_UARTB, TEGRA114_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA114_CLK_UARTC, TEGRA114_CLK_PLL_P, 408000000, 0 },
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index e81ea5b11577..7936b86f9a2a 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1089,7 +1089,7 @@ static void __init tegra124_pll_init(void __iomem *clk_base,

 	/* PLLM */
 	clk = tegra_clk_register_pllm("pll_m", "pll_ref", clk_base, pmc,
-			     CLK_IGNORE_UNUSED | CLK_SET_RATE_GATE,
+			     CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
 			     &pll_m_params, NULL);
 	clk_register_clkdev(clk, "pll_m", NULL);
 	clks[TEGRA124_CLK_PLL_M] = clk;
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index e33d7548a4e9..18c2a0ea3f0f 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -819,8 +819,9 @@ static void __init tegra20_periph_clk_init(void)
 			       CLK_SET_RATE_NO_REPARENT,
 			       clk_base + CLK_SOURCE_EMC,
 			       30, 2, 0, &emc_lock);
-	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base, 0,
-				    57, periph_clk_enb_refcnt);
+	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base,
+					     CLK_IS_CRITICAL, 57,
+					     periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_EMC] = clk;

 	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
@@ -1030,7 +1031,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_HCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA20_CLK_PCLK, TEGRA20_CLK_CLK_MAX, 60000000, 1 },
 	{ TEGRA20_CLK_CSITE, TEGRA20_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA20_CLK_EMC, TEGRA20_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA20_CLK_CCLK, TEGRA20_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA20_CLK_UARTA, TEGRA20_CLK_PLL_P, 0, 0 },
 	{ TEGRA20_CLK_UARTB, TEGRA20_CLK_PLL_P, 0, 0 },
diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 9e6260869eb9..3f54c48701c0 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2786,7 +2786,8 @@ static void __init tegra210_pll_init(void __iomem *clk_base,

 	/* PLLM */
 	clk = tegra_clk_register_pllm("pll_m", "osc", clk_base, pmc,
-			     CLK_SET_RATE_GATE, &pll_m_params, NULL);
+				      CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
+				      &pll_m_params, NULL);
 	clk_register_clkdev(clk, "pll_m", NULL);
 	clks[TEGRA210_CLK_PLL_M] = clk;

@@ -3009,6 +3010,7 @@ static const struct of_device_id pmc_match[] __initconst = {
 };

 static struct tegra_clk_init_table init_table[] __initdata = {
+	{ TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_UARTA, TEGRA210_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA210_CLK_UARTB, TEGRA210_CLK_PLL_P, 408000000, 0 },
 	{ TEGRA210_CLK_UARTC, TEGRA210_CLK_PLL_P, 408000000, 0 },
@@ -3040,7 +3042,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA210_CLK_XUSB_DEV_SRC, TEGRA210_CLK_PLL_P_OUT_XUSB, 102000000, 0 },
 	{ TEGRA210_CLK_SATA, TEGRA210_CLK_PLL_P, 104000000, 0 },
 	{ TEGRA210_CLK_SATA_OOB, TEGRA210_CLK_PLL_P, 204000000, 0 },
-	{ TEGRA210_CLK_EMC, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_MSELECT, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA210_CLK_CSITE, TEGRA210_CLK_CLK_MAX, 0, 1 },
 	/* TODO find a way to enable this on-demand */
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index bee84c554932..f4c483c02d91 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1060,8 +1060,9 @@ static void __init tegra30_periph_clk_init(void)
 			       CLK_SET_RATE_NO_REPARENT,
 			       clk_base + CLK_SOURCE_EMC,
 			       30, 2, 0, &emc_lock);
-	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base, 0,
-				    57, periph_clk_enb_refcnt);
+	clk = tegra_clk_register_periph_gate("emc", "emc_mux", 0, clk_base,
+					     CLK_IS_CRITICAL, 57,
+					     periph_clk_enb_refcnt);
 	clks[TEGRA30_CLK_EMC] = clk;

 	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
@@ -1255,7 +1256,6 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA30_CLK_PLL_M, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_PCLK, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_CSITE, TEGRA30_CLK_CLK_MAX, 0, 1 },
-	{ TEGRA30_CLK_EMC, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_MSELECT, TEGRA30_CLK_CLK_MAX, 0, 1 },
 	{ TEGRA30_CLK_SBC1, TEGRA30_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA30_CLK_SBC2, TEGRA30_CLK_PLL_P, 100000000, 0 },
