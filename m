From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 20/22] power_supply: bq2415x_charger: Decrement the power
 supply's device reference counter
Date: Tue, 10 Mar 2015 09:27:24 +0100
Message-ID: <1425976046-20973-21-git-send-email-k.kozlowski__18132.762463256$1425976232$gmane$org@samsung.com>
References: <1425976046-20973-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1425976046-20973-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, David Herrmann <dh.herrmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Cezary Jackiewicz <cezary.jackiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use power_supply_put() to decrement the power supply's device reference
counter (increased by power_supply_get_by_name() or
power_supply_get_by_phandle()).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/power/bq2415x_charger.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/power/bq2415x_charger.c b/drivers/power/bq2415x_charger.c
index c745d278815d..6c534dcbc19c 100644
--- a/drivers/power/bq2415x_charger.c
+++ b/drivers/power/bq2415x_charger.c
@@ -1594,27 +1594,27 @@ static int bq2415x_probe(struct i2c_client *client,
 		ret = of_property_read_u32(np, "ti,current-limit",
 				&bq->init_data.current_limit);
 		if (ret)
-			goto error_2;
+			goto error_3;
 		ret = of_property_read_u32(np, "ti,weak-battery-voltage",
 				&bq->init_data.weak_battery_voltage);
 		if (ret)
-			goto error_2;
+			goto error_3;
 		ret = of_property_read_u32(np, "ti,battery-regulation-voltage",
 				&bq->init_data.battery_regulation_voltage);
 		if (ret)
-			goto error_2;
+			goto error_3;
 		ret = of_property_read_u32(np, "ti,charge-current",
 				&bq->init_data.charge_current);
 		if (ret)
-			goto error_2;
+			goto error_3;
 		ret = of_property_read_u32(np, "ti,termination-current",
 				&bq->init_data.termination_current);
 		if (ret)
-			goto error_2;
+			goto error_3;
 		ret = of_property_read_u32(np, "ti,resistor-sense",
 				&bq->init_data.resistor_sense);
 		if (ret)
-			goto error_2;
+			goto error_3;
 	} else {
 		memcpy(&bq->init_data, pdata, sizeof(bq->init_data));
 	}
@@ -1624,19 +1624,19 @@ static int bq2415x_probe(struct i2c_client *client,
 	ret = bq2415x_power_supply_init(bq);
 	if (ret) {
 		dev_err(bq->dev, "failed to register power supply: %d\n", ret);
-		goto error_2;
+		goto error_3;
 	}
 
 	ret = bq2415x_sysfs_init(bq);
 	if (ret) {
 		dev_err(bq->dev, "failed to create sysfs entries: %d\n", ret);
-		goto error_3;
+		goto error_4;
 	}
 
 	ret = bq2415x_set_defaults(bq);
 	if (ret) {
 		dev_err(bq->dev, "failed to set default values: %d\n", ret);
-		goto error_4;
+		goto error_5;
 	}
 
 	if (bq->notify_psy) {
@@ -1644,7 +1644,7 @@ static int bq2415x_probe(struct i2c_client *client,
 		ret = power_supply_reg_notifier(&bq->nb);
 		if (ret) {
 			dev_err(bq->dev, "failed to reg notifier: %d\n", ret);
-			goto error_5;
+			goto error_6;
 		}
 
 		/* Query for initial reported_mode and set it */
@@ -1664,11 +1664,14 @@ static int bq2415x_probe(struct i2c_client *client,
 	dev_info(bq->dev, "driver registered\n");
 	return 0;
 
+error_6:
 error_5:
-error_4:
 	bq2415x_sysfs_exit(bq);
-error_3:
+error_4:
 	bq2415x_power_supply_exit(bq);
+error_3:
+	if (bq->notify_psy)
+		power_supply_put(bq->notify_psy);
 error_2:
 	kfree(name);
 error_1:
@@ -1685,8 +1688,10 @@ static int bq2415x_remove(struct i2c_client *client)
 {
 	struct bq2415x_device *bq = i2c_get_clientdata(client);
 
-	if (bq->notify_psy)
+	if (bq->notify_psy) {
 		power_supply_unreg_notifier(&bq->nb);
+		power_supply_put(bq->notify_psy);
+	}
 
 	bq2415x_sysfs_exit(bq);
 	bq2415x_power_supply_exit(bq);
-- 
1.9.1
