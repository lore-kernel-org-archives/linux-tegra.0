From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: don't flip master of DT-instantiated DAI links
Date: Mon, 14 May 2012 14:47:22 -0600
Message-ID: <1337028442-5603-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit 4924082 "ASoC: core: Flip master for CODECs in the CPU slot of a
CODEC<->CODEC link" added code that was conditional on there being no
PCM/DMA driver for the link. However, it failed to cover the case where
the link was instantiated from device tree, and hence was specified by
DT node rather than name.

This prevents the following error on Toshiba AC100:
aplay: pcm_write:1603: write error: Input/output error

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
I tested this fix on AC100 (ALC5632), Harmony (WM8903), and TrimSlice
(TLV320AIC23). I'm not sure why the issue only affected AC100. Perhaps
the other codecs support being the I2S master but the ALC5632 driver
doesn't?
---
 sound/soc/soc-core.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2783d2b..b37ee80 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1612,7 +1612,8 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 		}
 
 		/* If this is a regular CPU link there will be a platform */
-		if (dai_fmt && dai_link->platform_name) {
+		if (dai_fmt &&
+		    (dai_link->platform_name || dai_link->platform_of_node)) {
 			ret = snd_soc_dai_set_fmt(card->rtd[i].cpu_dai,
 						  dai_fmt);
 			if (ret != 0 && ret != -ENOTSUPP)
-- 
1.7.0.4
