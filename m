From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2] i2c: tegra: Fix Maximum transfer size
Date: Wed, 2 Jan 2019 14:35:19 -0800
Message-ID: <1546468519-2128-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra194 supports maximum 64K Bytes transfer per packet.
Tegra186 and prior supports maximum 4K Bytes transfer per packet.

This patch fixes this payload difference between Tegra194 and prior
tegra chipsets using seperate i2c_adapter_quirks.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 437294ea2f0a..95f7fefd2186 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -167,6 +167,7 @@ struct tegra_i2c_hw_feature {
 	bool has_multi_master_mode;
 	bool has_slcg_override_reg;
 	bool has_mst_fifo;
+	const struct i2c_adapter_quirks *quirks;
 };
 
 /**
@@ -833,6 +834,12 @@ static const struct i2c_adapter_quirks tegra_i2c_quirks = {
 	.max_write_len = 4096,
 };
 
+static const struct i2c_adapter_quirks tegra194_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+	.max_read_len = 65535,
+	.max_write_len = 65535,
+};
+
 static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_continue_xfer_support = false,
 	.has_per_pkt_xfer_complete_irq = false,
@@ -844,6 +851,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.quirks = &tegra_i2c_quirks,
 };
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
@@ -857,6 +865,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.quirks = &tegra_i2c_quirks,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -870,6 +879,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = false,
 	.has_mst_fifo = false,
+	.quirks = &tegra_i2c_quirks,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -883,6 +893,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_multi_master_mode = false,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.quirks = &tegra_i2c_quirks,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -896,6 +907,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = false,
+	.quirks = &tegra_i2c_quirks,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -909,6 +921,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_multi_master_mode = true,
 	.has_slcg_override_reg = true,
 	.has_mst_fifo = true,
+	.quirks = &tegra194_i2c_quirks,
 };
 
 /* Match table for of_platform binding */
@@ -960,7 +973,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->base = base;
 	i2c_dev->div_clk = div_clk;
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
-	i2c_dev->adapter.quirks = &tegra_i2c_quirks;
 	i2c_dev->irq = irq;
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
@@ -976,6 +988,8 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->hw = of_device_get_match_data(&pdev->dev);
 	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						  "nvidia,tegra20-i2c-dvc");
+	i2c_dev->adapter.quirks = i2c_dev->hw->quirks;
+
 	init_completion(&i2c_dev->msg_complete);
 	spin_lock_init(&i2c_dev->xfer_lock);
 
-- 
2.7.4
