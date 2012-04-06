From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: fix i2s compilation when !CONFIG_DEBUG_FS
Date: Thu,  5 Apr 2012 23:11:16 -0600
Message-ID: <1333689076-24454-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Commit d4a2eca "ASoC: Tegra I2S: Remove dependency on pdev->id" changed
the prototype of tegra_i2s_debug_add, but didn't update the dummy inline
used when !CONFIG_DEBUG_FS. Fix that.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.3
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_i2s.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 86f5ca4..64fd12e 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -116,7 +116,7 @@ static void tegra_i2s_debug_remove(struct tegra_i2s *i2s)
 		debugfs_remove(i2s->debug);
 }
 #else
-static inline void tegra_i2s_debug_add(struct tegra_i2s *i2s, int id)
+static inline void tegra_i2s_debug_add(struct tegra_i2s *i2s)
 {
 }
 
-- 
1.7.5.4
