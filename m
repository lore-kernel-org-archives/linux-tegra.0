From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/8] clk: tegra: implement reset status callback
Date: Fri, 20 Jul 2018 14:45:25 +0100
Message-ID: <20180720134532.13148-2-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

Add a the status callback for the reset controller part of the clock
code in the tegra to allow drivers to query the status of a reset line.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index ffaf17f71860..a2cb3d0d38bf 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -146,6 +146,19 @@ static const struct tegra_clk_periph_regs periph_regs[] = {
 
 static void __iomem *clk_base;
 
+static int tegra_clk_rst_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	void __iomem *reg;
+
+	if (id < periph_banks * 32) {
+		reg = clk_base + periph_regs[id / 32].rst_reg;
+		return readl_relaxed(reg) & BIT(id % 32) ? 1 : 0;
+	}
+
+	return -EINVAL;
+}
+
 static int tegra_clk_rst_assert(struct reset_controller_dev *rcdev,
 		unsigned long id)
 {
@@ -288,6 +301,7 @@ void __init tegra_init_from_table(struct tegra_clk_init_table *tbl,
 }
 
 static const struct reset_control_ops rst_ops = {
+	.status = tegra_clk_rst_status,
 	.assert = tegra_clk_rst_assert,
 	.deassert = tegra_clk_rst_deassert,
 	.reset = tegra_clk_rst_reset,
-- 
2.18.0
