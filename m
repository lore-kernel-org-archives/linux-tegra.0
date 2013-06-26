From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] usb: host: tegra: Remove direct vbus regulator control using GPIOs
Date: Wed, 26 Jun 2013 12:59:39 +0300
Message-ID: <1372240781-1017-3-git-send-email-mperttunen@nvidia.com>
References: <1372240781-1017-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372240781-1017-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The tegra ehci driver has enabled USB vbus regulators directly using
GPIOs and the device tree attribute nvidia,vbus-gpio. This is ugly
and causes error messages on boot when both the regulator driver
and the ehci driver want access to the same GPIO.

This patch removes this mechanism of vbus control, so that an actual
regulator interface can be used by the phy layer to control the
usb vbus regulator.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c | 34 +---------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index a1cec77..51cf1d2 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -328,33 +328,6 @@ static void tegra_ehci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 	free_dma_aligned_buffer(urb);
 }
 
-static int setup_vbus_gpio(struct platform_device *pdev,
-			   struct tegra_ehci_platform_data *pdata)
-{
-	int err = 0;
-	int gpio;
-
-	gpio = pdata->vbus_gpio;
-	if (!gpio_is_valid(gpio))
-		gpio = of_get_named_gpio(pdev->dev.of_node,
-					 "nvidia,vbus-gpio", 0);
-	if (!gpio_is_valid(gpio))
-		return 0;
-
-	err = gpio_request(gpio, "vbus_gpio");
-	if (err) {
-		dev_err(&pdev->dev, "can't request vbus gpio %d", gpio);
-		return err;
-	}
-	err = gpio_direction_output(gpio, 1);
-	if (err) {
-		dev_err(&pdev->dev, "can't enable vbus\n");
-		return err;
-	}
-
-	return err;
-}
-
 static int tegra_ehci_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -382,14 +355,11 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	if (!pdev->dev.coherent_dma_mask)
 		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
 
-	setup_vbus_gpio(pdev, pdata);
-
 	hcd = usb_create_hcd(&tegra_ehci_hc_driver, &pdev->dev,
 					dev_name(&pdev->dev));
 	if (!hcd) {
 		dev_err(&pdev->dev, "Unable to create HCD\n");
-		err = -ENOMEM;
-		goto cleanup_vbus_gpio;
+		return -ENOMEM;
 	}
 	platform_set_drvdata(pdev, hcd);
 	ehci = hcd_to_ehci(hcd);
@@ -505,8 +475,6 @@ cleanup_clk_get:
 	clk_put(tegra->clk);
 cleanup_hcd_create:
 	usb_put_hcd(hcd);
-cleanup_vbus_gpio:
-	/* FIXME: Undo setup_vbus_gpio() here */
 	return err;
 }
 
-- 
1.8.1.5
