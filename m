From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 5/5] i2c: tegra: convert normal suspend/resume to *_noirq
Date: Tue, 10 Jul 2012 16:50:44 +0530
Message-ID: <1341919244-23327-6-git-send-email-ldewangan@nvidia.com>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: w.sang@pengutronix.de, khali@linux-fr.org, ben-linux@fluff.org
Cc: swarren@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

To provide the late suspend and early resume for i2c
driver, convert the suspend/resume as
	suspend-> suspend_noirq
	resume -> resume_noirq

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 5f0572d..99e6ae5 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -713,7 +713,7 @@ static int __devexit tegra_i2c_remove(struct platform_device *pdev)
 }
 
 #ifdef CONFIG_PM
-static int tegra_i2c_suspend(struct device *dev)
+static int tegra_i2c_suspend_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
@@ -725,7 +725,7 @@ static int tegra_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_i2c_resume(struct device *dev)
+static int tegra_i2c_resume_noirq(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
@@ -748,8 +748,8 @@ static int tegra_i2c_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops tegra_i2c_dev_pm_ops = {
-	.suspend = tegra_i2c_suspend,
-	.resume = tegra_i2c_resume,
+	.suspend_noirq = tegra_i2c_suspend_noirq,
+	.resume_noirq = tegra_i2c_resume_noirq,
 };
 #define TEGRA_I2C_DEV_PM_OPS (&tegra_i2c_dev_pm_ops)
 #else
-- 
1.7.1.1
