From: Shardar Shariff Md <smohammed@nvidia.com>
Subject: [PATCH v2] i2c: tegra: proper handling of error cases
Date: Mon, 18 Apr 2016 12:04:42 +0530
Message-ID: <1460961282-3532-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, gnurou@gmail.com, smohammed@nvidia.com
List-Id: linux-tegra@vger.kernel.org

To summarize the issue observed in error cases:

SW Flow: For i2c message transfer, packet header and data payload is posted
and then required error/packet completion interrupts are enabled later.

HW flow: HW process the packet just after packet header is posted, if ARB
lost/NACK error occurs (SW will not handle immediately when error happens
as error interrupts are not enabled at this point). HW assumes error is
acknowledged and clears current data in FIFO, But SW here posts the
remaining data payload which still stays in FIFO as stale data (without
packet header).

Now once the interrupts are enabled, SW handles ARB lost/NACK error by
clearing the ARB lost/NACK interrupt. Now HW assumes that SW attended the
error and will parse/process stale data (data without packet header)
present in FIFO which causes invalid NACK errors.

Fix: Enable the error interrupts before posting the packet into FIFO which
make sure HW to not clear the fifo. Also disable the packet mode before
acknowledging errors (ARB lost/NACK error) to not process any stale data.
As error interrupts are enabled before posting the packet header use
spinlock to avoid preempting.

Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 70 ++++++++++++++++++++++++++++++++----------
 1 file changed, 54 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d764d64..47345ac 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -191,6 +191,7 @@ struct tegra_i2c_dev {
 	u16 clk_divisor_non_hs_mode;
 	bool is_suspended;
 	bool is_multimaster_mode;
+	spinlock_t xfer_lock;
 };
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val, unsigned long reg)
@@ -423,12 +424,31 @@ static inline void tegra_i2c_clock_disable(struct tegra_i2c_dev *i2c_dev)
 		clk_disable(i2c_dev->fast_clk);
 }
 
+static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
+{
+	unsigned long timeout;
+
+	if (i2c_dev->hw->has_config_load_reg) {
+		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
+		timeout = jiffies + msecs_to_jiffies(1000);
+		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
+			if (time_after(jiffies, timeout)) {
+				dev_warn(i2c_dev->dev,
+					 "timeout waiting for config load\n");
+				return -ETIMEDOUT;
+			}
+			msleep(1);
+		}
+	}
+
+	return 0;
+}
+
 static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 {
 	u32 val;
 	int err = 0;
 	u32 clk_divisor;
-	unsigned long timeout = jiffies + HZ;
 
 	err = tegra_i2c_clock_enable(i2c_dev);
 	if (err < 0) {
@@ -477,36 +497,42 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (i2c_dev->is_multimaster_mode && i2c_dev->hw->has_slcg_override_reg)
 		i2c_writel(i2c_dev, I2C_MST_CORE_CLKEN_OVR, I2C_CLKEN_OVERRIDE);
 
-	if (i2c_dev->hw->has_config_load_reg) {
-		i2c_writel(i2c_dev, I2C_MSTR_CONFIG_LOAD, I2C_CONFIG_LOAD);
-		while (i2c_readl(i2c_dev, I2C_CONFIG_LOAD) != 0) {
-			if (time_after(jiffies, timeout)) {
-				dev_warn(i2c_dev->dev,
-					"timeout waiting for config load\n");
-				return -ETIMEDOUT;
-			}
-			msleep(1);
-		}
-	}
-
-	tegra_i2c_clock_disable(i2c_dev);
+	err = tegra_i2c_wait_for_config_load(i2c_dev);
+	if (err)
+		goto err;
 
 	if (i2c_dev->irq_disabled) {
 		i2c_dev->irq_disabled = 0;
 		enable_irq(i2c_dev->irq);
 	}
 
+err:
+	tegra_i2c_clock_disable(i2c_dev);
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
+	int ret;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
+	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
@@ -522,6 +548,9 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	}
 
 	if (unlikely(status & status_err)) {
+		ret = tegra_i2c_disable_packet_mode(i2c_dev);
+		if (ret)
+			return IRQ_NONE;
 		if (status & I2C_INT_NO_ACK)
 			i2c_dev->msg_err |= I2C_ERR_NO_ACK;
 		if (status & I2C_INT_ARBITRATION_LOST)
@@ -551,7 +580,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 		BUG_ON(i2c_dev->msg_buf_remaining);
 		complete(&i2c_dev->msg_complete);
 	}
-	return IRQ_HANDLED;
+	goto done;
 err:
 	/* An error occurred, mask all interrupts */
 	tegra_i2c_mask_irq(i2c_dev, I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST |
@@ -562,6 +591,8 @@ err:
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
 	complete(&i2c_dev->msg_complete);
+done:
+	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
 	return IRQ_HANDLED;
 }
 
@@ -571,6 +602,7 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 	u32 packet_header;
 	u32 int_mask;
 	unsigned long time_left;
+	unsigned long flags;
 
 	tegra_i2c_flush_fifos(i2c_dev);
 
@@ -583,6 +615,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
@@ -612,14 +649,15 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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
 
-- 
1.8.1.5
