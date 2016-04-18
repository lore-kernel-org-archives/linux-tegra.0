From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v3 1/2] i2c: tegra: add separate function for config_load
Date: Mon, 18 Apr 2016 18:45:54 +0530
Message-ID: <1460985355-28901-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, gnurou@gmail.com, smohammed@nvidia.com
List-Id: linux-tegra@vger.kernel.org

- Define separate function for configuration load register handling
to make it use by different functions later.
- Instead of calculating timeout for the config load during init,
calculate it when config load register is written. Also use the
msecs_to_jiffies for timeout calculation instead of macro HZ.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

Changes since v1:
- Add separate function for config load handling
---
 drivers/i2c/busses/i2c-tegra.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d764d64..6235f16 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -423,12 +423,31 @@ static inline void tegra_i2c_clock_disable(struct tegra_i2c_dev *i2c_dev)
 		clk_disable(i2c_dev->fast_clk);
 }
 
+static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned long timeout;
+
+	if (i2c_dev->hw->has_config_load_reg) {
+		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+		timeout = jiffies + msecs_to_jiffies(1000);
+		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
+			if (time_after(jiffies, timeout)) {
+				dev_warn(i2c_dev->dev,
+					 "timeout waiting for config load\n");
+				return -ETIMEDOUT;
+			}
+			msleep(1);
+		}
+	}
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 	int err = 0;
 	u32 clk_divisor;
-	unsigned long timeout = jiffies + HZ;
 
 	err = tegra_i2c_clock_enable(i2c_dev);
 	if (err < 0) {
@@ -477,25 +496,17 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
-			if (time_after(jiffies, timeout)) {
-				dev_warn(i2c_dev->dev,
-					"timeout waiting for config load\n");
-				return -ETIMEDOUT;
-			}
-			msleep(1);
-		}
-	}
-
-	tegra_i2c_clock_disable(i2c_dev);
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		goto err;
 
 	if (i2c_dev->irq_disabled) {
 		i2c_dev->irq_disabled = 0;
 		enable_irq(i2c_dev->irq);
 	}
 
+err:
+	tegra_i2c_clock_disable(i2c_dev);
 	return err;
 }
 
-- 
1.8.1.5
