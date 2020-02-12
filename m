From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 01/12] clk: tegra: Add custom CCLK implementation
Date: Thu, 13 Feb 2020 02:45:56 +0300
Message-ID: <20200212234607.11521-2-digetx@gmail.com>
References: <20200212234607.11521-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200212234607.11521-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Marcel Ziswiler <marcel.ziswiler-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

CCLK stands for "CPU Clock", CPU core is running off CCLK. CCLK supports
multiple parents, it has internal clock divider and a clock skipper.
PLLX is the main CCLK parent that provides clock rates above 1GHz and it
has special property such that the CCLK's internal divider is set into
bypass mode when PLLX is selected as a parent for CCLK.

This patch forks generic Super Clock into CCLK implementation which takes
into account all CCLK specifics. The proper CCLK implementation is needed
by the upcoming Tegra20 CPUFreq driver update that will allow to utilize
the generic cpufreq-dt driver by moving intermediate clock selection into
the clock driver.

Note that technically this patch could be squashed into clk-super.c, but
it is cleaner to have a separate source file. Also note that currently all
CCLKLP bits are left in the clk-super.c and only CCLKG is supported by
clk-tegra-super-cclk. It shouldn't be difficult to move the CCLKLP bits,
but CCLKLP is not used by anything in kernel and thus better not to touch
it for now.

Acked-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/clk/tegra/Makefile               |   1 +
 drivers/clk/tegra/clk-tegra-super-cclk.c | 178 +++++++++++++++++++++++
 drivers/clk/tegra/clk.h                  |  11 +-
 3 files changed, 188 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-tegra-super-cclk.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index df966ca06788..f04b490f5416 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -14,6 +14,7 @@ obj-y					+= clk-tegra-audio.o
 obj-y					+= clk-tegra-periph.o
 obj-y					+= clk-tegra-pmc.o
 obj-y					+= clk-tegra-fixed.o
+obj-y					+= clk-tegra-super-cclk.o
 obj-y					+= clk-tegra-super-gen4.o
 obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
