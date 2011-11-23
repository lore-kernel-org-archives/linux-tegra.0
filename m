From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 3/3] ASoC: TrimSlice machine: Set the new fully_routed flag
Date: Wed, 23 Nov 2011 12:42:06 -0700
Message-ID: <1322077326-5538-3-git-send-email-swarren@nvidia.com>
References: <1322077326-5538-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322077326-5538-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set card.fully_routed to request the ASoC core calculated unused codec
pins, and call snd_soc_dapm_nc_pin() for them. Remove the open-coded
calls.

v2: Rename flag from auto_nc_pins to fully_routed. Adjust description.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/trimslice.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index d564b40..043eb7c 100644
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
+	.fully_routed = true,
 };
 
 static __devinit int tegra_snd_trimslice_probe(struct platform_device *pdev)
-- 
1.7.0.4
