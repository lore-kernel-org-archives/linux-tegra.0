From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] mfd: tps65910: Add wakeup support
Date: Fri, 20 Jan 2012 16:39:30 +0530
Message-ID: <1327057770-6688-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Adding wakeup support for PMIC device 65910. This can be
selected through the board specific platform data.

The wakeup should enabled if PMIC need to be configure for
waking up system through RTC or ONKEY.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch will enable the wakeup functionality through
device tps65910/tps65911.

 drivers/mfd/tps65910-irq.c   |    9 +++++++++
 drivers/mfd/tps65910.c       |    1 +
 include/linux/mfd/tps65910.h |    2 ++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/drivers/mfd/tps65910-irq.c b/drivers/mfd/tps65910-irq.c
index a56be93..8b6f423 100644
--- a/drivers/mfd/tps65910-irq.c
+++ b/drivers/mfd/tps65910-irq.c
@@ -210,6 +210,15 @@ int tps65910_irq_init(struct tps65910 *tps65910, int irq,
 	if (ret != 0)
 		dev_err(tps65910->dev, "Failed to request IRQ: %d\n", ret);
 
+	if (!ret && pdata->en_wakeup) {
+		device_init_wakeup(tps65910->dev, 1);
+		ret = enable_irq_wake(irq);
+		if (ret < 0)
+			dev_warn(tps65910->dev, "Can't enable IRQ as wake "
+				"source: %d\n", ret);
+		return 0;
+	}
+
 	return ret;
 }
 
diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 8517481..88e3dec 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -169,6 +169,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 
 	init_data->irq = pmic_plat_data->irq;
 	init_data->irq_base = pmic_plat_data->irq_base;
+	init_data->en_wakeup = pmic_plat_data->en_wakeup;
 
 	tps65910_gpio_init(tps65910, pmic_plat_data->gpio_base);
 
diff --git a/include/linux/mfd/tps65910.h b/include/linux/mfd/tps65910.h
index d0cb12e..ba8eb6a 100644
--- a/include/linux/mfd/tps65910.h
+++ b/include/linux/mfd/tps65910.h
@@ -777,6 +777,7 @@ struct tps65910_board {
 	int gpio_base;
 	int irq;
 	int irq_base;
+	int en_wakeup;
 	int vmbch_threshold;
 	int vmbch2_threshold;
 	struct regulator_init_data *tps65910_pmic_init_data[TPS65910_NUM_REGS];
@@ -813,6 +814,7 @@ struct tps65910 {
 struct tps65910_platform_data {
 	int irq;
 	int irq_base;
+	int en_wakeup;
 };
 
 int tps65910_set_bits(struct tps65910 *tps65910, u8 reg, u8 mask);
-- 
1.7.1.1
