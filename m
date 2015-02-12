From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v6 14/15] memory: tegra: Add debugfs entry for getting and setting the EMC rate
Date: Thu, 12 Feb 2015 15:06:30 +0100
Message-ID: <1423750042-6535-15-git-send-email-tomeu.vizoso@collabora.com>
References: <1423750042-6535-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423750042-6535-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, Mikko Perttunen <mperttunen@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Will be very useful when tuning memory scaling.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/memory/tegra/tegra124-emc.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 7036ad5..d4817b6 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -18,6 +18,7 @@
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -1036,6 +1037,38 @@ static struct device_node *tegra_emc_find_node_by_ram_code(
 	return NULL;
 }
 
+/* Debugfs entry */
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
+	d = debugfs_create_file("emc_rate", S_IRUGO | S_IWUSR, NULL,
+				clk_get_sys("tegra-clk-debug", "emc"),
+				&emc_debug_rate_fops);
+	if (!d)
+		pr_warn("failed to create debugfs entries\n");
+}
+
 static int tegra_emc_probe(struct platform_device *pdev)
 {
 	struct tegra_emc *tegra;
@@ -1106,6 +1139,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tegra);
 
 
+	emc_debugfs_init();
+
 	return 0;
 };
 
-- 
1.9.3
