From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH 5/5] i2c: tegra: proper handling of error cases
Date: Wed, 31 Aug 2016 18:52:38 +0530
Message-ID: <1472649758-5608-5-git-send-email-smohammed@nvidia.com>
References: <1472649758-5608-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472649758-5608-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: smohammed@nvidia.com, wsa@the-dreams.de, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
List-Id: linux-tegra@vger.kernel.org

To summarize the issue observed in error cases:

SW Flow: For i2c message transfer, packet header and data payload is
posted and then required error/packet completion interrupts are enabled
later.

HW flow: HW process the packet just after packet header is posted, if
ARB lost/NACK error occurs (SW will not handle immediately when error
happens as error interrupts are not enabled at this point). HW assumes
error is acknowledged and clears current data in FIFO, But SW here posts
the remaining data payload which still stays in FIFO as stale data
(data without packet header).

Now once the interrupts are enabled, SW handles ARB lost/NACK error by
clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended
the error and will parse/process stale data (data without packet header)
present in FIFO which causes invalid NACK errors.

Fix: Enable the error interrupts before posting the packet into FIFO
which make sure HW to not clear the fifo. Also disable the packet mode
before acknowledging errors (ARB lost/NACK error) to not process any
stale data. As error interrupts are enabled before posting the packet
header use spinlock to avoid preempting.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>

---
Changes in v2:
- Align the commit message to 72 characters per line.
- Removing unnecessary paranthesis.
- Handle error in isr

Changes in v3:
- Printing error if tegra_i2c_disable_packet_mode() fails
  is already present and handling error is not taken cared
  in ISR which was done in v2 but keeping return error in
  *wait_for_config_load() as its used in tegra_i2c_init()

Changes in V10:
- Rebase on top of [PATCH V2 0/9] Some Tegra I2C Updates
---
---
 drivers/i2c/busses/i2c-tegra.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2437535..c15d575 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -196,6 +196,7 @@ struct tegra_i2c_dev {
 	u16 clk_divisor_non_hs_mode;
 	bool is_suspended;
 	bool is_multimaster_mode;
+	spinlock_t xfer_lock;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
@@ -542,14 +543,27 @@ err:
 	return err;
 }
 
+static int tegra_i2c_disable_packet_mode(struct tegra_i2c_dev *i2c_dev)
+{
+	u32 cnfg;
+
+	cnfg = i2c_readl(i2c_dev, I2C_CNFG);
+	if (cnfg & I2C_CNFG_PACKET_MODE_EN)
+		i2c_writel(i2c_dev, cnfg & ~I2C_CNFG_PACKET_MODE_EN, I2C_CNFG);
+
+	return tegra_i2c_wait_for_config_load(i2c_dev);
+}
+
 static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 {
 	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
+	unsigned long flags;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
+	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
@@ -565,6 +579,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	if (unlikely(status & status_err)) {
+		tegra_i2c_disable_packet_mode(i2c_dev);
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
 		if (status & I2C_INT_ARBITRATION_LOST)
@@ -594,7 +609,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		BUG_ON(i2c_dev->msg_buf_remaining);
 		complete(&i2c_dev->msg_complete);
 	}
-	return IRQ_HANDLED;
+	goto done;
 err:
 	/* An error occurred, mask all interrupts */
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
@@ -605,6 +620,8 @@ err:
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	complete(&i2c_dev->msg_complete);
+done:
+	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
 	return IRQ_HANDLED;
 }
 
@@ -614,6 +631,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 packet_header;
 	u32 int_mask;
 	unsigned long time_left;
+	unsigned long flags;
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -626,6 +644,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	i2c_dev->msg_read = (msg->flags & I2C_M_RD);
 	reinit_completion(&i2c_dev->msg_complete);
 
+	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
+
+	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
+	tegra_i2c_unmask_irq(i2c_dev, int_mask);
+
 	packet_header = (0 << PACKET_HEADER0_HEADER_SIZE_SHIFT) |
 			PACKET_HEADER0_PROTOCOL_I2C |
 			(i2c_dev->cont_id << PACKET_HEADER0_CONT_ID_SHIFT) |
@@ -655,14 +678,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	if (!(msg->flags & I2C_M_RD))
 		tegra_i2c_fill_tx_fifo(i2c_dev);
 
-	int_mask = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	if (i2c_dev->hw->has_per_pkt_xfer_complete_irq)
 		int_mask |= I2C_INT_PACKET_XFER_COMPLETE;
 	if (msg->flags & I2C_M_RD)
 		int_mask |= I2C_INT_RX_FIFO_DATA_REQ;
 	else if (i2c_dev->msg_buf_remaining)
 		int_mask |= I2C_INT_TX_FIFO_DATA_REQ;
+
 	tegra_i2c_unmask_irq(i2c_dev, int_mask);
+	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
 	dev_dbg(i2c_dev->dev, "unmasked irq: %02x\n",
 		i2c_readl(i2c_dev, I2C_INT_MASK));
 
@@ -899,6 +923,7 @@ static int tegra_i2c_probe(struct platform_device *pdev)
 	i2c_dev->is_dvc = of_device_is_compatible(pdev->dev.of_node,
 						  "nvidia,tegra20-i2c-dvc");
 	init_completion(&i2c_dev->msg_complete);
+	spin_lock_init(&i2c_dev->xfer_lock);
 
 	if (!i2c_dev->hw->has_single_clk_source) {
 		fast_clk = devm_clk_get(&pdev->dev, "fast-clk");
-- 
1.8.1.5
