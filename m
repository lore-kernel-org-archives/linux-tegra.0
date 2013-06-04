From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] ASoC: tegra: add runtime PM to resume functions
Date: Tue,  4 Jun 2013 12:58:14 -0600
Message-ID: <1370372294-25844-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra HW needs clocks etc. active when touching registers. Make sure they
are active during resume, by calling pm_runtime_get_sync() before touching
HW.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra30_ahub.c | 4 ++++
 sound/soc/tegra/tegra30_i2s.c  | 9 ++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 0f4787c..d554d46 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -640,8 +640,12 @@ static int tegra30_ahub_resume(struct device *dev)
 {
 	int ret;
 
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
 	ret = regcache_sync(ahub->regmap_ahub);
 	ret |= regcache_sync(ahub->regmap_apbif);
+	pm_runtime_put(dev);
 
 	return ret;
 }
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index bd0ebc0..d04146c 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -527,8 +527,15 @@ static int tegra30_i2s_suspend(struct device *dev)
 static int tegra30_i2s_resume(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
+	int ret;
 
-	return regcache_sync(i2s->regmap);
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0)
+		return ret;
+	ret = regcache_sync(i2s->regmap);
+	pm_runtime_put(dev);
+
+	return ret;
 }
 #endif
 
-- 
1.8.1.5
