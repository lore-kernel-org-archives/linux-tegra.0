From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2 4/4] i2c: tegra: Update transfer timeout
Date: Thu, 24 Jan 2019 12:51:53 -0800
Message-ID: <1548363113-25969-4-git-send-email-skomatineni@nvidia.com>
References: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548363113-25969-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Update I2C transfer timeout based on transfer bytes and I2C bus
rate to allow enough time during max transfer size based on the
speed.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V2] : Added this patch in V2 series to allow enough time for data transfer
	to happen.
	This patch has dependency with DMA patch as TEGRA_I2C_TIMEOUT define
	takes argument with this patch.

 drivers/i2c/busses/i2c-tegra.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 769700d5a7f3..2f8de837f660 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -27,7 +27,7 @@
 #include <linux/reset.h>
 #include <linux/slab.h>
 
-#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
+#define TEGRA_I2C_TIMEOUT(ms) (msecs_to_jiffies(ms))
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
@@ -857,7 +857,8 @@ static void tegra_i2c_config_fifo_trig(struct tegra_i2c_dev *i2c_dev,
 	dmaengine_slave_config(chan, &dma_sconfig);
 }
 
-static int tegra_i2c_start_dma_xfer(struct tegra_i2c_dev *i2c_dev)
+static int tegra_i2c_start_dma_xfer(struct tegra_i2c_dev *i2c_dev,
+				    u16 xfer_time)
 {
 	u32 *buffer = (u32 *)i2c_dev->msg_buf;
 	unsigned long time_left, flags;
@@ -929,7 +930,7 @@ static int tegra_i2c_start_dma_xfer(struct tegra_i2c_dev *i2c_dev)
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
 	time_left = wait_for_completion_timeout(&i2c_dev->dma_complete,
-						TEGRA_I2C_TIMEOUT);
+						TEGRA_I2C_TIMEOUT(xfer_time));
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 		dmaengine_terminate_all(chan);
@@ -995,6 +996,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	int ret = 0;
 	size_t xfer_size = 0;
 	bool dma = false;
+	u16 xfer_time = 100;
 
 	buffer = kmalloc(ALIGN(msg->len, BYTES_PER_FIFO_WORD) +
 			 I2C_PACKET_HEADER_SIZE, GFP_KERNEL);
@@ -1012,6 +1014,9 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	i2c_dev->is_curr_dma_xfer = dma;
 
+	xfer_time += DIV_ROUND_CLOSEST((xfer_size * 9) * 1000,
+					i2c_dev->bus_clk_rate);
+
 	tegra_i2c_flush_fifos(i2c_dev);
 
 	i2c_dev->msg_buf = (u8 *)buffer;
@@ -1048,7 +1053,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		memcpy(buffer, msg->buf, msg->len);
 
 	if (dma)
-		ret = tegra_i2c_start_dma_xfer(i2c_dev);
+		ret = tegra_i2c_start_dma_xfer(i2c_dev, xfer_time);
 	else
 		ret = tegra_i2c_start_pio_xfer(i2c_dev);
 
@@ -1058,7 +1063,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		goto end_xfer;
 
 	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						TEGRA_I2C_TIMEOUT);
+						TEGRA_I2C_TIMEOUT(xfer_time));
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
 		if (i2c_dev->is_curr_dma_xfer) {
-- 
2.7.4
