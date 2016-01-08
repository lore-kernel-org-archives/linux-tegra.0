From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 5/9] clk: tegra: pll: Fix potential sleeping-while-atomic
Date: Fri, 8 Jan 2016 13:37:07 -0500
Message-ID: <1452278231-9546-6-git-send-email-rklein@nvidia.com>
References: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

Since the ->enable() callback is called with a spinlock held, we cannot
call potentially blocking functions such as clk_get_rate() or
clk_get_parent(), so use the unlocked versions instead.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
[rklein: Adapted from ChromeOS patch, removing pllu_enable cleanup as
it isn't present upstream]
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index a534bfab30b3..65156486889a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -880,7 +880,7 @@ static int clk_plle_training(struct tegra_clk_pll *pll)
 static int clk_plle_enable(struct clk_hw *hw)
 {
 	struct tegra_clk_pll *pll = to_clk_pll(hw);
-	unsigned long input_rate = clk_get_rate(clk_get_parent(hw->clk));
+	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 	struct tegra_clk_pll_freq_table sel;
 	u32 val;
 	int err;
@@ -1378,7 +1378,7 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 	unsigned long flags = 0;
-	unsigned long input_rate = clk_get_rate(clk_get_parent(hw->clk));
+	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
 	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
 		return -EINVAL;
@@ -2014,7 +2014,7 @@ static int clk_plle_tegra210_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 	unsigned long flags = 0;
-	unsigned long input_rate = clk_get_rate(clk_get_parent(hw->clk));
+	unsigned long input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
 
 	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
 		return -EINVAL;
-- 
1.9.1
