From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 2/2] ASoC: tegra: implement suspend/resume for Tegra30 I2S
Date: Mon,  3 Jun 2013 11:37:42 -0600
Message-ID: <1370281062-15238-2-git-send-email-swarren@wwwdotorg.org>
References: <1370281062-15238-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370281062-15238-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add tegra30_i2s_{suspend,resume}. These use regcache functions to
restore all HW registers after power loss during a suspend/resume cycle.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 sound/soc/tegra/tegra30_i2s.c |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 31d092d..bd0ebc0 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -514,6 +514,24 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int tegra30_i2s_suspend(struct device *dev)
+{
+	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
+
+	regcache_mark_dirty(i2s->regmap);
+
+	return 0;
+}
+
+static int tegra30_i2s_resume(struct device *dev)
+{
+	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
+
+	return regcache_sync(i2s->regmap);
+}
+#endif
+
 static const struct of_device_id tegra30_i2s_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2s", },
 	{},
@@ -522,6 +540,7 @@ static const struct of_device_id tegra30_i2s_of_match[] = {
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
 			   tegra30_i2s_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra30_i2s_suspend, tegra30_i2s_resume)
 };
 
 static struct platform_driver tegra30_i2s_driver = {
-- 
1.7.10.4
