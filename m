From: Andrew Bresticker <abrestic@chromium.org>
Subject: [PATCH V6 01/12] xhci: Set shared HCD's hcd_priv in xhci_gen_setup
Date: Mon, 24 Nov 2014 16:17:13 -0800
Message-ID: <1416874644-12070-2-git-send-email-abrestic@chromium.org>
References: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1416874644-12070-1-git-send-email-abrestic@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Andrew Bresticker <abrestic@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@ti.com>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, linux-arm-kernel@lists.infradead.org, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

xhci_gen_setup() sets the hcd_priv field for the primary HCD, but not
for the shared HCD, requiring xHCI host-controller drivers to set it
between usb_create_shared_hcd() and usb_add_hcd().  There's no reason
xhci_gen_setup() can't set the shared HCD's hcd_priv as well, so move
that bit out of the host-controller drivers and into xhci_gen_setup().

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Reviewed-by: Felipe Balbi <balbi@ti.com>
---
No changes from v5.
New for v5.
Peviously posted here: https://lkml.org/lkml/2014/10/30/726
---
 drivers/usb/host/xhci-pci.c  | 5 -----
 drivers/usb/host/xhci-plat.c | 5 -----
 drivers/usb/host/xhci.c      | 6 +++---
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 9a69b1f..31025e4 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -221,11 +221,6 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
index 3d78b0c..5bc33bc 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -149,11 +149,6 @@ static int xhci_plat_probe(struct platform_device *pdev)
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
index 2a5d45b..ae05471 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4843,9 +4843,9 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
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
2.1.0.rc2.206.gedb03e5
