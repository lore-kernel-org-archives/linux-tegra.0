From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V7 5/5] i2c: tegra: Add I2C interface timing support
Date: Wed, 30 Jan 2019 08:01:36 -0800
Message-ID: <1548864096-20974-5-git-send-email-skomatineni@nvidia.com>
References: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548864096-20974-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch adds I2C interface timing registers support for
proper bus rate configuration along with meeting the i2c spec
setup and hold times based on the tuning performed on Tegra210,
Tegra186 and Tegra194 platforms.

I2C_INTERFACE_TIMING_0 register contains TLOW and THIGH field
and Tegra I2C controller design uses them as a part of internal
clock divisor.

I2C_INTERFACE_TIMING_1 register contains the setup and hold times
for start and stop conditions.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V7] : Minor updates to timing implementation
 [V5/V6] : Added this Interface timing patch in V5 of the patch series.

 drivers/i2c/busses/i2c-tegra.c | 192 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 169 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 623bf4f275cd..ad8eeac5a745 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -130,6 +130,15 @@
 #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
 #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
 
+#define I2C_INTERFACE_TIMING_0			0x94
+#define I2C_THIGH_SHIFT				8
+#define I2C_INTERFACE_TIMING_1			0x98
+
+#define I2C_STANDARD_MODE			100000
+#define I2C_FAST_MODE				400000
+#define I2C_FAST_PLUS_MODE			1000000
+#define I2C_HS_MODE				3500000
+
 /* Packet header size in bytes */
 #define I2C_PACKET_HEADER_SIZE			12
 
