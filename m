From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 5/6] ASoC: tegra trimslice: assume CONFIG_OF, and other cleanup
Date: Fri, 15 Feb 2013 17:07:34 -0700
Message-ID: <1360973255-344-5-git-send-email-swarren@wwwdotorg.org>
References: <1360973255-344-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360973255-344-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all runtime
checks for DT support from the driver.

Also, some minor changes so that the probe() body more closely resembles
other drivers, for easier comparison.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/trimslice.c |   56 +++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 32 deletions(-)

diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 7fcf6c2..05c68aa 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -97,9 +97,6 @@ static const struct snd_soc_dapm_route trimslice_audio_map[] = {
 static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.name = "TLV320AIC23",
 	.stream_name = "AIC23",
-	.codec_name = "tlv320aic23-codec.2-001a",
-	.platform_name = "tegra20-i2s.0",
-	.cpu_dai_name = "tegra20-i2s.0",
 	.codec_dai_name = "tlv320aic23-hifi",
 	.ops = &trimslice_asoc_ops,
 	.dai_fmt = SND_SOC_DAIFMT_I2S |
@@ -122,6 +119,7 @@ static struct snd_soc_card snd_soc_trimslice = {
 
 static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &snd_soc_trimslice;
 	struct tegra_trimslice *trimslice;
 	int ret;
@@ -130,44 +128,38 @@ static int tegra_snd_trimslice_probe(struct platform_device *pdev)
 				 GFP_KERNEL);
 	if (!trimslice) {
 		dev_err(&pdev->dev, "Can't allocate tegra_trimslice\n");
-		ret = -ENOMEM;
+		return -ENOMEM;
+	}
+
+	card->dev = &pdev->dev;
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, trimslice);
+
+	trimslice_tlv320aic23_dai.codec_of_node = of_parse_phandle(np,
+			"nvidia,audio-codec", 0);
+	if (!trimslice_tlv320aic23_dai.codec_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,audio-codec' missing or invalid\n");
+		ret = -EINVAL;
 		goto err;
 	}
 
-	if (pdev->dev.of_node) {
-		trimslice_tlv320aic23_dai.codec_name = NULL;
-		trimslice_tlv320aic23_dai.codec_of_node = of_parse_phandle(
-				pdev->dev.of_node, "nvidia,audio-codec", 0);
-		if (!trimslice_tlv320aic23_dai.codec_of_node) {
-			dev_err(&pdev->dev,
-				"Property 'nvidia,audio-codec' missing or invalid\n");
-			ret = -EINVAL;
-			goto err;
-		}
-
-		trimslice_tlv320aic23_dai.cpu_dai_name = NULL;
-		trimslice_tlv320aic23_dai.cpu_of_node = of_parse_phandle(
-				pdev->dev.of_node, "nvidia,i2s-controller", 0);
-		if (!trimslice_tlv320aic23_dai.cpu_of_node) {
-			dev_err(&pdev->dev,
-				"Property 'nvidia,i2s-controller' missing or invalid\n");
-			ret = -EINVAL;
-			goto err;
-		}
-
-		trimslice_tlv320aic23_dai.platform_name = NULL;
-		trimslice_tlv320aic23_dai.platform_of_node =
-				trimslice_tlv320aic23_dai.cpu_of_node;
+	trimslice_tlv320aic23_dai.cpu_of_node = of_parse_phandle(np,
+			"nvidia,i2s-controller", 0);
+	if (!trimslice_tlv320aic23_dai.cpu_of_node) {
+		dev_err(&pdev->dev,
+			"Property 'nvidia,i2s-controller' missing or invalid\n");
+		ret = -EINVAL;
+		goto err;
 	}
 
+	trimslice_tlv320aic23_dai.platform_of_node =
+			trimslice_tlv320aic23_dai.cpu_of_node;
+
 	ret = tegra_asoc_utils_init(&trimslice->util_data, &pdev->dev);
 	if (ret)
 		goto err;
 
-	card->dev = &pdev->dev;
-	platform_set_drvdata(pdev, card);
-	snd_soc_card_set_drvdata(card, trimslice);
-
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
-- 
1.7.10.4
