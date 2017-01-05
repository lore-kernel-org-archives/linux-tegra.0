From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pinctrl: core: Fix panic when pinctrl devices with hogs are unregistered
Date: Thu, 5 Jan 2017 15:52:55 +0000
Message-ID: <1483631575-14422-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit df61b366af26 ('pinctrl: core: Use delayed work for hogs')
deferred part of the registration for pinctrl devices if the pinctrl
device has hogs. This introduced a window where if the pinctrl device
with hogs was sucessfully registered, but then unregistered again
(which could be caused by parent device being probe deferred) before
the delayed work has chanced to run, then this will cause a kernel
panic to occur because:

1. The 'pctldev->p' has not yet been initialised and when unregistering
   the pinctrl device we only check to see if it is an error value, but
   now it could also be NULL.
2. The pinctrl device may not have been added to the 'pinctrldev_list'
   list and we don't check to see if it was added before removing.

Fix up the above by checking to see if the 'pctldev->p' pointer is an
error value or NULL before putting the pinctrl device and verifying
that the pinctrl device is present in 'pinctrldev_list' before removing.

Fixes: df61b366af26 ('pinctrl: core: Use delayed work for hogs')

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index d311d73..9f305ac 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2064,6 +2064,8 @@ struct pinctrl_dev *pinctrl_register(struct pinctrl_desc *pctldesc,
 void pinctrl_unregister(struct pinctrl_dev *pctldev)
 {
 	struct pinctrl_gpio_range *range, *n;
+	struct pinctrl_dev *p, *p1;
+
 	if (pctldev == NULL)
 		return;
 
@@ -2072,13 +2074,15 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 	pinctrl_remove_device_debugfs(pctldev);
 	mutex_unlock(&pctldev->mutex);
 
-	if (!IS_ERR(pctldev->p))
+	if (!IS_ERR_OR_NULL(pctldev->p))
 		pinctrl_put(pctldev->p);
 
 	mutex_lock(&pinctrldev_list_mutex);
 	mutex_lock(&pctldev->mutex);
 	/* TODO: check that no pinmuxes are still active? */
-	list_del(&pctldev->node);
+	list_for_each_entry_safe(p, p1, &pinctrldev_list, node)
+		if (p == pctldev)
+			list_del(&p->node);
 	pinmux_generic_free_functions(pctldev);
 	pinctrl_generic_free_groups(pctldev);
 	/* Destroy descriptor tree */
-- 
1.9.1
