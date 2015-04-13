From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] clk: tegra: Fix comments for structure definitions
Date: Mon, 13 Apr 2015 12:38:17 -0400
Message-ID: <1428943097-2768-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some fields moved from the tegra_clk_pll struct to
the tegra_pll_params struct. Update the struct comments
to reflect where the fields really are.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk.h |   74 +++++++++++++++++++++++------------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 751a97966354..4eae99a4f32e 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -171,6 +171,30 @@ struct div_nmp {
  * @lock_bit_idx:		Bit index for PLL lock status
  * @lock_enable_bit_idx:	Bit index to enable PLL lock
  * @lock_delay:			Delay in us if PLL lock is not used
+ * @freq_table:			array of frequencies supported by PLL
+ * @fixed_rate:			PLL rate if it is fixed
+ * @flags:			PLL flags
+ *
+ * Flags:
+ * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
+ *     PLL locking. If not set it will use lock_delay value to wait.
+ * TEGRA_PLL_HAS_CPCON - This flag indicates that CPCON value needs
+ *     to be programmed to change output frequency of the PLL.
+ * TEGRA_PLL_SET_LFCON - This flag indicates that LFCON value needs
+ *     to be programmed to change output frequency of the PLL.
+ * TEGRA_PLL_SET_DCCON - This flag indicates that DCCON value needs
+ *     to be programmed to change output frequency of the PLL.
+ * TEGRA_PLLU - PLLU has inverted post divider. This flags indicated
+ *     that it is PLLU and invert post divider value.
+ * TEGRA_PLLM - PLLM has additional override settings in PMC. This
+ *     flag indicates that it is PLLM and use override settings.
+ * TEGRA_PLL_FIXED - We are not supposed to change output frequency
+ *     of some plls.
+ * TEGRA_PLLE_CONFIGURE - Configure PLLE when enabling.
+ * TEGRA_PLL_LOCK_MISC - Lock bit is in the misc register instead of the
+ *     base register.
+ * TEGRA_PLL_BYPASS - PLL has bypass bit
+ * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
  */
 struct tegra_clk_pll_params {
 	unsigned long	input_min;
@@ -203,38 +227,26 @@ struct tegra_clk_pll_params {
 	unsigned long	fixed_rate;
 };
 
+#define TEGRA_PLL_USE_LOCK BIT(0)
+#define TEGRA_PLL_HAS_CPCON BIT(1)
+#define TEGRA_PLL_SET_LFCON BIT(2)
+#define TEGRA_PLL_SET_DCCON BIT(3)
+#define TEGRA_PLLU BIT(4)
+#define TEGRA_PLLM BIT(5)
+#define TEGRA_PLL_FIXED BIT(6)
+#define TEGRA_PLLE_CONFIGURE BIT(7)
+#define TEGRA_PLL_LOCK_MISC BIT(8)
+#define TEGRA_PLL_BYPASS BIT(9)
+#define TEGRA_PLL_HAS_LOCK_ENABLE BIT(10)
+
 /**
  * struct tegra_clk_pll - Tegra PLL clock
  *
  * @hw:		handle between common and hardware-specifix interfaces
  * @clk_base:	address of CAR controller
  * @pmc:	address of PMC, required to read override bits
- * @freq_table:	array of frequencies supported by PLL
- * @params:	PLL parameters
- * @flags:	PLL flags
- * @fixed_rate:	PLL rate if it is fixed
  * @lock:	register lock
- *
- * Flags:
- * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
- *     PLL locking. If not set it will use lock_delay value to wait.
- * TEGRA_PLL_HAS_CPCON - This flag indicates that CPCON value needs
- *     to be programmed to change output frequency of the PLL.
- * TEGRA_PLL_SET_LFCON - This flag indicates that LFCON value needs
- *     to be programmed to change output frequency of the PLL.
- * TEGRA_PLL_SET_DCCON - This flag indicates that DCCON value needs
- *     to be programmed to change output frequency of the PLL.
- * TEGRA_PLLU - PLLU has inverted post divider. This flags indicated
- *     that it is PLLU and invert post divider value.
- * TEGRA_PLLM - PLLM has additional override settings in PMC. This
- *     flag indicates that it is PLLM and use override settings.
- * TEGRA_PLL_FIXED - We are not supposed to change output frequency
- *     of some plls.
- * TEGRA_PLLE_CONFIGURE - Configure PLLE when enabling.
- * TEGRA_PLL_LOCK_MISC - Lock bit is in the misc register instead of the
- *     base register.
- * TEGRA_PLL_BYPASS - PLL has bypass bit
- * TEGRA_PLL_HAS_LOCK_ENABLE - PLL has bit to enable lock monitoring
+ * @params:	PLL parameters
  */
 struct tegra_clk_pll {
 	struct clk_hw	hw;
@@ -246,18 +258,6 @@ struct tegra_clk_pll {
 
 #define to_clk_pll(_hw) container_of(_hw, struct tegra_clk_pll, hw)
 
-#define TEGRA_PLL_USE_LOCK BIT(0)
-#define TEGRA_PLL_HAS_CPCON BIT(1)
-#define TEGRA_PLL_SET_LFCON BIT(2)
-#define TEGRA_PLL_SET_DCCON BIT(3)
-#define TEGRA_PLLU BIT(4)
-#define TEGRA_PLLM BIT(5)
-#define TEGRA_PLL_FIXED BIT(6)
-#define TEGRA_PLLE_CONFIGURE BIT(7)
-#define TEGRA_PLL_LOCK_MISC BIT(8)
-#define TEGRA_PLL_BYPASS BIT(9)
-#define TEGRA_PLL_HAS_LOCK_ENABLE BIT(10)
-
 extern const struct clk_ops tegra_clk_pll_ops;
 extern const struct clk_ops tegra_clk_plle_ops;
 struct clk *tegra_clk_register_pll(const char *name, const char *parent_name,
-- 
1.7.9.5
