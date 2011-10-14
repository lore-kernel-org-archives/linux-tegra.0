From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ASoC: Tegra: sparse cleanup
Date: Fri, 14 Oct 2011 15:54:19 -0700
Message-ID: <1318632859-14796-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fixes the following sparse warnings:

sound/soc/tegra/tegra_das.c:215:8: warning: Using plain integer as NULL pointer
sound/soc/tegra/tegra_das.c:237:8: warning: Using plain integer as NULL pointer
sound/soc/tegra/tegra_pcm.c:370:32: warning: symbol 'tegra_pcm_platform' was not declared. Should it be static?

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 sound/soc/tegra/tegra_das.c |    4 ++--
 sound/soc/tegra/tegra_pcm.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_das.c b/sound/soc/tegra/tegra_das.c
index 9f24ef7..3b55a44 100644
--- a/sound/soc/tegra/tegra_das.c
+++ b/sound/soc/tegra/tegra_das.c
@@ -212,7 +212,7 @@ err_release:
 	release_mem_region(res->start, resource_size(res));
 err_free:
 	kfree(das);
-	das = 0;
+	das = NULL;
 exit:
 	return ret;
 }
@@ -234,7 +234,7 @@ static int __devexit tegra_das_remove(struct platform_device *pdev)
 	release_mem_region(res->start, resource_size(res));
 
 	kfree(das);
-	das = 0;
+	das = NULL;
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index c7cfd96..436def1 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -367,7 +367,7 @@ static void tegra_pcm_free(struct snd_pcm *pcm)
 	tegra_pcm_deallocate_dma_buffer(pcm, SNDRV_PCM_STREAM_PLAYBACK);
 }
 
-struct snd_soc_platform_driver tegra_pcm_platform = {
+static struct snd_soc_platform_driver tegra_pcm_platform = {
 	.ops		= &tegra_pcm_ops,
 	.pcm_new	= tegra_pcm_new,
 	.pcm_free	= tegra_pcm_free,
-- 
1.7.4.1
