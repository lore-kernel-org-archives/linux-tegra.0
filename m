From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V16 5/6] i2c: tegra: update transfer timeout
Date: Fri, 8 Feb 2019 08:45:13 -0800
Message-ID: <1549644314-1481-5-git-send-email-skomatineni@nvidia.com>
References: <1549644314-1481-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549644314-1481-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com
Cc: digetx@gmail.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra194 allows max of 64K bytes and Tegra186 and prior allows
max of 4K bytes of transfer per packet.

one sec timeout is not enough for transfers more than 10K bytes
at STD bus rate.

This patch updates I2C transfer timeout based on the transfer size
and I2C bus rate to allow enough time during max transfer size at
lower bus speed.

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 [V11/V12/V13/V14/V15/V16] : Same as V10
 [V10] : Reduced the timeout for bus clear operation
	Added adapter timeout to cover worst case transfer rate (max transfer
	size at STD speed) incase if ARB LOST happens during middle/end of 
	the transaction.
 [V9] : Rebased to 5.0-rc4
	Minor updates for readability of xfer time
 [V8] : Added comment with explaination of xfer time calculation
 [V5/V6/V7] : Same as V4
 [V4] : V4 series includes bus clear support and this patch is updated with
	fixed timeout of 1sec for bus clear operation.
 [V3] : Same as V2
 [V2] : Added this patch in V2 series to allow enough time for data transfer
	to happen.
	This patch has dependency with DMA patch as TEGRA_I2C_TIMEOUT define
	takes argument with this patch.


 drivers/i2c/busses/i2c-tegra.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 488929f5ed35..9cba84be1571 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -24,7 +24,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
-#define TEGRA_I2C_TIMEOUT (msecs_to_jiffies(1000))
 #define BYTES_PER_FIFO_WORD 4
 
 #define I2C_CNFG				0x000
@@ -935,7 +934,7 @@ static int tegra_i2c_issue_bus_clear(struct tegra_i2c_dev *i2c_dev)
 		tegra_i2c_unmask_irq(i2c_dev, I2C_INT_BUS_CLR_DONE);
 
 		time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-							TEGRA_I2C_TIMEOUT);
+							msecs_to_jiffies(50));
 
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "timed out for bus clear\n");
@@ -963,6 +962,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 *buffer = NULL;
 	int err = 0;
 	bool dma;
+	u16 xfer_time = 100;
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -982,6 +982,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 				    i2c_dev->dma_buf;
 	tegra_i2c_config_fifo_trig(i2c_dev, xfer_size);
 	dma = i2c_dev->is_curr_dma_xfer;
+	/*
+	 * Transfer time in mSec = Total bits / transfer rate
+	 * Total bits = 9 bits per byte (including ACK bit) + Start & stop bits
+	 */
+	xfer_time += DIV_ROUND_CLOSEST(((xfer_size * 9) + 2) * MSEC_PER_SEC,
+					i2c_dev->bus_clk_rate);
 	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
 
 	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
@@ -1086,7 +1092,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		time_left = wait_for_completion_timeout(
 						&i2c_dev->dma_complete,
-						TEGRA_I2C_TIMEOUT);
+						msecs_to_jiffies(xfer_time));
 		if (time_left == 0) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
 			dmaengine_terminate_sync(i2c_dev->msg_read ?
@@ -1112,7 +1118,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	}
 
 	time_left = wait_for_completion_timeout(&i2c_dev->msg_complete,
-						TEGRA_I2C_TIMEOUT);
+						msecs_to_jiffies(xfer_time));
 	tegra_i2c_mask_irq(i2c_dev, int_mask);
 
 	if (time_left == 0) {
@@ -1387,6 +1393,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->div_clk = div_clk;
 	i2c_dev->adapter.algo = &tegra_i2c_algo;
 	i2c_dev->adapter.retries = 1;
+	i2c_dev->adapter.timeout = 6 * HZ;
 	i2c_dev->irq = irq;
 	i2c_dev->cont_id = pdev->id;
 	i2c_dev->dev = &pdev->dev;
-- 
2.7.4
