From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH] clk: tegra: Implement reset control reset
Date: Thu, 2 Mar 2017 16:16:16 +0200
Message-ID: <1488464177-24174-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mikko Perttunen <mperttunen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

For completeness, also implement this reset framework API for Tegra.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Arto Merilainen <amerilainen@nvidia.com>
---
 drivers/clk/tegra/clk.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index b2cdd9a..ba923f0 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -17,6 +17,7 @@
 #include <linux/clkdev.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/clk/tegra.h>
 #include <linux/reset-controller.h>
@@ -182,6 +183,20 @@ static int tegra_clk_rst_deassert(struct reset_controller_dev *rcdev,
 	return -EINVAL;
 }
 
+static int tegra_clk_rst_reset(struct reset_controller_dev *rcdev,
+		unsigned long id)
+{
+	int err;
+
+	err = tegra_clk_rst_assert(rcdev, id);
+	if (err)
+		return err;
+
+	udelay(1);
+
+	return tegra_clk_rst_deassert(rcdev, id);
+}
+
 const struct tegra_clk_periph_regs *get_reg_bank(int clkid)
 {
 	int reg_bank = clkid / 32;
@@ -274,6 +289,7 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 static const struct reset_control_ops rst_ops = {
 	.assert = tegra_clk_rst_assert,
 	.deassert = tegra_clk_rst_deassert,
+	.reset = tegra_clk_rst_reset,
 };
 
 static struct reset_controller_dev rst_ctlr = {
-- 
1.9.1
