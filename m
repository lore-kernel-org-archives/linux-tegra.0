From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/3] ASoC: Tegra+WM903 machine: Set the new fully_routed flag
Date: Wed, 23 Nov 2011 12:42:05 -0700
Message-ID: <1322077326-5538-2-git-send-email-swarren@nvidia.com>
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
 sound/soc/tegra/tegra_wm8903.c |   22 +---------------------
 1 files changed, 1 insertions(+), 21 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 33feee8..b260f54 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -331,27 +331,6 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 
 	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
 
-	/* FIXME: Calculate automatically based on DAPM routes? */
-	if (!machine_is_harmony())
-		snd_soc_dapm_nc_pin(dapm, "IN1L");
-	if (!machine_is_seaboard() && !machine_is_aebl())
-		snd_soc_dapm_nc_pin(dapm, "IN1R");
-	snd_soc_dapm_nc_pin(dapm, "IN2L");
-	if (!machine_is_kaen())
-		snd_soc_dapm_nc_pin(dapm, "IN2R");
-	snd_soc_dapm_nc_pin(dapm, "IN3L");
-	snd_soc_dapm_nc_pin(dapm, "IN3R");
-
-	if (machine_is_aebl()) {
-		snd_soc_dapm_nc_pin(dapm, "LON");
-		snd_soc_dapm_nc_pin(dapm, "RON");
-		snd_soc_dapm_nc_pin(dapm, "ROP");
-		snd_soc_dapm_nc_pin(dapm, "LOP");
-	} else {
-		snd_soc_dapm_nc_pin(dapm, "LINEOUTR");
-		snd_soc_dapm_nc_pin(dapm, "LINEOUTL");
-	}
-
 	return 0;
 }
 
@@ -375,6 +354,7 @@ static struct snd_soc_card snd_soc_tegra_wm8903 = {
 	.num_controls = ARRAY_SIZE(tegra_wm8903_controls),
 	.dapm_widgets = tegra_wm8903_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(tegra_wm8903_dapm_widgets),
+	.fully_routed = true,
 };
 
 static __devinit int tegra_wm8903_driver_probe(struct platform_device *pdev)
-- 
1.7.0.4
