From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 6/9] clk: tegra210: fix pllx dyn step calculation
Date: Fri, 8 Jan 2016 13:37:08 -0500
Message-ID: <1452278231-9546-7-git-send-email-rklein@nvidia.com>
References: <1452278231-9546-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452278231-9546-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The logic for calculating the input rate used when figuring out
the proper dynamic steps for pllx was incorrect. It is supposed to
be calculated using parent_rate / m but it was just using the parent
rate directly, therefore using the wrong step values.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
