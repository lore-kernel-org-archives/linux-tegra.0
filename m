From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] USB: EHCI: tegra: Fix oops in error cleanup
Date: Fri, 14 Jun 2013 13:21:21 +0200
Message-ID: <1371208881-26916-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Under some circumstances it happens that the connected PHY can't be
powered up properly, in which case the cleanup path currently crashes
because it checks the tegra->transceiver field using !IS_ERR(), which
will succeed because it is in fact NULL. Dereferencing that pointer
causes an oops in tegra_ehci_probe().

This patch fixes the issue by adding an additional label into the
cleanup path to separately take down the PHY and the transceiver.

Signed-off-by: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Note: This is based on top of Stephen's latest patch series to allow
building the driver as a module:

[PATCH V3 REPOST 0/7] USB: tegra: support building as a module

 drivers/usb/host/ehci-tegra.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 8dac5e4..6ee7ef7 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -478,15 +478,15 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add USB HCD\n");
-		goto cleanup_phy;
+		goto cleanup_transceiver;
 	}
 
 	return err;
 
-cleanup_phy:
+cleanup_transceiver:
 	if (!IS_ERR(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
