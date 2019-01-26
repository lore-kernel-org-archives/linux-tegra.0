From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V3 2/3] i2c: tegra: Update transfer timeout
Date: Fri, 25 Jan 2019 19:57:52 -0800
Message-ID: <1548475073-12408-2-git-send-email-skomatineni@nvidia.com>
References: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548475073-12408-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Update I2C transfer timeout based on transfer bytes and I2C bus
rate to allow enough time during max transfer size based on the
speed.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V3] : Same as V2
 [V2] : Added this patch in V2 series to allow enough time for data transfer
	to happen.
	This patch has dependency with DMA patch as TEGRA_I2C_TIMEOUT define
	takes argument with this patch.

 drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index aec500ef9a98..3dcbc9960d9d 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -23,7 +23,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
+#define TEGRA_I2C_TIMEOUT(ms) (msecs_to_jiffies(ms))
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
@@ -116,6 +116,9 @@
 #define I2C_MST_FIFO_STATUS_TX_MASK		0xff0000
 #define I2C_MST_FIFO_STATUS_TX_SHIFT		16
 
+/* Packet header size in bytes */
+#define I2C_PACKET_HEADER_SIZE			12
+
 /*
  * msg_end_type: The bus control which need to be send at end of transfer.
  * @MSG_END_STOP: Send stop pulse at end of transfer.
@@ -683,6 +686,17 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 int_mask;
 	unsigned long time_left;
 	unsigned long flags;
+	u16 xfer_time = 100;
+	size_t xfer_size = 0;
+
+	if (msg->flags & I2C_M_RD)
+		xfer_size = ALIGN(msg->len, BYTES_PER_FIFO_WORD);
+	else
+		xfer_size = ALIGN(msg->len, BYTES_PER_FIFO_WORD) +
+			    I2C_PACKET_HEADER_SIZE;
+
+	xfer_time += DIV_ROUND_CLOSEST((xfer_size * 9) * 1000,
+					i2c_dev->bus_clk_rate);
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -739,7 +753,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						TEGRA_I2C_TIMEOUT);
+						TEGRA_I2C_TIMEOUT(xfer_time));
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
-- 
2.7.4
