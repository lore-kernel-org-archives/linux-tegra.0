From: Mike Rapoport <mike@compulab.co.il>
Subject: [PATCH] ASoC: tegra: TrimSlice machine support
Date: Sun, 17 Apr 2011 15:39:48 +0300
Message-ID: <1303043988-21933-1-git-send-email-mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Mike Rapoport <mike@compulab.co.il>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike@compulab.co.il>
---
The patch is currently agains Linus' tree. Once everybody os Ok with it I'll rebase it on top of asoc or linux-next tree.


 sound/soc/tegra/Kconfig     |    9 ++
 sound/soc/tegra/Makefile    |    2 +
 sound/soc/tegra/trimslice.c |  253 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 264 insertions(+), 0 deletions(-)
 create mode 100644 sound/soc/tegra/trimslice.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 66b504f..5935814 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -24,3 +24,12 @@ config SND_TEGRA_SOC_HARMONY
 	  Say Y or M here if you want to add support for SoC audio on the
 	  Tegra Harmony reference board.
 
+config SND_TEGRA_SOC_TRIMSLICE
+	tristate "SoC Audio support for TrimSlice board"
+	depends on SND_TEGRA_SOC && MACH_TRIMSLICE && I2C
+	default m
+	select SND_TEGRA_SOC_I2S
+	select SND_SOC_TLV320AIC23
+	help
+	  Say Y or M here if you want to add support for SoC audio on the
+	  TrimSlice platform.
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index fd183d3..784b5e8 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -11,5 +11,7 @@ obj-$(CONFIG_SND_TEGRA_SOC_I2S) += snd-soc-tegra-i2s.o
 
 # Tegra machine Support
 snd-soc-tegra-harmony-objs := harmony.o
+snd-soc-tegra-trimslice-objs := trimslice.o
 
 obj-$(CONFIG_SND_TEGRA_SOC_HARMONY) += snd-soc-tegra-harmony.o
