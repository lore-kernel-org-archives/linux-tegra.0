From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Fri,  5 Aug 2011 17:15:02 -0600
Message-ID: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

We found the register settings of wm8903(an audio codec) can't be modified
in snd_soc_suspend since I2C bus has been suspended before snd_soc_suspend.

Pop noise will occur when system resume from LP0 if the register settings of wm8903
haven't be modified correctly in snd_soc_suspend.

So, we use the suspend_noirq/resume_noirq callbacks to make sure I2C bus still
operates while running snd_soc_suspend.

Signed-off-by: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
When applying this, you'll get a trivial merge conflict with the other
i2c-tegra.c patch I just reposted titled "i2c: Tegra: Add of_match_table".
Just add the two lines to tegra_i2c_driver.driver in whichever order you
prefer:-).

 drivers/i2c/busses/i2c-tegra.c |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0c6e840..3d2bf19 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -687,8 +687,9 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int tegra_i2c_suspend(struct platform_device *pdev, pm_message_t state)
+static int tegra_i2c_suspend_noirq(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_lock_adapter(&i2c_dev->adapter);
@@ -698,8 +699,9 @@ static int tegra_i2c_suspend(struct platform_device *pdev, pm_message_t state)
 	return 0;
 }
 
-static int tegra_i2c_resume(struct platform_device *pdev)
+static int tegra_i2c_resume_noirq(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 	int ret;
 
@@ -718,18 +720,23 @@ static int tegra_i2c_resume(struct platform_device *pdev)
 
 	return 0;
 }
+
+static const struct dev_pm_ops tegra_i2c_dev_pm_ops = {
+	.suspend_noirq = tegra_i2c_suspend_noirq,
+	.resume_noirq = tegra_i2c_resume_noirq,
+};
+#define TEGRA_I2C_DEV_PM_OPS (&tegra_i2c_dev_pm_ops)
+#else
+#define TEGRA_I2C_DEV_PM_OPS NULL
 #endif
 
 static struct platform_driver tegra_i2c_driver = {
 	.probe   = tegra_i2c_probe,
 	.remove  = tegra_i2c_remove,
-#ifdef CONFIG_PM
-	.suspend = tegra_i2c_suspend,
-	.resume  = tegra_i2c_resume,
-#endif
 	.driver  = {
 		.name  = "tegra-i2c",
 		.owner = THIS_MODULE,
+		.pm    = TEGRA_I2C_DEV_PM_OPS,
 	},
 };
 
-- 
1.7.0.4
