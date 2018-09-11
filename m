From: jun qian <hangdianqj@163.com>
Subject: [PATCH] i2c: i2c-tegra: replace spin_lock_irqsave with spin_lock in ISR
Date: Tue, 11 Sep 2018 07:54:46 -0700
Message-ID: <20180911145446.53621-1-hangdianqj@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, jun qian <hangdianqj@163.com>
List-Id: linux-tegra@vger.kernel.org

As you are already in ISR, it is unnecessary to call spin_lock_irqsave.

Signed-off-by: jun qian <hangdianqj@163.com>
---
 drivers/i2c/busses/i2c-tegra.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 60c8561fbe65..59f31d3a508f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -608,11 +608,10 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 	u32 status;
 	const u32 status_err = I2C_INT_NO_ACK | I2C_INT_ARBITRATION_LOST;
 	struct tegra_i2c_dev *i2c_dev = dev_id;
-	unsigned long flags;
 
 	status = i2c_readl(i2c_dev, I2C_INT_STATUS);
 
-	spin_lock_irqsave(&i2c_dev->xfer_lock, flags);
+	spin_lock(&i2c_dev->xfer_lock);
 	if (status == 0) {
 		dev_warn(i2c_dev->dev, "irq status 0 %08x %08x %08x\n",
 			 i2c_readl(i2c_dev, I2C_PACKET_TRANSFER_STATUS),
@@ -670,7 +669,7 @@ static irqreturn_t tegra_i2c_isr(int irq, void *dev_id)
 
 	complete(&i2c_dev->msg_complete);
 done:
-	spin_unlock_irqrestore(&i2c_dev->xfer_lock, flags);
+	spin_unlock(&i2c_dev->xfer_lock);
 	return IRQ_HANDLED;
 }
 
-- 
2.17.1
