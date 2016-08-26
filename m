From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 9/9] i2c: tegra: Add pinctrl support
Date: Fri, 26 Aug 2016 14:09:05 +0100
Message-ID: <1472216945-11818-10-git-send-email-jonathanh@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tegra124/132 the pins for I2C6 are shared with the Display Port AUX
(DPAUX) channel and on Tegra210 the pins for I2C4 and I2C6 are shared
with DPAUX1 and DPAUX0, respectively. The multiplexing of the pins is
handled by a register in the DPAUX and so the Tegra DPAUX driver has
been updated to register a pinctrl device for managing these pins.

The pins for these particular I2C devices are bound to the I2C device
prior to probing. However, these I2C devices are in a different power
partition to the DPAUX devices that own the pins. Hence, it is desirable
to place the pins in the 'idle' state and allow the DPAUX power
partition to switch off, when these I2C devices is not in use.
Therefore, add calls to place the I2C pins in the 'default' and 'idle'
states when the I2C device is runtime resumed and suspended,
respectively.

Please note that the pinctrl functions that set the state of the pins
check to see if the devices has pins associated and will return zero
if they do not. Therefore, it is safe to call these pinctrl functions
even for I2C devices that do not have any pins associated.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 05e34dc29d5a..d86a993b75d6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -28,6 +28,7 @@
 #include <linux/of_device.h>
 #include <linux/module.h>
 #include <linux/reset.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
 
 #include <asm/unaligned.h>
@@ -407,6 +408,10 @@ static int tegra_i2c_runtime_resume(struct device *dev)
 	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 	int ret;
 
+	ret = pinctrl_pm_select_default_state(i2c_dev->dev);
+	if (ret)
+		return ret;
+
 	if (!i2c_dev->hw->has_single_clk_source) {
 		ret = clk_enable(i2c_dev->fast_clk);
 		if (ret < 0) {
@@ -435,7 +440,7 @@ static int tegra_i2c_runtime_suspend(struct device *dev)
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_disable(i2c_dev->fast_clk);
 
-	return 0;
+	return pinctrl_pm_select_idle_state(i2c_dev->dev);
 }
 
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
-- 
2.1.4
