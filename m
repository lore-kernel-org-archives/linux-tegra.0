From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 11/11] clk: tegra: WARN if clk in the init_table has enable
Date: Fri, 27 May 2016 16:38:14 -0400
Message-ID: <1464381494-27096-12-git-send-email-rklein@nvidia.com>
References: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464381494-27096-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Enabling clocks through the init_table mechanism is deprecated. Clocks
that need to be enabled early and stay on should be marked as CRITICAL.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
 drivers/clk/tegra/clk.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index b2cdd9a235f4..898fe922c742 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -262,6 +262,11 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 				WARN_ON(1);
 			}
 
+		/* Using the init_table to enable clks at boot is
+		 * deprecated. Clks that need to be enabled through early
+		 * boot, they should be marked as CLK_IS_CRITICAL
+		 */
+		WARN_ON_ONCE(tbl->state);
 		if (tbl->state)
 			if (clk_prepare_enable(clk)) {
 				pr_err("%s: Failed to enable %s\n", __func__,
-- 
1.9.1
