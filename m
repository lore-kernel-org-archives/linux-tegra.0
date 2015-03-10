From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v6 08/22] power_supply: ab8500: Use power_supply_*() API for
 accessing function attrs
Date: Tue, 10 Mar 2015 09:27:12 +0100
Message-ID: <1425976046-20973-9-git-send-email-k.kozlowski__44103.8401950665$1425976626$gmane$org@samsung.com>
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

Signed-off-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Jonghwa Lee <jonghwa3.lee-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Acked-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/power/ab8500_btemp.c    | 2 +-
 drivers/power/ab8500_charger.c  | 2 +-
 drivers/power/ab8500_fg.c       | 2 +-
 drivers/power/abx500_chargalg.c | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/power/ab8500_btemp.c b/drivers/power/ab8500_btemp.c
index d5683f503a4e..4d18464d6400 100644
--- a/drivers/power/ab8500_btemp.c
+++ b/drivers/power/ab8500_btemp.c
@@ -938,7 +938,7 @@ static int ab8500_btemp_get_ext_psy_data(struct device *dev, void *data)
 		enum power_supply_property prop;
 		prop = ext->properties[j];
 
-		if (ext->get_property(ext, prop, &ret))
+		if (power_supply_get_property(ext, prop, &ret))
 			continue;
 
 		switch (prop) {
diff --git a/drivers/power/ab8500_charger.c b/drivers/power/ab8500_charger.c
index cee9b9e46825..f9eb7fff1d65 100644
--- a/drivers/power/ab8500_charger.c
+++ b/drivers/power/ab8500_charger.c
@@ -1957,7 +1957,7 @@ static int ab8500_charger_get_ext_psy_data(struct device *dev, void *data)
 		enum power_supply_property prop;
 		prop = ext->properties[j];
 
-		if (ext->get_property(ext, prop, &ret))
+		if (power_supply_get_property(ext, prop, &ret))
 			continue;
 
 		switch (prop) {
diff --git a/drivers/power/ab8500_fg.c b/drivers/power/ab8500_fg.c
index 73bdb4dc4142..7a2e3ac44cf3 100644
--- a/drivers/power/ab8500_fg.c
+++ b/drivers/power/ab8500_fg.c
@@ -2200,7 +2200,7 @@ static int ab8500_fg_get_ext_psy_data(struct device *dev, void *data)
 		enum power_supply_property prop;
 		prop = ext->properties[j];
 
-		if (ext->get_property(ext, prop, &ret))
+		if (power_supply_get_property(ext, prop, &ret))
 			continue;
 
 		switch (prop) {
diff --git a/drivers/power/abx500_chargalg.c b/drivers/power/abx500_chargalg.c
index 0da4415cbc10..ac6f4a22f846 100644
--- a/drivers/power/abx500_chargalg.c
+++ b/drivers/power/abx500_chargalg.c
@@ -1001,7 +1001,7 @@ static int abx500_chargalg_get_ext_psy_data(struct device *dev, void *data)
 	 * property because of handling that sysfs entry on its own, this is
 	 * the place to get the battery capacity.
 	 */
-	if (!ext->get_property(ext, POWER_SUPPLY_PROP_CAPACITY, &ret)) {
+	if (!power_supply_get_property(ext, POWER_SUPPLY_PROP_CAPACITY, &ret)) {
 		di->batt_data.percent = ret.intval;
 		capacity_updated = true;
 	}
@@ -1019,7 +1019,7 @@ static int abx500_chargalg_get_ext_psy_data(struct device *dev, void *data)
 			ext->type == POWER_SUPPLY_TYPE_USB)
 			di->usb_chg = psy_to_ux500_charger(ext);
 
-		if (ext->get_property(ext, prop, &ret))
+		if (power_supply_get_property(ext, prop, &ret))
 			continue;
 		switch (prop) {
 		case POWER_SUPPLY_PROP_PRESENT:
-- 
1.9.1
