From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH 3/5] i2c: tegra: add separate function for config_load programing
Date: Wed, 31 Aug 2016 18:52:36 +0530
Message-ID: <1472649758-5608-3-git-send-email-smohammed@nvidia.com>
References: <1472649758-5608-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472649758-5608-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: smohammed@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

Changes in v9:
- Rebase with the changes to earlier patch1

Changes in v10:
- Rebase on top of [PATCH V2 0/9] Some Tegra I2C Updates
---
---
 drivers/i2c/busses/i2c-tegra.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 07a39b7..daab0ce 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -446,6 +446,29 @@ static int tegra_i2c_runtime_suspend(struct device *dev)
 	return pinctrl_pm_select_idle_state(i2c_dev->dev);
 }
 
+static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned long reg_offset;
+	void __iomem *addr;
+	u32 val;
+	int err;
+
+	if (i2c_dev->hw->has_config_load_reg) {
+		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
+		addr = i2c_dev->base + reg_offset;
+		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+		err = readl_poll_timeout(addr, val, val == 0, 1000,
+					 I2C_CONFIG_LOAD_TIMEOUT);
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
@@ -500,21 +523,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		unsigned long reg_offset;
-		void __iomem *addr;
-
-		reg_offset = tegra_i2c_reg_addr(i2c_dev, I2C_CONFIG_LOAD);
-		addr = i2c_dev->base + reg_offset;
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		err = readl_poll_timeout(addr, val, val == 0, 1000,
-					 I2C_CONFIG_LOAD_TIMEOUT);
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
