From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 15/17] ASoC: tegra: add tegra30-i2s driver
Date: Fri, 30 Mar 2012 17:07:30 -0600
Message-ID: <1333148852-17806-16-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This provides an ASoC DAI interface for Tegra 30's I2S controller.

Includes a squashed bugfix from Sumit Bhattacharya <sumitb-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 .../devicetree/bindings/sound/tegra30-i2s.txt      |   12 +
 sound/soc/tegra/tegra30_i2s.c                      |  538 ++++++++++++++++++++
 sound/soc/tegra/tegra30_i2s.h                      |  242 +++++++++
 3 files changed, 792 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/tegra30-i2s.txt
 create mode 100644 sound/soc/tegra/tegra30_i2s.c
 create mode 100644 sound/soc/tegra/tegra30_i2s.h

diff --git a/Documentation/devicetree/bindings/sound/tegra30-i2s.txt b/Documentation/devicetree/bindings/sound/tegra30-i2s.txt
new file mode 100644
index 0000000..ee0aa8f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tegra30-i2s.txt
@@ -0,0 +1,12 @@
+NVIDIA Tegra30 I2S controller
+
+Required properties:
+- compatible : "nvidia,tegra30-i2s"
+- reg : Should contain I2S registers location and length
+
+Example:
+
+i2s@70002800 {
+	compatible = "nvidia,tegra30-i2s";
+	reg = <0x70080300 0x100>;
+};
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
new file mode 100644
index 0000000..b8f51c3
--- /dev/null
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -0,0 +1,538 @@
+/*
+ * tegra30_i2s.c - Tegra30 I2S driver
+ *
+ * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ * Copyright (c) 2010-2012, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * Based on code copyright/by:
+ *
+ * Copyright (c) 2009-2010, NVIDIA Corporation.
+ * Scott Peterson <speterson-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
+ *
+ * Copyright (C) 2010 Google, Inc.
+ * Iliyan Malchev <malchev-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/platform_device.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <mach/iomap.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "tegra30_ahub.h"
+#include "tegra30_i2s.h"
+
+#define DRV_NAME "tegra30-i2s"
+
+static inline void tegra30_i2s_write(struct tegra30_i2s *i2s, u32 reg, u32 val)
+{
+	__raw_writel(val, i2s->regs + reg);
+}
+
+static inline u32 tegra30_i2s_read(struct tegra30_i2s *i2s, u32 reg)
+{
+	return __raw_readl(i2s->regs + reg);
+}
+
+static void tegra30_i2s_enable_clocks(struct tegra30_i2s *i2s)
+{
+	tegra30_ahub_enable_clocks();
+	clk_enable(i2s->clk_i2s);
+}
+
+static void tegra30_i2s_disable_clocks(struct tegra30_i2s *i2s)
+{
+	clk_disable(i2s->clk_i2s);
+	tegra30_ahub_disable_clocks();
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int tegra30_i2s_show(struct seq_file *s, void *unused)
+{
+#define REG(r) { r, #r }
+	static const struct {
+		int offset;
+		const char *name;
+	} regs[] = {
+		REG(TEGRA30_I2S_CTRL),
+		REG(TEGRA30_I2S_TIMING),
+		REG(TEGRA30_I2S_OFFSET),
+		REG(TEGRA30_I2S_CH_CTRL),
+		REG(TEGRA30_I2S_SLOT_CTRL),
+		REG(TEGRA30_I2S_CIF_TX_CTRL),
+		REG(TEGRA30_I2S_CIF_RX_CTRL),
+		REG(TEGRA30_I2S_FLOWCTL),
+		REG(TEGRA30_I2S_TX_STEP),
+		REG(TEGRA30_I2S_FLOW_STATUS),
+		REG(TEGRA30_I2S_FLOW_TOTAL),
+		REG(TEGRA30_I2S_FLOW_OVER),
+		REG(TEGRA30_I2S_FLOW_UNDER),
+		REG(TEGRA30_I2S_LCOEF_1_4_0),
+		REG(TEGRA30_I2S_LCOEF_1_4_1),
+		REG(TEGRA30_I2S_LCOEF_1_4_2),
+		REG(TEGRA30_I2S_LCOEF_1_4_3),
+		REG(TEGRA30_I2S_LCOEF_1_4_4),
+		REG(TEGRA30_I2S_LCOEF_1_4_5),
+		REG(TEGRA30_I2S_LCOEF_2_4_0),
+		REG(TEGRA30_I2S_LCOEF_2_4_1),
+		REG(TEGRA30_I2S_LCOEF_2_4_2),
+	};
+#undef REG
+
+	struct tegra30_i2s *i2s = s->private;
+	int i;
+
+	tegra30_i2s_enable_clocks(i2s);
+
+	for (i = 0; i < ARRAY_SIZE(regs); i++) {
+		u32 val = tegra30_i2s_read(i2s, regs[i].offset);
+		seq_printf(s, "%s = %08x\n", regs[i].name, val);
+	}
+
+	tegra30_i2s_disable_clocks(i2s);
+
+	return 0;
+}
+
+static int tegra30_i2s_debug_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, tegra30_i2s_show, inode->i_private);
+}
+
+static const struct file_operations tegra30_i2s_debug_fops = {
+	.open    = tegra30_i2s_debug_open,
+	.read    = seq_read,
+	.llseek  = seq_lseek,
+	.release = single_release,
+};
+
+static void tegra30_i2s_debug_add(struct tegra30_i2s *i2s)
+{
+	i2s->debug = debugfs_create_file(i2s->dai.name, S_IRUGO,
+					 snd_soc_debugfs_root, i2s,
+					 &tegra30_i2s_debug_fops);
+}
+
+static void tegra30_i2s_debug_remove(struct tegra30_i2s *i2s)
+{
+	if (i2s->debug)
+		debugfs_remove(i2s->debug);
+}
+#else
+static inline void tegra30_i2s_debug_add(struct tegra30_i2s *i2s, int id)
+{
+}
+
+static inline void tegra30_i2s_debug_remove(struct tegra30_i2s *i2s)
+{
+}
+#endif
+
+int tegra30_i2s_startup(struct snd_pcm_substream *substream,
+			struct snd_soc_dai *dai)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	tegra30_i2s_enable_clocks(i2s);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = tegra30_ahub_allocate_tx_fifo(&i2s->txcif,
+					&i2s->playback_dma_data.addr,
+					&i2s->playback_dma_data.req_sel);
+		i2s->playback_dma_data.wrap = 4;
+		i2s->playback_dma_data.width = 32;
+		tegra30_ahub_set_rx_cif_source(
+				TEGRA30_AHUB_RXCIF_I2S0_RX0 + i2s->cif_id,
+				i2s->txcif);
+	} else {
+		ret = tegra30_ahub_allocate_rx_fifo(&i2s->rxcif,
+					&i2s->capture_dma_data.addr,
+					&i2s->capture_dma_data.req_sel);
+		i2s->capture_dma_data.wrap = 4;
+		i2s->capture_dma_data.width = 32;
+		tegra30_ahub_set_rx_cif_source(i2s->rxcif,
+				TEGRA30_AHUB_TXCIF_I2S0_TX0 + i2s->cif_id);
+	}
+
+	tegra30_i2s_disable_clocks(i2s);
+
+	return ret;
+}
+
+void tegra30_i2s_shutdown(struct snd_pcm_substream *substream,
+			struct snd_soc_dai *dai)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	tegra30_i2s_enable_clocks(i2s);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		tegra30_ahub_unset_rx_cif_source(
+				TEGRA30_AHUB_RXCIF_I2S0_RX0 + i2s->cif_id);
+		tegra30_ahub_free_tx_fifo(i2s->txcif);
+	} else {
+		tegra30_ahub_unset_rx_cif_source(i2s->rxcif);
+		tegra30_ahub_free_rx_fifo(i2s->rxcif);
+	}
+
+	tegra30_i2s_disable_clocks(i2s);
+}
+
+static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
+				unsigned int fmt)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_MASTER_ENABLE;
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	i2s->reg_ctrl &= ~(TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
+			   TEGRA30_I2S_CTRL_LRCK_MASK);
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_DSP_A:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
+		break;
+	case SND_SOC_DAIFMT_I2S:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK;
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct device *dev = substream->pcm->card->dev;
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 val;
+	int ret, sample_size, srate, i2sclock, bitcnt;
+
+	if (params_channels(params) != 2)
+		return -EINVAL;
+
+	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_BIT_SIZE_MASK;
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		i2s->reg_ctrl |= TEGRA30_I2S_CTRL_BIT_SIZE_16;
+		sample_size = 16;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	srate = params_rate(params);
+
+	/* Final "* 2" required by Tegra hardware */
+	i2sclock = srate * params_channels(params) * sample_size * 2;
+
+	bitcnt = (i2sclock / (2 * srate)) - 1;
+	if (bitcnt < 0 || bitcnt > TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US)
+		return -EINVAL;
+
+	ret = clk_set_rate(i2s->clk_i2s, i2sclock);
+	if (ret) {
+		dev_err(dev, "Can't set I2S clock rate: %d\n", ret);
+		return ret;
+	}
+
+	tegra30_i2s_enable_clocks(i2s);
+
+	val = bitcnt << TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT;
+
+	if (i2sclock % (2 * srate))
+		val |= TEGRA30_I2S_TIMING_NON_SYM_ENABLE;
+
+	tegra30_i2s_write(i2s, TEGRA30_I2S_TIMING, val);
+
+	val = (0 << TEGRA30_AUDIOCIF_CTRL_FIFO_THRESHOLD_SHIFT) |
+	      (1 << TEGRA30_AUDIOCIF_CTRL_AUDIO_CHANNELS_SHIFT) |
+	      (1 << TEGRA30_AUDIOCIF_CTRL_CLIENT_CHANNELS_SHIFT) |
+	      TEGRA30_AUDIOCIF_CTRL_AUDIO_BITS_16 |
+	      TEGRA30_AUDIOCIF_CTRL_CLIENT_BITS_16;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_RX;
+		tegra30_i2s_write(i2s, TEGRA30_I2S_CIF_RX_CTRL, val);
+	} else {
+		val |= TEGRA30_AUDIOCIF_CTRL_DIRECTION_TX;
+		tegra30_i2s_write(i2s, TEGRA30_I2S_CIF_TX_CTRL, val);
+	}
+
+	val = (1 << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT) |
+	      (1 << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT);
+	tegra30_i2s_write(i2s, TEGRA30_I2S_OFFSET, val);
+
+	tegra30_i2s_disable_clocks(i2s);
+
+	return 0;
+}
+
+static void tegra30_i2s_start_playback(struct tegra30_i2s *i2s)
+{
+	tegra30_ahub_enable_tx_fifo(i2s->txcif);
+	i2s->reg_ctrl |= TEGRA30_I2S_CTRL_XFER_EN_TX;
+	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+}
+
+static void tegra30_i2s_stop_playback(struct tegra30_i2s *i2s)
+{
+	tegra30_ahub_disable_tx_fifo(i2s->txcif);
+	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_XFER_EN_TX;
+	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+}
+
+static void tegra30_i2s_start_capture(struct tegra30_i2s *i2s)
+{
+	tegra30_ahub_enable_rx_fifo(i2s->rxcif);
+	i2s->reg_ctrl |= TEGRA30_I2S_CTRL_XFER_EN_RX;
+	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+}
+
+static void tegra30_i2s_stop_capture(struct tegra30_i2s *i2s)
+{
+	tegra30_ahub_disable_rx_fifo(i2s->rxcif);
+	i2s->reg_ctrl &= ~TEGRA30_I2S_CTRL_XFER_EN_RX;
+	tegra30_i2s_write(i2s, TEGRA30_I2S_CTRL, i2s->reg_ctrl);
+}
+
+static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		tegra30_i2s_enable_clocks(i2s);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			tegra30_i2s_start_playback(i2s);
+		else
+			tegra30_i2s_start_capture(i2s);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			tegra30_i2s_stop_playback(i2s);
+		else
+			tegra30_i2s_stop_capture(i2s);
+		tegra30_i2s_disable_clocks(i2s);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int tegra30_i2s_probe(struct snd_soc_dai *dai)
+{
+	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	dai->capture_dma_data = &i2s->capture_dma_data;
+	dai->playback_dma_data = &i2s->playback_dma_data;
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
+	.startup	= tegra30_i2s_startup,
+	.shutdown	= tegra30_i2s_shutdown,
+	.set_fmt	= tegra30_i2s_set_fmt,
+	.hw_params	= tegra30_i2s_hw_params,
+	.trigger	= tegra30_i2s_trigger,
+};
+
+static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
+	.probe = tegra30_i2s_probe,
+	.playback = {
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture = {
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.ops = &tegra30_i2s_dai_ops,
+	.symmetric_rates = 1,
+};
+
+static __devinit int tegra30_i2s_platform_probe(struct platform_device *pdev)
+{
+	struct tegra30_i2s *i2s;
+	struct resource *mem, *memregion;
+	int ret;
+
+	ret = tegra30_ahub_is_probed();
+	if (ret < 0)
+		return ret;
+
+	i2s = devm_kzalloc(&pdev->dev, sizeof(struct tegra30_i2s), GFP_KERNEL);
+	if (!i2s) {
+		dev_err(&pdev->dev, "Can't allocate tegra30_i2s\n");
+		ret = -ENOMEM;
+		goto err;
+	}
+	dev_set_drvdata(&pdev->dev, i2s);
+
+	i2s->dai = tegra30_i2s_dai_template;
+	i2s->dai.name = dev_name(&pdev->dev);
+
+	i2s->clk_i2s = clk_get(&pdev->dev, NULL);
+	if (IS_ERR(i2s->clk_i2s)) {
+		dev_err(&pdev->dev, "Can't retrieve i2s clock\n");
+		ret = PTR_ERR(i2s->clk_i2s);
+		goto err;
+	}
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem) {
+		dev_err(&pdev->dev, "No memory resource\n");
+		ret = -ENODEV;
+		goto err_clk_put;
+	}
+
+	/*
+	 * FIXME: This is gross. This should come from a DT property, but I'd
+	 * like to defer that until we have a better idea of how the AHUB and
+	 * its clients fit into ASoC's BE/FE split and codec support.
+	 *
+	 * Base addreses are 0x70080n00, where n is 3..7 for I2S 0..4.
+	 */
+	i2s->cif_id = ((mem->start & 0xf00) >> 8) - 3;
+
+	memregion = devm_request_mem_region(&pdev->dev, mem->start,
+					    resource_size(mem), DRV_NAME);
+	if (!memregion) {
+		dev_err(&pdev->dev, "Memory region already claimed\n");
+		ret = -EBUSY;
+		goto err_clk_put;
+	}
+
+	i2s->regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	if (!i2s->regs) {
+		dev_err(&pdev->dev, "ioremap failed\n");
+		ret = -ENOMEM;
+		goto err_clk_put;
+	}
+
+	ret = snd_soc_register_dai(&pdev->dev, &i2s->dai);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register DAI: %d\n", ret);
+		ret = -ENOMEM;
+		goto err_clk_put;
+	}
+
+	ret = tegra_pcm_platform_register(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
+		goto err_unregister_dai;
+	}
+
+	tegra30_i2s_debug_add(i2s);
+
+	return 0;
+
+err_unregister_dai:
+	snd_soc_unregister_dai(&pdev->dev);
+err_clk_put:
+	clk_put(i2s->clk_i2s);
+err:
+	return ret;
+}
+
+static int __devexit tegra30_i2s_platform_remove(struct platform_device *pdev)
+{
+	struct tegra30_i2s *i2s = dev_get_drvdata(&pdev->dev);
+
+	tegra_pcm_platform_unregister(&pdev->dev);
+	snd_soc_unregister_dai(&pdev->dev);
+
+	tegra30_i2s_debug_remove(i2s);
+
+	clk_put(i2s->clk_i2s);
+
+	return 0;
+}
+
+static const struct of_device_id tegra30_i2s_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra30-i2s", },
+	{},
+};
+
+static struct platform_driver tegra30_i2s_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = tegra30_i2s_of_match,
+	},
+	.probe = tegra30_i2s_platform_probe,
+	.remove = __devexit_p(tegra30_i2s_platform_remove),
+};
+module_platform_driver(tegra30_i2s_driver);
+
+MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
+MODULE_DESCRIPTION("Tegra30 I2S ASoC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra30_i2s_of_match);
diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
new file mode 100644
index 0000000..193e081
--- /dev/null
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -0,0 +1,242 @@
+/*
+ * tegra30_i2s.h - Definitions for Tegra30 I2S driver
+ *
+ * Copyright (c) 2011,2012, NVIDIA CORPORATION.  All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef __TEGRA30_I2S_H__
+#define __TEGRA30_I2S_H__
+
+#include "tegra_pcm.h"
+
+/* Register offsets from TEGRA30_I2S*_BASE */
+
+#define TEGRA30_I2S_CTRL				0x0
+#define TEGRA30_I2S_TIMING				0x4
+#define TEGRA30_I2S_OFFSET				0x08
+#define TEGRA30_I2S_CH_CTRL				0x0c
+#define TEGRA30_I2S_SLOT_CTRL				0x10
+#define TEGRA30_I2S_CIF_RX_CTRL				0x14
+#define TEGRA30_I2S_CIF_TX_CTRL				0x18
+#define TEGRA30_I2S_FLOWCTL				0x1c
+#define TEGRA30_I2S_TX_STEP				0x20
+#define TEGRA30_I2S_FLOW_STATUS				0x24
+#define TEGRA30_I2S_FLOW_TOTAL				0x28
+#define TEGRA30_I2S_FLOW_OVER				0x2c
+#define TEGRA30_I2S_FLOW_UNDER				0x30
+#define TEGRA30_I2S_LCOEF_1_4_0				0x34
+#define TEGRA30_I2S_LCOEF_1_4_1				0x38
+#define TEGRA30_I2S_LCOEF_1_4_2				0x3c
+#define TEGRA30_I2S_LCOEF_1_4_3				0x40
+#define TEGRA30_I2S_LCOEF_1_4_4				0x44
+#define TEGRA30_I2S_LCOEF_1_4_5				0x48
+#define TEGRA30_I2S_LCOEF_2_4_0				0x4c
+#define TEGRA30_I2S_LCOEF_2_4_1				0x50
+#define TEGRA30_I2S_LCOEF_2_4_2				0x54
+
+/* Fields in TEGRA30_I2S_CTRL */
+
+#define TEGRA30_I2S_CTRL_XFER_EN_TX			(1 << 31)
+#define TEGRA30_I2S_CTRL_XFER_EN_RX			(1 << 30)
+#define TEGRA30_I2S_CTRL_CG_EN				(1 << 29)
+#define TEGRA30_I2S_CTRL_SOFT_RESET			(1 << 28)
+#define TEGRA30_I2S_CTRL_TX_FLOWCTL_EN			(1 << 27)
+
+#define TEGRA30_I2S_CTRL_OBS_SEL_SHIFT			24
+#define TEGRA30_I2S_CTRL_OBS_SEL_MASK			(7 << TEGRA30_I2S_CTRL_OBS_SEL_SHIFT)
+
+#define TEGRA30_I2S_FRAME_FORMAT_LRCK			0
+#define TEGRA30_I2S_FRAME_FORMAT_FSYNC			1
+
+#define TEGRA30_I2S_CTRL_FRAME_FORMAT_SHIFT		12
+#define TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK		(7                              << TEGRA30_I2S_CTRL_FRAME_FORMAT_SHIFT)
+#define TEGRA30_I2S_CTRL_FRAME_FORMAT_LRCK		(TEGRA30_I2S_FRAME_FORMAT_LRCK  << TEGRA30_I2S_CTRL_FRAME_FORMAT_SHIFT)
+#define TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC		(TEGRA30_I2S_FRAME_FORMAT_FSYNC << TEGRA30_I2S_CTRL_FRAME_FORMAT_SHIFT)
+
+#define TEGRA30_I2S_CTRL_MASTER_ENABLE			(1 << 10)
+
+#define TEGRA30_I2S_LRCK_LEFT_LOW			0
+#define TEGRA30_I2S_LRCK_RIGHT_LOW			1
+
+#define TEGRA30_I2S_CTRL_LRCK_SHIFT			9
+#define TEGRA30_I2S_CTRL_LRCK_MASK			(1                          << TEGRA30_I2S_CTRL_LRCK_SHIFT)
+#define TEGRA30_I2S_CTRL_LRCK_L_LOW			(TEGRA30_I2S_LRCK_LEFT_LOW  << TEGRA30_I2S_CTRL_LRCK_SHIFT)
+#define TEGRA30_I2S_CTRL_LRCK_R_LOW			(TEGRA30_I2S_LRCK_RIGHT_LOW << TEGRA30_I2S_CTRL_LRCK_SHIFT)
+
+#define TEGRA30_I2S_CTRL_LPBK_ENABLE			(1 << 8)
+
+#define TEGRA30_I2S_BIT_CODE_LINEAR			0
+#define TEGRA30_I2S_BIT_CODE_ULAW			1
+#define TEGRA30_I2S_BIT_CODE_ALAW			2
+
+#define TEGRA30_I2S_CTRL_BIT_CODE_SHIFT			4
+#define TEGRA30_I2S_CTRL_BIT_CODE_MASK			(3                           << TEGRA30_I2S_CTRL_BIT_CODE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_CODE_LINEAR		(TEGRA30_I2S_BIT_CODE_LINEAR << TEGRA30_I2S_CTRL_BIT_CODE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_CODE_ULAW			(TEGRA30_I2S_BIT_CODE_ULAW   << TEGRA30_I2S_CTRL_BIT_CODE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_CODE_ALAW			(TEGRA30_I2S_BIT_CODE_ALAW   << TEGRA30_I2S_CTRL_BIT_CODE_SHIFT)
+
+#define TEGRA30_I2S_BITS_8				1
+#define TEGRA30_I2S_BITS_12				2
+#define TEGRA30_I2S_BITS_16				3
+#define TEGRA30_I2S_BITS_20				4
+#define TEGRA30_I2S_BITS_24				5
+#define TEGRA30_I2S_BITS_28				6
+#define TEGRA30_I2S_BITS_32				7
+
+/* Sample container size; see {RX,TX}_MASK field in CH_CTRL below */
+#define TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT			0
+#define TEGRA30_I2S_CTRL_BIT_SIZE_MASK			(7                   << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_8			(TEGRA30_I2S_BITS_8  << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_12			(TEGRA30_I2S_BITS_12 << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_16			(TEGRA30_I2S_BITS_16 << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_20			(TEGRA30_I2S_BITS_20 << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_24			(TEGRA30_I2S_BITS_24 << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_28			(TEGRA30_I2S_BITS_28 << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+#define TEGRA30_I2S_CTRL_BIT_SIZE_32			(TEGRA30_I2S_BITS_32 << TEGRA30_I2S_CTRL_BIT_SIZE_SHIFT)
+
+/* Fields in TEGRA30_I2S_TIMING */
+
+#define TEGRA30_I2S_TIMING_NON_SYM_ENABLE		(1 << 12)
+#define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT	0
+#define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US	0x7fff
+#define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK	(TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US << TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT)
+
+/* Fields in TEGRA30_I2S_OFFSET */
+
+#define TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT		16
+#define TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_MASK_US	0x7ff
+#define TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_MASK		(TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_MASK_US << TEGRA30_I2S_OFFSET_RX_DATA_OFFSET_SHIFT)
+#define TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT		0
+#define TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_MASK_US	0x7ff
+#define TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_MASK		(TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_MASK_US << TEGRA30_I2S_OFFSET_TX_DATA_OFFSET_SHIFT)
+
+/* Fields in TEGRA30_I2S_CH_CTRL */
+
+/* (FSYNC width - 1) in bit clocks */
+#define TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT		24
+#define TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK_US		0xff
+#define TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK		(TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK_US << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT)
+
+#define TEGRA30_I2S_HIGHZ_NO				0
+#define TEGRA30_I2S_HIGHZ_YES				1
+#define TEGRA30_I2S_HIGHZ_ON_HALF_BIT_CLK		2
+
+#define TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_SHIFT		12
+#define TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_MASK		(3                                 << TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_NO		(TEGRA30_I2S_HIGHZ_NO              << TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_YES		(TEGRA30_I2S_HIGHZ_YES             << TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_ON_HALF_BIT_CLK	(TEGRA30_I2S_HIGHZ_ON_HALF_BIT_CLK << TEGRA30_I2S_CH_CTRL_HIGHZ_CTRL_SHIFT)
+
+#define TEGRA30_I2S_MSB_FIRST				0
+#define TEGRA30_I2S_LSB_FIRST				1
+
+#define TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_SHIFT		10
+#define TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_MASK		(1                     << TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_MSB_FIRST	(TEGRA30_I2S_MSB_FIRST << TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_LSB_FIRST	(TEGRA30_I2S_LSB_FIRST << TEGRA30_I2S_CH_CTRL_RX_BIT_ORDER_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_SHIFT		9
+#define TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_MASK		(1                     << TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_MSB_FIRST	(TEGRA30_I2S_MSB_FIRST << TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_LSB_FIRST	(TEGRA30_I2S_LSB_FIRST << TEGRA30_I2S_CH_CTRL_TX_BIT_ORDER_SHIFT)
+
+#define TEGRA30_I2S_POS_EDGE				0
+#define TEGRA30_I2S_NEG_EDGE				1
+
+#define TEGRA30_I2S_CH_CTRL_EGDE_CTRL_SHIFT		8
+#define TEGRA30_I2S_CH_CTRL_EGDE_CTRL_MASK		(1                    << TEGRA30_I2S_CH_CTRL_EGDE_CTRL_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_EGDE_CTRL_POS_EDGE		(TEGRA30_I2S_POS_EDGE << TEGRA30_I2S_CH_CTRL_EGDE_CTRL_SHIFT)
+#define TEGRA30_I2S_CH_CTRL_EGDE_CTRL_NEG_EDGE		(TEGRA30_I2S_NEG_EDGE << TEGRA30_I2S_CH_CTRL_EGDE_CTRL_SHIFT)
+
+/* Sample size is # bits from BIT_SIZE minus this field */
+#define TEGRA30_I2S_CH_CTRL_RX_MASK_BITS_SHIFT		4
+#define TEGRA30_I2S_CH_CTRL_RX_MASK_BITS_MASK_US	7
+#define TEGRA30_I2S_CH_CTRL_RX_MASK_BITS_MASK		(TEGRA30_I2S_CH_CTRL_RX_MASK_BITS_MASK_US << TEGRA30_I2S_CH_CTRL_RX_MASK_BITS_SHIFT)
+
+#define TEGRA30_I2S_CH_CTRL_TX_MASK_BITS_SHIFT		0
+#define TEGRA30_I2S_CH_CTRL_TX_MASK_BITS_MASK_US	7
+#define TEGRA30_I2S_CH_CTRL_TX_MASK_BITS_MASK		(TEGRA30_I2S_CH_CTRL_TX_MASK_BITS_MASK_US << TEGRA30_I2S_CH_CTRL_TX_MASK_BITS_SHIFT)
+
+/* Fields in TEGRA30_I2S_SLOT_CTRL */
+
+/* Number of slots in frame, minus 1 */
+#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT		16
+#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK_US	7
+#define TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK		(TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_MASK_US << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOT_SHIFT)
+
+/* TDM mode slot enable bitmask */
+#define TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT	8
+#define TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK	(0xff << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT)
+
+#define TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT	0
+#define TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_MASK	(0xff << TEGRA30_I2S_SLOT_CTRL_TX_SLOT_ENABLES_SHIFT)
+
+/* Fields in TEGRA30_I2S_CIF_RX_CTRL */
+/* Uses field from TEGRA30_AUDIOCIF_CTRL_* in tegra30_ahub.h */
+
+/* Fields in TEGRA30_I2S_CIF_TX_CTRL */
+/* Uses field from TEGRA30_AUDIOCIF_CTRL_* in tegra30_ahub.h */
+
+/* Fields in TEGRA30_I2S_FLOWCTL */
+
+#define TEGRA30_I2S_FILTER_LINEAR			0
+#define TEGRA30_I2S_FILTER_QUAD				1
+
+#define TEGRA30_I2S_FLOWCTL_FILTER_SHIFT		31
+#define TEGRA30_I2S_FLOWCTL_FILTER_MASK			(1                         << TEGRA30_I2S_FLOWCTL_FILTER_SHIFT)
+#define TEGRA30_I2S_FLOWCTL_FILTER_LINEAR		(TEGRA30_I2S_FILTER_LINEAR << TEGRA30_I2S_FLOWCTL_FILTER_SHIFT)
+#define TEGRA30_I2S_FLOWCTL_FILTER_QUAD			(TEGRA30_I2S_FILTER_QUAD   << TEGRA30_I2S_FLOWCTL_FILTER_SHIFT)
+
+/* Fields in TEGRA30_I2S_TX_STEP */
+
+#define TEGRA30_I2S_TX_STEP_SHIFT			0
+#define TEGRA30_I2S_TX_STEP_MASK_US			0xffff
+#define TEGRA30_I2S_TX_STEP_MASK			(TEGRA30_I2S_TX_STEP_MASK_US << TEGRA30_I2S_TX_STEP_SHIFT)
+
+/* Fields in TEGRA30_I2S_FLOW_STATUS */
+
+#define TEGRA30_I2S_FLOW_STATUS_UNDERFLOW		(1 << 31)
+#define TEGRA30_I2S_FLOW_STATUS_OVERFLOW		(1 << 30)
+#define TEGRA30_I2S_FLOW_STATUS_MONITOR_INT_EN		(1 << 4)
+#define TEGRA30_I2S_FLOW_STATUS_COUNTER_CLR		(1 << 3)
+#define TEGRA30_I2S_FLOW_STATUS_MONITOR_CLR		(1 << 2)
+#define TEGRA30_I2S_FLOW_STATUS_COUNTER_EN		(1 << 1)
+#define TEGRA30_I2S_FLOW_STATUS_MONITOR_EN		(1 << 0)
+
+/*
+ * There are no fields in TEGRA30_I2S_FLOW_TOTAL, TEGRA30_I2S_FLOW_OVER,
+ * TEGRA30_I2S_FLOW_UNDER; they are counters taking the whole register.
+ */
+
+/* Fields in TEGRA30_I2S_LCOEF_* */
+
+#define TEGRA30_I2S_LCOEF_COEF_SHIFT			0
+#define TEGRA30_I2S_LCOEF_COEF_MASK_US			0xffff
+#define TEGRA30_I2S_LCOEF_COEF_MASK			(TEGRA30_I2S_LCOEF_COEF_MASK_US << TEGRA30_I2S_LCOEF_COEF_SHIFT)
+
+struct tegra30_i2s {
+	struct snd_soc_dai_driver dai;
+	int cif_id;
+	struct clk *clk_i2s;
+	int clk_refs;
+	enum tegra30_ahub_rxcif rxcif;
+	struct tegra_pcm_dma_params capture_dma_data;
+	enum tegra30_ahub_txcif txcif;
+	struct tegra_pcm_dma_params playback_dma_data;
+	void __iomem *regs;
+	struct dentry *debug;
+	u32 reg_ctrl;
+};
+
+#endif
-- 
1.7.0.4
