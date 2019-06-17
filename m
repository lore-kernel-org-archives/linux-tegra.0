From: Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V7] i2c: tegra: remove BUG, BUG_ON
Date: Sun, 16 Jun 2019 22:09:12 -0700
Message-ID: <1560748152-6575-1-git-send-email-bbiswas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>, Dmitry Osipenko <digetx@gmail.com>
Cc: Shardar Mohammed <smohammed@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove BUG, BUG_ON as it makes system usable:
 - Remove redundant BUG_ON calls or replace with WARN_ON_ONCE
   as needed.
 - Remove BUG() and mask Rx interrupt similar as Tx
   for message fully sent case.
 - Add caller error handling and WARN_ON_ONCE check for non-zero
   rx_fifo_avail in tegra_i2c_empty_rx_fifo() after all processing.

Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 45 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4dfb4c1..b155b61 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -73,6 +73,7 @@
 #define I2C_ERR_NO_ACK				BIT(0)
 #define I2C_ERR_ARBITRATION_LOST		BIT(1)
 #define I2C_ERR_UNKNOWN_INTERRUPT		BIT(2)
+#define I2C_ERR_RX_BUFFER_OVERFLOW		BIT(3)
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -515,7 +516,11 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * prevent overwriting past the end of buf
 	 */
 	if (rx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
+		/*
+		 * buf_remaining > 3 check not needed as rx_fifo_avail == 0
+		 * when (words_to_transfer was > rx_fifo_avail) earlier
+		 * in this function.
+		 */
 		val = i2c_readl(i2c_dev, I2C_RX_FIFO);
 		val = cpu_to_le32(val);
 		memcpy(buf, &val, buf_remaining);
@@ -523,7 +528,15 @@ static int tegra_i2c_empty_rx_fifo(struct tegra_i2c_dev *i2c_dev)
 		rx_fifo_avail--;
 	}
 
-	BUG_ON(rx_fifo_avail > 0 && buf_remaining > 0);
+	if ((!(i2c_dev->msg_buf_remaining)) &&
+	    WARN_ON_ONCE(rx_fifo_avail))
+		return -EINVAL;
+
+	/*
+	 * buf_remaining > 0 at this point can only have rx_fifo_avail == 0
+	 * as this corresponds to (words_to_transfer was > rx_fifo_avail)
+	 * case earlier in this function.
+	 */
 	i2c_dev->msg_buf_remaining = buf_remaining;
 	i2c_dev->msg_buf = buf;
 
@@ -581,7 +594,11 @@ static int tegra_i2c_fill_tx_fifo(struct tegra_i2c_dev *i2c_dev)
 	 * boundary and fault.
 	 */
 	if (tx_fifo_avail > 0 && buf_remaining > 0) {
-		BUG_ON(buf_remaining > 3);
+		/*
+		 * buf_remaining > 3 check not needed as tx_fifo_avail == 0
+		 * when (words_to_transfer was > tx_fifo_avail) earlier
+		 * in this function for non-zero words_to_transfer.
+		 */
 		memcpy(&val, buf, buf_remaining);
 		val = le32_to_cpu(val);
 
@@ -847,10 +864,15 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	if (!i2c_dev->is_curr_dma_xfer) {
 		if (i2c_dev->msg_read && (status & I2C_INT_RX_FIFO_DATA_REQ)) {
-			if (i2c_dev->msg_buf_remaining)
-				tegra_i2c_empty_rx_fifo(i2c_dev);
-			else
-				BUG();
+			if (tegra_i2c_empty_rx_fifo(i2c_dev)) {
+				/*
+				 * Overflow error condition: message fully sent,
+				 * with no XFER_COMPLETE interrupt but hardware
+				 * asks to transfer more.
+				 */
+				i2c_dev->msg_err |= I2C_ERR_RX_BUFFER_OVERFLOW;
+				goto err;
+			}
 		}
 
 		if (!i2c_dev->msg_read && (status & I2C_INT_TX_FIFO_DATA_REQ)) {
@@ -876,7 +898,14 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		if (i2c_dev->is_curr_dma_xfer)
 			i2c_dev->msg_buf_remaining = 0;
-		BUG_ON(i2c_dev->msg_buf_remaining);
+		/*
+		 * Underflow error condition: XFER_COMPLETE before message
+		 * fully sent.
+		 */
+		if (WARN_ON_ONCE(i2c_dev->msg_buf_remaining)) {
+			i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
+			goto err;
+		}
 		complete(&i2c_dev->msg_complete);
 	}
 	goto done;
-- 
2.7.4
