From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ASoC: Tegra I2S: Remove dependency on pdev->id
Date: Wed, 23 Nov 2011 13:33:25 -0700
Message-ID: <1322080405-22281-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When devices are instantiated from device-tree, pdev->id is set to -1.
Rework the driver so it doesn't depend on the ID.

Tegra I2S instantiated from board files are configured with pdev
name "tegra-i2s" and ID 0 or 1. The driver core then names the
device "tegra-i2s.0" or "tegra-i2s.1". This is not changing.

When a device is instantiated from device-tree, it will have
pdev->name="" and pdev->id=-1. For this reason, the pdev->id value is
not something we can rely on.

This patch doesn't actually change any names though:

When a device is instantiated from device-tree, the overall device name
will be "${unit_address}.${node_name}". This causes issues such as
clk_get() failures due to lack of a device-name match. To solve that,
AUXDATA was invented, to force a specific device name, thus allowing
dev_name() to return the same as the non-device-tree case. Tegra
currently uses AUXDATA for the I2S controllers. Eventually, AUXDATA will
go away, most likely replaced by phandle-based references within the
device tree.

v2:
* Use dev_name(&pdev->dev) instead of pdev->name.
* Expand commit description.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_i2s.c |   72 ++++++++++++++-----------------------------
 sound/soc/tegra/tegra_i2s.h |    1 +
 2 files changed, 24 insertions(+), 49 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 76014f0..59cd63b 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -98,13 +98,11 @@ static const struct file_operations tegra_i2s_debug_fops = {
 	.release = single_release,
 };
 
-static void tegra_i2s_debug_add(struct tegra_i2s *i2s, int id)
+static void tegra_i2s_debug_add(struct tegra_i2s *i2s)
 {
-	char name[] = DRV_NAME ".0";
-
-	snprintf(name, sizeof(name), DRV_NAME".%1d", id);
-	i2s->debug = debugfs_create_file(name, S_IRUGO, snd_soc_debugfs_root,
-						i2s, &tegra_i2s_debug_fops);
+	i2s->debug = debugfs_create_file(i2s->dai.name, S_IRUGO,
+					 snd_soc_debugfs_root, i2s,
+					 &tegra_i2s_debug_fops);
 }
 
 static void tegra_i2s_debug_remove(struct tegra_i2s *i2s)
@@ -311,43 +309,22 @@ static struct snd_soc_dai_ops tegra_i2s_dai_ops = {
 	.trigger	= tegra_i2s_trigger,
 };
 
-static struct snd_soc_dai_driver tegra_i2s_dai[] = {
-	{
-		.name = DRV_NAME ".0",
-		.probe = tegra_i2s_probe,
-		.playback = {
-			.channels_min = 2,
-			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_8000_96000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
-		},
-		.capture = {
-			.channels_min = 2,
-			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_8000_96000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
-		},
-		.ops = &tegra_i2s_dai_ops,
-		.symmetric_rates = 1,
+static const struct snd_soc_dai_driver tegra_i2s_dai_template = {
+	.probe = tegra_i2s_probe,
+	.playback = {
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
-	{
-		.name = DRV_NAME ".1",
-		.probe = tegra_i2s_probe,
-		.playback = {
-			.channels_min = 2,
-			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_8000_96000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
-		},
-		.capture = {
-			.channels_min = 2,
-			.channels_max = 2,
-			.rates = SNDRV_PCM_RATE_8000_96000,
-			.formats = SNDRV_PCM_FMTBIT_S16_LE,
-		},
-		.ops = &tegra_i2s_dai_ops,
-		.symmetric_rates = 1,
+	.capture = {
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
 	},
+	.ops = &tegra_i2s_dai_ops,
+	.symmetric_rates = 1,
 };
 
 static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
@@ -356,12 +333,6 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 	struct resource *mem, *memregion, *dmareq;
 	int ret;
 
-	if ((pdev->id < 0) ||
-		(pdev->id >= ARRAY_SIZE(tegra_i2s_dai))) {
-		dev_err(&pdev->dev, "ID %d out of range\n", pdev->id);
-		return -EINVAL;
-	}
-
 	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra_i2s), GFP_KERNEL);
 	if (!i2s) {
 		dev_err(&pdev->dev, "Can't allocate tegra_i2s\n");
@@ -370,6 +341,9 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, i2s);
 
+	i2s->dai = tegra_i2s_dai_template;
+	i2s->dai.name = dev_name(&pdev->dev);
+
 	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
 	if (IS_ERR(i2s->clk_i2s)) {
 		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
@@ -418,14 +392,14 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 
 	i2s->reg_ctrl = TEGRA_I2S_CTRL_FIFO_FORMAT_PACKED;
 
-	ret = snd_soc_register_dai(&pdev->dev, &tegra_i2s_dai[pdev->id]);
+	ret = snd_soc_register_dai(&pdev->dev, &i2s->dai);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
 		ret = -ENOMEM;
 		goto err_clk_put;
 	}
 
-	tegra_i2s_debug_add(i2s, pdev->id);
+	tegra_i2s_debug_add(i2s);
 
 	return 0;
 
diff --git a/sound/soc/tegra/tegra_i2s.h b/sound/soc/tegra/tegra_i2s.h
index 2b38a09..15ce1e2 100644
--- a/sound/soc/tegra/tegra_i2s.h
+++ b/sound/soc/tegra/tegra_i2s.h
@@ -153,6 +153,7 @@
 #define TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_TWELVE_SLOTS	(TEGRA_I2S_FIFO_ATN_LVL_TWELVE_SLOTS << TEGRA_I2S_FIFO_SCR_FIFO1_ATN_LVL_SHIFT)
 
 struct tegra_i2s {
+	struct snd_soc_dai_driver dai;
 	struct clk *clk_i2s;
 	int clk_refs;
 	struct tegra_pcm_dma_params capture_dma_data;
-- 
1.7.0.4
