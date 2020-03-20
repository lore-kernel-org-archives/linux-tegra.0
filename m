From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/2] ASoC: tegra: tegra_wm8903: Support DAPM events for built-in microphone
Date: Fri, 20 Mar 2020 23:55:04 +0300
Message-ID: <20200320205504.30466-3-digetx@gmail.com>
References: <20200320205504.30466-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200320205504.30466-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The enable-GPIO needs to be toggled on a DAPM event in order to turn
microphone ON/OFF, otherwise microphone won't work.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index f08d3489c3cf..071c7d2de77c 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -143,14 +143,32 @@ static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int tegra_wm8903_event_int_mic(struct snd_soc_dapm_widget *w,
+				      struct snd_kcontrol *k, int event)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+	struct snd_soc_card *card = dapm->card;
+	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
+
+	if (!gpio_is_valid(machine->gpio_int_mic_en))
+		return 0;
+
+	gpio_set_value_cansleep(machine->gpio_int_mic_en,
+				SND_SOC_DAPM_EVENT_ON(event));
+
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget tegra_wm8903_dapm_widgets[] = {
 	SND_SOC_DAPM_SPK("Int Spk", tegra_wm8903_event_int_spk),
 	SND_SOC_DAPM_HP("Headphone Jack", tegra_wm8903_event_hp),
 	SND_SOC_DAPM_MIC("Mic Jack", NULL),
+	SND_SOC_DAPM_MIC("Int Mic", tegra_wm8903_event_int_mic),
 };
 
 static const struct snd_kcontrol_new tegra_wm8903_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Int Spk"),
+	SOC_DAPM_PIN_SWITCH("Int Mic"),
 };
 
 static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.25.1
