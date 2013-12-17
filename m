From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2 RESEND 1/2] ASOC: tegra: fix matching of AC97 components
Date: Tue, 17 Dec 2013 11:52:43 +0100
Message-ID: <1387277564-4774-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Matching works completely based on the cpu of_node.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: no changes

CC: <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
CC: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
CC: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 sound/soc/tegra/tegra_wm9712.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm9712.c b/sound/soc/tegra/tegra_wm9712.c
index 5e11963..45b5789 100644
--- a/sound/soc/tegra/tegra_wm9712.c
+++ b/sound/soc/tegra/tegra_wm9712.c
@@ -55,7 +55,6 @@ static int tegra_wm9712_init(struct snd_soc_pcm_runtime *rtd)
 static struct snd_soc_dai_link tegra_wm9712_dai = {
 	.name = "AC97 HiFi",
 	.stream_name = "AC97 HiFi",
-	.cpu_dai_name = "tegra20-ac97",
 	.codec_dai_name = "wm9712-hifi",
 	.codec_name = "wm9712-codec",
 	.init = tegra_wm9712_init,
-- 
1.8.3.1
