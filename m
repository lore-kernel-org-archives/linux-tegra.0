From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] mfd: tps6586x: Fix "failed to read interrupt" storm on resume from suspend
Date: Wed,  7 Sep 2016 17:56:12 +0300
Message-ID: <20160907145612.12512-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

tps6586x MFD spews hundreds of "failed to read interrupt status" KMSG's on
resume from suspend with eventual disablement of the IRQ when tps6586x's
RTC wakes the system. This happens because IRQ gets handled before I2C been
resumed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/tps6586x.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index 5628a6b..48c7045 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -133,6 +133,9 @@ struct tps6586x {
 	u32			irq_en;
 	u8			mask_reg[5];
 	struct irq_domain	*irq_domain;
+
+	bool			suspended;
+	bool			irq_disabled;
 };
 
 static inline struct tps6586x *dev_to_tps6586x(struct device *dev)
@@ -315,6 +318,12 @@ static irqreturn_t tps6586x_irq(int irq, void *data)
 	u32 acks;
 	int ret = 0;
 
+	if (tps6586x->suspended) {
+		disable_irq_nosync(tps6586x->irq);
+		tps6586x->irq_disabled = true;
+		return IRQ_HANDLED;
+	}
+
 	ret = tps6586x_reads(tps6586x->dev, TPS6586X_INT_ACK1,
 			     sizeof(acks), (uint8_t *)&acks);
 
@@ -600,10 +609,38 @@ static const struct i2c_device_id tps6586x_id_table[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tps6586x_id_table);
 
+static int tps6586x_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct tps6586x *tps6586x = i2c_get_clientdata(client);
+
+	tps6586x->suspended = true;
+
+	return 0;
+}
+
+static int tps6586x_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct tps6586x *tps6586x = i2c_get_clientdata(client);
+
+	tps6586x->suspended = false;
+
+	if (tps6586x->irq_disabled) {
+		enable_irq(client->irq);
+		tps6586x->irq_disabled = false;
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(tps6586x_pm_ops, tps6586x_suspend, tps6586x_resume);
+
 static struct i2c_driver tps6586x_driver = {
 	.driver	= {
 		.name	= "tps6586x",
 		.of_match_table = of_match_ptr(tps6586x_of_match),
+		.pm	= &tps6586x_pm_ops,
 	},
 	.probe		= tps6586x_i2c_probe,
 	.remove		= tps6586x_i2c_remove,
-- 
2.9.3
