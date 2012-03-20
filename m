From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/3] ASoC: tegra: register 'platform' from DAIs, get rid of pdev
Date: Tue, 20 Mar 2012 14:55:49 -0600
Message-ID: <1332276950-9398-2-git-send-email-swarren@wwwdotorg.org>
References: <1332276950-9398-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1332276950-9398-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Previously, the ASoC 'platform' (PCM/DMA) object was instantiated via a
platform_device. This didn't represent the hardware well, since there
was no separate hardware associated with this platform_device; it was a
virtual device with sole purpose to call snd_soc_register_platform().
This mechanism required all board files to register this device, and all
ASoC machine drivers to create and register this device when booting
using device tree.

This change removes the platform_device completely. Each Tegra DAI now
registers the ASoC 'platform' itself. Machine drivers are adjusted for
the new 'platform' name.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |   21 +++------------------
 sound/soc/tegra/tegra_i2s.c     |   11 ++++++++++-
 sound/soc/tegra/tegra_pcm.c     |   26 +++++++-------------------
 sound/soc/tegra/tegra_pcm.h     |    5 ++++-
 sound/soc/tegra/tegra_spdif.c   |   11 ++++++++++-
 sound/soc/tegra/tegra_wm8903.c  |   24 ++++++------------------
 sound/soc/tegra/trimslice.c     |    2 +-
 7 files changed, 41 insertions(+), 59 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 03ae095..396181c 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -2,6 +2,7 @@
  * tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
  *
  * Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
+ * Copyright (C) 2012 - NVIDIA, Inc.
  *
  * Authors:  Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
  *           Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>
@@ -39,7 +40,6 @@
 
 struct tegra_alc5632 {
 	struct tegra_asoc_utils_data util_data;
-	struct platform_device *pcm_dev;
 	int gpio_requested;
 	int gpio_hp_det;
 };
@@ -140,7 +140,6 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 static struct snd_soc_dai_link tegra_alc5632_dai = {
 	.name = "ALC5632",
 	.stream_name = "ALC5632 PCM",
-	.platform_name = "tegra-pcm-audio",
 	.codec_dai_name = "alc5632-hifi",
 	.init = tegra_alc5632_asoc_init,
 	.ops = &tegra_alc5632_asoc_ops,
@@ -179,8 +178,6 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, alc5632);
 
-	alc5632->pcm_dev = ERR_PTR(-EINVAL);
-
 	if (!(pdev->dev.of_node)) {
 		dev_err(&pdev->dev, "Must be instantiated using device tree\n");
 		ret = -EINVAL;
@@ -214,18 +211,11 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	alc5632->pcm_dev = platform_device_register_simple(
-		"tegra-pcm-audio", -1, NULL, 0);
-	if (IS_ERR(alc5632->pcm_dev)) {
-		dev_err(&pdev->dev,
-			"Can't instantiate tegra-pcm-audio\n");
-		ret = PTR_ERR(alc5632->pcm_dev);
-		goto err;
-	}
+	tegra_alc5632_dai.platform_of_node = tegra_alc5632_dai.cpu_dai_of_node;
 
 	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
 	if (ret)
-		goto err_unregister;
+		goto err;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
@@ -238,9 +228,6 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&alc5632->util_data);
-err_unregister:
-	if (!IS_ERR(alc5632->pcm_dev))
-		platform_device_unregister(alc5632->pcm_dev);
 err:
 	return ret;
 }
@@ -259,8 +246,6 @@ static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
-	if (!IS_ERR(machine->pcm_dev))
-		platform_device_unregister(machine->pcm_dev);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 33509de..546e29b 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -2,7 +2,7 @@
  * tegra_i2s.c - Tegra I2S driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * Based on code copyright/by:
  *
@@ -409,10 +409,18 @@ static __devinit int tegra_i2s_platform_probe(struct platform_device *pdev)
 		goto err_clk_put;
 	}
 
