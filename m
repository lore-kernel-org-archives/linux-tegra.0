From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: [PATCH v7 14/18] memory: tegra: Add debugfs entry for getting and setting the EMC rate
Date: Wed, 11 Mar 2015 11:34:27 +0100
Message-ID: <1426070126-26910-15-git-send-email-tomeu.vizoso@collabora.com>
References: <1426070126-26910-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426070126-26910-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Will be very useful when tuning memory scaling.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
---
 drivers/memory/tegra/tegra124-emc.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index ffd9604..4157f52 100644
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
@@ -1037,6 +1038,38 @@ static struct device_node *tegra_emc_find_node_by_ram_code(
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
@@ -1107,6 +1140,8 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tegra);
 
 
+	emc_debugfs_init();
+
 	return 0;
 };
 
-- 
2.1.0
