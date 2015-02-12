From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH v2 1/3] ASoC: tegra: Expose Headphones pin to userspace
Date: Thu, 12 Feb 2015 09:41:55 +0100
Message-ID: <1423730523-26266-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1423730523-26266-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423730523-26266-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Dylan Reid <dgreid@chromium.org>, Wolfram Sang <wsa@the-dreams.de>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

So userspace can enable or disable it based on the current policy.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Stephen Warren <swarren@nvidia.com>
---
 sound/soc/tegra/tegra_max98090.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index af3fb99..8df71a4 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -136,6 +136,7 @@ static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
 };
 
 static const struct snd_kcontrol_new tegra_max98090_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphones"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 };
 
-- 
1.9.3
