From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 1/2] ASoC: tegra: implement suspend/resume for Tegra30 AHUB
Date: Mon,  3 Jun 2013 11:37:41 -0600
Message-ID: <1370281062-15238-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tegra30_ahub_{suspend,resume}. These use regcache functions to
restore all HW registers after power loss during a suspend/resume cycle.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra30_ahub.c |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 23e592f..0f4787c 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -627,9 +627,30 @@ static int tegra30_ahub_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int tegra30_ahub_suspend(struct device *dev)
+{
+	regcache_mark_dirty(ahub->regmap_ahub);
+	regcache_mark_dirty(ahub->regmap_apbif);
+
+	return 0;
+}
+
+static int tegra30_ahub_resume(struct device *dev)
+{
+	int ret;
+
+	ret = regcache_sync(ahub->regmap_ahub);
+	ret |= regcache_sync(ahub->regmap_apbif);
+
+	return ret;
+}
+#endif
+
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
 			   tegra30_ahub_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra30_ahub_suspend, tegra30_ahub_resume)
 };
 
 static struct platform_driver tegra30_ahub_driver = {
-- 
1.7.10.4
