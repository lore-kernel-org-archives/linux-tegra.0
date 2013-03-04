From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: fix I2S bit count mask
Date: Mon,  4 Mar 2013 15:46:34 -0700
Message-ID: <1362437194-6193-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This register field is 11 bits wide, not 15 bits wide. Given the way
this value is currently, used, this patch has no practical effect.
However, it's still best if the value is correct.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra30_i2s.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_i2s.h b/sound/soc/tegra/tegra30_i2s.h
index 34dc47b..a294d94 100644
--- a/sound/soc/tegra/tegra30_i2s.h
+++ b/sound/soc/tegra/tegra30_i2s.h
@@ -110,7 +110,7 @@
 
 #define TEGRA30_I2S_TIMING_NON_SYM_ENABLE		(1 << 12)
 #define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT	0
-#define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US	0x7fff
+#define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US	0x7ff
 #define TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK	(TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_MASK_US << TEGRA30_I2S_TIMING_CHANNEL_BIT_COUNT_SHIFT)
 
 /* Fields in TEGRA30_I2S_OFFSET */
-- 
1.7.10.4
