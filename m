From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Wed,  6 May 2020 21:33:55 +0200
Message-ID: <20200506193358.2807244-3-thierry.reding@gmail.com>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200506193358.2807244-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Depending on the board design, the I2C controllers found on Tegra SoCs
may require pinmuxing in order to function. This is done as part of the
driver's runtime suspend/resume operations. However, the PM core does
not allow devices to go into runtime suspend during system sleep to
avoid potential races with the suspend/resume of their parents.

As a result of this, when Tegra SoCs resume from system suspend, their
I2C controllers may have lost the pinmux state in hardware, whereas the
pinctrl subsystem is not aware of this. To fix this, make sure that if
the I2C controller is not runtime suspended, the runtime suspend code is
still executed in order to disable the module clock (which we don't need
to be enabled during sleep) and set the pinmux to the idle state.

Conversely, make sure that the I2C controller is properly resumed when
waking up from sleep so that pinmux settings are properly restored.

This fixes a bug seen with DDC transactions to an HDMI monitor timing
out when resuming from system suspend.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 7c88611c732c..db142d897604 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 static int __maybe_unused tegra_i2c_suspend(struct device *dev)
 {
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
+	int err = 0;
 
 	i2c_mark_adapter_suspended(&i2c_dev->adapter);
 
-	return 0;
+	if (!pm_runtime_status_suspended(dev))
+		err = tegra_i2c_runtime_suspend(dev);
+
+	return err;
 }
 
 static int __maybe_unused tegra_i2c_resume(struct device *dev)
@@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
 	if (err)
 		return err;
 
-	err = tegra_i2c_runtime_suspend(dev);
-	if (err)
-		return err;
+	if (pm_runtime_status_suspended(dev)) {
+		err = tegra_i2c_runtime_suspend(dev);
+		if (err)
+			return err;
+	}
 
 	i2c_mark_adapter_resumed(&i2c_dev->adapter);
 
-- 
2.24.1