+	ret = tegra_pcm_platform_register(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
+		goto err_unregister_dai;
+	}
+
 	tegra_i2s_debug_add(i2s);
 
 	return 0;
 
+err_unregister_dai:
+	snd_soc_unregister_dai(&pdev->dev);
 err_clk_put:
 	clk_put(i2s->clk_i2s);
 err:
@@ -423,6 +431,7 @@ static int __devexit tegra_i2s_platform_remove(struct platform_device *pdev)
 {
 	struct tegra_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
+	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_dai(&pdev->dev);
 
 	tegra_i2s_debug_remove(i2s);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 8b44571..476b8ac 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -2,7 +2,7 @@
  * tegra_pcm.c - Tegra PCM driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * Based on code copyright/by:
  *
@@ -39,8 +39,6 @@
 
 #include "tegra_pcm.h"
 
-#define DRV_NAME "tegra-pcm-audio"
-
 static const struct snd_pcm_hardware tegra_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_MMAP |
 				  SNDRV_PCM_INFO_MMAP_VALID |
@@ -372,28 +370,18 @@ static struct snd_soc_platform_driver tegra_pcm_platform = {
 	.pcm_free	= tegra_pcm_free,
 };
 
-static int __devinit tegra_pcm_platform_probe(struct platform_device *pdev)
+int __devinit tegra_pcm_platform_register(struct device *dev)
 {
-	return snd_soc_register_platform(&pdev->dev, &tegra_pcm_platform);
+	return snd_soc_register_platform(dev, &tegra_pcm_platform);
 }
+EXPORT_SYMBOL_GPL(tegra_pcm_platform_register);
 
-static int __devexit tegra_pcm_platform_remove(struct platform_device *pdev)
+void __devexit tegra_pcm_platform_unregister(struct device *dev)
 {
-	snd_soc_unregister_platform(&pdev->dev);
-	return 0;
+	snd_soc_unregister_platform(dev);
 }
-
-static struct platform_driver tegra_pcm_driver = {
-	.driver = {
-		.name = DRV_NAME,
-		.owner = THIS_MODULE,
-	},
-	.probe = tegra_pcm_platform_probe,
-	.remove = __devexit_p(tegra_pcm_platform_remove),
-};
-module_platform_driver(tegra_pcm_driver);
+EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
 
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/tegra/tegra_pcm.h b/sound/soc/tegra/tegra_pcm.h
index dbb9033..985d418 100644
--- a/sound/soc/tegra/tegra_pcm.h
+++ b/sound/soc/tegra/tegra_pcm.h
@@ -2,7 +2,7 @@
  * tegra_pcm.h - Definitions for Tegra PCM driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010 - NVIDIA, Inc.
+ * Copyright (C) 2010,2012 - NVIDIA, Inc.
  *
  * Based on code copyright/by:
  *
@@ -52,4 +52,7 @@ struct tegra_runtime_data {
 	struct tegra_dma_channel *dma_chan;
 };
 
+int tegra_pcm_platform_register(struct device *dev);
+void tegra_pcm_platform_unregister(struct device *dev);
+
 #endif
diff --git a/sound/soc/tegra/tegra_spdif.c b/sound/soc/tegra/tegra_spdif.c
index 475428c..cd836cb 100644
--- a/sound/soc/tegra/tegra_spdif.c
+++ b/sound/soc/tegra/tegra_spdif.c
@@ -2,7 +2,7 @@
  * tegra_spdif.c - Tegra SPDIF driver
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2011 - NVIDIA, Inc.
+ * Copyright (C) 2011-2012 - NVIDIA, Inc.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -306,10 +306,18 @@ static __devinit int tegra_spdif_platform_probe(struct platform_device *pdev)
 		goto err_unmap;
 	}
 
+	ret = tegra_pcm_platform_register(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "Could not register PCM: %d\n", ret);
+		goto err_unregister_dai;
+	}
+
 	tegra_spdif_debug_add(spdif);
 
 	return 0;
 
