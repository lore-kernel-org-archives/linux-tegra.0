From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1] i2c: tegra: Add I2C interface timing support
Date: Tue, 15 Jan 2019 12:50:53 -0800
Message-ID: <1547585453-22019-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch adds I2C interface timing register support and uses
it for clock divisor computation instead of using fixed value.

I2C_INTERFACE_TIMING_0 register contains TLOW and THIGH field
and Tegra I2C controller design uses them as a part of internal
clock divisor. TLOW and THIGH can be tuned for specific platform
to achive accurate bus rates.

Default values of TLOW and THIGH are good for existing tegra
platforms Jetson-TX1, Quill and Xavier AGX.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 70 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index e417ebf7628c..2e050af6b225 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -118,6 +118,13 @@
 #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
 #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
 
+#define I2C_INTERFACE_TIMING_0                  0x94
+#define I2C_TLOW_MASK                           0x3F
+#define I2C_THIGH_SHIFT                         8
+#define I2C_THIGH_MASK                          (0x3F << I2C_THIGH_SHIFT)
+#define I2C_TLOW_NEW_MASK			0xFF
+#define I2C_THIGH_NEW_MASK			(0xFF << I2C_THIGH_SHIFT)
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -155,6 +162,10 @@ enum msg_end_type {
  * @has_mst_fifo: The I2C controller contains the new MST FIFO interface that
  *		provides additional features and allows for longer messages to
  *		be transferred in one go.
+ * @interface_timing_enhancement: Interface Timing bit fields increased in
+ *		Tegra194 compared to Prior Tegra chips for more tuning to meet
+ *		I2C Timing requirements for various data rates.
+
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -167,6 +178,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	bool interface_timing_enhancement;
 };
 
 /**
@@ -515,7 +527,36 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
-static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_set_clk_rate(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 clk_multiplier = I2C_CLK_MULTIPLIER_STD_FAST_MODE;
+	u32 val;
+	u8 low_clk_period, high_clk_period;
+	int ret = 0;
+
+	val = i2c_readl(i2c_dev, I2C_INTERFACE_TIMING_0);
+
+	if (i2c_dev->hw->interface_timing_enhancement) {
+		low_clk_period = val & I2C_TLOW_NEW_MASK;
+		high_clk_period = (val & I2C_THIGH_NEW_MASK) >>
+							I2C_THIGH_SHIFT;
+	} else {
+		low_clk_period = val & I2C_TLOW_MASK;
+		high_clk_period = (val & I2C_THIGH_MASK) >> I2C_THIGH_SHIFT;
+	}
+
+	clk_multiplier = (low_clk_period + high_clk_period + 2);
+	clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
+
+	ret = clk_set_rate(i2c_dev->div_clk,
+			   i2c_dev->bus_clk_rate * clk_multiplier);
+	if (ret)
+		dev_err(i2c_dev->dev, "Clock rate change failed %d\n", ret);
+
+	return ret;
+}
+
+static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev, bool is_reinit)
 {
 	u32 val;
 	int err;
@@ -549,6 +590,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 					I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
 	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
 
+	if (!is_reinit) {
+		err = tegra_i2c_set_clk_rate(i2c_dev);
+		if (err < 0)
+			goto err;
+	}
+
 	if (!i2c_dev->is_dvc) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
@@ -747,7 +794,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 
-		tegra_i2c_init(i2c_dev);
+		tegra_i2c_init(i2c_dev, true);
 		return -ETIMEDOUT;
 	}
 
@@ -758,7 +805,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (likely(i2c_dev->msg_err == I2C_ERR_NONE))
 		return 0;
 
-	tegra_i2c_init(i2c_dev);
+	tegra_i2c_init(i2c_dev, true);
 	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
 		if (msg->flags & I2C_M_IGNORE_NAK)
 			return 0;
@@ -848,6 +895,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.interface_timing_enhancement = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -861,6 +909,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.interface_timing_enhancement = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -874,6 +923,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.interface_timing_enhancement = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -887,6 +937,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.interface_timing_enhancement = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -900,6 +951,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.interface_timing_enhancement = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -913,6 +965,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.interface_timing_enhancement = true,
 };
 
 /* Match table for of_platform binding */
@@ -937,7 +990,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int irq;
 	int ret = 0;
-	int clk_multiplier = I2C_CLK_MULTIPLIER_STD_FAST_MODE;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
@@ -1009,14 +1061,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		i2c_dev->clk_divisor_non_hs_mode =
 			i2c_dev->hw->clk_divisor_fast_plus_mode;
 
-	clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
-	ret = clk_set_rate(i2c_dev->div_clk,
-			   i2c_dev->bus_clk_rate * clk_multiplier);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Clock rate change failed %d\n", ret);
-		goto unprepare_fast_clk;
-	}
-
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
 		dev_err(i2c_dev->dev, "Clock prepare failed %d\n", ret);
@@ -1041,7 +1085,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = tegra_i2c_init(i2c_dev);
+	ret = tegra_i2c_init(i2c_dev, false);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
 		goto disable_div_clk;
-- 
2.7.4
