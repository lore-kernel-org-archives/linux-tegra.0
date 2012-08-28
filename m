From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ARM: tegra: remove tegra_timer from tegra_list_clks
Date: Mon, 27 Aug 2012 17:38:37 -0700
Message-ID: <1346114317-28486-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

tegra_time is a struct sys_timer, not a struct clk, so can't be included
in an array of struct clk *.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra20_clocks_data.c |    1 -
 arch/arm/mach-tegra/tegra30_clocks_data.c |    1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index b9cb82b..be57764 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -926,7 +926,6 @@ PERIPH_CLK(pcie_xclk,	NULL,		  "pcie_xclk",  74,     0,	26000000,  mux_clk_m,
 static struct clk *tegra_list_clks[] = {
 	&tegra_apbdma,
 	&tegra_rtc,
-	&tegra_timer,
 	&tegra_i2s1,
 	&tegra_i2s2,
 	&tegra_spdif_out,
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 3d2e553..d92cb55 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1143,7 +1143,6 @@ struct clk *tegra_list_clks[] = {
 	&tegra_apbdma,
 	&tegra_rtc,
 	&tegra_kbc,
-	&tegra_timer,
 	&tegra_kfuse,
 	&tegra_fuse,
 	&tegra_fuse_burn,
-- 
1.7.9.5
