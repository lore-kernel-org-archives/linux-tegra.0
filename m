From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] i2c: tegra: recover from spurious interrupt storm
Date: Mon, 25 Apr 2011 15:32:25 -0600
Message-ID: <1303767147-17493-2-git-send-email-swarren@nvidia.com>
References: <1303767147-17493-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303767147-17493-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Todd Poynor <toddpoynor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Todd Poynor <toddpoynor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>

Re-init the I2C controller when an IRQ arrives with no
I2C_INT_STATUS bits set to indicate why the interrupt was sent.
Storms of such mystery interrupts are infrequently seen.

Dump some more status when these interrupts arrive.  Set an error
for the current request and wake up the requester (rather than
timing out the request or possibly silently ignoring the interrupts).

If the I2C block is inside the DVC, also ACK the DVC I2C transfer
done interrupt in the ISR error return path, as is done for the
normal return path.

Signed-off-by: Todd Poynor <toddpoynor-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
[swarren: Fix minor checkpatch whitespace issue, commit tag]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-tegra.c |   26 ++++++++++++++++++++++++--
 1 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 5f1b92c..c0b9aa7 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -37,6 +37,7 @@
 #define I2C_CNFG				0x000
 #define I2C_CNFG_PACKET_MODE_EN			(1<<10)
 #define I2C_CNFG_NEW_MASTER_FSM			(1<<11)
+#define I2C_STATUS				0x01C
 #define I2C_SL_CNFG				0x020
 #define I2C_SL_CNFG_NEWSL			(1<<2)
 #define I2C_SL_ADDR1				0x02c
@@ -77,6 +78,7 @@
 #define I2C_ERR_NONE				0x00
 #define I2C_ERR_NO_ACK				0x01
 #define I2C_ERR_ARBITRATION_LOST		0x02
+#define I2C_ERR_UNKNOWN_INTERRUPT		0x04
 
 #define PACKET_HEADER0_HEADER_SIZE_SHIFT	28
 #define PACKET_HEADER0_PACKET_ID_SHIFT		16
@@ -121,6 +123,7 @@ struct tegra_i2c_dev {
 	void __iomem *base;
 	int cont_id;
 	int irq;
+	bool irq_disabled;
 	int is_dvc;
 	struct completion msg_complete;
 	int msg_err;
@@ -343,6 +346,12 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 		err = -ETIMEDOUT;
 
 	clk_disable(i2c_dev->clk);
+
+	if (i2c_dev->irq_disabled) {
+		i2c_dev->irq_disabled = 0;
+		enable_irq(i2c_dev->irq);
+	}
+
 	return err;
 }
 
@@ -355,8 +364,19 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
 	if (status == 0) {
-		dev_warn(i2c_dev->dev, "interrupt with no status\n");
-		return IRQ_NONE;
+		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
+			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
+			 i2c_readl(i2c_dev, I2C_STATUS),
+			 i2c_readl(i2c_dev, I2C_CNFG));
+		i2c_dev->msg_err |= I2C_ERR_UNKNOWN_INTERRUPT;
+
+		if (!i2c_dev->irq_disabled) {
+			disable_irq_nosync(i2c_dev->irq);
+			i2c_dev->irq_disabled = 1;
+		}
+
+		complete(&i2c_dev->msg_complete);
+		goto err;
 	}
 
 	if (unlikely(status & status_err)) {
@@ -396,6 +416,8 @@ err:
 		I2C_INT_PACKET_XFER_COMPLETE | I2C_INT_TX_FIFO_DATA_REQ |
 		I2C_INT_RX_FIFO_DATA_REQ);
 	i2c_writel(i2c_dev, status, I2C_INT_STATUS);
+	if (i2c_dev->is_dvc)
+		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 	return IRQ_HANDLED;
 }
 
-- 
1.7.0.4
