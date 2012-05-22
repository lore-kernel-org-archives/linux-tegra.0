From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ASoC: tegra+alc5632: move all GPIO setup into probe
Date: Tue, 22 May 2012 16:09:51 -0600
Message-ID: <1337724592-12434-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Now that deferred probe exists, we can parse device tree and request
GPIOs from probe(), rather than deferring this to the DAI link's init().

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 32de700..facf6f0 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -1,5 +1,5 @@
 /*
- * tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
+* tegra_alc5632.c  --  Toshiba AC100(PAZ00) machine ASoC driver
  *
  * Copyright (C) 2011 The AC100 Kernel Team <ac100-oU9gvf+ajcSyy5GWsZ7R2qxOck334EZe@public.gmane.org>
  * Copyright (C) 2012 - NVIDIA, Inc.
@@ -110,7 +110,6 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_codec *codec = rtd->codec;
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
-	struct device_node *np = codec->card->dev->of_node;
 	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(codec->card);
 
 	snd_soc_jack_new(codec, "Headset Jack", SND_JACK_HEADSET,
@@ -119,8 +118,6 @@ static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 			ARRAY_SIZE(tegra_alc5632_hs_jack_pins),
 			tegra_alc5632_hs_jack_pins);
 
-	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
-
 	if (gpio_is_valid(machine->gpio_hp_det)) {
 		tegra_alc5632_hp_jack_gpio.gpio = machine->gpio_hp_det;
 		snd_soc_jack_add_gpios(&tegra_alc5632_hs_jack,
@@ -159,6 +156,7 @@ static struct snd_soc_card snd_soc_tegra_alc5632 = {
 
 static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &snd_soc_tegra_alc5632;
 	struct tegra_alc5632 *alc5632;
 	int ret;
@@ -181,6 +179,10 @@ static __devinit int tegra_alc5632_probe(struct platform_device *pdev)
 		goto err;
 	}
 
+	alc5632->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
+	if (alc5632->gpio_hp_det == -ENODEV)
+		return -EPROBE_DEFER;
+
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (ret)
 		goto err;
-- 
1.7.0.4
