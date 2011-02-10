From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/7] ASoC: WM8903: Fix mic detection register definitions
Date: Thu, 10 Feb 2011 15:37:13 -0700
Message-ID: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* There is no hysteresis enable field in the current datasheet.
* Mic detection threshold field is only 2 bits wide.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/sound/wm8903.h |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/include/sound/wm8903.h b/include/sound/wm8903.h
index 86172cf..cf7ccb7 100644
--- a/include/sound/wm8903.h
+++ b/include/sound/wm8903.h
@@ -17,13 +17,9 @@
 /*
  * R6 (0x06) - Mic Bias Control 0
  */
-#define WM8903_MICDET_HYST_ENA                  0x0080  /* MICDET_HYST_ENA */
-#define WM8903_MICDET_HYST_ENA_MASK             0x0080  /* MICDET_HYST_ENA */
-#define WM8903_MICDET_HYST_ENA_SHIFT                 7  /* MICDET_HYST_ENA */
-#define WM8903_MICDET_HYST_ENA_WIDTH                 1  /* MICDET_HYST_ENA */
-#define WM8903_MICDET_THR_MASK                  0x0070  /* MICDET_THR - [6:4] */
-#define WM8903_MICDET_THR_SHIFT                      4  /* MICDET_THR - [6:4] */
-#define WM8903_MICDET_THR_WIDTH                      3  /* MICDET_THR - [6:4] */
+#define WM8903_MICDET_THR_MASK                  0x0030  /* MICDET_THR - [5:4] */
+#define WM8903_MICDET_THR_SHIFT                      4  /* MICDET_THR - [5:4] */
+#define WM8903_MICDET_THR_WIDTH                      2  /* MICDET_THR - [5:4] */
 #define WM8903_MICSHORT_THR_MASK                0x000C  /* MICSHORT_THR - [3:2] */
 #define WM8903_MICSHORT_THR_SHIFT                    2  /* MICSHORT_THR - [3:2] */
 #define WM8903_MICSHORT_THR_WIDTH                    2  /* MICSHORT_THR - [3:2] */
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
