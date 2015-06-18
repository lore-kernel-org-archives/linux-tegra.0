From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 04/25] clk: tegra: pll: add tegra_pll_wait_for_lock to clk header
Date: Thu, 18 Jun 2015 17:28:19 -0400
Message-ID: <1434662920-21469-5-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Create a wrapper interface to make use of the existing
clk_pll_wait_for_lock. This will be useful for implementations
of callbacks in Tegra SoC specific clock drivers.

Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
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
index 5d2678914160..eeb735e3fa72 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -674,5 +674,6 @@ void tegra114_clock_deassert_dfll_dvco_reset(void);
 
 typedef void (*tegra_clk_apply_init_table_func)(void);
 extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
+int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
 
 #endif /* TEGRA_CLK_H */
-- 
1.7.9.5
