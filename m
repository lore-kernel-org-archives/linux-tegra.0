From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/4] xhci: Check for XHCI_COMP_MODE_QUIRK when disabling D3cold
Date: Tue, 19 Aug 2014 10:01:50 -0700
Message-ID: <1408467712-27497-3-git-send-email-abrestic@chromium.org>
References: <1408467712-27497-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408467712-27497-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Julius Werner <jwerner-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Instead of calling xhci_compliance_mode_recovery_timer_quirk_check() again
in the PCI suspend path, just check for XHCI_COMP_MODE_QUIRK which will
have been set based on xhci_compliance_mode_recovery_timer_quirk_check()
in xhci_init().

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
No change from v1/v2.
---
 drivers/usb/host/xhci-pci.c | 2 +-
 drivers/usb/host/xhci.c     | 2 +-
 drivers/usb/host/xhci.h     | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 88d4553..8093ad6 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -279,7 +279,7 @@ static int xhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
 	 * Systems with the TI redriver that loses port status change events
 	 * need to have the registers polled during D3, so avoid D3cold.
 	 */
-	if (xhci_compliance_mode_recovery_timer_quirk_check())
+	if (xhci->quirks & XHCI_COMP_MODE_QUIRK)
 		pdev->no_d3cold = true;
 
 	return xhci_suspend(xhci);
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index f94530a..a5cd831 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -491,7 +491,7 @@ static void compliance_mode_recovery_timer_init(struct xhci_hcd *xhci)
  * Systems:
  * Vendor: Hewlett-Packard -> System Models: Z420, Z620 and Z820
  */
-bool xhci_compliance_mode_recovery_timer_quirk_check(void)
+static bool xhci_compliance_mode_recovery_timer_quirk_check(void)
 {
 	const char *dmi_product_name, *dmi_sys_vendor;
 
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 194dbd3..71400b3 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1888,7 +1888,4 @@ struct xhci_input_control_ctx *xhci_get_input_control_ctx(struct xhci_hcd *xhci,
 struct xhci_slot_ctx *xhci_get_slot_ctx(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx);
 struct xhci_ep_ctx *xhci_get_ep_ctx(struct xhci_hcd *xhci, struct xhci_container_ctx *ctx, unsigned int ep_index);
 
-/* xHCI quirks */
-bool xhci_compliance_mode_recovery_timer_quirk_check(void);
