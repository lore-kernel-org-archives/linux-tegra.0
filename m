From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/7] ASoC: Harmony: Call snd_soc_dapm_nc_pin
Date: Thu, 10 Feb 2011 15:37:17 -0700
Message-ID: <1297377439-27382-5-git-send-email-swarren@nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297377439-27382-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/harmony.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/sound/soc/tegra/harmony.c b/sound/soc/tegra/harmony.c
index 2fbfa10..6cbb352 100644
--- a/sound/soc/tegra/harmony.c
+++ b/sound/soc/tegra/harmony.c
@@ -236,6 +236,11 @@ static int harmony_asoc_init(struct snd_soc_pcm_runtime *rtd)
 
 	snd_soc_dapm_force_enable_pin(dapm, "Mic Bias");
 
+	snd_soc_dapm_nc_pin(dapm, "IN3L");
+	snd_soc_dapm_nc_pin(dapm, "IN3R");
+	snd_soc_dapm_nc_pin(dapm, "LINEOUTL");
+	snd_soc_dapm_nc_pin(dapm, "LINEOUTR");
+
 	snd_soc_dapm_sync(dapm);
 
 	return 0;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