+err_unregister_dai:
+	snd_soc_unregister_dai(&pdev->dev);
 err_unmap:
 	iounmap(spdif->regs);
 err_release:
@@ -327,6 +335,7 @@ static int __devexit tegra_spdif_platform_remove(struct platform_device *pdev)
 	struct tegra_spdif *spdif = dev_get_drvdata(&pdev->dev);
 	struct resource *res;
 
+	tegra_pcm_platform_unregister(&pdev->dev);
 	snd_soc_unregister_dai(&pdev->dev);
 
 	tegra_spdif_debug_remove(spdif);
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 566655e..fbd1335 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -2,7 +2,7 @@
  * tegra_wm8903.c - Tegra machine ASoC driver for boards using WM8903 codec.
  *
  * Author: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
- * Copyright (C) 2010-2011 - NVIDIA, Inc.
+ * Copyright (C) 2010-2012 - NVIDIA, Inc.
  *
  * Based on code copyright/by:
  *
@@ -61,7 +61,6 @@
 
 struct tegra_wm8903 {
 	struct tegra_wm8903_platform_data pdata;
-	struct platform_device *pcm_dev;
 	struct tegra_asoc_utils_data util_data;
 	int gpio_requested;
 };
@@ -354,7 +353,7 @@ static struct snd_soc_dai_link tegra_wm8903_dai = {
 	.name = "WM8903",
 	.stream_name = "WM8903 PCM",
 	.codec_name = "wm8903.0-001a",
-	.platform_name = "tegra-pcm-audio",
+	.platform_name = "tegra-i2s.0",
 	.cpu_dai_name = "tegra-i2s.0",
 	.codec_dai_name = "wm8903-hifi",
 	.init = tegra_wm8903_init,
@@ -392,7 +391,6 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 		ret = -ENOMEM;
 		goto err;
 	}
-	machine->pcm_dev = ERR_PTR(-EINVAL);
 
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
@@ -428,14 +426,9 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 			goto err;
 		}
 
-		machine->pcm_dev = platform_device_register_simple(
-					"tegra-pcm-audio", -1, NULL, 0);
-		if (IS_ERR(machine->pcm_dev)) {
-			dev_err(&pdev->dev,
-				"Can't instantiate tegra-pcm-audio\n");
-			ret = PTR_ERR(machine->pcm_dev);
-			goto err;
-		}
+		tegra_wm8903_dai.platform_name = NULL;
+		tegra_wm8903_dai.platform_of_node =
+					tegra_wm8903_dai.cpu_dai_of_node;
 	} else {
 		if (machine_is_harmony()) {
 			card->dapm_routes = harmony_audio_map;
@@ -454,7 +447,7 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 
 	ret = tegra_asoc_utils_init(&machine->util_data, &pdev->dev);
 	if (ret)
-		goto err_unregister;
+		goto err;
 
 	ret = snd_soc_register_card(card);
 	if (ret) {
@@ -467,9 +460,6 @@ static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
 
 err_fini_utils:
 	tegra_asoc_utils_fini(&machine->util_data);
-err_unregister:
-	if (!IS_ERR(machine->pcm_dev))
-		platform_device_unregister(machine->pcm_dev);
 err:
 	return ret;
 }
@@ -497,8 +487,6 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&machine->util_data);
-	if (!IS_ERR(machine->pcm_dev))
-		platform_device_unregister(machine->pcm_dev);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 2bdfc55..6be9e0f 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -119,7 +119,7 @@ static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.name = "TLV320AIC23",
 	.stream_name = "AIC23",
 	.codec_name = "tlv320aic23-codec.2-001a",
-	.platform_name = "tegra-pcm-audio",
+	.platform_name = "tegra-i2s.0",
 	.cpu_dai_name = "tegra-i2s.0",
 	.codec_dai_name = "tlv320aic23-hifi",
 	.ops = &trimslice_asoc_ops,
-- 
1.7.0.4
