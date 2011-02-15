From: vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Subject: [PATCH v6] mfd: tps6586x: add RTC driver for TI TPS6586x
Date: Tue, 15 Feb 2011 15:04:45 +0530
Message-ID: <1297762485-29648-1-git-send-email-vwadekar@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARitger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

this driver supports setting of alarms, and
reading/setting of time

From: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v6: enable/disable rtc irq while setting alarms

 drivers/rtc/Kconfig          |    6 +
 drivers/rtc/rtc-tps6586x.c   |  354 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/tps6586x.h |   14 ++
 3 files changed, 374 insertions(+), 0 deletions(-)
 create mode 100644 drivers/rtc/rtc-tps6586x.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 4941cad..3ab89ca 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -297,6 +297,12 @@ config RTC_DRV_DM355EVM
 	help
 	  Supports the RTC firmware in the MSP430 on the DM355 EVM.
 
+config RTC_DRV_TPS6586X
+	tristate "TI TPS6586X RTC"
+	depends on MFD_TPS6586X
+	help
+	  This driver supports TPS6586X RTC
+
 config RTC_DRV_TWL92330
 	boolean "TI TWL92330/Menelaus"
 	depends on MENELAUS
diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
new file mode 100644
index 0000000..7d571b0
--- /dev/null
+++ b/drivers/rtc/rtc-tps6586x.c
@@ -0,0 +1,354 @@
+/*
+ * drivers/rtc/rtc-tps6586x.c
+ *
+ * RTC driver for TI TPS6586x
+ *
+ * Copyright (c) 2010, NVIDIA Corporation.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along
+ * with this program; if not, write to the Free Software Foundation, Inc.,
+ * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/mfd/tps6586x.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/slab.h>
+
+#define RTC_CTRL	0xc0
+#define RTC_ENABLE	BIT(5)	/* enables alarm */
+#define RTC_HIRES	BIT(4)	/* 1Khz or 32Khz updates */
+#define RTC_ALARM1_HI	0xc1
+#define RTC_COUNT4	0xc6
+
+struct tps6586x_rtc {
+	unsigned long		epoch_start;
+	int			irq;
+	struct rtc_device	*rtc;
+	bool			irq_en;
+};
+
+static inline struct device *to_tps6586x_dev(struct device *dev)
+{
+	return dev->parent;
+}
+
+static int tps6586x_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(dev);
+	struct device *tps_dev = to_tps6586x_dev(dev);
+	unsigned long long ticks = 0;
+	unsigned long seconds;
+	u8 buff[5];
+	int err;
+	int i;
+
+	err = tps6586x_reads(tps_dev, RTC_COUNT4, sizeof(buff), buff);
+	if (err < 0) {
+		dev_err(dev, "failed to read counter\n");
+		return err;
+	}
+
+	for (i = 0; i < sizeof(buff); i++) {
+		ticks <<= 8;
+		ticks |= buff[i];
+	}
+
+	seconds = ticks >> 10;
+
+	seconds += rtc->epoch_start;
+	rtc_time_to_tm(seconds, tm);
+	return rtc_valid_tm(tm);
+}
+
+static int tps6586x_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(dev);
+	struct device *tps_dev = to_tps6586x_dev(dev);
+	unsigned long long ticks;
+	unsigned long seconds;
+	u8 buff[5];
+	int err;
+
+	rtc_tm_to_time(tm, &seconds);
+
+	if (WARN_ON(seconds < rtc->epoch_start)) {
+		dev_err(dev, "requested time unsupported\n");
+		return -EINVAL;
+	}
+
+	if (alrm->enabled && !rtc->irq_en) {
+		enable_irq(rtc->irq);
+		rtc->irq_en = true;
+	} else if (!alrm->enabled && rtc->irq_en) {
+		disable_irq(rtc->irq);
+		rtc->irq_en = false;
+	}
+
+	seconds -= rtc->epoch_start;
+
+	ticks = (unsigned long long)seconds << 10;
+	buff[0] = (ticks >> 32) & 0xff;
+	buff[1] = (ticks >> 24) & 0xff;
+	buff[2] = (ticks >> 16) & 0xff;
+	buff[3] = (ticks >> 8) & 0xff;
+	buff[4] = ticks & 0xff;
+
+	err = tps6586x_clr_bits(tps_dev, RTC_CTRL, RTC_ENABLE);
+	if (err < 0) {
+		dev_err(dev, "failed to clear RTC_ENABLE\n");
+		return err;
+	}
+
+	err = tps6586x_writes(tps_dev, RTC_COUNT4, sizeof(buff), buff);
+	if (err < 0) {
+		dev_err(dev, "failed to program new time\n");
+		return err;
+	}
+
+	err = tps6586x_set_bits(tps_dev, RTC_CTRL, RTC_ENABLE);
+	if (err < 0) {
+		dev_err(dev, "failed to set RTC_ENABLE\n");
+		return err;
+	}
+
+	return 0;
+}
+
+static int tps6586x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(dev);
+	struct device *tps_dev = to_tps6586x_dev(dev);
+	unsigned long seconds;
+	unsigned long ticks;
+	u8 buff[3];
+	int err;
+
+	if (rtc->irq == -1)
+		return -EIO;
+
+	rtc_tm_to_time(&alrm->time, &seconds);
+
+	if (WARN_ON(alrm->enabled && (seconds < rtc->epoch_start))) {
+		dev_err(dev, "can't set alarm to requested time\n");
+		return -EINVAL;
+	}
+
+	seconds -= rtc->epoch_start;
+	ticks = (unsigned long long)seconds << 10;
+
+	buff[0] = (ticks >> 16) & 0xff;
+	buff[1] = (ticks >> 8) & 0xff;
+	buff[2] = ticks & 0xff;
+
+	err = tps6586x_writes(tps_dev, RTC_ALARM1_HI, sizeof(buff), buff);
+	if (err)
+		dev_err(tps_dev, "unable to program alarm\n");
+
+	return err;
+}
+
+static int tps6586x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(dev);
+	struct device *tps_dev = to_tps6586x_dev(dev);
+	unsigned long ticks;
+	unsigned long seconds;
+	u8 buff[3];
+	int err;
+
+	err = tps6586x_reads(tps_dev, RTC_ALARM1_HI, sizeof(buff), buff);
+	if (err)
+		return err;
+
+	ticks = (buff[0] << 16) | (buff[1] << 8) | buff[2];
+	seconds = ticks >> 10;
+	seconds += rtc->epoch_start;
+
+	rtc_time_to_tm(seconds, &alrm->time);
+
+	return 0;
+}
+
+static int tps6586x_rtc_alarm_irq_enable(struct device *dev,
+					 unsigned int enabled)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(dev);
+	struct device *tps_dev = to_tps6586x_dev(dev);
+	u8 buff;
+	int err;
+
+	if (rtc->irq == -1)
+		return -EIO;
+
+	err = tps6586x_read(tps_dev, RTC_CTRL, &buff);
+	if (err < 0) {
+		dev_err(dev, "failed to read RTC_CTRL\n");
+		return err;
+	}
+
+	if ((enabled && (buff & RTC_ENABLE)) ||
+	    (!enabled && !(buff & RTC_ENABLE)))
+		return 0;
+
+	if (enabled) {
+		err = tps6586x_set_bits(tps_dev, RTC_CTRL, RTC_ENABLE);
+		if (err < 0) {
+			dev_err(dev, "failed to set RTC_ENABLE\n");
+			return err;
+		}
+		if (!rtc->irq_en) {
+			enable_irq(rtc->irq);
+			rtc->irq_en = true;
+		}
+	} else {
+		err = tps6586x_clr_bits(tps_dev, RTC_CTRL, RTC_ENABLE);
+		if (err < 0) {
+			dev_err(dev, "failed to clear RTC_ENABLE\n");
+			return err;
+		}
+		if (!rtc->irq_en) {
+			disable_irq(rtc->irq);
+			rtc->irq_en = false;
+		}
+	}
+
+	return 0;
+}
+
+static const struct rtc_class_ops tps6586x_rtc_ops = {
+	.read_time	= tps6586x_rtc_read_time,
+	.set_time	= tps6586x_rtc_set_time,
+	.set_alarm	= tps6586x_rtc_set_alarm,
+	.read_alarm	= tps6586x_rtc_read_alarm,
+	.alarm_irq_enable = tps6586x_rtc_alarm_irq_enable,
+};
+
+static irqreturn_t tps6586x_rtc_irq(int irq, void *data)
+{
+	struct device *dev = data;
+	struct tps6586x_rtc *rtc = dev_get_drvdata(dev);
+
+	rtc_update_irq(rtc->rtc, 1, RTC_IRQF | RTC_AF);
+	return IRQ_HANDLED;
+}
+
+static int __devinit tps6586x_rtc_probe(struct platform_device *pdev)
+{
+	struct tps6586x_rtc_platform_data *pdata = pdev->dev.platform_data;
+	struct device *tps_dev = to_tps6586x_dev(&pdev->dev);
+	struct tps6586x_rtc *rtc;
+	int err;
+	struct tps6586x_epoch_start *epoch;
+
+	rtc = kzalloc(sizeof(*rtc), GFP_KERNEL);
+
+	if (!rtc)
+		return -ENOMEM;
+
+	rtc->irq = -1;
+
+	if (!pdata) {
+		dev_err(&pdev->dev, "no platform_data specified\n");
+		return -EINVAL;
+	}
+
+	if (pdata->irq < 0)
+		dev_warn(&pdev->dev, "no IRQ specified, wakeup is disabled\n");
+
+	epoch = &pdata->start;
+	rtc->epoch_start = mktime(epoch->year, epoch->month, epoch->day,
+				  epoch->hour, epoch->min, epoch->sec);
+
+	device_init_wakeup(&pdev->dev, 1);
+
+	rtc->rtc = rtc_device_register("tps6586x-rtc", &pdev->dev,
+				       &tps6586x_rtc_ops, THIS_MODULE);
+
+	if (IS_ERR(rtc->rtc)) {
+		err = PTR_ERR(rtc->rtc);
+		goto fail;
+	}
+
+	/* disable high-res mode, enable tick counting */
+	err = tps6586x_update(tps_dev, RTC_CTRL,
+			      (RTC_ENABLE | RTC_HIRES), RTC_ENABLE);
+	if (err < 0) {
+		dev_err(&pdev->dev, "unable to start counter\n");
+		goto fail;
+	}
+
+	dev_set_drvdata(&pdev->dev, rtc);
+	if (pdata && (pdata->irq >= 0)) {
+		rtc->irq = pdata->irq;
+		err = request_threaded_irq(pdata->irq, NULL, tps6586x_rtc_irq,
+					   IRQF_ONESHOT, "tps6586x-rtc",
+					   &pdev->dev);
+		if (err) {
+			dev_warn(&pdev->dev, "unable to request IRQ(%d)\n", rtc->irq);
+			rtc->irq = -1;
+		} else {
+			disable_irq(rtc->irq);
+			enable_irq_wake(rtc->irq);
+		}
+	}
+
+	return 0;
+
+fail:
+	if (!IS_ERR_OR_NULL(rtc->rtc))
+		rtc_device_unregister(rtc->rtc);
+	kfree(rtc);
+	return err;
+}
+
+static int __devexit tps6586x_rtc_remove(struct platform_device *pdev)
+{
+	struct tps6586x_rtc *rtc = dev_get_drvdata(&pdev->dev);
+
+	if (rtc->irq != -1)
+		free_irq(rtc->irq, rtc);
+	rtc_device_unregister(rtc->rtc);
+	kfree(rtc);
+	return 0;
+}
+
+static struct platform_driver tps6586x_rtc_driver = {
+	.driver	= {
+		.name	= "tps6586x-rtc",
+		.owner	= THIS_MODULE,
+	},
+	.probe	= tps6586x_rtc_probe,
+	.remove	= __devexit_p(tps6586x_rtc_remove),
+};
+
+static int __init tps6586x_rtc_init(void)
+{
+	return platform_driver_register(&tps6586x_rtc_driver);
+}
+module_init(tps6586x_rtc_init);
+
+static void __exit tps6586x_rtc_exit(void)
+{
+	platform_driver_unregister(&tps6586x_rtc_driver);
+}
+module_exit(tps6586x_rtc_exit);
+
+MODULE_DESCRIPTION("TI TPS6586x RTC driver");
+MODULE_AUTHOR("NVIDIA Corporation");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:rtc-tps6586x")
diff --git a/include/linux/mfd/tps6586x.h b/include/linux/mfd/tps6586x.h
index b6bab1b..eb5389c 100644
--- a/include/linux/mfd/tps6586x.h
+++ b/include/linux/mfd/tps6586x.h
@@ -54,6 +54,20 @@ struct tps6586x_subdev_info {
 	void		*platform_data;
 };
 
+struct tps6586x_epoch_start {
+	int year;
+	int month;
+	int day;
+	int hour;
+	int min;
+	int sec;
+};
+
+struct tps6586x_rtc_platform_data {
+	int irq;
+	struct tps6586x_epoch_start start;
+};
+
 struct tps6586x_platform_data {
 	int num_subdevs;
 	struct tps6586x_subdev_info *subdevs;
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
