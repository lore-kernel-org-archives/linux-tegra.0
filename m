From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v9 1/4] i2c: tegra: use readl_poll_timeout after config_load reg programmed
Date: Mon, 29 Aug 2016 22:06:36 +0530
Message-ID: <1472488599-13562-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: smohammed@nvidia.com, ldewangan@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

After CONFIG_LOAD register is programmed instead of explicitly waiting
for timeout, use readx_poll_timeout() to check for register value to get
updated or wait till timeout.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

---
Changes in v4:
- Split timeout calculation to separate patch

Changes in v5:
- Move disabling of clock to separate patch

Changes in v8:
- 1st change of [PATCH v7] series is merged, v8 is rebased on top of
  merged change, here patch series is changed accordingly.
- Updated the commit message as per review to properly reflect change.
- calculate the register offset seperately to make code more readable.

Changes in v9:
- Use readl_poll_timeout() instead of readx_poll_timeout()
---
---
 drivers/i2c/busses/i2c-tegra.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d9979da..41ffc8a 100644
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
@@ -478,15 +480,19 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
 	if (i2c_dev->hw->has_config_load_reg) {
+		unsigned long reg_offset;
+		void __iomem *addr;
+		u32 val;
+
+		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
+		addr = i2c_dev->base + reg_offset;
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
-			if (time_after(jiffies, timeout)) {
-				dev_warn(i2c_dev->dev,
-					"timeout waiting for config load\n");
-				err = -ETIMEDOUT;
-				goto err;
-			}
-			msleep(1);
+		err = readl_poll_timeout(addr, val, val == 0, 1000,
+					 I2C_CONFIG_LOAD_TIMEOUT);
+		if (err) {
+			dev_warn(i2c_dev->dev,
+				 "timeout waiting for config load\n");
+			goto err;
 		}
 	}
 
-- 
1.8.1.5
