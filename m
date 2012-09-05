From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2] ASoC: tegra: move platform data header
Date: Wed,  5 Sep 2012 10:27:14 -0600
Message-ID: <1346862434-12012-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Move the Tegra+WM8903 ASoC platform data header out of
arch/arm/mach-tegra, as a pre-requisite of single zImage.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2:
* Remove stale filename from comment.
* Add include guards
---
 .../sound/tegra_wm8903.h                           |    7 +++++--
 sound/soc/tegra/tegra_wm8903.c                     |    3 +--
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h => include/sound/tegra_wm8903.h (89%)

diff --git a/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h b/include/sound/tegra_wm8903.h
similarity index 89%
rename from arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
rename to include/sound/tegra_wm8903.h
index 9d29334..57b202e 100644
--- a/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
+++ b/include/sound/tegra_wm8903.h
@@ -1,6 +1,4 @@
 /*
- * arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
- *
  * Copyright 2011 NVIDIA, Inc.
  *
  * This software is licensed under the terms of the GNU General Public
@@ -14,6 +12,9 @@
  *
  */
 
+#ifndef __SOUND_TEGRA_WM38903_H
+#define __SOUND_TEGRA_WM38903_H
+
 struct tegra_wm8903_platform_data {
 	int gpio_spkr_en;
 	int gpio_hp_det;
@@ -21,3 +22,5 @@ struct tegra_wm8903_platform_data {
 	int gpio_int_mic_en;
 	int gpio_ext_mic_en;
 };
+
+#endif
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index d4f14e4..cee13b7 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -34,13 +34,12 @@
 #include <linux/gpio.h>
 #include <linux/of_gpio.h>
 
-#include <mach/tegra_wm8903_pdata.h>
-
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include <sound/tegra_wm8903.h>
 
 #include "../codecs/wm8903.h"
 
-- 
1.7.0.4
