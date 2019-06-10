From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V4 6/6] i2c: tegra: remove BUG, BUG_ON
Date: Mon, 10 Jun 2019 10:08:35 -0700
Message-ID: <1560186515-30797-6-git-send-email-bbiswas@nvidia.com>
References: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560186515-30797-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
as needed. Remove BUG() and make Rx and Tx case handling
similar.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4dfb4c1..30619d6 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -515,7 +515,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
@@ -523,7 +522,6 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail--;
 	}
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -581,7 +579,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -850,7 +847,8 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 			if (i2c_dev->msg_buf_remaining)
 				tegra_i2c_empty_rx_fifo(i2c_dev);
 			else
-				BUG();
+				tegra_i2c_mask_irq(i2c_dev,
+						   I2C_INT_RX_FIFO_DATA_REQ);
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -876,7 +874,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
+			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
+			goto err;
+		}
 		complete(&i2c_dev->msg_complete);
 	}
 	goto done;
-- 
2.7.4
