From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v2] i2c: tegra: enable multi master mode
Date: Mon, 14 Mar 2016 18:52:18 +0530
Message-ID: <1457961738-1927-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
To: ldewangan@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, smohammed@nvidia.com
List-Id: linux-tegra@vger.kernel.org

Enable multi-master mode in I2C_CNFG reg based on hw features.
Using single/multi-master mode bit introduced for Tegra210,
whereas multi-master mode is enabled by default in HW for T124 and
earlier Tegra SOC. Enabling this bit doesn't explicitly start
treating the bus has having multiple masters, but will start
checking for arbitration lost and reporting when it occurs.

The Tegra210 I2C controller supports single/multi master mode.
Add chipdata for Tegra210 and its compatibility string so that
Tegra210 will select data that enables multi master mode correctly.

Do below prerequisites for multi-master bus if "multi-master"
dt property entry is added.
 1. Enable 1st level clock always set.
 2. Disable 2nd level clock gating (slcg which
    is supported from T124 SOC and later chips)

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 74 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 68 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 929185a..d764d64 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -38,6 +38,7 @@
 #define I2C_CNFG_DEBOUNCE_CNT_SHIFT		12
 #define I2C_CNFG_PACKET_MODE_EN			(1<<10)
 #define I2C_CNFG_NEW_MASTER_FSM			(1<<11)
+#define I2C_CNFG_MULTI_MASTER_MODE		(1<<17)
 #define I2C_STATUS				0x01C
 #define I2C_SL_CNFG				0x020
 #define I2C_SL_CNFG_NACK			(1<<1)
@@ -106,6 +107,9 @@
 #define I2C_SLV_CONFIG_LOAD			(1 << 1)
 #define I2C_TIMEOUT_CONFIG_LOAD			(1 << 2)
 
+#define I2C_CLKEN_OVERRIDE			0x090
+#define I2C_MST_CORE_CLKEN_OVR			(1 << 0)
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -143,6 +147,8 @@ struct tegra_i2c_hw_feature {
 	int clk_divisor_hs_mode;
 	int clk_divisor_std_fast_mode;
 	u16 clk_divisor_fast_plus_mode;
+	bool has_multi_master_mode;
+	bool has_slcg_override_reg;
 };
 
 /**
@@ -184,6 +190,7 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_suspended;
+	bool is_multimaster_mode;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned long reg)
@@ -438,6 +445,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 	val = I2C_CNFG_NEW_MASTER_FSM | I2C_CNFG_PACKET_MODE_EN |
 		(0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
+
+	if (i2c_dev->hw->has_multi_master_mode)
+		val |= I2C_CNFG_MULTI_MASTER_MODE;
+
 	i2c_writel(i2c_dev, val, I2C_CNFG);
 	i2c_writel(i2c_dev, 0, I2C_INT_MASK);
 
@@ -463,6 +474,9 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (tegra_i2c_flush_fifos(i2c_dev))
 		err = -ETIMEDOUT;
 
+	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
+		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
+
 	if (i2c_dev->hw->has_config_load_reg) {
 		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
 		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
@@ -688,6 +702,20 @@ static u32 tegra_i2c_func(struct i2c_adapter *adap)
 	return ret;
 }
 
+static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
+{
+	struct device_node *np = i2c_dev->dev->of_node;
+	int ret;
+
+	ret = of_property_read_u32(np, "clock-frequency",
+			&i2c_dev->bus_clk_rate);
+	if (ret)
+		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
+
+	i2c_dev->is_multimaster_mode = of_property_read_bool(np,
+			"multi-master");
+}
+
 static const struct i2c_algorithm tegra_i2c_algo = {
 	.master_xfer	= tegra_i2c_xfer,
 	.functionality	= tegra_i2c_func,
@@ -707,6 +735,8 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.clk_divisor_std_fast_mode = 0,
 	.clk_divisor_fast_plus_mode = 0,
 	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -717,6 +747,8 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.clk_divisor_std_fast_mode = 0,
 	.clk_divisor_fast_plus_mode = 0,
 	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -727,6 +759,8 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.clk_divisor_std_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -737,10 +771,25 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.clk_divisor_std_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = true,
+};
+
+static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.has_single_clk_source = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = true,
+	.has_slcg_override_reg = true,
 };
 
 /* Match table for of_platform binding */
 static const struct of_device_id tegra_i2c_of_match[] = {
+	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
@@ -797,10 +846,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c_dev->rst);
 	}
 
-	ret = of_property_read_u32(i2c_dev->dev->of_node, "clock-frequency",
-					&i2c_dev->bus_clk_rate);
-	if (ret)
-		i2c_dev->bus_clk_rate = 100000; /* default clock rate */
+	tegra_i2c_parse_dt(i2c_dev);
 
 	i2c_dev->hw = &tegra20_i2c_hw;
 
@@ -853,6 +899,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		goto unprepare_fast_clk;
 	}
 
+	if (i2c_dev->is_multimaster_mode) {
+		ret = clk_enable(i2c_dev->div_clk);
+		if (ret < 0) {
+			dev_err(i2c_dev->dev, "div_clk enable failed %d\n",
+				ret);
+			goto unprepare_div_clk;
+		}
+	}
+
 	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize i2c controller");
@@ -863,7 +918,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 			tegra_i2c_isr, 0, dev_name(&pdev->dev), i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %i\n", i2c_dev->irq);
-		goto unprepare_div_clk;
+		goto disable_div_clk;
 	}
 
 	i2c_set_adapdata(&i2c_dev->adapter, i2c_dev);
@@ -878,11 +933,15 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	ret = i2c_add_numbered_adapter(&i2c_dev->adapter);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add I2C adapter\n");
-		goto unprepare_div_clk;
+		goto disable_div_clk;
 	}
 
 	return 0;
 
+disable_div_clk:
+	if (i2c_dev->is_multimaster_mode)
+		clk_disable(i2c_dev->div_clk);
+
 unprepare_div_clk:
 	clk_unprepare(i2c_dev->div_clk);
 
@@ -898,6 +957,9 @@ static int tegra_i2c_remove(struct platform_device *pdev)
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
 	i2c_del_adapter(&i2c_dev->adapter);
 
+	if (i2c_dev->is_multimaster_mode)
+		clk_disable(i2c_dev->div_clk);
+
 	clk_unprepare(i2c_dev->div_clk);
 	if (!i2c_dev->hw->has_single_clk_source)
 		clk_unprepare(i2c_dev->fast_clk);
-- 
1.8.1.5
