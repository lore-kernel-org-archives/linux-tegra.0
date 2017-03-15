From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH v2] clk: tegra: add Tegra210 special resets
Date: Wed, 15 Mar 2017 14:59:32 +0200
Message-ID: <1489582774-22217-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 has 2 special resets which don't follow the normal pattern:
DVCO and ADSP. Add them in this patch.

Changelog:

v2: add DT bindings file

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 85 ++++++++++++++++++++++++++++++++
 include/dt-bindings/reset/tegra210-car.h | 13 +++++
 2 files changed, 98 insertions(+)
 create mode 100644 include/dt-bindings/reset/tegra210-car.h

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 2a84897..a41733d 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -24,6 +24,7 @@
 #include <linux/export.h>
 #include <linux/clk/tegra.h>
 #include <dt-bindings/clock/tegra210-car.h>
+#include <dt-bindings/reset/tegra210-car.h>
 #include <linux/iopoll.h>
 
 #include "clk.h"
@@ -218,6 +219,12 @@
 #define CLK_M_DIVISOR_SHIFT 2
 #define CLK_M_DIVISOR_MASK 0x3
 
+#define RST_DFLL_DVCO 0x2f4
+#define DVFS_DFLL_RESET_SHIFT 0
+
+#define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
+#define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
+
 /*
  * SDM fractional divisor is 16-bit 2's complement signed number within
  * (-2^12 ... 2^12-1) range. Represented in PLL data structure as unsigned
@@ -2984,6 +2991,81 @@ static void __init tegra210_clock_apply_init_table(void)
 }
 
 /**
+ * tegra210_car_barrier - wait for pending writes to the CAR to complete
+ *
+ * Wait for any outstanding writes to the CAR MMIO space from this CPU
+ * to complete before continuing execution.  No return value.
+ */
+static void tegra210_car_barrier(void)
+{
+	readl_relaxed(clk_base + RST_DFLL_DVCO);
+}
+
+/**
+ * tegra210_clock_assert_dfll_dvco_reset - assert the DFLL's DVCO reset
+ *
+ * Assert the reset line of the DFLL's DVCO.  No return value.
+ */
+static void tegra210_clock_assert_dfll_dvco_reset(void)
+{
+	u32 v;
+
+	v = readl_relaxed(clk_base + RST_DFLL_DVCO);
+	v |= (1 << DVFS_DFLL_RESET_SHIFT);
+	writel_relaxed(v, clk_base + RST_DFLL_DVCO);
+	tegra210_car_barrier();
+}
+
+/**
+ * tegra210_clock_deassert_dfll_dvco_reset - deassert the DFLL's DVCO reset
+ *
+ * Deassert the reset line of the DFLL's DVCO, allowing the DVCO to
+ * operate.  No return value.
+ */
+static void tegra210_clock_deassert_dfll_dvco_reset(void)
+{
+	u32 v;
+
+	v = readl_relaxed(clk_base + RST_DFLL_DVCO);
+	v &= ~(1 << DVFS_DFLL_RESET_SHIFT);
+	writel_relaxed(v, clk_base + RST_DFLL_DVCO);
+	tegra210_car_barrier();
+}
+
+static int tegra210_reset_assert(unsigned long id)
+{
+	if (id == TEGRA210_RST_DFLL_DVCO)
+		tegra210_clock_assert_dfll_dvco_reset();
+	else if (id == TEGRA210_RST_ADSP)
+		writel(GENMASK(26, 21) | BIT(7),
+			clk_base + CLK_RST_CONTROLLER_RST_DEV_Y_SET);
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int tegra210_reset_deassert(unsigned long id)
+{
+	if (id == TEGRA210_RST_DFLL_DVCO)
+		tegra210_clock_deassert_dfll_dvco_reset();
+	else if (id == TEGRA210_RST_ADSP) {
+		writel(BIT(21), clk_base + CLK_RST_CONTROLLER_RST_DEV_Y_CLR);
+		/*
+		 * Considering adsp cpu clock (min: 12.5MHZ, max: 1GHz)
+		 * a delay of 5us ensures that it's at least
+		 * 6 * adsp_cpu_cycle_period long.
+		 */
+		udelay(5);
+		writel(GENMASK(26, 22) | BIT(7),
+			clk_base + CLK_RST_CONTROLLER_RST_DEV_Y_CLR);
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
  * tegra210_clock_init - Tegra210-specific clock initialization
  * @np: struct device_node * of the DT node for the SoC CAR IP block
  *
@@ -3047,6 +3129,9 @@ static void __init tegra210_clock_init(struct device_node *np)
 
 	tegra_super_clk_gen5_init(clk_base, pmc_base, tegra210_clks,
 				  &pll_x_params);
+	tegra_init_special_resets(2, tegra210_reset_assert,
+				  tegra210_reset_deassert);
+
 	tegra_add_of_provider(np);
 	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
 
diff --git a/include/dt-bindings/reset/tegra210-car.h b/include/dt-bindings/reset/tegra210-car.h
new file mode 100644
index 0000000..296ec6e
--- /dev/null
+++ b/include/dt-bindings/reset/tegra210-car.h
@@ -0,0 +1,13 @@
+/*
+ * This header provides Tegra210-specific constants for binding
+ * nvidia,tegra210-car.
+ */
+
+#ifndef _DT_BINDINGS_RESET_TEGRA210_CAR_H
+#define _DT_BINDINGS_RESET_TEGRA210_CAR_H
+
+#define TEGRA210_RESET(x)		(7 * 32 + (x))
+#define TEGRA210_RST_DFLL_DVCO		TEGRA210_RESET(0)
+#define TEGRA210_RST_ADSP		TEGRA210_RESET(1)
+
+#endif	/* _DT_BINDINGS_RESET_TEGRA210_CAR_H */
-- 
1.9.1
