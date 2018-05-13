From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] mfd: tps6586x: Move interrupt handling into workqueue
Date: Mon, 14 May 2018 00:18:42 +0300
Message-ID: <20180513211842.7819-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Reading of status register within the interrupt handler fails with -EAGAIN
if I2C is busy with handling some other request at the same time. Move the
actual interrupt handling into a workqueue to avoid the unfortunate I2C
failure and to avoid hanging CPU in interrupt up to 1 second (transfer
timeout in the Tegra I2C driver).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/tps6586x.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index b89379782741..9896e080b274 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -133,6 +133,7 @@ struct tps6586x {
 	u32			irq_en;
 	u8			mask_reg[5];
 	struct irq_domain	*irq_domain;
+	struct work_struct	isr_work;
 };
 
 static inline struct tps6586x *dev_to_tps6586x(struct device *dev)
@@ -309,18 +310,19 @@ static const struct irq_domain_ops tps6586x_domain_ops = {
 	.xlate  = irq_domain_xlate_twocell,
 };
 
-static irqreturn_t tps6586x_irq(int irq, void *data)
+static void tps6586x_isr_work(struct work_struct *work)
 {
-	struct tps6586x *tps6586x = data;
+	struct tps6586x *tps6586x = container_of(work, struct tps6586x,
+						 isr_work);
 	u32 acks;
-	int ret = 0;
+	int err;
 
-	ret = tps6586x_reads(tps6586x->dev, TPS6586X_INT_ACK1,
+	err = tps6586x_reads(tps6586x->dev, TPS6586X_INT_ACK1,
 			     sizeof(acks), (uint8_t *)&acks);
-
-	if (ret < 0) {
-		dev_err(tps6586x->dev, "failed to read interrupt status\n");
-		return IRQ_NONE;
+	if (err < 0) {
+		dev_err(tps6586x->dev,
+			"failed to read interrupt status %d\n", err);
+		return;
 	}
 
 	acks = le32_to_cpu(acks);
@@ -335,6 +337,16 @@ static irqreturn_t tps6586x_irq(int irq, void *data)
 		acks &= ~(1 << i);
 	}
 
+	enable_irq(tps6586x->irq);
+}
+
+static irqreturn_t tps6586x_irq(int irq, void *data)
+{
+	struct tps6586x *tps6586x = data;
+
+	disable_irq_nosync(irq);
+	schedule_work(&tps6586x->isr_work);
+
 	return IRQ_HANDLED;
 }
 
@@ -542,8 +554,9 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
 		return ret;
 	}
 
-
 	if (client->irq) {
+		INIT_WORK(&tps6586x->isr_work, tps6586x_isr_work);
+
 		ret = tps6586x_irq_init(tps6586x, client->irq,
 					pdata->irq_base);
 		if (ret) {
@@ -585,10 +598,15 @@ static int tps6586x_i2c_remove(struct i2c_client *client)
 {
 	struct tps6586x *tps6586x = i2c_get_clientdata(client);
 
+	if (client->irq) {
+		disable_irq(client->irq);
+		flush_work(&tps6586x->isr_work);
+		free_irq(client->irq, tps6586x);
+	}
+
 	tps6586x_remove_subdevs(tps6586x);
 	mfd_remove_devices(tps6586x->dev);
-	if (client->irq)
-		free_irq(client->irq, tps6586x);
+
 	return 0;
 }
 
-- 
2.17.0
