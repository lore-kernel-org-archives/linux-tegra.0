From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/5] ASoC: tegra+wm8903: simplify gpio tests in widget callbacks
Date: Tue, 22 May 2012 16:08:53 -0600
Message-ID: <1337724536-12349-2-git-send-email-swarren@wwwdotorg.org>
References: <1337724536-12349-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1337724536-12349-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

By the time any widget callbacks could be called, if the GPIO ID they
will manipulate is valid, it must have already been requested, or the
card would have failed to probe or initialize. So, testing for GPIO
validity is equivalent to testing whether the GPIO was successfully
requested at this point in the code. Making this change will allow later
patches to remove the gpio_requested variable.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_wm8903.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 0b0df49..f33fe7c 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -160,7 +160,7 @@ static int tegra_wm8903_event_int_spk(struct snd_soc_dapm_widget *w,
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
-	if (!(machine->gpio_requested & GPIO_SPKR_EN))
+	if (!gpio_is_valid(pdata->gpio_spkr_en))
 		return 0;
 
 	gpio_set_value_cansleep(pdata->gpio_spkr_en,
@@ -177,7 +177,7 @@ static int tegra_wm8903_event_hp(struct snd_soc_dapm_widget *w,
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 	struct tegra_wm8903_platform_data *pdata = &machine->pdata;
 
-	if (!(machine->gpio_requested & GPIO_HP_MUTE))
+	if (!gpio_is_valid(pdata->gpio_hp_mute))
 		return 0;
 
 	gpio_set_value_cansleep(pdata->gpio_hp_mute,
-- 
1.7.0.4
