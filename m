From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ASoC: Tegra: Enable Kaen HP_MUTE at boot
Date: Thu, 26 May 2011 12:46:50 -0600
Message-ID: <1306435610-27810-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We want the default state of the HP_MUTE signal to be asserted, so that
the headphones are muted before the first audio playback. Without this,
the headphones are left unmuted until shortly after the first audio
playback completes.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 0d6738a..a42e9ac 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -267,7 +267,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		}
 		machine->gpio_requested |= GPIO_HP_MUTE;
 
-		gpio_direction_output(pdata->gpio_hp_mute, 0);
+		gpio_direction_output(pdata->gpio_hp_mute, 1);
 	}
 
 	if (gpio_is_valid(pdata->gpio_int_mic_en)) {
-- 
1.7.0.4
