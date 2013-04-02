From: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
Subject: [PATCH] usb: host: ehci-tegra: Fix oops in error cleanup
Date: Tue,  2 Apr 2013 22:40:50 +0200
Message-ID: <1364935250-26422-1-git-send-email-thierry@gilfi.de>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The cleanup path checks whether the transceiver was properly initialized
using IS_ERR(). However it can also happen that the cleanup path is run
before the transceiver was initialized (or the operating mode isn't set
to TEGRA_USB_OTG) and is therefore NULL. Add a separate label for error
unwinding and initialize the transceiver field to ERR_PTR(-ENODEV) when
the operating mode isn't TEGRA_USB_OTG to allow for consistent checking.

Signed-off-by: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 1d2488c..c8cb488 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -755,7 +755,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	err = usb_phy_set_suspend(hcd->phy, 0);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to power on the phy\n");
-		goto fail;
+		goto fail_phy;
 	}
 
 	tegra->host_resumed = 1;
@@ -765,7 +765,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	if (!irq) {
 		dev_err(&pdev->dev, "Failed to get IRQ\n");
 		err = -ENODEV;
-		goto fail;
+		goto fail_phy;
 	}
 
 	if (pdata->operating_mode == TEGRA_USB_OTG) {
@@ -773,6 +773,8 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 			devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 		if (!IS_ERR(tegra->transceiver))
 			otg_set_host(tegra->transceiver->otg, &hcd->self);
+	} else {
+		tegra->transceiver = ERR_PTR(-ENODEV);
 	}
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
@@ -794,6 +796,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 fail:
 	if (!IS_ERR(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
+fail_phy:
 	usb_phy_shutdown(hcd->phy);
 fail_io:
 	clk_disable_unprepare(tegra->clk);
-- 
1.8.2

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
