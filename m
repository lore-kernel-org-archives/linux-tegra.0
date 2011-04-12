From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] ASoC: Tegra: Rename pdev tegra-snd-harmony to tegra-snd-wm8903
Date: Tue, 12 Apr 2011 11:29:00 -0600
Message-ID: <1302629341-2302-3-git-send-email-swarren@nvidia.com>
References: <1302629341-2302-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302629341-2302-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, konkers-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Soon, this machine driver will be updated to handle a number of Tegra boards
using the WM8903 codec. Rename the platform device in advance to reflect this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch needs special merge handling; please see the cover letter.

 arch/arm/mach-tegra/board-harmony.c |    2 +-
 sound/soc/tegra/harmony.c           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index 3c6bba2..987c5e4 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -75,7 +75,7 @@ static struct tegra_wm8903_platform_data harmony_audio_pdata = {
 };
 
 static struct platform_device harmony_audio_device = {
-	.name	= "tegra-snd-harmony",
+	.name	= "tegra-snd-wm8903",
 	.id	= 0,
 	.dev	= {
 		.platform_data  = &harmony_audio_pdata,
diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index f511017..6bd1e42 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -50,7 +50,7 @@
 #include "tegra_pcm.h"
 #include "tegra_asoc_utils.h"
 
-#define DRV_NAME "tegra-snd-harmony"
+#define DRV_NAME "tegra-snd-wm8903"
 
 #define GPIO_SPKR_EN    BIT(0)
 #define GPIO_INT_MIC_EN BIT(1)
-- 
1.7.1
