From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH 18/19] clk: tegra: Add Super Gen5 Logic
Date: Fri, 24 Apr 2015 12:47:58 -0400
Message-ID: <1429894079-25052-19-git-send-email-rklein@nvidia.com>
References: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429894079-25052-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Bill Huang <bilhuang@nvidia.com>

Super clock divider control and clock source mux of Tegra210 has changed
a little against prior SoCs, this patch adds Gen5 logic to address those
differences.

Signed-off-by: Bill Huang <bilhuang@nvidia.com>
---
 drivers/clk/tegra/Makefile               |    1 +
 drivers/clk/tegra/clk-tegra-super-gen5.c |  150 ++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h                  |    3 +
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/clk/tegra/clk-tegra-super-gen5.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index dbc9360e551c..0ba495b852e6 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -11,6 +11,7 @@ obj-y					+= clk-tegra-periph.o
 obj-y					+= clk-tegra-pmc.o
 obj-y					+= clk-tegra-fixed.o
 obj-y					+= clk-tegra-super-gen4.o
+obj-y					+= clk-tegra-super-gen5.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
 obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
diff --git a/drivers/clk/tegra/clk-tegra-super-gen5.c b/drivers/clk/tegra/clk-tegra-super-gen5.c
new file mode 100644
index 000000000000..c8a117d902a5
--- /dev/null
+++ b/drivers/clk/tegra/clk-tegra-super-gen5.c
@@ -0,0 +1,150 @@
+/*
+ * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/io.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/delay.h>
+#include <linux/export.h>
+#include <linux/clk/tegra.h>
+
+#include "clk.h"
+#include "clk-id.h"
+
+#define PLLX_BASE 0xe0
+#define PLLX_MISC 0xe4
+#define PLLX_MISC2 0x514
+#define PLLX_MISC3 0x518
+
+#define CCLKG_BURST_POLICY 0x368
+#define CCLKLP_BURST_POLICY 0x370
+#define SCLK_DIVIDER 0x370
+#define SCLK_BURST_POLICY 0x028
+#define SYSTEM_CLK_RATE 0x030
+
+static DEFINE_SPINLOCK(sysrate_lock);
+
+static const char *sclk_parents[] = { "clk_m", "pll_c_out1", "pll_c4_out3",
+			       "pll_p", "pll_p_out2", "pll_c4_out1",
+			       "clk_32k", "pll_c4_out2" };
+
+static const char *cclk_g_parents[] = { "clk_m", "unused", "clk_32k", "unused",
+					"pll_p", "pll_p_out4", "unused",
+					"unused", "pll_x", "unused", "unused",
+					"unused", "unused", "unused", "unused",
+					"dfllCPU_out" };
+
+static const char *cclk_lp_parents[] = { "clk_m", "unused", "clk_32k", "unused",
+					"pll_p", "pll_p_out4", "unused",
+					"unused", "pll_x", "unused", "unused",
+					"unused", "unused", "unused", "unused",
+					"dfllCPU_out" };
+
+static void __init tegra_sclk_init(void __iomem *clk_base,
+				struct tegra_clk *tegra_clks)
+{
+	struct clk *clk;
+	struct clk **dt_clk;
+
+	/* SCLK_MUX */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_sclk_mux, tegra_clks);
+	if (dt_clk) {
+		clk = tegra_clk_register_super_mux("sclk_mux", sclk_parents,
+						ARRAY_SIZE(sclk_parents),
+						CLK_SET_RATE_PARENT,
+						clk_base + SCLK_BURST_POLICY,
+						0, 4, 0, 0, NULL);
+		*dt_clk = clk;
+	}
+	/* SCLK */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_sclk, tegra_clks);
+	if (dt_clk) {
+		clk = clk_register_divider(NULL, "sclk", "sclk_mux", 0,
+						clk_base + SCLK_DIVIDER, 0, 8,
+						0, &sysrate_lock);
+		*dt_clk = clk;
+	}
+
+	/* HCLK */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_hclk, tegra_clks);
+	if (dt_clk) {
+		clk = clk_register_divider(NULL, "hclk_div", "sclk", 0,
+				   clk_base + SYSTEM_CLK_RATE, 4, 2, 0,
+				   &sysrate_lock);
+		clk = clk_register_gate(NULL, "hclk", "hclk_div",
+				CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+				clk_base + SYSTEM_CLK_RATE,
+				7, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
+		*dt_clk = clk;
+	}
+
+	/* PCLK */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_pclk, tegra_clks);
+	if (!dt_clk)
+		return;
+
+	clk = clk_register_divider(NULL, "pclk_div", "hclk", 0,
+				   clk_base + SYSTEM_CLK_RATE, 0, 2, 0,
+				   &sysrate_lock);
+	clk = clk_register_gate(NULL, "pclk", "pclk_div", CLK_SET_RATE_PARENT |
+				CLK_IGNORE_UNUSED, clk_base + SYSTEM_CLK_RATE,
+				3, CLK_GATE_SET_TO_DISABLE, &sysrate_lock);
+	*dt_clk = clk;
+}
+
+void __init tegra_super_clk_gen5_init(void __iomem *clk_base,
+				void __iomem *pmc_base,
+				struct tegra_clk *tegra_clks,
+				struct tegra_clk_pll_params *params)
+{
+	struct clk *clk;
+	struct clk **dt_clk;
+
+	/* CCLKG */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_cclk_g, tegra_clks);
+	if (dt_clk) {
+		clk = tegra_clk_register_super_mux("cclk_g", cclk_g_parents,
+					ARRAY_SIZE(cclk_g_parents),
+					CLK_SET_RATE_PARENT,
+					clk_base + CCLKG_BURST_POLICY,
+					0, 4, 8, 0, NULL);
+		*dt_clk = clk;
+	}
+
+	/* CCLKLP */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_cclk_lp, tegra_clks);
+	if (dt_clk) {
+		clk = tegra_clk_register_super_mux("cclk_lp", cclk_lp_parents,
+					ARRAY_SIZE(cclk_lp_parents),
+					CLK_SET_RATE_PARENT,
+					clk_base + CCLKLP_BURST_POLICY,
+					0, 4, 8, 0, NULL);
+		*dt_clk = clk;
+	}
+
+	tegra_sclk_init(clk_base, tegra_clks);
+
+	/* PLLX */
+	dt_clk = tegra_lookup_dt_id(tegra_clk_pll_x, tegra_clks);
+	if (!dt_clk)
+		return;
+
+	clk = tegra_clk_register_pllxc("pll_x", "pll_ref", clk_base,
+			pmc_base, CLK_IGNORE_UNUSED, params, NULL);
+	*dt_clk = clk;
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 6454c1732dbd..fb12dd0de4cf 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -714,6 +714,9 @@ int tegra_osc_clk_init(void __iomem *clk_base, struct tegra_clk *clks,
 void tegra_super_clk_gen4_init(void __iomem *clk_base,
 			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
 			struct tegra_clk_pll_params *pll_params);
+void tegra_super_clk_gen5_init(void __iomem *clk_base,
+			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
+			struct tegra_clk_pll_params *pll_params);
 
 #ifdef CONFIG_TEGRA_CLK_EMC
 struct clk *tegra_emc_init(struct device_node *np, void __iomem *clk_regs,
-- 
1.7.9.5
