From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 05/22] power_supply: Add API for safe access of power supply
 function attrs
Date: Tue, 10 Mar 2015 09:27:09 +0100
Message-ID: <1425976046-20973-6-git-send-email-k.kozlowski__23816.3756709129$1425976668$gmane$org@samsung.com>
References: <1425976046-20973-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1425976046-20973-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, David Herrmann <dh.herrmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Cezary Jackiewicz <cezary.jackiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add simple wrappers for accessing power supply's function attributes:
 - get_property -> power_supply_get_property
 - set_property -> power_supply_set_property
 - property_is_writeable -> power_supply_property_is_writeable
 - external_power_changed -> power_supply_external_power_changed

This API along with atomic usage counter adds a safe way of accessing a
power supply from another driver. If power supply is unregistered after
obtaining reference to it by some driver, then the API wrappers won't be
executed in invalid (freed) context.

Next patch changing the ownership of power supply class is still needed
to fully fix race conditions in accessing freed power supply.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
---
 drivers/power/power_supply_core.c | 47 ++++++++++++++++++++++++++++++++++++++-
 include/linux/power_supply.h      | 16 +++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/power/power_supply_core.c b/drivers/power/power_supply_core.c
index a21e36ed8d41..583dece8845b 100644
--- a/drivers/power/power_supply_core.c
+++ b/drivers/power/power_supply_core.c
@@ -314,7 +314,9 @@ EXPORT_SYMBOL_GPL(power_supply_is_system_supplied);
 
 int power_supply_set_battery_charged(struct power_supply *psy)
 {
-	if (psy->type == POWER_SUPPLY_TYPE_BATTERY && psy->set_charged) {
+	if (atomic_read(&psy->use_cnt) >= 0 &&
+			psy->type == POWER_SUPPLY_TYPE_BATTERY &&
+			psy->set_charged) {
 		psy->set_charged(psy);
 		return 0;
 	}
@@ -366,6 +368,47 @@ struct power_supply *power_supply_get_by_phandle(struct device_node *np,
 EXPORT_SYMBOL_GPL(power_supply_get_by_phandle);
 #endif /* CONFIG_OF */
 
+int power_supply_get_property(struct power_supply *psy,
+			    enum power_supply_property psp,
+			    union power_supply_propval *val)
+{
+	if (atomic_read(&psy->use_cnt) <= 0)
+		return -ENODEV;
+
+	return psy->get_property(psy, psp, val);
+}
+EXPORT_SYMBOL_GPL(power_supply_get_property);
+
+int power_supply_set_property(struct power_supply *psy,
+			    enum power_supply_property psp,
+			    const union power_supply_propval *val)
+{
+	if (atomic_read(&psy->use_cnt) <= 0 || !psy->set_property)
+		return -ENODEV;
+
+	return psy->set_property(psy, psp, val);
+}
+EXPORT_SYMBOL_GPL(power_supply_set_property);
+
+int power_supply_property_is_writeable(struct power_supply *psy,
+					enum power_supply_property psp)
+{
+	if (atomic_read(&psy->use_cnt) <= 0 || !psy->property_is_writeable)
+		return -ENODEV;
+
+	return psy->property_is_writeable(psy, psp);
+}
+EXPORT_SYMBOL_GPL(power_supply_property_is_writeable);
+
+void power_supply_external_power_changed(struct power_supply *psy)
+{
+	if (atomic_read(&psy->use_cnt) <= 0 || !psy->external_power_changed)
+		return;
+
+	psy->external_power_changed(psy);
+}
+EXPORT_SYMBOL_GPL(power_supply_external_power_changed);
+
 int power_supply_powers(struct power_supply *psy, struct device *dev)
 {
 	return sysfs_create_link(&psy->dev->kobj, &dev->kobj, "powers");
@@ -555,6 +598,7 @@ static int __power_supply_register(struct device *parent,
 	dev->release = power_supply_dev_release;
 	dev_set_drvdata(dev, psy);
 	psy->dev = dev;
+	atomic_inc(&psy->use_cnt);
 	if (cfg) {
 		psy->drv_data = cfg->drv_data;
 		psy->of_node = cfg->of_node;
@@ -676,6 +720,7 @@ EXPORT_SYMBOL_GPL(devm_power_supply_register_no_ws);
 
 void power_supply_unregister(struct power_supply *psy)
 {
+	WARN_ON(atomic_dec_return(&psy->use_cnt));
 	cancel_work_sync(&psy->changed_work);
 	sysfs_remove_link(&psy->dev->kobj, "powers");
 	power_supply_remove_triggers(psy);
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 0d7c95f634a5..7ae60346465f 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -199,6 +199,12 @@ struct power_supply {
 	size_t num_supplies;
 	struct device_node *of_node;
 
+	/*
+	 * Functions for drivers implementing power supply class.
+	 * These shouldn't be called directly by other drivers for accessing
+	 * this power supply. Instead use power_supply_*() functions (for
+	 * example power_supply_get_property()).
+	 */
 	int (*get_property)(struct power_supply *psy,
 			    enum power_supply_property psp,
 			    union power_supply_propval *val);
@@ -227,6 +233,7 @@ struct power_supply {
 	struct work_struct changed_work;
 	spinlock_t changed_lock;
 	bool changed;
+	atomic_t use_cnt;
 #ifdef CONFIG_THERMAL
 	struct thermal_zone_device *tzd;
 	struct thermal_cooling_device *tcd;
@@ -287,6 +294,15 @@ extern int power_supply_is_system_supplied(void);
 static inline int power_supply_is_system_supplied(void) { return -ENOSYS; }
 #endif
 
+extern int power_supply_get_property(struct power_supply *psy,
+			    enum power_supply_property psp,
+			    union power_supply_propval *val);
+extern int power_supply_set_property(struct power_supply *psy,
+			    enum power_supply_property psp,
+			    const union power_supply_propval *val);
+extern int power_supply_property_is_writeable(struct power_supply *psy,
+					enum power_supply_property psp);
+extern void power_supply_external_power_changed(struct power_supply *psy);
 extern int power_supply_register(struct device *parent,
 				 struct power_supply *psy,
 				 const struct power_supply_config *cfg);
-- 
1.9.1
