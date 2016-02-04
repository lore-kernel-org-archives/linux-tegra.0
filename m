From: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/4] sound/soc: tegra_max98090: rename headphone jack DAPM
Date: Wed,  3 Feb 2016 22:31:00 -0700
Message-ID: <1454563862-1971-3-git-send-email-sctincman@gmail.com>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454563862-1971-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The correct DAPM name for a headphone jack is "Headphone Jack"
This is also what userspace expects, and this fixes headphone detection.

Signed-off-by: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra_max98090.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_max98090.c b/sound/soc/tegra/tegra_max98090.c
index b373d06..a015d1b 100644
--- a/sound/soc/tegra/tegra_max98090.c
+++ b/sound/soc/tegra/tegra_max98090.c
@@ -101,7 +101,7 @@ static struct snd_soc_jack tegra_max98090_hp_jack;
 
 static struct snd_soc_jack_pin tegra_max98090_hp_jack_pins[] = {
 	{
-		.pin = "Headphones",
+		.pin = "Headphone Jack",
 		.mask = SND_JACK_HEADPHONE,
 	},
 };
@@ -130,14 +130,14 @@ static struct snd_soc_jack_gpio tegra_max98090_mic_jack_gpio = {
 };
 
 static const struct snd_soc_dapm_widget tegra_max98090_dapm_widgets[] = {
-	SND_SOC_DAPM_HP("Headphones", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
 	SND_SOC_DAPM_MIC("Int Mic", NULL),
 };
 
 static const struct snd_kcontrol_new tegra_max98090_controls[] = {
-	SOC_DAPM_PIN_SWITCH("Headphones"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Mic Jack"),
 	SOC_DAPM_PIN_SWITCH("Int Mic"),
@@ -148,7 +148,7 @@ static int tegra_max98090_asoc_init(struct snd_soc_pcm_runtime *rtd)
 	struct tegra_max98090 *machine = snd_soc_card_get_drvdata(rtd->card);
 
 	if (gpio_is_valid(machine->gpio_hp_det)) {
-		snd_soc_card_jack_new(rtd->card, "Headphones",
+		snd_soc_card_jack_new(rtd->card, "Headphone Jack",
 				      SND_JACK_HEADPHONE,
 				      &tegra_max98090_hp_jack,
 				      tegra_max98090_hp_jack_pins,
-- 
2.7.0
