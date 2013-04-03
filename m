From: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
Subject: [PATCH v2] usb: host: ehci-tegra: Fix oops in error cleanup
Date: Wed,  3 Apr 2013 21:57:57 +0200
Message-ID: <1365019077-1308-1-git-send-email-thierry@gilfi.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The cleanup path checks whether the transceiver was properly initialized
using IS_ERR(). However it can also happen that the cleanup path is run
before the transceiver was initialized (or the operating mode isn't set
to TEGRA_USB_OTG) and is therefore NULL. Add a separate label for error
unwinding and initialize the transceiver field to ERR_PTR(-ENODEV) when
the operating mode isn't TEGRA_USB_OTG to allow for consistent checking.

Signed-off-by: Thierry Reding <thierry-TKn1d31QZ+o@public.gmane.org>
Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Note that this has a conflict with Felipe's tree, but it should be
trivial to solve.

Changes in v2:
- add Acked-bys from Stephen and Venu
- rebase on Greg's usb-next branch
---
 drivers/usb/host/ehci-tegra.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 83d190a..4f3cfb8 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -760,7 +760,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	err = usb_phy_set_suspend(hcd->phy, 0);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to power on the phy\n");
-		goto fail;
+		goto fail_phy;
 	}
 
 	tegra->host_resumed = 1;
@@ -770,7 +770,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	if (!irq) {
 		dev_err(&pdev->dev, "Failed to get IRQ\n");
 		err = -ENODEV;
-		goto fail;
+		goto fail_phy;
 	}
 
 #ifdef CONFIG_USB_OTG_UTILS
@@ -779,6 +779,8 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 			devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
 		if (!IS_ERR_OR_NULL(tegra->transceiver))
 			otg_set_host(tegra->transceiver->otg, &hcd->self);
+	} else {
+		tegra->transceiver = ERR_PTR(-ENODEV);
 	}
 #endif
 
@@ -803,6 +805,7 @@ fail:
 	if (!IS_ERR_OR_NULL(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
 #endif
+fail_phy:
 	usb_phy_shutdown(hcd->phy);
 fail_io:
 	clk_disable_unprepare(tegra->clk);
-- 
1.8.2
