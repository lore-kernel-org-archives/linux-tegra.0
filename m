From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [PATCH v3] ASoC: tegra: TrimSlice machine support
Date: Tue, 26 Apr 2011 11:52:42 +0300
Message-ID: <1303807962-14833-1-git-send-email-mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
v3 changes:
* s/SND_TEGRA_SOC/SND_SOC_TEGRA
* drop 'default' setting in Kconfig

v2 changes:
* address Stephen and Mark comments
* rebase against Mark's for-next branch
* switch to data based specification of widgets and routes
* explicitly disable unused codec pins

 sound/soc/tegra/Kconfig     |    8 ++
 sound/soc/tegra/Makefile    |    2 +
 sound/soc/tegra/trimslice.c |  228 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+), 0 deletions(-)
 create mode 100644 sound/soc/tegra/trimslice.c

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 14f7119..1e75da3 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -26,3 +26,11 @@ config SND_SOC_TEGRA_WM8903
 	  boards using the WM8093 codec. Currently, the supported boards are
 	  Harmony, Ventana, Seaboard, Kaen, and Aebl.
 
+config SND_SOC_TEGRA_TRIMSLICE
+	tristate "SoC Audio support for TrimSlice board"
+	depends on SND_SOC_TEGRA && MACH_TRIMSLICE && I2C
+	select SND_SOC_TEGRA_I2S
+	select SND_SOC_TLV320AIC23
+	help
+	  Say Y or M here if you want to add support for SoC audio on the
+	  TrimSlice platform.
diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index 13bef8d..fa6574d 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -11,5 +11,7 @@ obj-$(CONFIG_SND_SOC_TEGRA_I2S) += snd-soc-tegra-i2s.o
 
 # Tegra machine Support
 snd-soc-tegra-wm8903-objs := tegra_wm8903.o
+snd-soc-tegra-trimslice-objs := trimslice.o
 
 obj-$(CONFIG_SND_SOC_TEGRA_WM8903) += snd-soc-tegra-wm8903.o
+obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
new file mode 100644
index 0000000..8fc07e9
--- /dev/null
+++ b/sound/soc/tegra/trimslice.c
@@ -0,0 +1,228 @@
+/*
+ * trimslice.c - TrimSlice machine ASoC driver
+ *
+ * Copyright (C) 2011 - CompuLab, Ltd.
+ * Author: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
+ *
+ * Based on code copyright/by:
+ * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
+	int srate, mclk;
+	int err;
+
+	srate = params_rate(params);
+	mclk = 128 * srate;
+
+	err = tegra_asoc_utils_set_rate(&trimslice->util_data, srate, mclk);
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
+	err = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+					SND_SOC_CLOCK_IN);
+	if (err < 0) {
+		dev_err(card->dev, "codec_dai clock not set\n");
+		return err;
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
+	SND_SOC_DAPM_HP("Line Out", NULL),
+	SND_SOC_DAPM_LINE("Line In", NULL),
+};
+
+static const struct snd_soc_dapm_route trimslice_audio_map[] = {
+	{"Line Out", NULL, "LOUT"},
+	{"Line Out", NULL, "ROUT"},
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
+	snd_soc_dapm_nc_pin(dapm, "LHPOUT");
+	snd_soc_dapm_nc_pin(dapm, "RHPOUT");
+	snd_soc_dapm_nc_pin(dapm, "MICIN");
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
+
+	.dapm_widgets = trimslice_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
+	.dapm_routes = trimslice_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
+};
+
+static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &snd_soc_trimslice;
+	struct tegra_trimslice *trimslice;
+	int ret;
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
+		goto err_fini_utils;
+	}
+
+	return 0;
+
+err_fini_utils:
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
+MODULE_AUTHOR("Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>");
+MODULE_DESCRIPTION("Trimslice machine ASoC driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
1.7.3.1
