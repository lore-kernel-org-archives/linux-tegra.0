From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH v2 2/4] xhci: Check for XHCI_COMP_MODE_QUIRK when disabling D3cold
Date: Mon, 18 Aug 2014 09:12:21 -0700
Message-ID: <1408378343-9352-3-git-send-email-abrestic@chromium.org>
References: <1408378343-9352-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408378343-9352-1-git-send-email-abrestic@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, Julius Werner <jwerner@chromium.org>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

Instead of calling xhci_compliance_mode_recovery_timer_quirk_check() again
in the PCI suspend path, just check for XHCI_COMP_MODE_QUIRK which will
have been set based on xhci_compliance_mode_recovery_timer_quirk_check()
in xhci_init().

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
No change from v1.
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
-
 #endif /* __LINUX_XHCI_HCD_H */
-- 
2.1.0.rc2.206.gedb03e5