diff --git a/drivers/clk/tegra/clk-tegra-super-cclk.c b/drivers/clk/tegra/clk-tegra-super-cclk.c
new file mode 100644
index 000000000000..7bcb9e8d0860
--- /dev/null
+++ b/drivers/clk/tegra/clk-tegra-super-cclk.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Based on clk-super.c
+ * Copyright (c) 2012, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * Based on older tegra20-cpufreq driver by Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+ * Copyright (C) 2010 Google, Inc.
+ *
+ * Author: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ * Copyright (C) 2019 GRATE-DRIVER project
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "clk.h"
+
+#define PLLP_INDEX		4
+#define PLLX_INDEX		8
+
+#define SUPER_CDIV_ENB		BIT(31)
+
+static u8 cclk_super_get_parent(struct clk_hw *hw)
+{
+	return tegra_clk_super_ops.get_parent(hw);
+}
+
+static int cclk_super_set_parent(struct clk_hw *hw, u8 index)
+{
+	return tegra_clk_super_ops.set_parent(hw, index);
+}
+
+static int cclk_super_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	return tegra_clk_super_ops.set_rate(hw, rate, parent_rate);
+}
+
+static unsigned long cclk_super_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	if (cclk_super_get_parent(hw) == PLLX_INDEX)
+		return parent_rate;
+
+	return tegra_clk_super_ops.recalc_rate(hw, parent_rate);
+}
+
+static int cclk_super_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
+{
+	struct clk_hw *pllp_hw = clk_hw_get_parent_by_index(hw, PLLP_INDEX);
+	struct clk_hw *pllx_hw = clk_hw_get_parent_by_index(hw, PLLX_INDEX);
+	struct tegra_clk_super_mux *super = to_clk_super_mux(hw);
+	unsigned long pllp_rate;
+	long rate = req->rate;
+
+	if (WARN_ON_ONCE(!pllp_hw || !pllx_hw))
+		return -EINVAL;
+
+	/*
+	 * Switch parent to PLLP for all CCLK rates that are suitable for PLLP.
+	 * PLLX will be disabled in this case, saving some power.
+	 */
+	pllp_rate = clk_hw_get_rate(pllp_hw);
+
+	if (rate <= pllp_rate) {
+		if (super->flags & TEGRA20_SUPER_CLK)
+			rate = pllp_rate;
+		else
+			rate = tegra_clk_super_ops.round_rate(hw, rate,
+							      &pllp_rate);
+
+		req->best_parent_rate = pllp_rate;
+		req->best_parent_hw = pllp_hw;
+		req->rate = rate;
+	} else {
+		rate = clk_hw_round_rate(pllx_hw, rate);
+		req->best_parent_rate = rate;
+		req->best_parent_hw = pllx_hw;
+		req->rate = rate;
+	}
+
+	if (WARN_ON_ONCE(rate <= 0))
+		return -EINVAL;
+
+	return 0;
+}
+
+static const struct clk_ops tegra_cclk_super_ops = {
+	.get_parent = cclk_super_get_parent,
+	.set_parent = cclk_super_set_parent,
+	.set_rate = cclk_super_set_rate,
+	.recalc_rate = cclk_super_recalc_rate,
+	.determine_rate = cclk_super_determine_rate,
+};
+
+static const struct clk_ops tegra_cclk_super_mux_ops = {
+	.get_parent = cclk_super_get_parent,
+	.set_parent = cclk_super_set_parent,
+	.determine_rate = cclk_super_determine_rate,
+};
+
+struct clk *tegra_clk_register_super_cclk(const char *name,
+		const char * const *parent_names, u8 num_parents,
+		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
+		spinlock_t *lock)
+{
+	struct tegra_clk_super_mux *super;
+	struct clk *clk;
+	struct clk_init_data init;
+	u32 val;
+
+	super = kzalloc(sizeof(*super), GFP_KERNEL);
+	if (!super)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.flags = flags;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+
+	super->reg = reg;
+	super->lock = lock;
+	super->width = 4;
+	super->flags = clk_super_flags;
+	super->hw.init = &init;
+
+	if (super->flags & TEGRA20_SUPER_CLK) {
+		init.ops = &tegra_cclk_super_mux_ops;
+	} else {
+		init.ops = &tegra_cclk_super_ops;
+
+		super->frac_div.reg = reg + 4;
+		super->frac_div.shift = 16;
+		super->frac_div.width = 8;
+		super->frac_div.frac_width = 1;
+		super->frac_div.lock = lock;
+		super->div_ops = &tegra_clk_frac_div_ops;
+	}
+
+	/*
+	 * Tegra30+ has the following CPUG clock topology:
+	 *
+	 *        +---+  +-------+  +-+            +-+                +-+
+	 * PLLP+->+   +->+DIVIDER+->+0|  +-------->+0|  ------------->+0|
+	 *        |   |  +-------+  | |  |  +---+  | |  |             | |
+	 * PLLC+->+MUX|             | +->+  | S |  | +->+             | +->+CPU
+	 *  ...   |   |             | |  |  | K |  | |  |  +-------+  | |
+	 * PLLX+->+-->+------------>+1|  +->+ I +->+1|  +->+ DIV2  +->+1|
+	 *        +---+             +++     | P |  +++     |SKIPPER|  +++
+	 *                           ^      | P |   ^      +-------+   ^
+	 *                           |      | E |   |                  |
+	 *                PLLX_SEL+--+      | R |   |       OVERHEAT+--+
+	 *                                  +---+   |
+	 *                                          |
+	 *                         SUPER_CDIV_ENB+--+
+	 *
+	 * Tegra20 is similar, but simpler. It doesn't have the divider and
+	 * thermal DIV2 skipper.
+	 *
+	 * At least for now we're not going to use clock-skipper, hence let's
+	 * ensure that it is disabled.
+	 */
+	val = readl_relaxed(reg + 4);
+	val &= ~SUPER_CDIV_ENB;
+	writel_relaxed(val, reg + 4);
+
+	clk = clk_register(NULL, &super->hw);
+	if (IS_ERR(clk))
+		kfree(super);
+
+	return clk;
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 416a6b09f6a3..ee35a847df08 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -729,8 +729,10 @@ struct clk *tegra_clk_register_periph_data(void __iomem *clk_base,
  * TEGRA_DIVIDER_2 - LP cluster has additional divider. This flag indicates
  *     that this is LP cluster clock.
  * TEGRA210_CPU_CLK - This flag is used to identify CPU cluster for gen5
- * super mux parent using PLLP branches. To use PLLP branches to CPU, need
- * to configure additional bit PLLP_OUT_CPU in the clock registers.
+ *     super mux parent using PLLP branches. To use PLLP branches to CPU, need
+ *     to configure additional bit PLLP_OUT_CPU in the clock registers.
+ * TEGRA20_SUPER_CLK - Tegra20 doesn't have a dedicated divider for Super
+ *     clocks, it only has a clock-skipper.
  */
 struct tegra_clk_super_mux {
 	struct clk_hw	hw;
@@ -748,6 +750,7 @@ struct tegra_clk_super_mux {
 
 #define TEGRA_DIVIDER_2 BIT(0)
 #define TEGRA210_CPU_CLK BIT(1)
+#define TEGRA20_SUPER_CLK BIT(2)
 
 extern const struct clk_ops tegra_clk_super_ops;
 struct clk *tegra_clk_register_super_mux(const char *name,
@@ -758,6 +761,10 @@ struct clk *tegra_clk_register_super_clk(const char *name,
 		const char * const *parent_names, u8 num_parents,
 		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
 		spinlock_t *lock);
+struct clk *tegra_clk_register_super_cclk(const char *name,
+		const char * const *parent_names, u8 num_parents,
+		unsigned long flags, void __iomem *reg, u8 clk_super_flags,
+		spinlock_t *lock);
 
 /**
  * struct tegra_sdmmc_mux - switch divider with Low Jitter inputs for SDMMC
-- 
2.24.0
