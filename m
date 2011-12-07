From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 5/6] ASoC: Tegra: Move DAS configuration into DAS driver
Date: Wed,  7 Dec 2011 15:13:49 -0700
Message-ID: <1323296033-28730-11-git-send-email-swarren@nvidia.com>
References: <1323296033-28730-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1323296033-28730-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Move DAS routing setup into the DAS driver itself. This removes the need
to duplicate this in each machine driver, of which we'll soon have three.

An added advantage is that the machine drivers no longer call the Tegra20-
specific DAS functions by name, so the machine driver no longer needs to
be split up into Tegra20 and Tegra30 versions.

If individual machine drivers need a different routing setup to this
default, they can still call the DAS functions to set that up.

Long-term, DAS will be a codec driver, and user-space will be able to
control its routing, possibly within constraints that the machine driver
sets up. Configuring the DAS routing from the DAS driver is a very slight
move in that direction.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: New patch. Sorry for the churn here. This should avoid the Paz00
(Toshiba AC100) machine driver from having to add the calls to the DAS
driver.

 sound/soc/tegra/tegra_das.c    |   13 +++++++++++++
 sound/soc/tegra/tegra_wm8903.c |   13 -------------
 sound/soc/tegra/trimslice.c    |   23 -----------------------
 3 files changed, 13 insertions(+), 36 deletions(-)

diff --git a/sound/soc/tegra/tegra_das.c b/sound/soc/tegra/tegra_das.c
index 5b82b4e..3b3c1ba 100644
--- a/sound/soc/tegra/tegra_das.c
+++ b/sound/soc/tegra/tegra_das.c
@@ -202,6 +202,19 @@ static int __devinit tegra_das_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	ret = tegra_das_connect_dap_to_dac(TEGRA_DAS_DAP_ID_1,
+					   TEGRA_DAS_DAP_SEL_DAC1);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
+		goto err;
+	}
+	ret = tegra_das_connect_dac_to_dap(TEGRA_DAS_DAC_ID_1,
+					   TEGRA_DAS_DAC_SEL_DAP1);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
+		goto err;
+	}
+
 	tegra_das_debug_add(das);
 
 	platform_set_drvdata(pdev, das);
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 2f5b107..ba2d23e 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -249,19 +249,6 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct tegra_wm8903_platform_data *pdata = machine->pdata;
 	int ret;
 
-	ret = tegra_das_connect_dap_to_dac(TEGRA_DAS_DAP_ID_1,
-					   TEGRA_DAS_DAP_SEL_DAC1);
-	if (ret) {
-		dev_err(card->dev, "Can't set up DAS DAP connection\n");
-		return ret;
-	}
-	ret = tegra_das_connect_dac_to_dap(TEGRA_DAS_DAC_ID_1,
-					   TEGRA_DAS_DAC_SEL_DAP1);
-	if (ret) {
-		dev_err(card->dev, "Can't set up DAS DAC connection\n");
-		return ret;
-	}
-
 	if (gpio_is_valid(pdata->gpio_spkr_en)) {
 		ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
 		if (ret) {
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 043eb7c..7d95b76 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -115,28 +115,6 @@ static const struct snd_soc_dapm_route trimslice_audio_map[] = {
 	{"RLINEIN", NULL, "Line In"},
 };
 
-static int trimslice_asoc_init(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_codec *codec = rtd->codec;
-	struct snd_soc_card *card = codec->card;
-	int ret;
-
-	ret = tegra_das_connect_dap_to_dac(TEGRA_DAS_DAP_ID_1,
-					   TEGRA_DAS_DAP_SEL_DAC1);
-	if (ret) {
-		dev_err(card->dev, "Can't set up DAS DAP connection\n");
-		return ret;
-	}
-	ret = tegra_das_connect_dac_to_dap(TEGRA_DAS_DAC_ID_1,
-					   TEGRA_DAS_DAC_SEL_DAP1);
-	if (ret) {
-		dev_err(card->dev, "Can't set up DAS DAC connection\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.name = "TLV320AIC23",
 	.stream_name = "AIC23",
@@ -144,7 +122,6 @@ static struct snd_soc_dai_link trimslice_tlv320aic23_dai = {
 	.platform_name = "tegra-pcm-audio",
 	.cpu_dai_name = "tegra-i2s.0",
 	.codec_dai_name = "tlv320aic23-hifi",
-	.init = trimslice_asoc_init,
 	.ops = &trimslice_asoc_ops,
 };
 
-- 
1.7.0.4
