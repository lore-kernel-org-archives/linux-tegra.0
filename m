From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Read and use the GPIO flags of the headphone detect
Date: Tue, 21 Oct 2014 17:33:29 +0200
Message-ID: <1413905609-23268-1-git-send-email-alban.bedel@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The headphone detect was hardcoded to low-active, use the flags from
DT to allow high-active as well.

Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 sound/soc/tegra/tegra_rt5640.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_rt5640.c b/sound/soc/tegra/tegra_rt5640.c
index a689883..4ebe387 100644
--- a/sound/soc/tegra/tegra_rt5640.c
+++ b/sound/soc/tegra/tegra_rt5640.c
@@ -44,6 +44,7 @@
 struct tegra_rt5640 {
 	struct tegra_asoc_utils_data util_data;
 	int gpio_hp_det;
+	enum of_gpio_flags gpio_hp_det_flags;
 };
 
 static int tegra_rt5640_asoc_hw_params(struct snd_pcm_substream *substream,
@@ -119,6 +120,8 @@ static int tegra_rt5640_asoc_init(struct snd_soc_pcm_runtime *rtd)
 
 	if (gpio_is_valid(machine->gpio_hp_det)) {
 		tegra_rt5640_hp_jack_gpio.gpio = machine->gpio_hp_det;
+		tegra_rt5640_hp_jack_gpio.invert =
+			!!(machine->gpio_hp_det_flags & OF_GPIO_ACTIVE_LOW);
 		snd_soc_jack_add_gpios(&tegra_rt5640_hp_jack,
 						1,
 						&tegra_rt5640_hp_jack_gpio);
@@ -180,7 +183,8 @@ static int tegra_rt5640_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
-	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
+	machine->gpio_hp_det = of_get_named_gpio_flags(
+		np, "nvidia,hp-det-gpios", 0, &machine->gpio_hp_det_flags);
 	if (machine->gpio_hp_det == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-- 
2.1.1
