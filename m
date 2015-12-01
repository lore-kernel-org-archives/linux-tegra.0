From: Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ASoC: tegra_alc5632: check return value
Date: Tue,  1 Dec 2015 16:09:51 +0530
Message-ID: <1448966391-13996-1-git-send-email-sudipm.mukherjee@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sudip Mukherjee <sudipm.mukherjee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We have been returning success even if snd_soc_card_jack_new() fails.
Lets check the return value and return error if it fails.

Fixes: 12cc6d1dca4d ("ASoC: tegra_alc5632: Register jacks at the card level")
Signed-off-by: Sudip Mukherjee <sudip-ofJRbWXBVFamYgehrs7/Lw@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index ba272e2..deb597f 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -101,12 +101,16 @@ static const struct snd_kcontrol_new tegra_alc5632_controls[] = {
 
 static int tegra_alc5632_asoc_init(struct snd_soc_pcm_runtime *rtd)
 {
+	int ret;
 	struct tegra_alc5632 *machine = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_soc_card_jack_new(rtd->card, "Headset Jack", SND_JACK_HEADSET,
-			      &tegra_alc5632_hs_jack,
-			      tegra_alc5632_hs_jack_pins,
-			      ARRAY_SIZE(tegra_alc5632_hs_jack_pins));
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET,
+				    &tegra_alc5632_hs_jack,
+				    tegra_alc5632_hs_jack_pins,
+				    ARRAY_SIZE(tegra_alc5632_hs_jack_pins));
+	if (ret)
+		return ret;
 
 	if (gpio_is_valid(machine->gpio_hp_det)) {
 		tegra_alc5632_hp_jack_gpio.gpio = machine->gpio_hp_det;
-- 
1.9.1
