From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 4/4] ASoC: convert Tegra20 DAS driver to
	regmap
Date: Fri, 13 Apr 2012 11:23:39 -0600
Message-ID: <1334337819-23665-4-git-send-email-swarren@wwwdotorg.org>
References: <1334337819-23665-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <1334337819-23665-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>, Liam Girdwood <lrg@ti.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
v2: Split into separate patch. Simplified tegra20_das_wr_rd_reg().
---
 sound/soc/tegra/tegra20_das.c |   99 +++++++++++++++--------------------------
 sound/soc/tegra/tegra20_das.h |    3 +-
 2 files changed, 37 insertions(+), 65 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 812696d..bf99296 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -20,12 +20,11 @@
  *
  */
 
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/seq_file.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include "tegra20_das.h"
@@ -36,12 +35,14 @@ static struct tegra20_das *das;
 
 static inline void tegra20_das_write(u32 reg, u32 val)
 {
-	__raw_writel(val, das->regs + reg);
+	regmap_write(das->regmap, reg, val);
 }
 
 static inline u32 tegra20_das_read(u32 reg)
 {
-	return __raw_readl(das->regs + reg);
+	u32 val;
+	regmap_read(das->regmap, reg, &val);
+	return val;
 }
 
 int tegra20_das_connect_dap_to_dac(int dap, int dac)
@@ -104,68 +105,36 @@ int tegra20_das_connect_dac_to_dap(int dac, int dap)
 }
 EXPORT_SYMBOL_GPL(tegra20_das_connect_dac_to_dap);
 
-#ifdef CONFIG_DEBUG_FS
-static int tegra20_das_show(struct seq_file *s, void *unused)
-{
-	int i;
-	u32 addr;
-	u32 reg;
-
-	for (i = 0; i < TEGRA20_DAS_DAP_CTRL_SEL_COUNT; i++) {
-		addr = TEGRA20_DAS_DAP_CTRL_SEL +
-			(i * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
-		reg = tegra20_das_read(addr);
-		seq_printf(s, "TEGRA20_DAS_DAP_CTRL_SEL[%d] = %08x\n", i, reg);
-	}
-
-	for (i = 0; i < TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT; i++) {
-		addr = TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL +
-			(i * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
-		reg = tegra20_das_read(addr);
-		seq_printf(s, "TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL[%d] = %08x\n",
-			   i, reg);
-	}
+#define LAST_REG(name) \
+	(TEGRA20_DAS_##name + \
+	 (TEGRA20_DAS_##name##_STRIDE * (TEGRA20_DAS_##name##_COUNT - 1)))
 
-	return 0;
-}
-
-static int tegra20_das_debug_open(struct inode *inode, struct file *file)
+static bool tegra20_das_wr_rd_reg(struct device *dev, unsigned int reg)
 {
-	return single_open(file, tegra20_das_show, inode->i_private);
+	if ((reg >= TEGRA20_DAS_DAP_CTRL_SEL) &&
+	    (reg <= LAST_REG(DAP_CTRL_SEL)))
+		return true;
+	if ((reg >= TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL) &&
+	    (reg <= LAST_REG(DAC_INPUT_DATA_CLK_SEL)))
+		return true;
+
+	return false;
 }
 
-static const struct file_operations tegra20_das_debug_fops = {
-	.open    = tegra20_das_debug_open,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = single_release,
+static const struct regmap_config tegra20_das_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = LAST_REG(DAC_INPUT_DATA_CLK_SEL),
+	.writeable_reg = tegra20_das_wr_rd_reg,
+	.readable_reg = tegra20_das_wr_rd_reg,
+	.cache_type = REGCACHE_RBTREE,
 };
 
-static void tegra20_das_debug_add(struct tegra20_das *das)
-{
-	das->debug = debugfs_create_file(DRV_NAME, S_IRUGO,
-					 snd_soc_debugfs_root, das,
-					 &tegra20_das_debug_fops);
-}
-
-static void tegra20_das_debug_remove(struct tegra20_das *das)
-{
-	if (das->debug)
-		debugfs_remove(das->debug);
-}
-#else
-static inline void tegra20_das_debug_add(struct tegra20_das *das)
-{
-}
-
-static inline void tegra20_das_debug_remove(struct tegra20_das *das)
-{
-}
-#endif
-
 static int __devinit tegra20_das_probe(struct platform_device *pdev)
 {
 	struct resource *res, *region;
+	void __iomem *regs;
 	int ret = 0;
 
 	if (das)
@@ -194,13 +163,21 @@ static int __devinit tegra20_das_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	das->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!das->regs) {
+	regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!regs) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		ret = -ENOMEM;
 		goto err;
 	}
 
+	das->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					    &tegra20_das_regmap_config);
+	if (IS_ERR(das->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		ret = PTR_ERR(das->regmap);
+		goto err;
+	}
+
 	ret = tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_1,
 					     TEGRA20_DAS_DAP_SEL_DAC1);
 	if (ret) {
@@ -214,8 +191,6 @@ static int __devinit tegra20_das_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	tegra20_das_debug_add(das);
-
 	platform_set_drvdata(pdev, das);
 
 	return 0;
@@ -230,8 +205,6 @@ static int __devexit tegra20_das_remove(struct platform_device *pdev)
 	if (!das)
 		return -ENODEV;
 
-	tegra20_das_debug_remove(das);
-
 	das = NULL;
 
 	return 0;
diff --git a/sound/soc/tegra/tegra20_das.h b/sound/soc/tegra/tegra20_das.h
index ade4fe0..be217f3 100644
--- a/sound/soc/tegra/tegra20_das.h
+++ b/sound/soc/tegra/tegra20_das.h
@@ -85,8 +85,7 @@
 
 struct tegra20_das {
 	struct device *dev;
-	void __iomem *regs;
-	struct dentry *debug;
+	struct regmap *regmap;
 };
 
 /*
-- 
1.7.0.4
