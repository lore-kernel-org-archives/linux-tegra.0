From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v5 2/4] i2c: tegra: calculate timeout for config load when needed
Date: Mon, 25 Apr 2016 17:15:16 +0530
Message-ID: <1461584718-23217-2-git-send-email-smohammed@nvidia.com>
References: <1461584718-23217-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461584718-23217-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
Cc: Shardar Shariff Md <smohammed@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Instead of calculating timeout for the config load during init,
calculate it after config load register is written by using
readx_poll_timeout().

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

---
Changes in v4:
- Split timeout calculation to separate patch

Changes in v5:
- Move disabling of clock to separate patch
---
 drivers/i2c/busses/i2c-tegra.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e8507f6..2869445 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -28,6 +28,7 @@
 #include <linux/of_device.h>
 #include <linux/module.h>
 #include <linux/reset.h>
+#include <linux/iopoll.h>
 
 #include <asm/unaligned.h>
 
@@ -110,6 +111,8 @@
 #define I2C_CLKEN_OVERRIDE			0x090
 #define I2C_MST_CORE_CLKEN_OVR			(1 << 0)
 
+#define I2C_CONFIG_LOAD_TIMEOUT			1000000
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -428,7 +431,6 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	u32 val;
 	int err = 0;
 	u32 clk_divisor;
-	unsigned long timeout = jiffies + HZ;
 
 	err = tegra_i2c_clock_enable(i2c_dev);
 	if (err < 0) {
@@ -478,15 +480,17 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
 	if (i2c_dev->hw->has_config_load_reg) {
+		u32 val;
+
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
-			if (time_after(jiffies, timeout)) {
-				dev_warn(i2c_dev->dev,
-					"timeout waiting for config load\n");
-				err = -ETIMEDOUT;
-				goto err;
-			}
-			msleep(1);
+		err = readx_poll_timeout(readl, i2c_dev->base +
+					 tegra_i2c_reg_addr(i2c_dev,
+					 I2C_CONFIG_LOAD), val, val == 0,
+					 1000, I2C_CONFIG_LOAD_TIMEOUT);
+		if (err) {
+			dev_warn(i2c_dev->dev,
+				 "timeout waiting for config load\n");
+			goto err;
 		}
 	}
 
-- 
1.8.1.5
