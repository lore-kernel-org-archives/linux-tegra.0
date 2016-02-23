From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] sound/soc/tegra: tegra_max98090: Invert headphone by GPIO flag
Date: Tue, 23 Feb 2016 10:19:45 -0700
Message-ID: <1456247985-5563-2-git-send-email-sctincman@gmail.com>
References: <56CB6624.6030600@wwwdotorg.org>
 <1456247985-5563-1-git-send-email-sctincman@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456247985-5563-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Set the invert property for the headphone jack depending on the GPIO flag in the
device-tree. This is similar to what is done for tegra_rt5640.

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra_max98090.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index 902da36..49b95c7 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -42,6 +42,7 @@
 struct tegra_max98090 {
 	struct tegra_asoc_utils_data util_data;
 	int gpio_hp_det;
+	enum of_gpio_flags gpio_hp_det_flags;
 	int gpio_mic_det;
 };
 
@@ -155,6 +156,7 @@ static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
 				      ARRAY_SIZE(tegra_max98090_hp_jack_pins));
 
 		tegra_max98090_hp_jack_gpio.gpio = machine->gpio_hp_det;
+		tegra_max98090_hp_jack_gpio.invert = (machine->gpio_hp_det_flags & OF_GPIO_ACTIVE_LOW);
 		snd_soc_jack_add_gpios(&tegra_max98090_hp_jack,
 					1,
 					&tegra_max98090_hp_jack_gpio);
@@ -234,7 +236,8 @@ static int tegra_max98090_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, card);
 	snd_soc_card_set_drvdata(card, machine);
 
-	machine->gpio_hp_det = of_get_named_gpio(np, "nvidia,hp-det-gpios", 0);
+	machine->gpio_hp_det = of_get_named_gpio_flags(
+                np, "nvidia,hp-det-gpios", 0, &machine->gpio_hp_det_flags);
 	if (machine->gpio_hp_det == -EPROBE_DEFER)
 		return -EPROBE_DEFER;
 
-- 
2.7.1
