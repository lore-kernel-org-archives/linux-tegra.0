From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] ASoC: tegra: Remove redundant initialisation of compat_filter_fn
Date: Sat, 19 Oct 2013 14:17:03 +0100
Message-ID: <1382188623-19494-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Setting a field in a static struct to NULL has no effect so don't bother
(and don't generate false positives for grep).

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 sound/soc/tegra/tegra_pcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index f056f63..7b2d23b 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -56,7 +56,6 @@ static const struct snd_pcm_hardware tegra_pcm_hardware = {
 static const struct snd_dmaengine_pcm_config tegra_dmaengine_pcm_config = {
 	.pcm_hardware = &tegra_pcm_hardware,
 	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
-	.compat_filter_fn = NULL,
 	.prealloc_buffer_size = PAGE_SIZE * 8,
 };
 
-- 
1.8.4.rc3
