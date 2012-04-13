From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 3/4] ASoC: convert Tegra20 SPDIF driver to
	regmap
Date: Fri, 13 Apr 2012 11:23:38 -0600
Message-ID: <1334337819-23665-3-git-send-email-swarren@wwwdotorg.org>
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
v2: Split into separate patch
---
 sound/soc/tegra/tegra20_spdif.c |  177 ++++++++++++++++++++-------------------
 sound/soc/tegra/tegra20_spdif.h |    3 +-
 2 files changed, 92 insertions(+), 88 deletions(-)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 94c5764..f9b5741 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -21,13 +21,12 @@
  */
 
 #include <linux/clk.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <linux/seq_file.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -41,12 +40,14 @@
 static inline void tegra20_spdif_write(struct tegra20_spdif *spdif, u32 reg,
 					u32 val)
 {
-	__raw_writel(val, spdif->regs + reg);
+	regmap_write(spdif->regmap, reg, val);
 }
 
 static inline u32 tegra20_spdif_read(struct tegra20_spdif *spdif, u32 reg)
 {
-	return __raw_readl(spdif->regs + reg);
+	u32 val;
+	regmap_read(spdif->regmap, reg, &val);
+	return val;
 }
 
 static int tegra20_spdif_runtime_suspend(struct device *dev)
@@ -72,82 +73,6 @@ static int tegra20_spdif_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int tegra20_spdif_show(struct seq_file *s, void *unused)
-{
-#define REG(r) { r, #r }
-	static const struct {
-		int offset;
-		const char *name;
-	} regs[] = {
-		REG(TEGRA20_SPDIF_CTRL),
-		REG(TEGRA20_SPDIF_STATUS),
-		REG(TEGRA20_SPDIF_STROBE_CTRL),
-		REG(TEGRA20_SPDIF_DATA_FIFO_CSR),
-		REG(TEGRA20_SPDIF_CH_STA_RX_A),
-		REG(TEGRA20_SPDIF_CH_STA_RX_B),
-		REG(TEGRA20_SPDIF_CH_STA_RX_C),
-		REG(TEGRA20_SPDIF_CH_STA_RX_D),
-		REG(TEGRA20_SPDIF_CH_STA_RX_E),
-		REG(TEGRA20_SPDIF_CH_STA_RX_F),
-		REG(TEGRA20_SPDIF_CH_STA_TX_A),
-		REG(TEGRA20_SPDIF_CH_STA_TX_B),
-		REG(TEGRA20_SPDIF_CH_STA_TX_C),
-		REG(TEGRA20_SPDIF_CH_STA_TX_D),
-		REG(TEGRA20_SPDIF_CH_STA_TX_E),
-		REG(TEGRA20_SPDIF_CH_STA_TX_F),
-	};
-#undef REG
-
-	struct tegra20_spdif *spdif = s->private;
-	int i;
-
-	clk_enable(spdif->clk_spdif_out);
-
-	for (i = 0; i < ARRAY_SIZE(regs); i++) {
-		u32 val = tegra20_spdif_read(spdif, regs[i].offset);
-		seq_printf(s, "%s = %08x\n", regs[i].name, val);
-	}
-
-	clk_disable(spdif->clk_spdif_out);
-
-	return 0;
-}
-
-static int tegra20_spdif_debug_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, tegra20_spdif_show, inode->i_private);
-}
-
-static const struct file_operations tegra20_spdif_debug_fops = {
-	.open    = tegra20_spdif_debug_open,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = single_release,
-};
-
-static void tegra20_spdif_debug_add(struct tegra20_spdif *spdif)
-{
-	spdif->debug = debugfs_create_file(DRV_NAME, S_IRUGO,
-						snd_soc_debugfs_root, spdif,
-						&tegra20_spdif_debug_fops);
-}
-
-static void tegra20_spdif_debug_remove(struct tegra20_spdif *spdif)
-{
-	if (spdif->debug)
-		debugfs_remove(spdif->debug);
-}
-#else
-static inline void tegra20_spdif_debug_add(struct tegra20_spdif *spdif)
-{
-}
-
-static inline void tegra20_spdif_debug_remove(struct tegra20_spdif *spdif)
-{
-}
-#endif
-
 static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -265,10 +190,86 @@ static struct snd_soc_dai_driver tegra20_spdif_dai = {
 	.ops = &tegra20_spdif_dai_ops,
 };
 
