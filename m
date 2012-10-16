From: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] ARM: tegra: add tegra_timer clock
Date: Tue, 16 Oct 2012 13:08:36 +0300
Message-ID: <1350382116-18024-3-git-send-email-sivaramn@nvidia.com>
References: <1350382116-18024-1-git-send-email-sivaramn@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1350382116-18024-1-git-send-email-sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This undoes commit 20f4665831cec65d6e5d33587bba28ffa536b91d by bringing
back the tegra_timer clock.  tegra_timer is indeed a clock (hidden by
the PERIPH_CLK macro) which should be added to the tegra_list_clks.

The above commit caused tegra_init_timer() failing to get the clk
reference.

Signed-off-by: Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra20_clocks_data.c |    1 +
 arch/arm/mach-tegra/tegra30_clocks_data.c |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index cc9b5fd..8d398a3 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -953,6 +953,7 @@ PERIPH_CLK(pcie_xclk,	NULL,		  "pcie_xclk",  74,     0,	26000000,  mux_clk_m,
 static struct clk *tegra_list_clks[] = {
 	&tegra_apbdma,
 	&tegra_rtc,
+	&tegra_timer,
 	&tegra_i2s1,
 	&tegra_i2s2,
 	&tegra_spdif_out,
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index d92cb55..3d2e553 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1143,6 +1143,7 @@ struct clk *tegra_list_clks[] = {
 	&tegra_apbdma,
 	&tegra_rtc,
 	&tegra_kbc,
+	&tegra_timer,
 	&tegra_kfuse,
 	&tegra_fuse,
 	&tegra_fuse_burn,
-- 
1.7.0.4
