From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 1/2] usb: host: ehci-tegra: Grab the correct UTMI pads reset
Date: Thu, 26 May 2016 17:23:29 +0200
Message-ID: <20160526152330.10929-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There are three EHCI controllers on Tegra SoCs, each with its own reset
line. However, the first controller contains a set of UTMI configuration
registers that are shared with its siblings. These registers will only
be reset as part of the first controller's reset. For proper operation
it must be ensured that the UTMI configuration registers are reset
before any of the EHCI controllers are enabled, irrespective of the
probe order.

Commit a47cc24cd1e5 ("USB: EHCI: tegra: Fix probe order issue leading to
broken USB") introduced code that ensures the first controller is always
reset before setting up any of the controllers, and is never again reset
afterwards.

This code, however, grabs the wrong reset. Each EHCI controller has two
reset controls attached: 1) the USB controller reset and 2) the UTMI
pads reset (really the first controller's reset). In order to reset the
UTMI pads registers the code must grab the second reset, but instead it
grabbing the first.

Fixes: a47cc24cd1e5 ("USB: EHCI: tegra: Fix probe order issue leading to broken USB")
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v4:
- add stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org to stable and add Fixes: tag
- add Jon's Acked-by

 drivers/usb/host/ehci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 4031b372008e..c1c1024a054c 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -89,7 +89,7 @@ static int tegra_reset_usb_controller(struct platform_device *pdev)
 	if (!usb1_reset_attempted) {
 		struct reset_control *usb1_reset;
 
-		usb1_reset = of_reset_control_get(phy_np, "usb");
+		usb1_reset = of_reset_control_get(phy_np, "utmi-pads");
 		if (IS_ERR(usb1_reset)) {
 			dev_warn(&pdev->dev,
 				 "can't get utmi-pads reset from the PHY\n");
-- 
2.8.3