+static bool tegra20_spdif_wr_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA20_SPDIF_CTRL:
+	case TEGRA20_SPDIF_STATUS:
+	case TEGRA20_SPDIF_STROBE_CTRL:
+	case TEGRA20_SPDIF_DATA_FIFO_CSR:
+	case TEGRA20_SPDIF_DATA_OUT:
+	case TEGRA20_SPDIF_DATA_IN:
+	case TEGRA20_SPDIF_CH_STA_RX_A:
+	case TEGRA20_SPDIF_CH_STA_RX_B:
+	case TEGRA20_SPDIF_CH_STA_RX_C:
+	case TEGRA20_SPDIF_CH_STA_RX_D:
+	case TEGRA20_SPDIF_CH_STA_RX_E:
+	case TEGRA20_SPDIF_CH_STA_RX_F:
+	case TEGRA20_SPDIF_CH_STA_TX_A:
+	case TEGRA20_SPDIF_CH_STA_TX_B:
+	case TEGRA20_SPDIF_CH_STA_TX_C:
+	case TEGRA20_SPDIF_CH_STA_TX_D:
+	case TEGRA20_SPDIF_CH_STA_TX_E:
+	case TEGRA20_SPDIF_CH_STA_TX_F:
+	case TEGRA20_SPDIF_USR_STA_RX_A:
+	case TEGRA20_SPDIF_USR_DAT_TX_A:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra20_spdif_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA20_SPDIF_STATUS:
+	case TEGRA20_SPDIF_DATA_FIFO_CSR:
+	case TEGRA20_SPDIF_DATA_OUT:
+	case TEGRA20_SPDIF_DATA_IN:
+	case TEGRA20_SPDIF_CH_STA_RX_A:
+	case TEGRA20_SPDIF_CH_STA_RX_B:
+	case TEGRA20_SPDIF_CH_STA_RX_C:
+	case TEGRA20_SPDIF_CH_STA_RX_D:
+	case TEGRA20_SPDIF_CH_STA_RX_E:
+	case TEGRA20_SPDIF_CH_STA_RX_F:
+	case TEGRA20_SPDIF_USR_STA_RX_A:
+	case TEGRA20_SPDIF_USR_DAT_TX_A:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra20_spdif_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA20_SPDIF_DATA_OUT:
+	case TEGRA20_SPDIF_DATA_IN:
+	case TEGRA20_SPDIF_USR_STA_RX_A:
+	case TEGRA20_SPDIF_USR_DAT_TX_A:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config tegra20_spdif_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = TEGRA20_SPDIF_USR_DAT_TX_A,
+	.writeable_reg = tegra20_spdif_wr_rd_reg,
+	.readable_reg = tegra20_spdif_wr_rd_reg,
+	.volatile_reg = tegra20_spdif_volatile_reg,
+	.precious_reg = tegra20_spdif_precious_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
 static __devinit int tegra20_spdif_platform_probe(struct platform_device *pdev)
 {
 	struct tegra20_spdif *spdif;
 	struct resource *mem, *memregion, *dmareq;
+	void __iomem *regs;
 	int ret;
 
 	spdif = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_spdif),
@@ -309,13 +310,21 @@ static __devinit int tegra20_spdif_platform_probe(struct platform_device *pdev)
 		goto err_clk_put;
 	}
 
-	spdif->regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	if (!spdif->regs) {
+	regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	if (!regs) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		ret = -ENOMEM;
 		goto err_clk_put;
 	}
 
+	spdif->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					    &tegra20_spdif_regmap_config);
+	if (IS_ERR(spdif->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		ret = PTR_ERR(spdif->regmap);
+		goto err_clk_put;
+	}
+
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.wrap = 4;
 	spdif->playback_dma_data.width = 32;
@@ -341,8 +350,6 @@ static __devinit int tegra20_spdif_platform_probe(struct platform_device *pdev)
 		goto err_unregister_dai;
 	}
 
-	tegra20_spdif_debug_add(spdif);
-
 	return 0;
 
 err_unregister_dai:
@@ -369,8 +376,6 @@ static int __devexit tegra20_spdif_platform_remove(struct platform_device *pdev)
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_dai(&pdev->dev);
 
-	tegra20_spdif_debug_remove(spdif);
-
 	clk_put(spdif->clk_spdif_out);
 
 	return 0;
diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index 823af4c..ed75652 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -464,8 +464,7 @@ struct tegra20_spdif {
 	struct clk *clk_spdif_out;
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
-	void __iomem *regs;
-	struct dentry *debug;
+	struct regmap *regmap;
 	u32 reg_ctrl;
 };
 
-- 
1.7.0.4
