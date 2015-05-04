From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v4 15/20] clk: tegra: pll: Add dyn_ramp callback
Date: Mon, 4 May 2015 12:37:35 -0400
Message-ID: <1430757460-9478-16-git-send-email-rklein@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

Add a callback to the pll_params for custom dynamic ramping
functions which can be specified per PLL.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/clk.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index fb4caa510583..74cf6242a57a 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -160,6 +160,8 @@ struct div_nmp {
 
 #define MAX_PLL_MISC_REG_COUNT	6
 
+struct tegra_clk_pll;
+
 /**
  * struct clk_pll_params - PLL parameters
  *
@@ -250,6 +252,8 @@ struct tegra_clk_pll_params {
 			unsigned long rate, unsigned long parent_rate);
 	unsigned long	(*adjust_vco)(struct tegra_clk_pll_params *pll_params,
 				unsigned long parent_rate);
+	int	(*dyn_ramp)(struct tegra_clk_pll *pll,
+			struct tegra_clk_pll_freq_table *cfg);
 };
 
 #define TEGRA_PLL_USE_LOCK BIT(0)
-- 
1.7.9.5
