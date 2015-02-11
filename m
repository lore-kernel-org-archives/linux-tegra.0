From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 2/3] ASoC: tegra: Add sink for the internal mic to tegra_max98090
Date: Wed, 11 Feb 2015 15:49:53 +0100
Message-ID: <1423666200-32365-3-git-send-email-tomeu.vizoso@collabora.com>
References: <1423666200-32365-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423666200-32365-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Dylan Reid <dgreid@chromium.org>, Lars-Peter Clausen <lars@metafoo.de>, Wolfram Sang <wsa@the-dreams.de>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
List-Id: linux-tegra@vger.kernel.org

Also adds a control for the pin of the internal mic, so userspace can
apply policy when the state of the external mic jack changes.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt | 1 +
 sound/soc/tegra/tegra_max98090.c                                        | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
index c949abc..c3495be 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
@@ -18,6 +18,7 @@ Required properties:
   * Headphones
   * Speakers
   * Mic Jack
+  * Int Mic
 
 - nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
   connected to the CODEC.
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 8df71a4..29ea87c 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -133,11 +133,13 @@ static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", NULL),
 };
 
 static const struct snd_kcontrol_new tegra_max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
 };
 
 static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
-- 
1.9.3
