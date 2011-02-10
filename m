From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/7] ASoC: Tegra: Add MODULE_ALIAS
Date: Thu, 10 Feb 2011 15:37:19 -0700
Message-ID: <1297377439-27382-7-git-send-email-swarren@nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297377439-27382-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

With the appropriate MODULE_ALIAS in place, the audio modules will be
automatically loaded; there is no longer a need for manual modprobes.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/harmony.c   |    1 +
 sound/soc/tegra/tegra_das.c |    1 +
 sound/soc/tegra/tegra_i2s.c |    1 +
 sound/soc/tegra/tegra_pcm.c |    5 ++++-
 4 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index c54d420..e6216b4 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -390,3 +390,4 @@ module_exit(snd_tegra_harmony_exit);
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Harmony machine ASoC driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/tegra/tegra_das.c b/sound/soc/tegra/tegra_das.c
index 01eb9c9..9f24ef7 100644
--- a/sound/soc/tegra/tegra_das.c
+++ b/sound/soc/tegra/tegra_das.c
@@ -262,3 +262,4 @@ module_exit(tegra_das_modexit);
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra DAS driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 870ee36..4f5e2c9 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -500,3 +500,4 @@ module_exit(snd_tegra_i2s_exit);
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra I2S ASoC driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 663ea9f..40540b1 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -39,6 +39,8 @@
 
 #include "tegra_pcm.h"
 
+#define DRV_NAME "tegra-pcm-audio"
+
 static const struct snd_pcm_hardware tegra_pcm_hardware = {
 	.info			= SNDRV_PCM_INFO_MMAP |
 				  SNDRV_PCM_INFO_MMAP_VALID |
@@ -377,7 +379,7 @@ static int __devexit tegra_pcm_platform_remove(struct platform_device *pdev)
 
 static struct platform_driver tegra_pcm_driver = {
 	.driver = {
-		.name = "tegra-pcm-audio",
+		.name = DRV_NAME,
 		.owner = THIS_MODULE,
 	},
 	.probe = tegra_pcm_platform_probe,
@@ -399,3 +401,4 @@ module_exit(snd_tegra_pcm_exit);
 MODULE_AUTHOR("Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("Tegra PCM ASoC driver");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
