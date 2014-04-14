From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] USB: EHCI: tegra: set txfill_tuning
Date: Mon, 14 Apr 2014 15:21:23 -0600
Message-ID: <1397510483-21383-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

To avoid memory fetch underflows with larger USB transfers, Tegra SoCs
need txfill_tuning's txfifothresh register field set to a non-default
value. Add a custom reset override in order to set this up.

These values are recommended practice for all Tegra chips. However,
I've only noticed practical problems when not setting them this way on
systems using Tegra124. Hence, CC: stable only for recent kernels which
actually support Tegra124.

Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 3.14+
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 27ac6ad53c3d..7ef00ecb0da1 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -509,8 +509,31 @@ static struct platform_driver tegra_ehci_driver = {
 	}
 };
 
+static int tegra_ehci_reset(struct usb_hcd *hcd)
+{
+	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
+	int retval;
+	int txfifothresh;
+
+	retval = ehci_setup(hcd);
+	if (retval)
+		return retval;
+
+	/*
+	 * We should really pull this value out of tegra_ehci_soc_config, but
+	 * to avoid needing access to it, make use of the fact that Tegra20 is
+	 * the only one so far that needs a value of 10, and Tegra20 is the
+	 * only one which doesn't set has_hostpc.
+	 */
+	txfifothresh = ehci->has_hostpc ? 0x10 : 10;
+	ehci_writel(ehci, txfifothresh << 16, &ehci->regs->txfill_tuning);
+
+	return 0;
+}
+
 static const struct ehci_driver_overrides tegra_overrides __initconst = {
 	.extra_priv_size	= sizeof(struct tegra_ehci_hcd),
+	.reset			= tegra_ehci_reset,
 };
 
 static int __init ehci_tegra_init(void)
-- 
1.8.1.5
