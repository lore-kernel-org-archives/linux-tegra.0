From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ASoC: Tegra: WM8903: Allow re-insertion of module
Date: Thu,  4 Aug 2011 16:44:43 -0600
Message-ID: <1312497884-1599-2-git-send-email-swarren@nvidia.com>
References: <1312497884-1599-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1312497884-1599-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Two issues were preventing module snd-soc-tegra-wm8903.ko from being
removed and re-inserted:

a) The speaker-enable GPIO is hosted by the WM8903 chip. This GPIO must
   be freed before snd_soc_unregister_card() is called, because that
   triggers wm8903.c:wm8903_remove(), which calls gpiochip_remove(), which
   then fails if any of the GPIOs are in use. To solve this, free all GPIOs
   first, so the code doesn't care where they come from.

b) We need to call snd_soc_jack_free_gpios() to match the call to
   snd_soc_jack_add_gpios() during initialization. Without this, the
   call to snd_soc_jack_add_gpios() fails during any subsequent modprobe
   and initialization, since the GPIO and IRQ are already registered. In
   turn, this causes the headphone state not to be monitored, so the
   headphone is assumed not to be plugged in, and the audio path to it is
   never enabled.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |   15 +++++++++++----
 1 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index a42e9ac..661373c 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -56,6 +56,7 @@
 #define GPIO_HP_MUTE    BIT(1)
 #define GPIO_INT_MIC_EN BIT(2)
 #define GPIO_EXT_MIC_EN BIT(3)
+#define GPIO_HP_DET     BIT(4)
 
 struct tegra_wm8903 {
 	struct tegra_asoc_utils_data util_data;
@@ -304,6 +305,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_jack_add_gpios(&tegra_wm8903_hp_jack,
 					1,
 					&tegra_wm8903_hp_jack_gpio);
+		machine->gpio_requested |= GPIO_HP_DET;
 	}
 
 	snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
@@ -429,10 +431,10 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = machine->pdata;
 
-	snd_soc_unregister_card(card);
-
-	tegra_asoc_utils_fini(&machine->util_data);
-
+	if (machine->gpio_requested & GPIO_HP_DET)
+		snd_soc_jack_free_gpios(&tegra_wm8903_hp_jack,
+					1,
+					&tegra_wm8903_hp_jack_gpio);
 	if (machine->gpio_requested & GPIO_EXT_MIC_EN)
 		gpio_free(pdata->gpio_ext_mic_en);
 	if (machine->gpio_requested & GPIO_INT_MIC_EN)
@@ -441,6 +443,11 @@ static int __devexit tegra_wm8903_driver_remove(struct platform_device *pdev)
 		gpio_free(pdata->gpio_hp_mute);
 	if (machine->gpio_requested & GPIO_SPKR_EN)
 		gpio_free(pdata->gpio_spkr_en);
+	machine->gpio_requested = 0;
+
+	snd_soc_unregister_card(card);
+
+	tegra_asoc_utils_fini(&machine->util_data);
 
 	kfree(machine);
 
-- 
1.7.0.4
