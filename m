From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1] i2c: tegra: disable irq in tegra_i2c_xfer_msg
Date: Mon, 17 Jun 2019 22:23:06 -0700
Message-ID: <1560835386-2865-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Synchronize ISR and tegra_i2c_xfer_msg execution
by disabling interrupt. This avoids spinlock usage
for same purpose.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 6fb545e..ccc7fae 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -240,7 +240,6 @@ struct tegra_i2c_hw_feature {
  * @bus_clk_rate: current I2C bus clock rate
  * @clk_divisor_non_hs_mode: clock divider for non-high-speed modes
  * @is_multimaster_mode: track if I2C controller is in multi-master mode
- * @xfer_lock: lock to serialize transfer submission and processing
  * @tx_dma_chan: DMA transmit channel
  * @rx_dma_chan: DMA receive channel
  * @dma_phys: handle to DMA resources
@@ -270,8 +269,6 @@ struct tegra_i2c_dev {
 	u32 bus_clk_rate;
 	u16 clk_divisor_non_hs_mode;
 	bool is_multimaster_mode;
-	/* xfer_lock: lock to serialize transfer submission and processing */
-	spinlock_t xfer_lock;
 	struct dma_chan *tx_dma_chan;
 	struct dma_chan *rx_dma_chan;
 	dma_addr_t dma_phys;
@@ -835,7 +832,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
-	spin_lock(&i2c_dev->xfer_lock);
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
@@ -935,7 +931,6 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	complete(&i2c_dev->msg_complete);
 done:
-	spin_unlock(&i2c_dev->xfer_lock);
 	return IRQ_HANDLED;
 }
 
@@ -1054,7 +1049,6 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 packet_header;
 	u32 int_mask;
 	unsigned long time_left;
-	unsigned long flags;
 	size_t xfer_size;
 	u32 *buffer = NULL;
 	int err = 0;
@@ -1085,7 +1079,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	 */
 	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
 					i2c_dev->bus_clk_rate);
-	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
+	if (!i2c_dev->irq_disabled) {
+		disable_irq_nosync(i2c_dev->irq);
+		i2c_dev->irq_disabled = true;
+	}
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
@@ -1180,7 +1177,10 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 unlock:
-	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
+	if (i2c_dev->irq_disabled) {
+		i2c_dev->irq_disabled = false;
+		enable_irq(i2c_dev->irq);
+	}
 
 	if (dma) {
 		if (err)
@@ -1576,7 +1576,6 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 				I2C_PACKET_HEADER_SIZE;
 	init_completion(&i2c_dev->msg_complete);
 	init_completion(&i2c_dev->dma_complete);
-	spin_lock_init(&i2c_dev->xfer_lock);
 
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-- 
2.7.4
