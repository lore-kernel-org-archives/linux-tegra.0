From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: move platform data header
Date: Tue,  4 Sep 2012 16:43:46 -0600
Message-ID: <1346798626-28925-1-git-send-email-swarren@wwwdotorg.org>
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
 .../sound/tegra_wm8903.h                           |    0
 sound/soc/tegra/tegra_wm8903.c                     |    3 +--
 2 files changed, 1 insertions(+), 2 deletions(-)
 rename arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h => include/sound/tegra_wm8903.h (100%)

diff --git a/arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h b/include/sound/tegra_wm8903.h
similarity index 100%
rename from arch/arm/mach-tegra/include/mach/tegra_wm8903_pdata.h
rename to include/sound/tegra_wm8903.h
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
