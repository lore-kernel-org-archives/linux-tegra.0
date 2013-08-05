From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 3/8] clk: tegra114: add LP1 suspend/resume support
Date: Mon, 5 Aug 2013 19:20:59 +0800
Message-ID: <1375701664-14965-4-git-send-email-josephl@nvidia.com>
References: <1375701664-14965-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375701664-14965-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When the system suspends to LP1, the CPU clock source is switched to
CLK_M (12MHz Oscillator) during suspend/resume flow. The CPU clock
source is controlled by the CCLKG_BURST_POLICY register, and hence this
register must be restored during LP1 resume.

Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* update the commit message
---
 drivers/clk/tegra/clk-tegra114.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index f74ed19..b0e745a 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -22,6 +22,7 @@
 #include <linux/of_address.h>
 #include <linux/delay.h>
 #include <linux/export.h>
+#include <linux/syscore_ops.h>
 #include <linux/clk/tegra.h>
 
 #include "clk.h"
@@ -2332,6 +2333,33 @@ void tegra114_clock_deassert_dfll_dvco_reset(void)
 }
 EXPORT_SYMBOL(tegra114_clock_deassert_dfll_dvco_reset);
 
+#ifdef CONFIG_PM_SLEEP
+static u32 clk_rst_suspend[2];
+
+static int tegra114_clk_suspend(void)
+{
+	u32 *ctx = clk_rst_suspend;
+
+	*ctx++ = readl_relaxed(clk_base + CCLKG_BURST_POLICY);
+	*ctx++ = readl_relaxed(clk_base + CCLKG_BURST_POLICY + 4);
+
+	return 0;
+}
+
+static void tegra114_clk_resume(void)
+{
+	u32 *ctx = clk_rst_suspend;
+
+	writel_relaxed(*ctx++, clk_base + CCLKG_BURST_POLICY);
+	writel_relaxed(*ctx++, clk_base + CCLKG_BURST_POLICY + 4);
+}
+
+static struct syscore_ops tegra114_clk_syscore_ops = {
+	.suspend = tegra114_clk_suspend,
+	.resume = tegra114_clk_resume,
+};
+#endif
+
 static void __init tegra114_clock_init(struct device_node *np)
 {
 	struct device_node *node;
@@ -2384,5 +2412,9 @@ static void __init tegra114_clock_init(struct device_node *np)
 	tegra_clk_apply_init_table = tegra114_clock_apply_init_table;
 
 	tegra_cpu_car_ops = &tegra114_cpu_car_ops;
+
+#ifdef CONFIG_PM_SLEEP
+	register_syscore_ops(&tegra114_clk_syscore_ops);
+#endif
 }
 CLK_OF_DECLARE(tegra114, "nvidia,tegra114-car", tegra114_clock_init);
-- 
1.8.3.4
