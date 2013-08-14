From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: support a Mic Jack in the Tegra+RT5640 machine driver
Date: Wed, 14 Aug 2013 14:26:29 -0600
Message-ID: <1376511989-28187-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a Mic Jack widget to the Tegra+RT5640 machine driver, and document
this in the DT binding. This enables the DT to include the Mic Jack in
the audio routing table, and hence enables capture of audio, in addition
to the previously-working playback.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt | 1 +
 sound/soc/tegra/tegra_rt5640.c                                        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
index cba4f88..dc62249 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
@@ -16,6 +16,7 @@ Required properties:
 
   * Headphones
   * Speakers
+  * Mic Jack
 
 - nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
   connected to the CODEC.
diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index 08794f9..4511c5a 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -99,6 +99,7 @@ static struct snd_soc_jack_gpio tegra_rt5640_hp_jack_gpio = {
 static const struct snd_soc_dapm_widget tegra_rt5640_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 };
 
 static const struct snd_kcontrol_new tegra_rt5640_controls[] = {
-- 
1.8.1.5
