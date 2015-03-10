From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 07/22] power_supply: 88pm860x_charger: Use power_supply_*()
 API for accessing function attrs
Date: Tue, 10 Mar 2015 09:27:11 +0100
Message-ID: <1425976046-20973-8-git-send-email-k.kozlowski__43603.0005490922$1425976606$gmane$org@samsung.com>
References: <1425976046-20973-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1425976046-20973-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, David Herrmann <dh.herrmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Cezary Jackiewicz <cezary.jackiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Replace direct calls to power supply function attributes with wrappers.
Wrappers provide safe access in case of unregistering the power
supply (e.g. by removing the driver). Replace:
 - get_property -> power_supply_get_property
 - set_property -> power_supply_set_property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/power/88pm860x_charger.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/power/88pm860x_charger.c b/drivers/power/88pm860x_charger.c
index ac352a6c03ea..98e31419d9cf 100644
--- a/drivers/power/88pm860x_charger.c
+++ b/drivers/power/88pm860x_charger.c
@@ -296,12 +296,13 @@ static int set_charging_fsm(struct pm860x_charger_info *info)
 	psy = power_supply_get_by_name(pm860x_supplied_to[0]);
 	if (!psy)
 		return -EINVAL;
-	ret = psy->get_property(psy, POWER_SUPPLY_PROP_VOLTAGE_NOW, &data);
+	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_VOLTAGE_NOW,
+			&data);
 	if (ret)
 		return ret;
 	vbatt = data.intval / 1000;
 
-	ret = psy->get_property(psy, POWER_SUPPLY_PROP_PRESENT, &data);
+	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_PRESENT, &data);
 	if (ret)
 		return ret;
 
@@ -430,7 +431,7 @@ static irqreturn_t pm860x_temp_handler(int irq, void *data)
 	psy = power_supply_get_by_name(pm860x_supplied_to[0]);
 	if (!psy)
 		goto out;
-	ret = psy->get_property(psy, POWER_SUPPLY_PROP_TEMP, &temp);
+	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_TEMP, &temp);
 	if (ret)
 		goto out;
 	value = temp.intval / 10;
@@ -485,7 +486,8 @@ static irqreturn_t pm860x_done_handler(int irq, void *data)
 	psy = power_supply_get_by_name(pm860x_supplied_to[0]);
 	if (!psy)
 		goto out;
-	ret = psy->get_property(psy, POWER_SUPPLY_PROP_VOLTAGE_NOW, &val);
+	ret = power_supply_get_property(psy, POWER_SUPPLY_PROP_VOLTAGE_NOW,
+			&val);
 	if (ret)
 		goto out;
 	vbatt = val.intval / 1000;
@@ -500,7 +502,8 @@ static irqreturn_t pm860x_done_handler(int irq, void *data)
 	if (ret < 0)
 		goto out;
 	if (vbatt > CHARGE_THRESHOLD && ret & STATUS2_CHG)
-		psy->set_property(psy, POWER_SUPPLY_PROP_CHARGE_FULL, &val);
+		power_supply_set_property(psy, POWER_SUPPLY_PROP_CHARGE_FULL,
+				&val);
 
 out:
 	mutex_unlock(&info->lock);
-- 
1.9.1
