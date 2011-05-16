From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ASoC: Tegra: Fix compile when debugfs not enabled
Date: Mon, 16 May 2011 14:19:27 -0600
Message-ID: <1305577167-16152-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The prototype of the inline dummy version of tegra_i2s_debug_add
was not consistent with the real version.

Reported-by: Rhyland-Klein < rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra_i2s.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/soc/tegra/tegra_i2s.c b/sound/soc/tegra/tegra_i2s.c
index 4f5e2c9..6b817e2 100644
--- a/sound/soc/tegra/tegra_i2s.c
+++ b/sound/soc/tegra/tegra_i2s.c
@@ -114,7 +114,7 @@ static void tegra_i2s_debug_remove(struct tegra_i2s *i2s)
 		debugfs_remove(i2s->debug);
 }
 #else
-static inline void tegra_i2s_debug_add(struct tegra_i2s *i2s)
+static inline void tegra_i2s_debug_add(struct tegra_i2s *i2s, int id)
 {
 }
 
-- 
1.7.0.4
