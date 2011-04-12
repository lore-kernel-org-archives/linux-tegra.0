From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] ARM: Tegra: Rename harmony_audio.h -> tegra_wm8903_pdata.h
Date: Tue, 12 Apr 2011 11:28:59 -0600
Message-ID: <1302629341-2302-2-git-send-email-swarren@nvidia.com>
References: <1302629341-2302-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302629341-2302-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The audio driver will soon support more than just the Tegra Harmony board.
Rename the platform data header file and data type to reflect this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch needs special merge handling; please see the cover letter.

 arch/arm/mach-tegra/board-harmony.c                |    4 +-
 arch/arm/mach-tegra/include/mach/harmony_audio.h   |   22 --------------------
 .../mach-tegra/include/mach/tegra_wm8903_pdata.h   |   22 ++++++++++++++++++++
 sound/soc/tegra/harmony.c                          |   12 +++++-----
 4 files changed, 30 insertions(+), 30 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/include/mach/harmony_audio.h
 create mode 100644 arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index 75c918a..3c6bba2 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -34,7 +34,7 @@
 #include <asm/mach/time.h>
 #include <asm/setup.h>
 
-#include <mach/harmony_audio.h>
+#include <mach/tegra_wm8903_pdata.h>
 #include <mach/iomap.h>
 #include <mach/irqs.h>
 #include <mach/sdhci.h>
@@ -67,7 +67,7 @@ static struct platform_device debug_uart = {
 	},
 };
 
-static struct harmony_audio_platform_data harmony_audio_pdata = {
+static struct tegra_wm8903_platform_data harmony_audio_pdata = {
 	.gpio_spkr_en		= TEGRA_GPIO_SPKR_EN,
 	.gpio_hp_det		= TEGRA_GPIO_HP_DET,
 	.gpio_int_mic_en	= TEGRA_GPIO_INT_MIC_EN,
diff --git a/arch/arm/mach-tegra/include/mach/harmony_audio.h b/arch/arm/mach-tegra/include/mach/harmony_audio.h
deleted file mode 100644
index af08650..0000000
--- a/arch/arm/mach-tegra/include/mach/harmony_audio.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/*
- * arch/arm/mach-tegra/include/mach/harmony_audio.h
- *
- * Copyright 2011 NVIDIA, Inc.
- *
- * This software is licensed under the terms of the GNU General Public
- * License version 2, as published by the Free Software Foundation, and
- * may be copied, distributed, and modified under those terms.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-struct harmony_audio_platform_data {
-	int gpio_spkr_en;
-	int gpio_hp_det;
-	int gpio_int_mic_en;
-	int gpio_ext_mic_en;
-};
diff --git a/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h b/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
new file mode 100644
index 0000000..c34bd5e
--- /dev/null
+++ b/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
@@ -0,0 +1,22 @@
+/*
+ * arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
+ *
+ * Copyright 2011 NVIDIA, Inc.
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+struct tegra_wm8903_platform_data {
+	int gpio_spkr_en;
+	int gpio_hp_det;
+	int gpio_int_mic_en;
+	int gpio_ext_mic_en;
+};
diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 556a571..f511017 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -35,7 +35,7 @@
 #include <linux/slab.h>
 #include <linux/gpio.h>
 
-#include <mach/harmony_audio.h>
+#include <mach/tegra_wm8903_pdata.h>
 
 #include <sound/core.h>
 #include <sound/jack.h>
@@ -58,7 +58,7 @@
 
 struct tegra_harmony {
 	struct tegra_asoc_utils_data util_data;
-	struct harmony_audio_platform_data *pdata;
+	struct tegra_wm8903_platform_data *pdata;
 	int gpio_requested;
 };
 
@@ -163,7 +163,7 @@ static int harmony_event_int_spk(struct snd_soc_dapm_widget *w,
 	struct snd_soc_codec *codec = w->codec;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_harmony *harmony = snd_soc_card_get_drvdata(card);
-	struct harmony_audio_platform_data *pdata = harmony->pdata;
+	struct tegra_wm8903_platform_data *pdata = harmony->pdata;
 
 	gpio_set_value_cansleep(pdata->gpio_spkr_en,
 				SND_SOC_DAPM_EVENT_ON(event));
@@ -198,7 +198,7 @@ static int harmony_asoc_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_dapm_context *dapm = &codec->dapm;
 	struct snd_soc_card *card = codec->card;
 	struct tegra_harmony *harmony = snd_soc_card_get_drvdata(card);
-	struct harmony_audio_platform_data *pdata = harmony->pdata;
+	struct tegra_wm8903_platform_data *pdata = harmony->pdata;
 	int ret;
 
 	ret = gpio_request(pdata->gpio_spkr_en, "spkr_en");
@@ -291,7 +291,7 @@ static __devinit int tegra_snd_harmony_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &snd_soc_harmony;
 	struct tegra_harmony *harmony;
-	struct harmony_audio_platform_data *pdata;
+	struct tegra_wm8903_platform_data *pdata;
 	int ret;
 
 	if (!machine_is_harmony()) {
@@ -344,7 +344,7 @@ static int __devexit tegra_snd_harmony_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 	struct tegra_harmony *harmony = snd_soc_card_get_drvdata(card);
-	struct harmony_audio_platform_data *pdata = harmony->pdata;
+	struct tegra_wm8903_platform_data *pdata = harmony->pdata;
 
 	snd_soc_unregister_card(card);
 
-- 
1.7.1
