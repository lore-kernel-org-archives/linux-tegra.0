From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/5] ASoC: WM8903: Fix platform data gpio_cfg confusion
Date: Fri,  2 Dec 2011 15:08:37 -0700
Message-ID: <1322863721-29793-2-git-send-email-swarren@nvidia.com>
References: <1322863721-29793-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322863721-29793-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

wm8903_platform_data.gpio_cfg[] was intended to be interpreted as follows:
0:       Don't touch this GPIO's configuration register
1..7fff: Write that value to the GPIO's configuration register
8000:    Write zero to the GPIO's configuration register
other:   Undefined (invalid)

The rationale is that platform data is usually global data, and a value of
zero means that the field wasn't explicitly set to anything (e.g. because
the field was new to the pdata type, and existing users weren't update to
initialize it) and hence the value zero should be ignored. 0x8000 is an
explicit way to get 0 in the register.

The code worked this way until commit 7cfe561 "ASoC: wm8903: Expose GPIOs
through gpiolib", where the behaviour was changed due to my lack of
awareness of the above rationale.

This patch reverts to the intended behaviour, and updates all in-tree users
to use the correct scheme. This also makes WM8903 consistent with other
devices that use a similar scheme.

WM8903_GPIO_NO_CONFIG is also renamed to WM8903_GPIO_CONFIG_ZERO so that
its name accurately reflects its purpose.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
Olof, Colin, could you please ack this so that Mark can apply it to the
ASoC tree even though it touches Tegra code? Thanks.

 arch/arm/mach-tegra/board-harmony.c  |    8 ++++----
 arch/arm/mach-tegra/board-seaboard.c |    8 ++++----
 include/sound/wm8903.h               |    7 +++++--
 sound/soc/codecs/wm8903.c            |    3 ++-
 4 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index 60afd08..a37c11c 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -90,11 +90,11 @@ static struct wm8903_platform_data harmony_wm8903_pdata = {
 	.micdet_delay = 100,
 	.gpio_base = HARMONY_GPIO_WM8903(0),
 	.gpio_cfg = {
-		WM8903_GPIO_NO_CONFIG,
-		WM8903_GPIO_NO_CONFIG,
 		0,
-		WM8903_GPIO_NO_CONFIG,
-		WM8903_GPIO_NO_CONFIG,
+		0,
+		WM8903_GPIO_CONFIG_ZERO,
+		0,
+		0,
 	},
 };
 
diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c
index ce3c9a2..b8ddf53 100644
--- a/arch/arm/mach-tegra/board-seaboard.c
+++ b/arch/arm/mach-tegra/board-seaboard.c
@@ -171,11 +171,11 @@ static struct wm8903_platform_data wm8903_pdata = {
 	.micdet_delay = 100,
 	.gpio_base = SEABOARD_GPIO_WM8903(0),
 	.gpio_cfg = {
-		WM8903_GPIO_NO_CONFIG,
-		WM8903_GPIO_NO_CONFIG,
 		0,
-		WM8903_GPIO_NO_CONFIG,
-		WM8903_GPIO_NO_CONFIG,
+		0,
+		WM8903_GPIO_CONFIG_ZERO,
+		0,
+		0,
 	},
 };
 
diff --git a/include/sound/wm8903.h b/include/sound/wm8903.h
index cf7ccb7..b310c5a 100644
--- a/include/sound/wm8903.h
+++ b/include/sound/wm8903.h
@@ -11,8 +11,11 @@
 #ifndef __LINUX_SND_WM8903_H
 #define __LINUX_SND_WM8903_H
 
-/* Used to enable configuration of a GPIO to all zeros */
-#define WM8903_GPIO_NO_CONFIG 0x8000
+/*
+ * Used to enable configuration of a GPIO to all zeros; a gpio_cfg value of
+ * zero in platform data means "don't touch this pin".
+ */
+#define WM8903_GPIO_CONFIG_ZERO 0x8000
 
 /*
  * R6 (0x06) - Mic Bias Control 0
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index a3e5620..3070a94 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1892,7 +1892,8 @@ static int wm8903_probe(struct snd_soc_codec *codec)
 		bool mic_gpio = false;
 
 		for (i = 0; i < ARRAY_SIZE(pdata->gpio_cfg); i++) {
-			if (pdata->gpio_cfg[i] > 0x7fff)
+			if ((!pdata->gpio_cfg[i]) ||
+			    (pdata->gpio_cfg[i] > WM8903_GPIO_CONFIG_ZERO))
 				continue;
 
 			snd_soc_write(codec, WM8903_GPIO_CONTROL_1 + i,
-- 
1.7.0.4
