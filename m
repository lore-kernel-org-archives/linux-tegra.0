From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 12/12] memory: tegra: Add debugfs entry for getting and setting the EMC rate
Date: Tue, 21 Oct 2014 16:45:44 +0200
Message-ID: <1413902788-7727-13-git-send-email-tomeu.vizoso@collabora.com>
References: <1413902788-7727-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1413902788-7727-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Will be very useful when tuning memory scaling.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/memory/tegra/tegra124-emc.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 8438de2..abe2525 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -20,6 +20,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -1034,6 +1035,39 @@ void tegra_emc_complete_timing_change(unsigned long rate)
 	emc_complete_timing_change(emc_instance, emc_instance->timings + i);
 }
 
+/* * * * * * * * * * * * * * * * * * * * * * * * * *
+ * Debugfs entry                                   *
+ * * * * * * * * * * * * * * * * * * * * * * * * * */
+
+static int emc_debug_rate_get(void *data, u64 *rate)
+{
+	struct clk *c = data;
+
+	*rate = clk_get_rate(c);
+
+	return 0;
+}
+
+static int emc_debug_rate_set(void *data, u64 rate)
+{
+	struct clk *c = data;
+
+	return clk_set_rate(c, rate);
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(emc_debug_rate_fops, emc_debug_rate_get,
+			emc_debug_rate_set, "%lld\n");
+
+void emc_debugfs_init(void)
+{
+	struct dentry *d;
+
+	d = debugfs_create_file("emc_rate", S_IRUGO | S_IWUSR, NULL, clk_get_sys("tegra-clk-debug", "emc"),
+				&emc_debug_rate_fops);
+	if (!d)
+		pr_warn("failed to create debugfs entries\n");
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct tegra_emc *tegra;
@@ -1111,6 +1145,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 
 	emc_instance = tegra;
 
+	emc_debugfs_init();
+
 	return 0;
 };
 
-- 
1.9.3
