From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 3/9] i2c: tegra: Fix missing blank lines after declarations
Date: Fri, 26 Aug 2016 14:08:59 +0100
Message-ID: <1472216945-11818-4-git-send-email-jonathanh@nvidia.com>
References: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <1472216945-11818-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Checkpatch warns about missing blank lines after declarations in the
Tegra I2C driver and so fix these.

Note that the initialisation of 'val' to zero in tegra_dvc_init() is
unnecessary and so remove this.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 98d13437eb42..7a7f899936a3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -245,15 +245,17 @@ static void i2c_readsl(struct tegra_i2c_dev *i2c_dev, void *data,
 
 static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
-	u32 int_mask = i2c_readl(i2c_dev, I2C_INT_MASK);
-	int_mask &= ~mask;
+	u32 int_mask;
+
+	int_mask = i2c_readl(i2c_dev, I2C_INT_MASK) & ~mask;
 	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
 }
 
 static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 {
-	u32 int_mask = i2c_readl(i2c_dev, I2C_INT_MASK);
-	int_mask |= mask;
+	u32 int_mask;
+
+	int_mask = i2c_readl(i2c_dev, I2C_INT_MASK) | mask;
 	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
 }
 
@@ -261,6 +263,7 @@ static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
 {
 	unsigned long timeout = jiffies + HZ;
 	u32 val = i2c_readl(i2c_dev, I2C_FIFO_CONTROL);
+
 	val |= I2C_FIFO_CONTROL_TX_FLUSH | I2C_FIFO_CONTROL_RX_FLUSH;
 	i2c_writel(i2c_dev, val, I2C_FIFO_CONTROL);
 
@@ -386,7 +389,8 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
  */
 static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 {
-	u32 val = 0;
+	u32 val;
+
 	val = dvc_readl(i2c_dev, DVC_CTRL_REG3);
 	val |= DVC_CTRL_REG3_SW_PROG;
 	val |= DVC_CTRL_REG3_I2C_DONE_INTR_EN;
@@ -400,6 +404,7 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
 static inline int tegra_i2c_clock_enable(struct tegra_i2c_dev *i2c_dev)
 {
 	int ret;
+
 	if (!i2c_dev->hw->has_single_clk_source) {
 		ret = clk_enable(i2c_dev->fast_clk);
 		if (ret < 0) {
@@ -461,11 +466,11 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 
 	if (!i2c_dev->is_dvc) {
 		u32 sl_cfg = i2c_readl(i2c_dev, I2C_SL_CNFG);
+
 		sl_cfg |= I2C_SL_CNFG_NACK | I2C_SL_CNFG_NEWSL;
 		i2c_writel(i2c_dev, sl_cfg, I2C_SL_CNFG);
 		i2c_writel(i2c_dev, 0xfc, I2C_SL_ADDR1);
 		i2c_writel(i2c_dev, 0x00, I2C_SL_ADDR2);
-
 	}
 
 	val = 7 << I2C_FIFO_CONTROL_TX_TRIG_SHIFT |
@@ -680,6 +685,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 
 	for (i = 0; i < num; i++) {
 		enum msg_end_type end_type = MSG_END_STOP;
+
 		if (i < (num - 1)) {
 			if (msgs[i + 1].flags & I2C_M_NOSTART)
 				end_type = MSG_END_CONTINUE;
@@ -956,6 +962,7 @@ unprepare_fast_clk:
 static int tegra_i2c_remove(struct platform_device *pdev)
 {
 	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
+
 	i2c_del_adapter(&i2c_dev->adapter);
 
 	if (i2c_dev->is_multimaster_mode)
-- 
2.1.4
