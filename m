From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V5 7/7] i2c: tegra: remove BUG, BUG_ON
Date: Tue, 11 Jun 2019 03:51:14 -0700
Message-ID: <1560250274-18499-7-git-send-email-bbiswas@nvidia.com>
References: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560250274-18499-1-git-send-email-bbiswas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
as needed. Remove BUG() and make Rx and Tx case handling
similar. Add WARN_ON_ONCE check for non-zero rx_fifo_avail
in tegra_i2c_empty_rx_fifo() and return new error
I2C_ERR_UNEXPECTED_STATUS.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 0596c12..2c8f051 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -73,6 +73,7 @@
 #define I2C_ERR_NO_ACK				BIT(0)
 #define I2C_ERR_ARBITRATION_LOST		BIT(1)
 #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
+#define I2C_ERR_UNEXPECTED_STATUS		BIT(3)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -516,15 +517,15 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 */
 	if (rx_fifo_avail > 0 &&
 	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
-		BUG_ON(buf_remaining > 3);
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
 		buf_remaining = 0;
 		rx_fifo_avail--;
 	}
+	if (WARN_ON_ONCE(rx_fifo_avail))
+		return -EINVAL;
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -582,7 +583,6 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 */
 	if (tx_fifo_avail > 0 &&
 	    (buf_remaining > 0 && buf_remaining < BYTES_PER_FIFO_WORD)) {
-		BUG_ON(buf_remaining > 3);
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -848,10 +848,16 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
-			if (i2c_dev->msg_buf_remaining)
-				tegra_i2c_empty_rx_fifo(i2c_dev);
-			else
-				BUG();
+			if (i2c_dev->msg_buf_remaining) {
+				if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
+					i2c_dev->msg_err |=
+						I2C_ERR_UNEXPECTED_STATUS;
+					goto err;
+				}
+			} else {
+				tegra_i2c_mask_irq(i2c_dev,
+						   I2C_INT_RX_FIFO_DATA_REQ);
+			}
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -877,7 +883,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
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
