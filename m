From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 27/31] USB: EHCI: tegra: use reset framework
Date: Fri, 15 Nov 2013 13:54:22 -0700
Message-ID: <1384548866-13141-28-git-send-email-swarren@wwwdotorg.org>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra's clock driver now provides an implementation of the common
reset API (include/linux/reset.h). Use this instead of the old Tegra-
specific API; that will soon be removed.

Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This patch is part of a series with strong internal depdendencies. I'm
looking for an ack so that I can take the entire series through the Tegra
and arm-soc trees. The series will be part of a stable branch that can be
merged into other subsystems if needed to avoid/resolve dependencies.
---
 drivers/usb/host/ehci-tegra.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index b9fd0396011e..6f7e23dd1417 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -17,7 +17,6 @@
  */
 
 #include <linux/clk.h>
-#include <linux/clk/tegra.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
@@ -29,6 +28,7 @@
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/tegra_usb_phy.h>
@@ -62,6 +62,7 @@ static int (*orig_hub_control)(struct usb_hcd *hcd,
 struct tegra_ehci_hcd {
 	struct tegra_usb_phy *phy;
 	struct clk *clk;
+	struct reset_control *rst;
 	int port_resuming;
 	bool needs_double_reset;
 	enum tegra_usb_phy_port_speed port_speed;
@@ -385,13 +386,20 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_hcd_create;
 	}
 
+	tegra->rst = devm_reset_control_get(&pdev->dev, "usb");
+	if (IS_ERR(tegra->rst)) {
+		dev_err(&pdev->dev, "Can't get ehci reset\n");
+		err = PTR_ERR(tegra->rst);
+		goto cleanup_hcd_create;
+	}
+
 	err = clk_prepare_enable(tegra->clk);
 	if (err)
 		goto cleanup_hcd_create;
 
-	tegra_periph_reset_assert(tegra->clk);
+	reset_control_assert(tegra->rst);
 	udelay(1);
-	tegra_periph_reset_deassert(tegra->clk);
+	reset_control_deassert(tegra->rst);
 
 	u_phy = devm_usb_get_phy_by_phandle(&pdev->dev, "nvidia,phy", 0);
 	if (IS_ERR(u_phy)) {
-- 
1.8.1.5
