From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/6] i2c: tegra: Add runtime power-management support
Date: Thu, 11 Aug 2016 11:16:59 +0100
Message-ID: <1470910620-9898-6-git-send-email-jonathanh@nvidia.com>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Update the Tegra I2C driver to use runtime PM and move the code in the
tegra_i2c_clock_enable/disable() functions to the PM runtime resume and
suspend callbacks, respectively.

Note that given that CONFIG_PM is not mandatory for Tegra, if CONFIG_PM
is not enabled and so runtime PM is not enabled, ensure that the I2C
clocks are turned on during probe and kept on by calling the resume
callback directly.

In the function tegra_i2c_init(), the variable 'err' does not need to be
initialised to zero in tegra_i2c_init() because it is initialised when
pm_runtime_get_sync() is called. Furthermore, to ensure we only return 0
from tegra_i2c_init(), it is necessary to re-initialise 'err' to 0 after
a successful call to pm_runtime_get_sync() because it can return a
positive value on success. However, alternatively re-initialise 'err' by
using the return value of the function tegra_i2c_flush_fifos() because
it can only be 0 or -ETIMEDOUT.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 61 ++++++++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4eaf3c4a531b..4391a74d7616 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -28,6 +28,7 @@
 #include <linux/of_device.h>
 #include <linux/module.h>
 #include <linux/reset.h>
+#include <linux/pm_runtime.h>
 
 #include <asm/unaligned.h>
 
@@ -396,9 +397,11 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
 }
 
-static inline int tegra_i2c_clock_enable(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_runtime_resume(struct device *dev)
 {
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int ret;
+
 	if (!i2c_dev->hw->has_single_clk_source) {
 		ret = clk_enable(i2c_dev->fast_clk);
 		if (ret < 0) {
@@ -407,32 +410,39 @@ static inline int tegra_i2c_clock_enable(struct tegra_i2c_dev *i2c_dev)
 			return ret;
 		}
 	}
+
 	ret = clk_enable(i2c_dev->div_clk);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev,
 			"Enabling div clk failed, err %d\n", ret);
 		clk_disable(i2c_dev->fast_clk);
+		return ret;
 	}
-	return ret;
+
+	return 0;
 }
 
-static inline void tegra_i2c_clock_disable(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_runtime_suspend(struct device *dev)
 {
+	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+
 	clk_disable(i2c_dev->div_clk);
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_disable(i2c_dev->fast_clk);
+
+	return 0;
 }
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
-	int err = 0;
+	int err;
 	u32 clk_divisor;
 	unsigned long timeout = jiffies + HZ;
 
-	err = tegra_i2c_clock_enable(i2c_dev);
+	err = pm_runtime_get_sync(i2c_dev->dev);
 	if (err < 0) {
-		dev_err(i2c_dev->dev, "Clock enable failed %d\n", err);
+		dev_err(i2c_dev->dev, "runtime resume failed %d\n", err);
 		return err;
 	}
 
@@ -471,8 +481,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		0 << I2C_FIFO_CONTROL_RX_TRIG_SHIFT;
 	i2c_writel(i2c_dev, val, I2C_FIFO_CONTROL);
 
-	if (tegra_i2c_flush_fifos(i2c_dev))
-		err = -ETIMEDOUT;
+	err = tegra_i2c_flush_fifos(i2c_dev);
 
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
@@ -496,7 +505,7 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	}
 
 err:
-	tegra_i2c_clock_disable(i2c_dev);
+	pm_runtime_put(i2c_dev->dev);
 	return err;
 }
 
@@ -670,9 +679,9 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 	if (i2c_dev->is_suspended)
 		return -EBUSY;
 
-	ret = tegra_i2c_clock_enable(i2c_dev);
+	ret = pm_runtime_get_sync(i2c_dev->dev);
 	if (ret < 0) {
-		dev_err(i2c_dev->dev, "Clock enable failed %d\n", ret);
+		dev_err(i2c_dev->dev, "runtime resume failed %d\n", ret);
 		return ret;
 	}
 
@@ -688,7 +697,9 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		if (ret)
 			break;
 	}
-	tegra_i2c_clock_disable(i2c_dev);
+
+	pm_runtime_put(i2c_dev->dev);
+
 	return ret ?: i;
 }
 
@@ -896,12 +907,21 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_fast_clk;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = tegra_i2c_runtime_resume(&pdev->dev);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "runtime resume failed\n");
+			goto unprepare_div_clk;
+		}
+	}
+
 	if (i2c_dev->is_multimaster_mode) {
 		ret = clk_enable(i2c_dev->div_clk);
 		if (ret < 0) {
 			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
 				ret);
-			goto unprepare_div_clk;
+			goto disable_rpm;
 		}
 	}
 
@@ -939,6 +959,11 @@ disable_div_clk:
 	if (i2c_dev->is_multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
+disable_rpm:
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_i2c_runtime_suspend(&pdev->dev);
+
 unprepare_div_clk:
 	clk_unprepare(i2c_dev->div_clk);
 
@@ -957,6 +982,10 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	if (i2c_dev->is_multimaster_mode)
 		clk_disable(i2c_dev->div_clk);
 
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		tegra_i2c_runtime_suspend(&pdev->dev);
+
 	clk_unprepare(i2c_dev->div_clk);
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_unprepare(i2c_dev->fast_clk);
@@ -992,7 +1021,11 @@ static int tegra_i2c_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(tegra_i2c_pm, tegra_i2c_suspend, tegra_i2c_resume);
+static const struct dev_pm_ops tegra_i2c_pm = {
+	SET_RUNTIME_PM_OPS(tegra_i2c_runtime_suspend, tegra_i2c_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(tegra_i2c_suspend, tegra_i2c_resume)
+};
 #define TEGRA_I2C_PM	(&tegra_i2c_pm)
 #else
 #define TEGRA_I2C_PM	NULL
-- 
2.1.4
