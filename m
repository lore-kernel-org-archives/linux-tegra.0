From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH 1/3] clk: tegra: refactor 7.1 div calculation
Date: Tue, 3 Jul 2018 14:35:19 +0300
Message-ID: <1530617721-5767-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

Move this to a separate file so it can be used to calculate the sdmmc
clock dividers.

Signed-off-by: Peter De-Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
---
 drivers/clk/tegra/Makefile      |  1 +
 drivers/clk/tegra/clk-divider.c | 30 ++++--------------------
 drivers/clk/tegra/clk.h         |  3 +++
 drivers/clk/tegra/div71.c       | 51 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+), 25 deletions(-)
 create mode 100644 drivers/clk/tegra/div71.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index b716923..6d4f563 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
 obj-y					+= cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
 obj-$(CONFIG_CLK_TEGRA_BPMP)		+= clk-bpmp.o
+obj-y					+= div71.o
diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 16e0aee..ad87858 100644
--- a/drivers/clk/tegra/clk-divider.c
+++ b/drivers/clk/tegra/clk-divider.c
@@ -32,35 +32,15 @@
 static int get_div(struct tegra_clk_frac_div *divider, unsigned long rate,
 		   unsigned long parent_rate)
 {
-	u64 divider_ux1 = parent_rate;
-	u8 flags = divider->flags;
-	int mul;
-
-	if (!rate)
-		return 0;
-
-	mul = get_mul(divider);
-
-	if (!(flags & TEGRA_DIVIDER_INT))
-		divider_ux1 *= mul;
-
-	if (flags & TEGRA_DIVIDER_ROUND_UP)
-		divider_ux1 += rate - 1;
-
-	do_div(divider_ux1, rate);
-
-	if (flags & TEGRA_DIVIDER_INT)
-		divider_ux1 *= mul;
+	int div;
 
-	divider_ux1 -= mul;
+	div = div71_get(rate, parent_rate, divider->width, divider->frac_width,
+			divider->flags);
 
-	if ((s64)divider_ux1 < 0)
+	if (div < 0)
 		return 0;
 
-	if (divider_ux1 > get_max_div(divider))
-		return get_max_div(divider);
-
-	return divider_ux1;
+	return div;
 }
 
 static unsigned long clk_frac_div_recalc_rate(struct clk_hw *hw,
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index e1f8846..f14e136 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -811,6 +811,9 @@ extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
 u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
+int div71_get(unsigned long rate, unsigned parent_rate, u8 width,
+	      u8 frac_width, u8 flags);
+
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
diff --git a/drivers/clk/tegra/div71.c b/drivers/clk/tegra/div71.c
new file mode 100644
index 0000000..27b3846
--- /dev/null
+++ b/drivers/clk/tegra/div71.c
@@ -0,0 +1,51 @@
+/*
+ * Copyright (c) 2018, NVIDIA CORPORATION.  All rights reserved.
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
+#include <linux/kernel.h>
+
+#include "clk.h"
+
+#define div_mask(w) ((1 << (w)) - 1)
+
+int div71_get(unsigned long rate, unsigned parent_rate, u8 width,
+	      u8 frac_width, u8 flags)
+{
+	s64 divider_ux1 = parent_rate;
+	int mul;
+
+	if (!rate)
+		return 0;
+
+	mul = 1 << frac_width;
+
+	if (!(flags & TEGRA_DIVIDER_INT))
+		divider_ux1 *= mul;
+
+	if (flags & TEGRA_DIVIDER_ROUND_UP)
+		divider_ux1 += rate - 1;
+
+	do_div(divider_ux1, rate);
+
+	if (flags & TEGRA_DIVIDER_INT)
+		divider_ux1 *= mul;
+
+	divider_ux1 -= mul;
+
+	if (divider_ux1 > div_mask(width))
+		return div_mask(width);
+
+	return divider_ux1;
+}
-- 
2.7.4