+obj-$(CONFIG_SND_TEGRA_SOC_TRIMSLICE) += snd-soc-tegra-trimslice.o
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
new file mode 100644
index 0000000..f1af4a4
--- /dev/null
+++ b/sound/soc/tegra/trimslice.c
@@ -0,0 +1,253 @@
+/*
+ * trimslice.c - TrimSlice machine ASoC driver
+ *
+ * Copyright (C) 2011 - CompuLab, Ltd.
+ * Author: Mike Rapoport <mike@compulab.co.il>
+ *
+ * Based on code copyright/by:
+ * Author: Stephen Warren <swarren@nvidia.com>
+ * Copyright (C) 2010-2011 - NVIDIA, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but
+ * WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
+ * 02110-1301 USA
+ *
+ */
+
+#include <asm/mach-types.h>
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "../codecs/tlv320aic23.h"
+
+#include "tegra_das.h"
+#include "tegra_i2s.h"
+#include "tegra_pcm.h"
+#include "tegra_asoc_utils.h"
+
+#define DRV_NAME "tegra-snd-trimslice"
+
+struct tegra_trimslice {
+	struct tegra_asoc_utils_data util_data;
+};
+
+static int trimslice_asoc_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_card *card = codec->card;
+	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
+	int srate, mclk, mclk_change;
+	int err;
+
+	srate = params_rate(params);
+	switch (srate) {
+	case 64000:
+	case 88200:
+	case 96000:
+		mclk = 128 * srate;
+		break;
+	default:
+		mclk = 256 * srate;
+		break;
+	}
+	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
+	while (mclk < 6000000)
+		mclk *= 2;
+
+	err = tegra_asoc_utils_set_rate(&trimslice->util_data, srate, mclk,
+					&mclk_change);
+	if (err < 0) {
+		dev_err(card->dev, "Can't configure clocks\n");
+		return err;
+	}
+
+	err = snd_soc_dai_set_fmt(codec_dai,
+					SND_SOC_DAIFMT_I2S |
+					SND_SOC_DAIFMT_NB_NF |
+					SND_SOC_DAIFMT_CBS_CFS);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai fmt not set\n");
+		return err;
+	}
+
+	err = snd_soc_dai_set_fmt(cpu_dai,
+					SND_SOC_DAIFMT_I2S |
+					SND_SOC_DAIFMT_NB_NF |
+					SND_SOC_DAIFMT_CBS_CFS);
+	if (err < 0) {
+		dev_err(card->dev, "cpu_dai fmt not set\n");
+		return err;
+	}
+
+	if (mclk_change) {
+		err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+					     SND_SOC_CLOCK_IN);
+		if (err < 0) {
+			dev_err(card->dev, "codec_dai clock not set\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
+static struct snd_soc_ops trimslice_asoc_ops = {
+	.hw_params = trimslice_asoc_hw_params,
+};
+
+static const struct snd_soc_dapm_widget trimslice_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_LINE("Line In", NULL),
+};
+
+static const struct snd_soc_dapm_route trimslice_audio_map[] = {
+	{"Headphone Jack", NULL, "LOUT"},
+	{"Headphone Jack", NULL, "ROUT"},
+
+	{"LLINEIN", NULL, "Line In"},
+	{"RLINEIN", NULL, "Line In"},
+};
+
+static int trimslice_asoc_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_codec *codec = rtd->codec;
+	struct snd_soc_dapm_context *dapm = &codec->dapm;
+
+	snd_soc_dapm_new_controls(dapm, trimslice_dapm_widgets,
+					ARRAY_SIZE(trimslice_dapm_widgets));
+
+	snd_soc_dapm_add_routes(dapm, trimslice_audio_map,
+				ARRAY_SIZE(trimslice_audio_map));
+
+	snd_soc_dapm_sync(dapm);
+
+	return 0;
+}
+
+static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
+	.name = "TLV320AIC23",
+	.stream_name = "AIC23",
+	.codec_name = "tlv320aic23-codec.2-001a",
+	.platform_name = "tegra-pcm-audio",
+	.cpu_dai_name = "tegra-i2s.0",
+	.codec_dai_name = "tlv320aic23-hifi",
+	.init = trimslice_asoc_init,
+	.ops = &trimslice_asoc_ops,
+};
+
+static struct snd_soc_card snd_soc_trimslice = {
+	.name = "tegra-trimslice",
+	.dai_link = &trimslice_tlv320aic23_dai,
+	.num_links = 1,
+};
+
+static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &snd_soc_trimslice;
+	struct tegra_trimslice *trimslice;
+	int ret;
+
+	if (!machine_is_trimslice()) {
+		dev_err(&pdev->dev, "Not running on Trimslice!\n");
+		return -ENODEV;
+	}
+
+	trimslice = kzalloc(sizeof(struct tegra_trimslice), GFP_KERNEL);
+	if (!trimslice) {
+		dev_err(&pdev->dev, "Can't allocate tegra_trimslice\n");
+		return -ENOMEM;
+	}
+
+	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
+	if (ret)
+		goto err_free_trimslice;
+
+	card->dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, trimslice);
+
+	ret = snd_soc_register_card(card);
+	if (ret) {
+		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+			ret);
+		goto err_clear_drvdata;
+	}
+
+	return 0;
+
+err_clear_drvdata:
+	snd_soc_card_set_drvdata(card, NULL);
+	platform_set_drvdata(pdev, NULL);
+	card->dev = NULL;
+	tegra_asoc_utils_fini(&trimslice->util_data);
+err_free_trimslice:
+	kfree(trimslice);
+	return ret;
+}
+
+static int __devexit tegra_snd_trimslice_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct tegra_trimslice *trimslice = snd_soc_card_get_drvdata(card);
+
+	snd_soc_unregister_card(card);
+
+	snd_soc_card_set_drvdata(card, NULL);
+	platform_set_drvdata(pdev, NULL);
+	card->dev = NULL;
+
+	tegra_asoc_utils_fini(&trimslice->util_data);
+
+	kfree(trimslice);
+
+	return 0;
+}
+
+static struct platform_driver tegra_snd_trimslice_driver = {
+	.driver = {
+		.name = DRV_NAME,
+		.owner = THIS_MODULE,
+	},
+	.probe = tegra_snd_trimslice_probe,
+	.remove = __devexit_p(tegra_snd_trimslice_remove),
+};
+
+static int __init snd_tegra_trimslice_init(void)
+{
+	return platform_driver_register(&tegra_snd_trimslice_driver);
+}
+module_init(snd_tegra_trimslice_init);
+
+static void __exit snd_tegra_trimslice_exit(void)
+{
+	platform_driver_unregister(&tegra_snd_trimslice_driver);
+}
+module_exit(snd_tegra_trimslice_exit);
+
+MODULE_AUTHOR("Mike Rapoport <mike@compulab.co.il>");
+MODULE_DESCRIPTION("Trimslice machine ASoC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
1.7.3.1
