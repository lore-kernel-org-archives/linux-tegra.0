From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] clk: tegra: defer application of init table
Date: Mon, 25 Mar 2013 17:10:19 -0600
Message-ID: <1364253019-2533-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The Tegra clock driver is initialized during the ARM machine descriptor's
.init_irq() hook. It can't be initialized earlier, since dynamic memory
usage is required. It can't be initialized later, since the .init_timer()
hook needs the clocks initialized. However, at this time, udelay()
doesn't work.

The Tegra clock initialization table may enable some PLLs. Enabling a PLL
may require usage of udelay(). Hence, this can't happen right when the
clock driver is initialized.

To solve this, separate the clock driver initialization from the clock
table processing, so they can execute at separate times.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Peter, if this makes sense to you, perhaps you could included it at the
start of your CCF V9 (with the Tegra114 parts split out into the relevant
changes of yours).
---
 arch/arm/mach-tegra/tegra.c      |    3 +++
 drivers/clk/tegra/clk-tegra114.c |    7 ++++++-
 drivers/clk/tegra/clk-tegra20.c  |    7 ++++++-
 drivers/clk/tegra/clk-tegra30.c  |    7 ++++++-
 drivers/clk/tegra/clk.c          |   10 ++++++++++
 drivers/clk/tegra/clk.h          |    2 ++
 include/linux/clk/tegra.h        |    1 +
 7 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 9cf1ab1..0d1e412 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 #include <linux/sys_soc.h>
 #include <linux/usb/tegra_usb_phy.h>
+#include <linux/clk/tegra.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -85,6 +86,8 @@ static void __init tegra_dt_init(void)
 	struct soc_device *soc_dev;
 	struct device *parent = NULL;
 
+	tegra_clocks_apply_init_table();
+
 	soc_dev_attr = kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
 	if (!soc_dev_attr)
 		goto out;
diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 9f738f8..6dce891 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -2018,6 +2018,11 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry. */
 };
 
+static void __init tegra114_clock_apply_init_table(void)
+{
+	tegra_init_from_table(init_table, clks, clk_max);
+}
+
 void __init tegra114_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -2067,7 +2072,7 @@ void __init tegra114_clock_init(struct device_node *np)
 	clk_data.clk_num = ARRAY_SIZE(clks);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 
-	tegra_init_from_table(init_table, clks, clk_max);
+	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
 
 	tegra_cpu_car_ops = &tegra114_cpu_car_ops;
 }
diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index dc3e2d6..05c4995 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1257,6 +1257,11 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry */
 };
 
+static void __init tegra20_clock_apply_init_table(void)
+{
+	tegra_init_from_table(init_table, clks, clk_max);
+}
+
 /*
  * Some clocks may be used by different drivers depending on the board
  * configuration.  List those here to register them twice in the clock lookup
@@ -1323,7 +1328,7 @@ void __init tegra20_clock_init(struct device_node *np)
 	clk_data.clk_num = ARRAY_SIZE(clks);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 
-	tegra_init_from_table(init_table, clks, clk_max);
+	tegra_clk_apply_init_table = tegra20_clock_apply_init_table;
 
 	tegra_cpu_car_ops = &tegra20_cpu_car_ops;
 }
diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index f3cb16d..54c6baa 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1921,6 +1921,11 @@ static __initdata struct tegra_clk_init_table init_table[] = {
 	{clk_max, clk_max, 0, 0}, /* This MUST be the last entry. */
 };
 
+static void __init tegra30_clock_apply_init_table(void)
+{
+	tegra_init_from_table(init_table, clks, clk_max);
+}
+
 /*
  * Some clocks may be used by different drivers depending on the board
  * configuration.  List those here to register them twice in the clock lookup
@@ -1994,7 +1999,7 @@ void __init tegra30_clock_init(struct device_node *np)
 	clk_data.clk_num = ARRAY_SIZE(clks);
 	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
 
-	tegra_init_from_table(init_table, clks, clk_max);
+	tegra_clk_apply_init_table = tegra30_clock_apply_init_table;
 
 	tegra_cpu_car_ops = &tegra30_cpu_car_ops;
 }
diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index 2a8e424..923ca7e 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -85,3 +85,13 @@ void __init tegra_clocks_init(void)
 {
 	of_clk_init(tegra_dt_clk_match);
 }
+
+tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
+
+void __init tegra_clocks_apply_init_table(void)
+{
+	if (!tegra_clk_apply_init_table)
+		return;
+
+	tegra_clk_apply_init_table();
+}
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 14acd48..e056562 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -589,5 +589,7 @@ void tegra114_clock_init(struct device_node *np);
 static inline void tegra114_clock_init(struct device_node *np) {}
 #endif /* CONFIG_ARCH_TEGRA114_SOC */
 
+typedef void (*tegra_clk_apply_init_table_func)(void);
+extern tegra_clk_apply_init_table_func tegra_clk_apply_init_table;
 
 #endif /* TEGRA_CLK_H */
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 404d6f9..642789b 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -123,5 +123,6 @@ static inline void tegra_cpu_clock_resume(void)
 void tegra_periph_reset_deassert(struct clk *c);
 void tegra_periph_reset_assert(struct clk *c);
 void tegra_clocks_init(void);
+void tegra_clocks_apply_init_table(void);
 
 #endif /* __LINUX_CLK_TEGRA_H_ */
-- 
1.7.10.4
