From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 6/9] clk: tegra210: fix pllx dyn step calculation
Date: Thu, 10 Dec 2015 17:08:25 -0500
Message-ID: <1449785308-19546-7-git-send-email-rklein@nvidia.com>
References: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449785308-19546-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The logic for calculating the input rate used when figuring out
the proper dynamic steps for pllx was incorrect. It is supposed to
be calculated using parent_rate / m but it was just using the parent
rate directly, therefore using the wrong step values.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 2a7faa357130..5d8fac7052f2 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -780,13 +780,13 @@ static void pllx_get_dyn_steps(struct clk_hw *hw, u32 *step_a, u32 *step_b)
 {
 	unsigned long input_rate;
 
-	if (!IS_ERR_OR_NULL(hw->clk)) {
+	/* cf rate */
+	if (!IS_ERR_OR_NULL(hw->clk))
 		input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
-		/* cf rate */
-		input_rate /= tegra_pll_get_fixed_mdiv(hw, input_rate);
-	} else {
+	else
 		input_rate = 38400000;
-	}
+
+	input_rate /= tegra_pll_get_fixed_mdiv(hw, input_rate);
 
 	switch (input_rate) {
 	case 12000000:
-- 
1.9.1
