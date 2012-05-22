From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 5/5] ASoC: tegra+wm8903: unconditionally free jack GPIOs in remove
Date: Tue, 22 May 2012 16:08:56 -0600
Message-ID: <1337724536-12349-5-git-send-email-swarren@wwwdotorg.org>
References: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337724536-12349-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
the tracking code. Almost all other machine drivers already operate this
way.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |   10 ++--------
 1 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index d78556a..1fd6a41 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -50,12 +50,9 @@
 
 #define DRV_NAME "tegra-snd-wm8903"
 
-#define GPIO_HP_DET     BIT(4)
-
 struct tegra_wm8903 {
 	struct tegra_wm8903_platform_data pdata;
 	struct tegra_asoc_utils_data util_data;
-	int gpio_requested;
 };
 
 static int tegra_wm8903_hw_params(struct snd_pcm_substream *substream,
@@ -252,7 +249,6 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_jack_add_gpios(&tegra_wm8903_hp_jack,
 					1,
 					&tegra_wm8903_hp_jack_gpio);
-		machine->gpio_requested |= GPIO_HP_DET;
 	}
 
 	snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
@@ -458,10 +454,8 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 
-	if (machine->gpio_requested & GPIO_HP_DET)
-		snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack,
-					1,
-					&tegra_wm8903_hp_jack_gpio);
+	snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack, 1,
+				&tegra_wm8903_hp_jack_gpio);
 
 	snd_soc_unregister_card(card);
 
-- 
1.7.0.4
