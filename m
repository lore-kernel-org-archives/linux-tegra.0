From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 03/17] ASoC: tegra: remove unnecessary includes
Date: Fri, 30 Mar 2012 17:07:18 -0600
Message-ID: <1333148852-17806-4-git-send-email-swarren@wwwdotorg.org>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148852-17806-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

These include aren't needed, and some of the files are about to be
renamed.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_alc5632.c |    3 ---
 sound/soc/tegra/tegra_wm8903.c  |    3 ---
 sound/soc/tegra/trimslice.c     |    3 ---
 3 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/sound/soc/tegra/tegra_alc5632.c b/sound/soc/tegra/tegra_alc5632.c
index 396181c..32de700 100644
--- a/sound/soc/tegra/tegra_alc5632.c
+++ b/sound/soc/tegra/tegra_alc5632.c
@@ -29,9 +29,6 @@
 
 #include "../codecs/alc5632.h"
 
-#include "tegra_das.h"
-#include "tegra_i2s.h"
-#include "tegra_pcm.h"
 #include "tegra_asoc_utils.h"
 
 #define DRV_NAME "tegra-alc5632"
diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index fbd1335..2f9e9ff 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -46,9 +46,6 @@
 
 #include "../codecs/wm8903.h"
 
-#include "tegra_das.h"
-#include "tegra_i2s.h"
-#include "tegra_pcm.h"
 #include "tegra_asoc_utils.h"
 
 #define DRV_NAME "tegra-snd-wm8903"
diff --git a/sound/soc/tegra/trimslice.c b/sound/soc/tegra/trimslice.c
index 6be9e0f..8884667 100644
--- a/sound/soc/tegra/trimslice.c
+++ b/sound/soc/tegra/trimslice.c
@@ -38,9 +38,6 @@
 
 #include "../codecs/tlv320aic23.h"
 
-#include "tegra_das.h"
-#include "tegra_i2s.h"
-#include "tegra_pcm.h"
 #include "tegra_asoc_utils.h"
 
 #define DRV_NAME "tegra-snd-trimslice"
-- 
1.7.0.4
