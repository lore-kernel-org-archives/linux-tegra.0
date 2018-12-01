From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH] memory: tegra: convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat,  1 Dec 2018 05:30:52 -0500
Message-ID: <20181201103052.6653-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/memory/tegra/tegra124-emc.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index eedb7d48e2ea..10e36ae2d573 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1027,7 +1027,7 @@ static int emc_debug_rate_set(void *data, u64 rate)
 DEFINE_SIMPLE_ATTRIBUTE(emc_debug_rate_fops, emc_debug_rate_get,
 			emc_debug_rate_set, "%lld\n");
 
-static int emc_debug_supported_rates_show(struct seq_file *s, void *data)
+static int emc_supported_rates_show(struct seq_file *s, void *data)
 {
 	struct tegra_emc *emc = s->private;
 	const char *prefix = "";
@@ -1046,19 +1046,7 @@ static int emc_debug_supported_rates_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int emc_debug_supported_rates_open(struct inode *inode,
-					  struct file *file)
-{
-	return single_open(file, emc_debug_supported_rates_show,
-			   inode->i_private);
-}
-
-static const struct file_operations emc_debug_supported_rates_fops = {
-	.open = emc_debug_supported_rates_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(emc_supported_rates);
 
 static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 {
@@ -1083,7 +1071,7 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 		dev_err(dev, "failed to create debugfs entry\n");
 
 	file = debugfs_create_file("supported_rates", S_IRUGO, root, emc,
-				   &emc_debug_supported_rates_fops);
+				   &emc_supported_rates_fops);
 	if (!file)
 		dev_err(dev, "failed to create debugfs entry\n");
 }
-- 
2.17.0
