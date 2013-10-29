From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] HACK: clk: tegra: Do not mark PLLE as fixed
Date: Tue, 29 Oct 2013 15:40:31 +0100
Message-ID: <1383057631-32668-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra114.c | 2 --
 drivers/clk/tegra/clk-tegra124.c | 2 --
 drivers/clk/tegra/clk-tegra20.c  | 2 --
 drivers/clk/tegra/clk-tegra30.c  | 3 +--
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 624077d..8f583dc 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -587,8 +587,6 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_delay = 300,
 	.div_nmp = &plle_nmp,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLL_FIXED,
-	.fixed_rate = 100000000,
 };
 
 static struct div_nmp pllre_nmp = {
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
index 266e80b..2f7361f 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -464,8 +464,6 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_delay = 300,
 	.div_nmp = &plle_nmp,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLL_FIXED,
-	.fixed_rate = 100000000,
 };
 
 static const struct clk_div_table pll_re_div_table[] = {
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 58faac5..e4d2071 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -427,8 +427,6 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_enable_bit_idx = PLLE_MISC_LOCK_ENABLE,
 	.lock_delay = 0,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLL_FIXED,
-	.fixed_rate = 100000000,
 };
 
 static struct tegra_devclk devclks[] __initdata = {
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 24ce357..69bf84d 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -577,8 +577,7 @@ static struct tegra_clk_pll_params pll_e_params = {
 	.lock_enable_bit_idx = PLLE_MISC_LOCK_ENABLE,
 	.lock_delay = 300,
 	.freq_table = pll_e_freq_table,
-	.flags = TEGRA_PLLE_CONFIGURE | TEGRA_PLL_FIXED,
-	.fixed_rate = 100000000,
+	.flags = TEGRA_PLLE_CONFIGURE,
 };
 
 static unsigned long tegra30_input_freq[] = {
-- 
1.8.4
