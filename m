From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra+alc5632: unconditionally free jack GPIOs in remove
Date: Tue, 22 May 2012 16:09:52 -0600
Message-ID: <1337724592-12434-2-git-send-email-swarren@wwwdotorg.org>
References: <1337724592-12434-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337724592-12434-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The headphone jack GPIOs are added/initialized in the DAI link's init()
method, and hence in theory may not always have been added before remove()
is called in some unusual cases. In order to prevent calling
snd_soc_jack_free_gpios() if snd_soc_jack_add_gpios() had not been, the
code kept track of the initialization state to avoid the free call when
necessary.

However, it appears that snd_soc_jack_free_gpios() is robust in the face
of being called without snd_soc_jack_add_gpios() first succeeding, so
there is little point manually tracking this information. Hence, remove
the tracking code. All other machine drivers already operate this way.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |   11 ++---------
 1 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index facf6f0..1566957 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -33,11 +33,8 @@
 
 #define DRV_NAME "tegra-alc5632"
 
-#define GPIO_HP_DET     BIT(0)
-
 struct tegra_alc5632 {
 	struct tegra_asoc_utils_data util_data;
-	int gpio_requested;
 	int gpio_hp_det;
 };
 
@@ -123,7 +120,6 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_jack_add_gpios(&tegra_alc5632_hs_jack,
 						1,
 						&tegra_alc5632_hp_jack_gpio);
-		machine->gpio_requested |= GPIO_HP_DET;
 	}
 
 	snd_soc_dapm_force_enable_pin(dapm, "MICBIAS1");
@@ -236,11 +232,8 @@ static int __devexit tegra_alc5632_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(card);
 
-	if (machine->gpio_requested & GPIO_HP_DET)
-		snd_soc_jack_free_gpios(&tegra_alc5632_hs_jack,
-					1,
-					&tegra_alc5632_hp_jack_gpio);
-	machine->gpio_requested = 0;
+	snd_soc_jack_free_gpios(&tegra_alc5632_hs_jack, 1,
+				&tegra_alc5632_hp_jack_gpio);
 
 	snd_soc_unregister_card(card);
 
-- 
1.7.0.4
