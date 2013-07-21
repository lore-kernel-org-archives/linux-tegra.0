From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: [PATCH 2/4] ASOC: tegra: fix matching of AC97 components
Date: Sun, 21 Jul 2013 23:28:50 +0200
Message-ID: <1374442132-24040-3-git-send-email-dev@lynxeye.de>
References: <1374442132-24040-1-git-send-email-dev@lynxeye.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374442132-24040-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Matching works completely based on the cpu of_node.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
This got broken some time ago. No cc stable as it's not really a
regression, as I can't remember a single point in time when everything
AC97 related would have been in place and working.

CC: <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>
CC: <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
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
