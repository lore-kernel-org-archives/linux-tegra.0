From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v5 1/6] reset: use kref for reference counting
Date: Thu,  1 Jun 2017 18:51:58 +0200
Message-ID: <20170601165203.15315-2-p.zabel@pengutronix.de>
References: <20170601165203.15315-1-p.zabel@pengutronix.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170601165203.15315-1-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Vivek Gautam <vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use kref for reference counting and enjoy the advantages of refcount_t.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/reset/core.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index cd739d2fa1603..0090784ff4105 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
+#include <linux/kref.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/reset.h>
@@ -40,7 +41,7 @@ struct reset_control {
 	struct reset_controller_dev *rcdev;
 	struct list_head list;
 	unsigned int id;
-	unsigned int refcnt;
+	struct kref refcnt;
 	bool shared;
 	atomic_t deassert_count;
 	atomic_t triggered_count;
@@ -288,7 +289,7 @@ static struct reset_control *__reset_control_get_internal(
 			if (WARN_ON(!rstc->shared || !shared))
 				return ERR_PTR(-EBUSY);
 
-			rstc->refcnt++;
+			kref_get(&rstc->refcnt);
 			return rstc;
 		}
 	}
@@ -302,18 +303,18 @@ static struct reset_control *__reset_control_get_internal(
 	rstc->rcdev = rcdev;
 	list_add(&rstc->list, &rcdev->reset_control_head);
 	rstc->id = index;
-	rstc->refcnt = 1;
+	kref_init(&rstc->refcnt);
 	rstc->shared = shared;
 
 	return rstc;
 }
 
-static void __reset_control_put_internal(struct reset_control *rstc)
+static void __reset_control_release(struct kref *kref)
 {
-	lockdep_assert_held(&reset_list_mutex);
+	struct reset_control *rstc = container_of(kref, struct reset_control,
+						  refcnt);
 
-	if (--rstc->refcnt)
-		return;
+	lockdep_assert_held(&reset_list_mutex);
 
 	module_put(rstc->rcdev->owner);
 
@@ -321,6 +322,13 @@ static void __reset_control_put_internal(struct reset_control *rstc)
 	kfree(rstc);
 }
 
+static void __reset_control_put_internal(struct reset_control *rstc)
+{
+	lockdep_assert_held(&reset_list_mutex);
+
+	kref_put(&rstc->refcnt, __reset_control_release);
+}
+
 struct reset_control *__of_reset_control_get(struct device_node *node,
 				     const char *id, int index, bool shared,
 				     bool optional)
@@ -400,7 +408,6 @@ EXPORT_SYMBOL_GPL(__reset_control_get);
  * reset_control_put - free the reset controller
  * @rstc: reset controller
  */
-
 void reset_control_put(struct reset_control *rstc)
 {
 	if (IS_ERR_OR_NULL(rstc))
-- 
2.11.0
