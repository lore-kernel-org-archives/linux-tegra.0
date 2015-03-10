From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 14/22] power_supply: Add power_supply_put for decrementing
 device reference counter
Date: Tue, 10 Mar 2015 09:27:18 +0100
Message-ID: <1425976046-20973-15-git-send-email-k.kozlowski__8273.33588754318$1425976512$gmane$org@samsung.com>
References: <1425976046-20973-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1425976046-20973-1-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jiri Kosina <jkosina-AlSwsSmVLrQ@public.gmane.org>, David Herrmann <dh.herrmann-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Cezary Jackiewicz <cezary.jackiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>, Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ingo Molnar <mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "H. Peter Anvin" <hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org>, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.orglinux-
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The power_supply_get_by_phandle() and power_supply_get_by_name() use
function class_find_device() for obtaining the reference to power
supply. Each use of class_find_device() increases the power supply's
device reference counter.

However the reference counter was not decreased by users of this API.
Thus final device_unregister() call from power_supply_unregister() could
not release the device and clean up its resources. This lead to memory
leak if at least once power_supply_get_by_*() was called between
registering and unregistering the power supply.

Add and document new API power_supply_put() for decrementing the
reference counter.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/power/power_supply_core.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/power_supply.h      |  1 +
 2 files changed, 39 insertions(+)

diff --git a/drivers/power/power_supply_core.c b/drivers/power/power_supply_core.c
index e51405b176c8..b4ec14683b7f 100644
--- a/drivers/power/power_supply_core.c
+++ b/drivers/power/power_supply_core.c
@@ -336,6 +336,17 @@ static int power_supply_match_device_by_name(struct device *dev, const void *dat
 	return strcmp(psy->desc->name, name) == 0;
 }
 
+/**
+ * power_supply_get_by_name() - Search for a power supply and returns its ref
+ * @name: Power supply name to fetch
+ *
+ * If power supply was found, it increases reference count for the
+ * internal power supply's device. The user should power_supply_put()
+ * after usage.
+ *
+ * Return: On success returns a reference to a power supply with
+ * matching name equals to @name, a NULL otherwise.
+ */
 struct power_supply *power_supply_get_by_name(const char *name)
 {
 	struct device *dev = class_find_device(power_supply_class, NULL, name,
@@ -345,12 +356,39 @@ struct power_supply *power_supply_get_by_name(const char *name)
 }
 EXPORT_SYMBOL_GPL(power_supply_get_by_name);
 
+/**
+ * power_supply_put() - Drop reference obtained with power_supply_get_by_name
+ * @psy: Reference to put
+ *
+ * The reference to power supply should be put before unregistering
+ * the power supply.
+ */
+void power_supply_put(struct power_supply *psy)
+{
+	might_sleep();
+
+	put_device(&psy->dev);
+}
+EXPORT_SYMBOL_GPL(power_supply_put);
+
 #ifdef CONFIG_OF
 static int power_supply_match_device_node(struct device *dev, const void *data)
 {
 	return dev->parent && dev->parent->of_node == data;
 }
 
+/**
+ * power_supply_get_by_phandle() - Search for a power supply and returns its ref
+ * @np: Pointer to device node holding phandle property
+ * @phandle_name: Name of property holding a power supply name
+ *
+ * If power supply was found, it increases reference count for the
+ * internal power supply's device. The user should power_supply_put()
+ * after usage.
+ *
+ * Return: On success returns a reference to a power supply with
+ * matching name equals to value under @property, NULL or ERR_PTR otherwise.
+ */
 struct power_supply *power_supply_get_by_phandle(struct device_node *np,
 							const char *property)
 {
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index ea15eb68f609..75a1dd8dc56e 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -282,6 +282,7 @@ extern struct atomic_notifier_head power_supply_notifier;
 extern int power_supply_reg_notifier(struct notifier_block *nb);
 extern void power_supply_unreg_notifier(struct notifier_block *nb);
 extern struct power_supply *power_supply_get_by_name(const char *name);
+extern void power_supply_put(struct power_supply *psy);
 #ifdef CONFIG_OF
 extern struct power_supply *power_supply_get_by_phandle(struct device_node *np,
 							const char *property);
-- 
1.9.1
