From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 03/20] clk: tegra: pll: add tegra_pll_wait_for_lock to clk header
Date: Mon, 4 May 2015 12:37:23 -0400
Message-ID: <1430757460-9478-4-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Create a wrapper interface to make use of the existing
clk_pll_wait_for_lock. This will be useful for implementations
of callbacks in Tegra SoC specific clock drivers.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-pll.c |    5 +++++
 drivers/clk/tegra/clk.h     |    1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 05c6d08a6695..b9a739ce4b98 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -269,6 +269,11 @@ static int clk_pll_wait_for_lock(struct tegra_clk_pll *pll)
 	return -1;
 }
 
+int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll)
+{
+	return clk_pll_wait_for_lock(pll);
+}
+
 static int clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index dfea6f367977..5759b8bfb80e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -647,5 +647,6 @@ void tegra114_clock_deassert_dfll_dvco_reset(void);
 
 typedef void (*tegra_clk_apply_init_table_func)(void);
 extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
+int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
 
 #endif /* TEGRA_CLK_H */
-- 
1.7.9.5
