From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] clk: tegra: Use readl_relaxed_poll_timeout_atomic in tegra210_clock_init
Date: Thu, 14 Sep 2017 18:36:14 -0700
Message-ID: <1505439374-8666-1-git-send-email-nicoleotsuka@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Below is the call trace of tegra210_init_pllu() function:
  start_kernel()
  -> time_init()
  --> of_clk_init()
  ---> tegra210_clock_init()
  ----> tegra210_pll_init()
  -----> tegra210_init_pllu()

Because the preemtion is disabled in the start_kernel before calling
time_init, tegra210_init_pllu is actually in an atomic context while
it includes a readl_relaxed_poll_timeout that might sleep.

So this patch just changes this readl_relaxed_poll_timeout() to its
atomic version.

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra210.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0b9789a..ea695c4 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2587,8 +2587,8 @@ static int tegra210_enable_pllu(void)
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
 
-	readl_relaxed_poll_timeout(clk_base + PLLU_BASE, reg,
-				   reg & PLL_BASE_LOCK, 2, 1000);
+	readl_relaxed_poll_timeout_atomic(clk_base + PLLU_BASE, reg,
+					  reg & PLL_BASE_LOCK, 2, 1000);
 	if (!(reg & PLL_BASE_LOCK)) {
 		pr_err("Timed out waiting for PLL_U to lock\n");
 		return -ETIMEDOUT;
-- 
2.1.4
