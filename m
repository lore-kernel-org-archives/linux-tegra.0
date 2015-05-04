From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v8 1/9] xhci: Set shared HCD's hcd_priv in xhci_gen_setup
Date: Mon,  4 May 2015 10:36:34 -0700
Message-ID: <1430761002-9327-2-git-send-email-abrestic@chromium.org>
References: <1430761002-9327-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430761002-9327-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

xhci_gen_setup() sets the hcd_priv field for the primary HCD, but not
for the shared HCD, requiring xHCI host-controller drivers to set it
between usb_create_shared_hcd() and usb_add_hcd().  There's no reason
xhci_gen_setup() can't set the shared HCD's hcd_priv as well, so move
that bit out of the host-controller drivers and into xhci_gen_setup().

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Reviewed-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
---
No changes from v5/v6/v7.
New for v5.
Peviously posted here: https://lkml.org/lkml/2014/10/30/726
---
 drivers/usb/host/xhci-pci.c  | 5 -----
 drivers/usb/host/xhci-plat.c | 5 -----
 drivers/usb/host/xhci.c      | 6 +++---
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 2af32e2..f9ce741 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -247,11 +247,6 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto dealloc_usb2_hcd;
 	}
 
-	/* Set the xHCI pointer before xhci_pci_setup() (aka hcd_driver.reset)
-	 * is called by usb_add_hcd().
-	 */
-	*((struct xhci_hcd **) xhci->shared_hcd->hcd_priv) = xhci;
-
 	retval = usb_add_hcd(xhci->shared_hcd, dev->irq,
 			IRQF_SHARED);
 	if (retval)
diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 783e819..852b1e9 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -147,11 +147,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
 	if ((node && of_property_read_bool(node, "usb3-lpm-capable")) ||
 			(pdata && pdata->usb3_lpm_capable))
 		xhci->quirks |= XHCI_LPM_SUPPORT;
-	/*
-	 * Set the xHCI pointer before xhci_plat_setup() (aka hcd_driver.reset)
-	 * is called by usb_add_hcd().
-	 */
-	*((struct xhci_hcd **) xhci->shared_hcd->hcd_priv) = xhci;
 
 	if (HCC_MAX_PSA(xhci->hcc_params) >= 4)
 		xhci->shared_hcd->can_do_streams = 1;
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index ec8ac16..2901a67 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4849,9 +4849,9 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
 		 */
 		hcd->has_tt = 1;
 	} else {
-		/* xHCI private pointer was set in xhci_pci_probe for the second
-		 * registered roothub.
-		 */
+		xhci = hcd_to_xhci(hcd->primary_hcd);
+		*((struct xhci_hcd **) hcd->hcd_priv) = xhci;
+
 		return 0;
 	}
 
-- 
2.2.0.rc0.207.ga3a616c
