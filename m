From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/7] ASoC: Tegra: Harmony: Implement mic detection
Date: Thu, 10 Feb 2011 15:37:16 -0700
Message-ID: <1297377439-27382-4-git-send-email-swarren@nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297377439-27382-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Add jack definition for mic jack
* Request wm8903 to enable mic detection
* Force mic bias on, since it's required for mic detection

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/harmony.c |   25 ++++++++++++++++++++++---
 1 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 2a473a8..2fbfa10 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -43,6 +43,8 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
+#include "../codecs/wm8903.h"
+
 #include "tegra_das.h"
 #include "tegra_i2s.h"
 #include "tegra_pcm.h"
@@ -142,6 +144,15 @@ static struct snd_soc_jack_gpio harmony_hp_jack_gpios[] = {
 	}
 };
 
+static struct snd_soc_jack harmony_mic_jack;
+
+static struct snd_soc_jack_pin harmony_mic_jack_pins[] = {
+	{
+		.pin = "Mic Jack",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
 static int harmony_event_int_spk(struct snd_soc_dapm_widget *w,
 					struct snd_kcontrol *k, int event)
 {
@@ -206,9 +217,6 @@ static int harmony_asoc_init(struct snd_soc_pcm_runtime *rtd)
 	snd_soc_dapm_add_routes(dapm, harmony_audio_map,
 				ARRAY_SIZE(harmony_audio_map));
 
-	snd_soc_dapm_enable_pin(dapm, "Mic Jack");
-	snd_soc_dapm_sync(dapm);
-
 	harmony_hp_jack_gpios[0].gpio = pdata->gpio_hp_det;
 	snd_soc_jack_new(codec, "Headphone Jack", SND_JACK_HEADPHONE,
 			 &harmony_hp_jack);
@@ -219,6 +227,17 @@ static int harmony_asoc_init(struct snd_soc_pcm_runtime *rtd)
 			       ARRAY_SIZE(harmony_hp_jack_gpios),
 			       harmony_hp_jack_gpios);
 
+	snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
+			 &harmony_mic_jack);
+	snd_soc_jack_add_pins(&harmony_mic_jack,
+			      ARRAY_SIZE(harmony_mic_jack_pins),
+			      harmony_mic_jack_pins);
+	wm8903_mic_detect(codec, &harmony_mic_jack, SND_JACK_MICROPHONE, 0);
+
+	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
+
+	snd_soc_dapm_sync(dapm);
+
 	return 0;
 }
 
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
