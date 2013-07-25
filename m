From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 3/9] usb: tegra: host: Remove references to plat data
Date: Thu, 25 Jul 2013 21:38:03 +0300
Message-ID: <1374777489-13093-4-git-send-email-ttynkkynen@nvidia.com>
References: <1374777489-13093-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374777489-13093-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Platform data is not used in tegra-ehci anymore, so remove all
references to it.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 06e8feb..a208cea 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -27,7 +27,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/tegra_usb.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/usb/ehci_def.h>
@@ -327,18 +326,11 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	struct usb_hcd *hcd;
 	struct ehci_hcd *ehci;
 	struct tegra_ehci_hcd *tegra;
-	struct tegra_ehci_platform_data *pdata;
 	int err = 0;
 	int irq;
 	struct device_node *np_phy;
 	struct usb_phy *u_phy;
 
-	pdata = pdev->dev.platform_data;
-	if (!pdata) {
-		dev_err(&pdev->dev, "Platform data missing\n");
-		return -EINVAL;
-	}
