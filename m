From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: [RESEND/PATCH] usb: host: ehci-tegra: fix PHY error handling
Date: Thu, 21 Mar 2013 14:23:23 +0200
Message-ID: <1363868603-14525-1-git-send-email-balbi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

PHY layer no longer returns NULL, we must
switch from IS_ERR_OR_NULL() to IS_ERR().

Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
---

Hi Stephen,

I'm waiting for your topic branch before I can merge
this into my 'next' branch.

cheers

 drivers/usb/host/ehci-tegra.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index fafbc81..1d2488c 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -768,14 +768,12 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-#if IS_ENABLED(CONFIG_USB_PHY)
 	if (pdata->operating_mode == TEGRA_USB_OTG) {
 		tegra->transceiver =
 			devm_usb_get_phy(&pdev->dev, USB_PHY_TYPE_USB2);
-		if (!IS_ERR_OR_NULL(tegra->transceiver))
+		if (!IS_ERR(tegra->transceiver))
 			otg_set_host(tegra->transceiver->otg, &hcd->self);
 	}
-#endif
 
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
@@ -794,10 +792,8 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	return err;
 
 fail:
-#if IS_ENABLED(CONFIG_USB_PHY)
-	if (!IS_ERR_OR_NULL(tegra->transceiver))
+	if (!IS_ERR(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
-#endif
 	usb_phy_shutdown(hcd->phy);
 fail_io:
 	clk_disable_unprepare(tegra->clk);
@@ -815,10 +811,8 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 
-#if IS_ENABLED(CONFIG_USB_PHY)
-	if (!IS_ERR_OR_NULL(tegra->transceiver))
+	if (!IS_ERR(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
-#endif
 
 	usb_phy_shutdown(hcd->phy);
 	usb_remove_hcd(hcd);
-- 
1.8.2
