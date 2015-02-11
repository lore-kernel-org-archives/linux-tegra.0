From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 3/3] ASoC: tegra: Add control for the Mic Jack pin
Date: Wed, 11 Feb 2015 15:49:54 +0100
Message-ID: <1423666200-32365-4-git-send-email-tomeu.vizoso@collabora.com>
References: <1423666200-32365-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423666200-32365-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Dylan Reid <dgreid@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

So userspace can enable and disable the external microphone.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 sound/soc/tegra/tegra_max98090.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 29ea87c..1f20c2c 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -139,6 +139,7 @@ static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
 static const struct snd_kcontrol_new tegra_max98090_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Mic Jack"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
 };
 
-- 
1.9.3
