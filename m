From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [PATCH V2 2/4] ASoC: convert Tegra20 I2S driver to
	regmap
Date: Fri, 13 Apr 2012 11:23:37 -0600
Message-ID: <1334337819-23665-2-git-send-email-swarren@wwwdotorg.org>
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
 sound/soc/tegra/tegra20_i2s.c |  149 +++++++++++++++++++---------------------
 sound/soc/tegra/tegra20_i2s.h |    3 +-
 2 files changed, 72 insertions(+), 80 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 6957658..0c7af63 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -29,14 +29,13 @@
  */
 
 #include <linux/clk.h>
-#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
-#include <linux/seq_file.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -49,12 +48,14 @@
 
 static inline void tegra20_i2s_write(struct tegra20_i2s *i2s, u32 reg, u32 val)
 {
-	__raw_writel(val, i2s->regs + reg);
+	regmap_write(i2s->regmap, reg, val);
 }
 
 static inline u32 tegra20_i2s_read(struct tegra20_i2s *i2s, u32 reg)
 {
-	return __raw_readl(i2s->regs + reg);
+	u32 val;
+	regmap_read(i2s->regmap, reg, &val);
+	return val;
 }
 
 static int tegra20_i2s_runtime_suspend(struct device *dev)
@@ -80,74 +81,6 @@ static int tegra20_i2s_runtime_resume(struct device *dev)
 	return 0;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int tegra20_i2s_show(struct seq_file *s, void *unused)
-{
-#define REG(r) { r, #r }
-	static const struct {
-		int offset;
-		const char *name;
-	} regs[] = {
-		REG(TEGRA20_I2S_CTRL),
-		REG(TEGRA20_I2S_STATUS),
-		REG(TEGRA20_I2S_TIMING),
-		REG(TEGRA20_I2S_FIFO_SCR),
-		REG(TEGRA20_I2S_PCM_CTRL),
-		REG(TEGRA20_I2S_NW_CTRL),
-		REG(TEGRA20_I2S_TDM_CTRL),
-		REG(TEGRA20_I2S_TDM_TX_RX_CTRL),
-	};
-#undef REG
-
-	struct tegra20_i2s *i2s = s->private;
-	int i;
-
-	clk_enable(i2s->clk_i2s);
-
-	for (i = 0; i < ARRAY_SIZE(regs); i++) {
-		u32 val = tegra20_i2s_read(i2s, regs[i].offset);
-		seq_printf(s, "%s = %08x\n", regs[i].name, val);
-	}
-
-	clk_disable(i2s->clk_i2s);
-
-	return 0;
-}
-
-static int tegra20_i2s_debug_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, tegra20_i2s_show, inode->i_private);
-}
-
-static const struct file_operations tegra20_i2s_debug_fops = {
-	.open    = tegra20_i2s_debug_open,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = single_release,
-};
-
-static void tegra20_i2s_debug_add(struct tegra20_i2s *i2s)
-{
-	i2s->debug = debugfs_create_file(i2s->dai.name, S_IRUGO,
-					 snd_soc_debugfs_root, i2s,
-					 &tegra20_i2s_debug_fops);
-}
-
-static void tegra20_i2s_debug_remove(struct tegra20_i2s *i2s)
-{
-	if (i2s->debug)
-		debugfs_remove(i2s->debug);
-}
-#else
-static inline void tegra20_i2s_debug_add(struct tegra_i2s *i2s)
-{
-}
-
-static inline void tegra20_i2s_debug_remove(struct tegra20_i2s *i2s)
-{
-}
-#endif
-
 static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 				unsigned int fmt)
 {
@@ -343,12 +276,68 @@ static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
 	.symmetric_rates = 1,
 };
 
+static bool tegra20_i2s_wr_rd_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA20_I2S_CTRL:
+	case TEGRA20_I2S_STATUS:
+	case TEGRA20_I2S_TIMING:
+	case TEGRA20_I2S_FIFO_SCR:
+	case TEGRA20_I2S_PCM_CTRL:
+	case TEGRA20_I2S_NW_CTRL:
+	case TEGRA20_I2S_TDM_CTRL:
+	case TEGRA20_I2S_TDM_TX_RX_CTRL:
+	case TEGRA20_I2S_FIFO1:
+	case TEGRA20_I2S_FIFO2:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra20_i2s_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA20_I2S_STATUS:
+	case TEGRA20_I2S_FIFO_SCR:
+	case TEGRA20_I2S_FIFO1:
+	case TEGRA20_I2S_FIFO2:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static bool tegra20_i2s_precious_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case TEGRA20_I2S_FIFO1:
+	case TEGRA20_I2S_FIFO2:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config tegra20_i2s_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = TEGRA20_I2S_FIFO2,
+	.writeable_reg = tegra20_i2s_wr_rd_reg,
+	.readable_reg = tegra20_i2s_wr_rd_reg,
+	.volatile_reg = tegra20_i2s_volatile_reg,
+	.precious_reg = tegra20_i2s_precious_reg,
+	.cache_type = REGCACHE_RBTREE,
+};
+
 static __devinit int tegra20_i2s_platform_probe(struct platform_device *pdev)
 {
 	struct tegra20_i2s *i2s;
 	struct resource *mem, *memregion, *dmareq;
 	u32 of_dma[2];
 	u32 dma_ch;
+	void __iomem *regs;
 	int ret;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_i2s), GFP_KERNEL);
@@ -398,13 +387,21 @@ static __devinit int tegra20_i2s_platform_probe(struct platform_device *pdev)
 		goto err_clk_put;
 	}
 
-	i2s->regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
-	if (!i2s->regs) {
+	regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	if (!regs) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		ret = -ENOMEM;
 		goto err_clk_put;
 	}
 
+	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
+					    &tegra20_i2s_regmap_config);
+	if (IS_ERR(i2s->regmap)) {
+		dev_err(&pdev->dev, "regmap init failed\n");
+		ret = PTR_ERR(i2s->regmap);
+		goto err_clk_put;
+	}
+
 	i2s->capture_dma_data.addr = mem->start + TEGRA20_I2S_FIFO2;
 	i2s->capture_dma_data.wrap = 4;
 	i2s->capture_dma_data.width = 32;
@@ -437,8 +434,6 @@ static __devinit int tegra20_i2s_platform_probe(struct platform_device *pdev)
 		goto err_unregister_dai;
 	}
 
-	tegra20_i2s_debug_add(i2s);
-
 	return 0;
 
 err_unregister_dai:
@@ -465,8 +460,6 @@ static int __devexit tegra20_i2s_platform_remove(struct platform_device *pdev)
 	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_dai(&pdev->dev);
 
-	tegra20_i2s_debug_remove(i2s);
-
 	clk_put(i2s->clk_i2s);
 
 	return 0;
diff --git a/sound/soc/tegra/tegra20_i2s.h b/sound/soc/tegra/tegra20_i2s.h
index 86ab327..a57efc6 100644
--- a/sound/soc/tegra/tegra20_i2s.h
+++ b/sound/soc/tegra/tegra20_i2s.h
@@ -157,8 +157,7 @@ struct tegra20_i2s {
 	struct clk *clk_i2s;
 	struct tegra_pcm_dma_params capture_dma_data;
 	struct tegra_pcm_dma_params playback_dma_data;
-	void __iomem *regs;
-	struct dentry *debug;
+	struct regmap *regmap;
 	u32 reg_ctrl;
 };
 
-- 
1.7.0.4
