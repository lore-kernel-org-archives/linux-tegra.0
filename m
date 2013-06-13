From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 REPOST 7/7] USB: EHCI: tegra: make use of ehci->priv
Date: Thu, 13 Jun 2013 11:24:13 -0600
Message-ID: <1371144253-21295-8-git-send-email-swarren@wwwdotorg.org>
References: <1371144253-21295-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371144253-21295-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Rather than allocating struct tegra_ehci_hcd separately, use struct
ehci_hcd's priv field instead.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
---
v3: New patch.
---
 drivers/usb/host/ehci-tegra.c | 70 +++++++++++++++++++++----------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 338c8a5..8dac5e4 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -56,7 +56,6 @@ static int (*orig_hub_control)(struct usb_hcd *hcd,
 				char *buf, u16 wLength);
 
 struct tegra_ehci_hcd {
-	struct ehci_hcd *ehci;
 	struct tegra_usb_phy *phy;
 	struct clk *clk;
 	struct usb_phy *transceiver;
@@ -139,8 +138,8 @@ static int tegra_ehci_hub_control(
 	u16		wLength
 )
 {
-	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
+	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
+	struct tegra_ehci_hcd *tegra = (struct tegra_ehci_hcd *)ehci->priv;
 	u32 __iomem	*status_reg;
 	u32		temp;
 	unsigned long	flags;
@@ -354,6 +353,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 {
 	struct resource *res;
 	struct usb_hcd *hcd;
+	struct ehci_hcd *ehci;
 	struct tegra_ehci_hcd *tegra;
 	struct tegra_ehci_platform_data *pdata;
 	int err = 0;
@@ -378,20 +378,29 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 
 	setup_vbus_gpio(pdev, pdata);
 
-	tegra = devm_kzalloc(&pdev->dev, sizeof(struct tegra_ehci_hcd),
-			     GFP_KERNEL);
-	if (!tegra)
-		return -ENOMEM;
+	hcd = usb_create_hcd(&tegra_ehci_hc_driver, &pdev->dev,
+					dev_name(&pdev->dev));
+	if (!hcd) {
+		dev_err(&pdev->dev, "Unable to create HCD\n");
+		err = -ENOMEM;
+		goto cleanup_vbus_gpio;
+	}
+	platform_set_drvdata(pdev, hcd);
+	ehci = hcd_to_ehci(hcd);
+	tegra = (struct tegra_ehci_hcd *)ehci->priv;
+
+	hcd->has_tt = 1;
 
 	tegra->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(tegra->clk)) {
 		dev_err(&pdev->dev, "Can't get ehci clock\n");
-		return PTR_ERR(tegra->clk);
+		err = PTR_ERR(tegra->clk);
+		goto cleanup_hcd_create;
 	}
 
 	err = clk_prepare_enable(tegra->clk);
 	if (err)
-		return err;
+		goto cleanup_clk_get;
 
 	tegra_periph_reset_assert(tegra->clk);
 	udelay(1);
@@ -400,35 +409,24 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	np_phy = of_parse_phandle(pdev->dev.of_node, "nvidia,phy", 0);
 	if (!np_phy) {
 		err = -ENODEV;
-		goto cleanup_clk;
+		goto cleanup_clk_en;
 	}
 
 	u_phy = tegra_usb_get_phy(np_phy);
 	if (IS_ERR(u_phy)) {
 		err = PTR_ERR(u_phy);
-		goto cleanup_clk;
+		goto cleanup_clk_en;
 	}
+	hcd->phy = u_phy;
 
 	tegra->needs_double_reset = of_property_read_bool(pdev->dev.of_node,
 		"nvidia,needs-double-reset");
 
-	hcd = usb_create_hcd(&tegra_ehci_hc_driver, &pdev->dev,
-					dev_name(&pdev->dev));
-	if (!hcd) {
-		dev_err(&pdev->dev, "Unable to create HCD\n");
-		err = -ENOMEM;
-		goto cleanup_clk;
-	}
-	tegra->ehci = hcd_to_ehci(hcd);
-
-	hcd->has_tt = 1;
-	hcd->phy = u_phy;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(&pdev->dev, "Failed to get I/O memory\n");
 		err = -ENXIO;
-		goto cleanup_hcd_create;
+		goto cleanup_clk_en;
 	}
 	hcd->rsrc_start = res->start;
 	hcd->rsrc_len = resource_size(res);
@@ -436,14 +434,14 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	if (!hcd->regs) {
 		dev_err(&pdev->dev, "Failed to remap I/O memory\n");
 		err = -ENOMEM;
-		goto cleanup_hcd_create;
+		goto cleanup_clk_en;
 	}
-	tegra->ehci->caps = hcd->regs + 0x100;
+	ehci->caps = hcd->regs + 0x100;
 
 	err = usb_phy_init(hcd->phy);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to initialize phy\n");
-		goto cleanup_hcd_create;
+		goto cleanup_clk_en;
 	}
 
 	u_phy->otg = devm_kzalloc(&pdev->dev, sizeof(struct usb_otg),
@@ -477,8 +475,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		tegra->transceiver = ERR_PTR(-ENODEV);
 	}
 
-	platform_set_drvdata(pdev, tegra);
-
 	err = usb_add_hcd(hcd, irq, IRQF_SHARED);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to add USB HCD\n");
@@ -492,17 +488,22 @@ cleanup_phy:
 		otg_set_host(tegra->transceiver->otg, NULL);
 
 	usb_phy_shutdown(hcd->phy);
+cleanup_clk_en:
+	clk_disable_unprepare(tegra->clk);
+cleanup_clk_get:
+	clk_put(tegra->clk);
 cleanup_hcd_create:
 	usb_put_hcd(hcd);
-cleanup_clk:
-	clk_disable_unprepare(tegra->clk);
+cleanup_vbus_gpio:
+	/* FIXME: Undo setup_vbus_gpio() here */
 	return err;
 }
 
 static int tegra_ehci_remove(struct platform_device *pdev)
 {
-	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
+	struct usb_hcd *hcd = platform_get_drvdata(pdev);
+	struct tegra_ehci_hcd *tegra =
+		(struct tegra_ehci_hcd *)hcd_to_ehci(hcd)->priv;
 
 	if (!IS_ERR(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
@@ -518,8 +519,7 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 
 static void tegra_ehci_hcd_shutdown(struct platform_device *pdev)
 {
-	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
+	struct usb_hcd *hcd = platform_get_drvdata(pdev);
 
 	if (hcd->driver->shutdown)
 		hcd->driver->shutdown(hcd);
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
