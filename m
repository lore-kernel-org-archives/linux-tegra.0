From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v6 22/25] clk: tegra: pll: Fix issues with rates for VCO PLLs
Date: Thu, 18 Jun 2015 17:28:37 -0400
Message-ID: <1434662920-21469-23-git-send-email-rklein@nvidia.com>
References: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434662920-21469-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

Without this change clk_get_rate would return the final output
rather than the VCO output as it would factor in the pdiv when
it shouldn't. This will cause problems for all dividers in the
subtree of the VCO PLL.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v5:
  - Switched to using flag for VCO_OUT

v3:
  - Added fix for this bug which was found during testing

 drivers/clk/tegra/clk-pll.c |   16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 7c166894babf..61bd15f9478d 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -743,6 +743,8 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		spin_lock_irqsave(pll->lock, flags);
 
 	_get_pll_mnp(pll, &old_cfg);
+	if (pll->params->flags & TEGRA_PLL_VCO_OUT)
+		cfg.p = old_cfg.p;
 
 	if (old_cfg.m != cfg.m || old_cfg.n != cfg.n || old_cfg.p != cfg.p ||
 		old_cfg.sdm_data != cfg.sdm_data)
@@ -803,11 +805,15 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 
 	_get_pll_mnp(pll, &cfg);
 
-	pdiv = _hw_to_p_div(hw, cfg.p);
-	if (pdiv < 0) {
-		WARN(1, "Clock %s has invalid pdiv value : 0x%x\n",
-			__clk_get_name(hw->clk), cfg.p);
+	if (pll->params->flags & TEGRA_PLL_VCO_OUT) {
 		pdiv = 1;
+	} else {
+		pdiv = _hw_to_p_div(hw, cfg.p);
+		if (pdiv < 0) {
+			WARN(1, "Clock %s has invalid pdiv value : 0x%x\n",
+				__clk_get_name(hw->clk), cfg.p);
+			pdiv = 1;
+		}
 	}
 
 	if (pll->params->set_gain)
@@ -1094,6 +1100,8 @@ static int clk_pllxc_set_rate(struct clk_hw *hw, unsigned long rate,
 		spin_lock_irqsave(pll->lock, flags);
 
 	_get_pll_mnp(pll, &old_cfg);
+	if (pll->params->flags & TEGRA_PLL_VCO_OUT)
+		cfg.p = old_cfg.p;
 
 	if (old_cfg.m != cfg.m || old_cfg.n != cfg.n || old_cfg.p != cfg.p)
 		ret = _program_pll(hw, &cfg, rate);
-- 
1.7.9.5
