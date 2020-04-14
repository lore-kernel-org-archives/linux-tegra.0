From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Applied "ASoC: tegra: tegra_wm8903: Support nvidia, headset property" to the asoc tree
Date: Tue, 14 Apr 2020 15:47:18 +0100
Message-ID: <applied-20200330204011.18465-3-digetx@gmail.com>
References: <20200330204011.18465-3-digetx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200330204011.18465-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The patch

   ASoC: tegra: tegra_wm8903: Support nvidia, headset property

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3ef9d5073b552d56bd6daf2af1e89b7e8d4df183 Mon Sep 17 00:00:00 2001
From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Mon, 30 Mar 2020 23:40:11 +0300
Subject: [PATCH] ASoC: tegra: tegra_wm8903: Support nvidia, headset property

The microphone-jack state needs to be masked in a case of a 4-pin jack
when microphone and ground pins are shorted. Presence of nvidia,headset
tells that WM8903 CODEC driver should mask microphone's status if short
circuit is detected, i.e headphones are inserted.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Link: https://lore.kernel.org/r/20200330204011.18465-3-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Signed-off-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 9b5651502f12..3aca354f9e08 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -177,6 +177,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
+	int shrt = 0;
 
 	if (gpio_is_valid(machine->gpio_hp_det)) {
 		tegra_wm8903_hp_jack_gpio.gpio = machine->gpio_hp_det;
@@ -189,12 +190,15 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 					&tegra_wm8903_hp_jack_gpio);
 	}
 
+	if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
+		shrt = SND_JACK_MICROPHONE;
+
 	snd_soc_card_jack_new(rtd->card, "Mic Jack", SND_JACK_MICROPHONE,
 			      &tegra_wm8903_mic_jack,
 			      tegra_wm8903_mic_jack_pins,
 			      ARRAY_SIZE(tegra_wm8903_mic_jack_pins));
 	wm8903_mic_detect(component, &tegra_wm8903_mic_jack, SND_JACK_MICROPHONE,
-				0);
+				shrt);
 
 	snd_soc_dapm_force_enable_pin(&card->dapm, "MICBIAS");
 
-- 
2.20.1
