From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v4 05/20] clk: tegra: pll: update warning msg
Date: Mon, 4 May 2015 12:37:25 -0400
Message-ID: <1430757460-9478-6-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Swap out the generic WARN_ON with a WARN which gives more
information about what is happening.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-pll.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index 1e1018dd466f..0282d9f4f2d7 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -692,7 +692,8 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 
 	pdiv = _hw_to_p_div(hw, cfg.p);
 	if (pdiv < 0) {
-		WARN_ON(1);
+		WARN(1, "Clock %s has invalid pdiv value : 0x%x\n",
+			__clk_get_name(hw->clk), cfg.p);
 		pdiv = 1;
 	}
 
-- 
1.7.9.5
