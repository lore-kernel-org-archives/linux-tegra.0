From: Aapo Vienamo <avienamo@nvidia.com>
Subject: [PATCH v6 2/4] clk: tegra: Refactor fractional divider calculation
Date: Thu, 12 Jul 2018 14:53:00 +0300
Message-ID: <1531396382-5579-3-git-send-email-avienamo@nvidia.com>
References: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, Aapo Vienamo <avienamo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Peter De Schrijver <pdeschrijver@nvidia.com>

Move this to a separate file so it can be used to calculate the sdmmc
clock dividers.

Signed-off-by: Peter De-Schrijver <pdeschrijver@nvidia.com>
Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/clk/tegra/Makefile      |  1 +
 drivers/clk/tegra/clk-divider.c | 30 +++++-----------------------
 drivers/clk/tegra/clk-utils.c   | 43 +++++++++++++++++++++++++++++++++++++++++
 drivers/clk/tegra/clk.h         |  3 +++
 4 files changed, 52 insertions(+), 25 deletions(-)
 create mode 100644 drivers/clk/tegra/clk-utils.c

diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
index b716923..c77d072 100644
--- a/drivers/clk/tegra/Makefile
+++ b/drivers/clk/tegra/Makefile
@@ -24,3 +24,4 @@ obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
 obj-y					+= cvb.o
 obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
 obj-$(CONFIG_CLK_TEGRA_BPMP)		+= clk-bpmp.o
+obj-y					+= clk-utils.o
diff --git a/drivers/clk/tegra/clk-divider.c b/drivers/clk/tegra/clk-divider.c
index 16e0aee..8f175ff 100644
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
+	div = div_frac_get(rate, parent_rate, divider->width,
+			   divider->frac_width, divider->flags);
 
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
diff --git a/drivers/clk/tegra/clk-utils.c b/drivers/clk/tegra/clk-utils.c
new file mode 100644
index 0000000..1a5daae
--- /dev/null
+++ b/drivers/clk/tegra/clk-utils.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <asm/div64.h>
+
+#include "clk.h"
+
+#define div_mask(w) ((1 << (w)) - 1)
+
+int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
+		 u8 frac_width, u8 flags)
+{
+	u64 divider_ux1 = parent_rate;
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
+	if (divider_ux1 < mul)
+		return 0;
+
+	divider_ux1 -= mul;
+
+	if (divider_ux1 > div_mask(width))
+		return div_mask(width);
+
+	return divider_ux1;
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index e3b9c22..c733841 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -812,6 +812,9 @@ extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 int tegra_pll_wait_for_lock(struct tegra_clk_pll *pll);
 u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
 int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
+int div_frac_get(unsigned long rate, unsigned parent_rate, u8 width,
+		 u8 frac_width, u8 flags);
+
 
 /* Combined read fence with delay */
 #define fence_udelay(delay, reg)	\
-- 
2.7.4
