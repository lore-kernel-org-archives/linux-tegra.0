From: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] ASoC: tegra: add mic detect gpio to tegra_max98090
Date: Thu,  2 Oct 2014 09:42:44 -0700
Message-ID: <1412268164-3333-1-git-send-email-dgreid@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add an optional mic detect gpio property.  If specified in device tree
there will be a mic jack created for the given gpio.  This will be
used by the Tegra-based Chromebooks.

Signed-off-by: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 .../bindings/sound/nvidia,tegra-audio-max98090.txt |  1 +
 sound/soc/tegra/tegra_max98090.c                   | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
index 9c7c55c..c949abc 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
@@ -25,6 +25,7 @@ Required properties:
 
 Optional properties:
 - nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
+- nvidia,mic-det-gpios : The GPIO that detect microphones are plugged in
 
 Example:
 
diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index b86cd99..01921d7 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -42,6 +42,7 @@
 struct tegra_max98090 {
 	struct tegra_asoc_utils_data util_data;
 	int gpio_hp_det;
+	int gpio_mic_det;
 };
 
 static int tegra_max98090_asoc_hw_params(struct snd_pcm_substream *substream,
@@ -112,6 +113,22 @@ static struct snd_soc_jack_gpio tegra_max98090_hp_jack_gpio = {
 	.invert = 1,
 };
 
+static struct snd_soc_jack tegra_max98090_mic_jack;
+
+static struct snd_soc_jack_pin tegra_max98090_mic_jack_pins[] = {
+	{
+		.pin = "Mic Jack",
+		.mask = SND_JACK_MICROPHONE,
+	},
+};
+
+static struct snd_soc_jack_gpio tegra_max98090_mic_jack_gpio = {
+	.name = "Mic detection",
+	.report = SND_JACK_MICROPHONE,
+	.debounce_time = 150,
+	.invert = 1,
+};
+
 static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
 	SND_SOC_DAPM_HP("Headphones", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
@@ -141,6 +158,19 @@ static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
 					&tegra_max98090_hp_jack_gpio);
 	}
 
+	if (gpio_is_valid(machine->gpio_mic_det)) {
+		snd_soc_jack_new(codec, "Mic Jack", SND_JACK_MICROPHONE,
+				 &tegra_max98090_mic_jack);
+		snd_soc_jack_add_pins(&tegra_max98090_mic_jack,
+				      ARRAY_SIZE(tegra_max98090_mic_jack_pins),
+				      tegra_max98090_mic_jack_pins);
+
+		tegra_max98090_mic_jack_gpio.gpio = machine->gpio_mic_det;
+		snd_soc_jack_add_gpios(&tegra_max98090_mic_jack,
+				       1,
+				       &tegra_max98090_mic_jack_gpio);
+	}
+
 	return 0;
 }
 
@@ -153,6 +183,11 @@ static int tegra_max98090_card_remove(struct snd_soc_card *card)
 					&tegra_max98090_hp_jack_gpio);
 	}
 
+	if (gpio_is_valid(machine->gpio_mic_det)) {
+		snd_soc_jack_free_gpios(&tegra_max98090_mic_jack, 1,
+					&tegra_max98090_mic_jack_gpio);
+	}
+
 	return 0;
 }
 
@@ -201,6 +236,11 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 	if (machine->gpio_hp_det == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
+	machine->gpio_mic_det =
+			of_get_named_gpio(np, "nvidia,mic-det-gpios", 0);
+	if (machine->gpio_mic_det == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
 	ret = snd_soc_of_parse_card_name(card, "nvidia,model");
 	if (ret)
 		goto err;
-- 
2.1.2.330.g565301e
