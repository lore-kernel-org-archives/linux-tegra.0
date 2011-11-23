From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 16/17] ASoC: TrimSlice machine: Use new auto_nc_codec_pins feature
Date: Tue, 22 Nov 2011 18:21:24 -0700
Message-ID: <1322011285-4002-17-git-send-email-swarren@nvidia.com>
References: <1322011285-4002-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322011285-4002-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Ian Lartey <ian-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dimitris Papastamos <dp-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set card.auto_nc_codec_pins to true to enable the feature, and remove all
the open-coded snd_soc_dapm_nc_pin() calls.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/trimslice.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index d564b40..7b07cb2 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -119,7 +119,6 @@ static int trimslice_asoc_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_codec *codec = rtd->codec;
 	struct snd_soc_card *card = codec->card;
-	struct snd_soc_dapm_context *dapm = &codec->dapm;
 	int ret;
 
 	ret = tegra_das_connect_dap_to_dac(TEGRA_DAS_DAP_ID_1,
@@ -135,10 +134,6 @@ static int trimslice_asoc_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	snd_soc_dapm_nc_pin(dapm, "LHPOUT");
-	snd_soc_dapm_nc_pin(dapm, "RHPOUT");
-	snd_soc_dapm_nc_pin(dapm, "MICIN");
-
 	return 0;
 }
 
@@ -162,6 +157,7 @@ static struct snd_soc_card snd_soc_trimslice = {
 	.num_dapm_widgets = ARRAY_SIZE(trimslice_dapm_widgets),
 	.dapm_routes = trimslice_audio_map,
 	.num_dapm_routes = ARRAY_SIZE(trimslice_audio_map),
+	.auto_nc_codec_pins = true,
 };
 
 static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
-- 
1.7.0.4
