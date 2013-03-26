From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [REPOST Patch v1 2/3] power: power_supply: Add core support for supplied_from
Date: Mon, 25 Mar 2013 22:24:49 -0400
Message-ID: <1364264690-2124-3-git-send-email-rklein@nvidia.com>
References: <1364264690-2124-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364264690-2124-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds support for supplies to register a list of char *'s
which represent the list of supplies which supply them. This is the
opposite as the supplied_to list.

This change maintains support for supplied_to until all drivers which
make use of it already are converted.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v1:
 - changed from RFC v2 -> patch v1
 - removed list logic and instead added supplied_from char ** array and
   num_supplies field

v2 (RFC):
 - changed from struct device_node * contained in suppliers to a list
   stored in the supplies.
 - changed logic for the is_supplied_by check to handle the entire loop
   as the array structure is difference between the 2 paths.

 drivers/power/power_supply_core.c |   49 +++++++++++++++++++++++++++----------
 include/linux/power_supply.h      |    3 +++
 2 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/power/power_supply_core.c b/drivers/power/power_supply_core.c
index 5deac43..dd675ae 100644
--- a/drivers/power/power_supply_core.c
+++ b/drivers/power/power_supply_core.c
@@ -26,17 +26,44 @@ EXPORT_SYMBOL_GPL(power_supply_class);
 
 static struct device_type power_supply_dev_type;
 
+static int __power_supply_is_supplied_by(struct power_supply *supplier,
+					 struct power_supply *supply)
+{
+	int i;
+
+	if (!supply->supplied_from && !supplier->supplied_to)
+		return -EINVAL;
+
+	/* Support both supplied_to and supplied_from modes */
+	if (supply->supplied_from) {
+		for (i = 0; i < supply->num_supplies; i++) {
+			if (!supplier->name)
+				continue;
+			if (!strcmp(supplier->name, supply->supplied_from[i]))
+				return 0;
+		}
+	} else {
+		for (i = 0; i < supplier->num_supplicants; i++) {
+			if (!supply->name)
+				continue;
+			if (!strcmp(supplier->supplied_to[i], supply->name))
+				return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static int __power_supply_changed_work(struct device *dev, void *data)
 {
 	struct power_supply *psy = (struct power_supply *)data;
 	struct power_supply *pst = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < psy->num_supplicants; i++)
-		if (!strcmp(psy->supplied_to[i], pst->name)) {
-			if (pst->external_power_changed)
-				pst->external_power_changed(pst);
-		}
+	if (__power_supply_is_supplied_by(psy, pst)) {
+		if (pst->external_power_changed)
+			pst->external_power_changed(pst);
+	}
+
 	return 0;
 }
 
@@ -68,17 +95,13 @@ static int __power_supply_am_i_supplied(struct device *dev, void *data)
 	union power_supply_propval ret = {0,};
 	struct power_supply *psy = (struct power_supply *)data;
 	struct power_supply *epsy = dev_get_drvdata(dev);
-	int i;
 
-	for (i = 0; i < epsy->num_supplicants; i++) {
-		if (!strcmp(epsy->supplied_to[i], psy->name)) {
-			if (epsy->get_property(epsy,
-				  POWER_SUPPLY_PROP_ONLINE, &ret))
-				continue;
+	if (__power_supply_is_supplied_by(epsy, psy))
+		if (!epsy->get_property(epsy, POWER_SUPPLY_PROP_ONLINE, &ret)) {
 			if (ret.intval)
 				return ret.intval;
 		}
-	}
+
 	return 0;
 }
 
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 002a99f..c1cbd5e 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -171,6 +171,9 @@ struct power_supply {
 	char **supplied_to;
 	size_t num_supplicants;
 
+	char **supplied_from;
+	size_t num_supplies;
+
 	int (*get_property)(struct power_supply *psy,
 			    enum power_supply_property psp,
 			    union power_supply_propval *val);
-- 
1.7.9.5
