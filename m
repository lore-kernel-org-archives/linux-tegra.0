From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 5/8] clk: tegra: add mux-only clock option
Date: Fri, 20 Jul 2018 14:45:29 +0100
Message-ID: <20180720134532.13148-6-ben.dooks@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-kernel@lists.codethink.co.uk, Ben Dooks <ben.dooks@codethink.co.uk>
List-Id: linux-tegra@vger.kernel.org

If both the TEGRA_PERIPH_NO_DIV and TEGRA_PERIPH_NO_GATE are set
as the clock is a mux only, then the clock code fails as it does
not handle both these at the same time. Add support for this by
adding new ops with just the parent get/set.

This is required to add the 2d and 3d idle clocks.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/clk/tegra/clk-periph.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph.c b/drivers/clk/tegra/clk-periph.c
index 9475c00b7cf9..0c377d2dac43 100644
--- a/drivers/clk/tegra/clk-periph.c
+++ b/drivers/clk/tegra/clk-periph.c
@@ -137,6 +137,11 @@ static const struct clk_ops tegra_clk_periph_no_gate_ops = {
 	.set_rate = clk_periph_set_rate,
 };
 
+static const struct clk_ops tegra_clk_periph_nodivgate_ops = {
+	.get_parent = clk_periph_get_parent,
+	.set_parent = clk_periph_set_parent,
+};
+
 static struct clk *_tegra_clk_register_periph(const char *name,
 			const char * const *parent_names, int num_parents,
 			struct tegra_clk_periph *periph,
@@ -147,8 +152,11 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	struct clk_init_data init;
 	const struct tegra_clk_periph_regs *bank;
 	bool div = !(periph->gate.flags & TEGRA_PERIPH_NO_DIV);
+	bool gate = !(periph->gate.flags & TEGRA_PERIPH_NO_GATE);
 
-	if (periph->gate.flags & TEGRA_PERIPH_NO_DIV) {
+	if (!div && !gate)
+		init.ops = &tegra_clk_periph_nodivgate_ops;
+	else if (periph->gate.flags & TEGRA_PERIPH_NO_DIV) {
 		flags |= CLK_SET_RATE_PARENT;
 		init.ops = &tegra_clk_periph_nodiv_ops;
 	} else if (periph->gate.flags & TEGRA_PERIPH_NO_GATE)
@@ -171,7 +179,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 	periph->mux.reg = clk_base + offset;
 	periph->divider.reg = div ? (clk_base + offset) : NULL;
 	periph->gate.clk_base = clk_base;
-	periph->gate.regs = bank;
+	periph->gate.regs = gate ? bank : NULL;
 	periph->gate.enable_refcnt = periph_clk_enb_refcnt;
 
 	clk = clk_register(NULL, &periph->hw);
@@ -180,7 +188,7 @@ static struct clk *_tegra_clk_register_periph(const char *name,
 
 	periph->mux.hw.clk = clk;
 	periph->divider.hw.clk = div ? clk : NULL;
-	periph->gate.hw.clk = clk;
+	periph->gate.hw.clk = gate ? clk : NULL;
 
 	return clk;
 }
-- 
2.18.0
