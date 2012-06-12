From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 1/4] i2c: tegra: make sure register writes completes
Date: Tue, 12 Jun 2012 16:07:28 +0530
Message-ID: <1339497451-26260-2-git-send-email-ldewangan@nvidia.com>
References: <1339497451-26260-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1339497451-26260-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The Tegra PPSB (an peripheral bus) queues writes transactions.
In order to guarantee that writes have completed before a
certain time, a read transaction to a register on the same
bus must be executed.
This is necessary in situations such as when clearing an
interrupt status or enable, so that when returning from an
interrupt handler, the HW has already de-asserted its
interrupt status output, which will avoid spurious interrupts.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
changes from V1:
	Taken care of Wolfram's review comment.

 drivers/i2c/busses/i2c-tegra.c |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 3da7ee3..753519a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -189,6 +189,9 @@ static void tegra_i2c_mask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 	u32 int_mask = i2c_readl(i2c_dev, I2C_INT_MASK);
 	int_mask &= ~mask;
 	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
+
+	/* Read back register to make sure that register writes completed */
+	i2c_readl(i2c_dev, I2C_INT_MASK);
 }
 
 static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
@@ -196,6 +199,9 @@ static void tegra_i2c_unmask_irq(struct tegra_i2c_dev *i2c_dev, u32 mask)
 	u32 int_mask = i2c_readl(i2c_dev, I2C_INT_MASK);
 	int_mask |= mask;
 	i2c_writel(i2c_dev, int_mask, I2C_INT_MASK);
+
+	/* Read back register to make sure that register writes completed */
+	i2c_readl(i2c_dev, I2C_INT_MASK);
 }
 
 static int tegra_i2c_flush_fifos(struct tegra_i2c_dev *i2c_dev)
@@ -430,6 +436,13 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	if (i2c_dev->is_dvc)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
+	/*
+	 * Register write get queued in the PPSB bus and write can
+	 * happen later. Read back register to make sure that register
+	 * write is completed.
+	 */
+	i2c_readl(i2c_dev, I2C_INT_STATUS);
+
 	if (status & I2C_INT_PACKET_XFER_COMPLETE) {
 		BUG_ON(i2c_dev->msg_buf_remaining);
 		complete(&i2c_dev->msg_complete);
@@ -444,6 +457,9 @@ err:
 	if (i2c_dev->is_dvc)
 		dvc_writel(i2c_dev, DVC_STATUS_I2C_DONE_INTR, DVC_STATUS);
 
+	/* Read back register to make sure that register writes completed */
+	i2c_readl(i2c_dev, I2C_INT_STATUS);
+
 	complete(&i2c_dev->msg_complete);
 	return IRQ_HANDLED;
 }
-- 
1.7.1.1
