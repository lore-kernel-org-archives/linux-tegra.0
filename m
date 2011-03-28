From: wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH] i2c: busses: i2c-tegra: Using suspend_noirq()/resume_noirq() for suspend/resume
Date: Mon, 28 Mar 2011 14:22:56 +0800
Message-ID: <1301293376-28224-1-git-send-email-wni@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, snanda-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

When use rtc-tps6586x wakealarm to suspend/resume,
it will show a lot error messages:
"tps6586x 4-0034: failed to read interrupt status
tps6586x 4-0034: failed reading from 0xb5"
After resume, the system will call tps6586x_irq() because of the alarm
interrupt. This irq handle will read tps6586x interrupt status (0xb5), but at
that time the i2c driver didn't resume yet, the system didn't call the
tegra_i2c_resume(), so the reading will be failed.
I2C driver needs to be suspended late and resumed early than other drivers.
So, I2C driver uses the suspend_noirq/resume_noirq callbacks of struct dev_pm_ops
for early/late power management system.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3921f66..c79761a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -636,8 +636,9 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int tegra_i2c_suspend(struct platform_device *pdev, pm_message_t state)
+static int tegra_i2c_suspend_noirq(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 
 	i2c_lock_adapter(&i2c_dev->adapter);
@@ -647,8 +648,9 @@ static int tegra_i2c_suspend(struct platform_device *pdev, pm_message_t state)
 	return 0;
 }
 
-static int tegra_i2c_resume(struct platform_device *pdev)
+static int tegra_i2c_resume_noirq(struct device *dev)
 {
+	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 	int ret;
 
@@ -667,18 +669,23 @@ static int tegra_i2c_resume(struct platform_device *pdev)
 
 	return 0;
 }
+
+static const struct dev_pm_ops tegra_i2c_dev_pm_ops = {
+	.suspend_noirq = tegra_i2c_suspend_noirq,
+	.resume_noirq  = tegra_i2c_resume_noirq,
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
1.7.0
