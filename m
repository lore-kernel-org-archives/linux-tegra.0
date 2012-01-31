From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: [PATCH 1/5] ASoC: Tegra+ALC5632: Implement device tree support in board file
Date: Tue, 31 Jan 2012 09:26:59 +0200
Message-ID: <1327994819-26989-1-git-send-email-leon@leon.nu>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch implements device tree support for tagra board with ALC5632
codec.

Signed-off-by: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |   78 ++++++++++++++++++++++++++++++++++----
 1 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 4a0e805..c0ba1e4 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -36,6 +36,7 @@
 
 struct tegra_alc5632 {
 	struct tegra_asoc_utils_data util_data;
+	struct platform_device *pcm_dev;
 };
 
 static int tegra_alc5632_asoc_hw_params(struct snd_pcm_substream *substream,
@@ -128,9 +129,7 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 static struct snd_soc_dai_link tegra_alc5632_dai = {
 	.name = "ALC5632",
 	.stream_name = "ALC5632 PCM",
-	.codec_name = "alc5632.0-001e",
 	.platform_name = "tegra-pcm-audio",
-	.cpu_dai_name = "tegra-i2s.0",
 	.codec_dai_name = "alc5632-hifi",
 	.init = tegra_alc5632_asoc_init,
 	.ops = &tegra_alc5632_asoc_ops,
@@ -163,26 +162,78 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 			sizeof(struct tegra_alc5632), GFP_KERNEL);
 	if (!alc5632) {
 		dev_err(&pdev->dev, "Can't allocate tegra_alc5632\n");
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto err;
 	}
 
-	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
-	if (ret)
-		return ret;
-
 	card->dev = &pdev->dev;
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, alc5632);
 
+	alc5632->pcm_dev = ERR_PTR(-EINVAL);
+
+	if (!(pdev->dev.of_node)) {
+		dev_err(&pdev->dev, "Must be instantiated using device tree\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
+	if (ret)
+		goto err;
+
+	ret = snd_soc_of_parse_audio_routing(card, "nvidia,audio-routing");
+	if (ret)
+		goto err;
+
+	tegra_alc5632_dai.codec_of_node = of_parse_phandle(
+			pdev->dev.of_node, "nvidia,audio-codec", 0);
+
+	if (!tegra_alc5632_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	tegra_alc5632_dai.cpu_dai_of_node = of_parse_phandle(
+			pdev->dev.of_node, "nvidia,i2s-controller", 0);
+	if (!tegra_alc5632_dai.cpu_dai_of_node) {
+		dev_err(&pdev->dev,
+		"Property 'nvidia,i2s-controller' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	alc5632->pcm_dev = platform_device_register_simple(
+		"tegra-pcm-audio", -1, NULL, 0);
+	if (IS_ERR(alc5632->pcm_dev)) {
+		dev_err(&pdev->dev,
+			"Can't instantiate tegra-pcm-audio\n");
+		ret = PTR_ERR(alc5632->pcm_dev);
+		goto err;
+	}
+
+	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
+	if (ret)
+		goto err_unregister;
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
 			ret);
-		tegra_asoc_utils_fini(&alc5632->util_data);
-		return ret;
+		goto err_fini_utils;
 	}
 
 	return 0;
+
+err_fini_utils:
+	tegra_asoc_utils_fini(&alc5632->util_data);
+err_unregister:
+	if (!IS_ERR(alc5632->pcm_dev))
+		platform_device_unregister(alc5632->pcm_dev);
+err:
+	return ret;
 }
 
 static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
@@ -193,15 +244,23 @@ static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
 	snd_soc_unregister_card(card);
 
 	tegra_asoc_utils_fini(&alc5632->util_data);
+	if (!IS_ERR(alc5632->pcm_dev))
+		platform_device_unregister(alc5632->pcm_dev);
 
 	return 0;
 }
 
+static const struct of_device_id tegra_alc5632_of_match[] __devinitconst = {
+	{ .compatible = "nvidia,tegra-audio-alc5632", },
+	{},
+};
+
 static struct platform_driver tegra_alc5632_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.owner = THIS_MODULE,
 		.pm = &snd_soc_pm_ops,
+		.of_match_table = tegra_alc5632_of_match,
 	},
 	.probe = tegra_alc5632_probe,
 	.remove = __devexit_p(tegra_alc5632_remove),
@@ -212,3 +271,4 @@ MODULE_AUTHOR("Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra+ALC5632 machine ASoC driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_alc5632_of_match);
-- 
1.7.3.4