@@ -167,7 +176,10 @@ enum msg_end_type {
  * @has_config_load_reg: Has the config load register to load the new
  *		configuration.
  * @clk_divisor_hs_mode: Clock divisor in HS mode.
- * @clk_divisor_std_fast_mode: Clock divisor in standard/fast mode. It is
+ * @clk_divisor_std_mode: Clock divisor in standard mode. It is
+ *		applicable if there is no fast clock source i.e. single clock
+ *		source.
+ * @clk_divisor_fast_mode: Clock divisor in fast mode. It is
  *		applicable if there is no fast clock source i.e. single clock
  *		source.
  * @clk_divisor_fast_plus_mode: Clock divisor in fast mode plus. It is
@@ -182,6 +194,16 @@ enum msg_end_type {
  *		be transferred in one go.
  * @supports_bus_clear: Bus Clear support to recover from bus hang during
  *		SDA stuck low from device for some unknown reasons.
+ * @tlow_std_mode: Low period of the clock in standard mode.
+ * @thigh_std_mode: High period of the clock in standard mode.
+ * @tlow_fast_fastplus_mode: Low period of the clock in fast/fast-plus modes.
+ * @thigh_fast_fastplus_mode: High period of the clock in fast/fast-plus modes.
+ * @setup_hold_time_std_mode: Setup and hold time for start and stop conditions
+ *		in standard mode.
+ * @setup_hold_time_fast_fast_plus_mode: Setup and hold time for start and stop
+ *		conditions in fast/fast-plus modes.
+ * @setup_hold_time_hs_mode: Setup and hold time for start and stop conditions
+ *		in HS mode.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -189,12 +211,20 @@ struct tegra_i2c_hw_feature {
 	bool has_single_clk_source;
 	bool has_config_load_reg;
 	int clk_divisor_hs_mode;
-	int clk_divisor_std_fast_mode;
+	int clk_divisor_std_mode;
+	int clk_divisor_fast_mode;
 	u16 clk_divisor_fast_plus_mode;
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
 	bool supports_bus_clear;
+	u8 tlow_std_mode;
+	u8 thigh_std_mode;
+	u8 tlow_fast_fastplus_mode;
+	u8 thigh_fast_fastplus_mode;
+	u32 setup_hold_time_std_mode;
+	u32 setup_hold_time_fast_fast_plus_mode;
+	u32 setup_hold_time_hs_mode;
 };
 
 /**
@@ -262,6 +292,7 @@ struct tegra_i2c_dev {
 };
 
 static struct dma_chan *chan;
+static bool first_init;
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned long reg)
@@ -639,6 +670,49 @@ static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
 	return 0;
 }
 
+static int tegra_i2c_set_timing(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 val;
+	u32 tsu_thd = 0;
+	u8 tlow = 0;
+	u8 thigh = 0;
+	u32 clk_multiplier;
+	int err = 0;
+
+	if ((i2c_dev->bus_clk_rate > I2C_STANDARD_MODE) &&
+	    (i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE)) {
+		tlow = i2c_dev->hw->tlow_fast_fastplus_mode;
+		thigh = i2c_dev->hw->thigh_fast_fastplus_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_fast_fast_plus_mode;
+	} else {
+		tlow = i2c_dev->hw->tlow_std_mode;
+		thigh = i2c_dev->hw->thigh_std_mode;
+		tsu_thd = i2c_dev->hw->setup_hold_time_std_mode;
+	}
+
+	val = (thigh << I2C_THIGH_SHIFT) | tlow;
+	if (val)
+		i2c_writel(i2c_dev, val, I2C_INTERFACE_TIMING_0);
+
+	if (tsu_thd)
+		i2c_writel(i2c_dev, tsu_thd, I2C_INTERFACE_TIMING_1);
+
+	if (first_init) {
+		clk_multiplier = (tlow + thigh + 2);
+		clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
+
+		err = clk_set_rate(i2c_dev->div_clk,
+				   i2c_dev->bus_clk_rate * clk_multiplier);
+		if (err)
+			dev_err(i2c_dev->dev,
+				"failed changing clock rate: %d\n", err);
+		else
+			first_init = false;
+	}
+
+	return err;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
@@ -673,6 +747,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 					I2C_CLK_DIVISOR_STD_FAST_MODE_SHIFT;
 	i2c_writel(i2c_dev, clk_divisor, I2C_CLK_DIVISOR);
 
+	err = tegra_i2c_set_timing(i2c_dev);
+	if (err < 0)
+		goto err;
+
 	if (!i2c_dev->is_dvc) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
 
@@ -1213,13 +1291,21 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_per_pkt_xfer_complete_irq = false,
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
-	.clk_divisor_std_fast_mode = 0,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
 	.clk_divisor_fast_plus_mode = 0,
 	.has_config_load_reg = false,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
 	.supports_bus_clear = false,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -1227,13 +1313,21 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_per_pkt_xfer_complete_irq = false,
 	.has_single_clk_source = false,
 	.clk_divisor_hs_mode = 3,
-	.clk_divisor_std_fast_mode = 0,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
 	.clk_divisor_fast_plus_mode = 0,
 	.has_config_load_reg = false,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
 	.supports_bus_clear = false,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1241,13 +1335,21 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
-	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = false,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
 	.supports_bus_clear = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1255,13 +1357,21 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
-	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
 	.supports_bus_clear = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_fast_plus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1269,32 +1379,71 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
-	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
 	.supports_bus_clear = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
 };
 
-static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
+static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
 	.has_single_clk_source = true,
 	.clk_divisor_hs_mode = 1,
-	.clk_divisor_std_fast_mode = 0x19,
+	.clk_divisor_std_mode = 0x16,
+	.clk_divisor_fast_mode = 0x19,
 	.clk_divisor_fast_plus_mode = 0x10,
 	.has_config_load_reg = true,
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
 	.supports_bus_clear = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x3,
+	.tlow_fast_fastplus_mode = 0x4,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_fast_plus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
+};
+
+static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.has_single_clk_source = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x4f,
+	.clk_divisor_fast_mode = 0x3c,
+	.clk_divisor_fast_plus_mode = 0x16,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = true,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = true,
+	.supports_bus_clear = true,
+	.tlow_std_mode = 0x8,
+	.thigh_std_mode = 0x7,
+	.tlow_fast_fastplus_mode = 0x2,
+	.thigh_fast_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_fast_plus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x090909,
 };
 
 /* Match table for of_platform binding */
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
+	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
 	{ .compatible = "nvidia,tegra114-i2c", .data = &tegra114_i2c_hw, },
@@ -1315,7 +1464,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	phys_addr_t phys_addr;
 	int irq;
 	int ret = 0;
-	int clk_multiplier = I2C_CLK_MULTIPLIER_STD_FAST_MODE;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	phys_addr = res->start;
@@ -1385,20 +1533,17 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
-	i2c_dev->clk_divisor_non_hs_mode =
-			i2c_dev->hw->clk_divisor_std_fast_mode;
-	if (i2c_dev->hw->clk_divisor_fast_plus_mode &&
-		(i2c_dev->bus_clk_rate == 1000000))
+	if ((i2c_dev->bus_clk_rate > I2C_FAST_MODE) &&
+	    (i2c_dev->bus_clk_rate <= I2C_FAST_PLUS_MODE))
 		i2c_dev->clk_divisor_non_hs_mode =
-			i2c_dev->hw->clk_divisor_fast_plus_mode;
-
-	clk_multiplier *= (i2c_dev->clk_divisor_non_hs_mode + 1);
-	ret = clk_set_rate(i2c_dev->div_clk,
-			   i2c_dev->bus_clk_rate * clk_multiplier);
-	if (ret) {
-		dev_err(i2c_dev->dev, "Clock rate change failed %d\n", ret);
-		goto unprepare_fast_clk;
-	}
+				i2c_dev->hw->clk_divisor_fast_plus_mode;
+	else if ((i2c_dev->bus_clk_rate > I2C_STANDARD_MODE) &&
+		 (i2c_dev->bus_clk_rate <= I2C_FAST_MODE))
+		i2c_dev->clk_divisor_non_hs_mode =
+				i2c_dev->hw->clk_divisor_fast_mode;
+	else
+		i2c_dev->clk_divisor_non_hs_mode =
+				i2c_dev->hw->clk_divisor_std_mode;
 
 	ret = clk_prepare(i2c_dev->div_clk);
 	if (ret < 0) {
@@ -1424,6 +1569,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 		}
 	}
 
+	first_init = true;
 	ret = tegra_i2c_init(i2c_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize i2c controller\n");
-- 
2.7.4
