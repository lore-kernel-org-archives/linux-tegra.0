From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v4 2/3] i2c: tegra: add separate function for config_load
Date: Sat, 23 Apr 2016 16:33:58 +0530
Message-ID: <1461409439-32385-2-git-send-email-smohammed@nvidia.com>
References: <1461409439-32385-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461409439-32385-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
Cc: Shardar Shariff Md <smohammed@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Define separate function for configuration load register handling
to make it use by different functions later.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

---
Changes in v2:
- Remove unnecessary paranthesis and align to 80 characters per line

Changes in v3:
- Add separate function for config load handling

Changes in v4:
- Move timeout calculation to separate patch
---
 drivers/i2c/busses/i2c-tegra.c | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c1b02c7..8d49995 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -426,6 +426,27 @@ static inline void tegra_i2c_clock_disable(struct tegra_i2c_dev *i2c_dev)
 		clk_disable(i2c_dev->fast_clk);
 }
 
+static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
+{
+	if (i2c_dev->hw->has_config_load_reg) {
+		u32 val;
+		int err;
+
+		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+		err = readx_poll_timeout(readl, i2c_dev->base +
+					 tegra_i2c_reg_addr(i2c_dev,
+					 I2C_CONFIG_LOAD), val, val == 0,
+					 1000, I2C_CONFIG_LOAD_TIMEOUT);
+		if (err) {
+			dev_warn(i2c_dev->dev,
+				 "timeout waiting for config load\n");
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
@@ -479,20 +500,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		u32 val;
-
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		err = readx_poll_timeout(readl, i2c_dev->base +
-					 tegra_i2c_reg_addr(i2c_dev,
-					 I2C_CONFIG_LOAD), val, val == 0,
-					 1000, I2C_CONFIG_LOAD_TIMEOUT);
-		if (err) {
-			dev_warn(i2c_dev->dev,
-				 "timeout waiting for config load\n");
-			goto err;
-		}
-	}
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		goto err;
 
 	if (i2c_dev->irq_disabled) {
 		i2c_dev->irq_disabled = 0;
-- 
1.8.1.5
