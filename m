From: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC 1/1] Driver Core: don't oops with unregistered driver in driver_find_device()
Date: Thu, 10 May 2012 10:35:02 +0300
Message-ID: <1336635302-29260-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

driver_find_device() can be called with an unregistered driver. Need
to check driver_private to see if it's populated or not, especially
under deferrable probe.

Signed-off-by: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
In [PATCHv5 2/3] ARM: tegra: Add SMMU enabler in AHB:
  http://article.gmane.org/gmane.linux.ports.tegra/4658

"tegra_ahb_driver" may not be populated when it's called.
---
 drivers/base/driver.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 3ec3896..207c27d 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -80,7 +80,7 @@ struct device *driver_find_device(struct device_driver *drv,
 	struct klist_iter i;
 	struct device *dev;
 
-	if (!drv)
+	if (!drv || !drv->p)
 		return NULL;
 
 	klist_iter_init_node(&drv->p->klist_devices, &i,
-- 
1.7.5.4
