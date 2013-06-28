From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/3] usb: phy,host: tegra: Use regulators instead of GPIOs for USB PHY VBUS
Date: Fri, 28 Jun 2013 15:33:14 +0300
Message-ID: <1372422796-23524-2-git-send-email-mperttunen@nvidia.com>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372422796-23524-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The tegra ehci driver has enabled USB vbus regulators directly using
GPIOs and the device tree attribute nvidia,vbus-gpio. This is ugly
and causes error messages on boot when both the regulator driver
and the ehci driver want access to the same GPIO.

After this patch, usb vbus regulators for tegra usb phy devices are specified
with the device tree attribute vbus-supply = <&x> where x is a regulator defined
in the device tree. The old nvidia,vbus-gpio property is no longer supported.

Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-tegra.c     | 34 +---------------------------------
 drivers/usb/phy/phy-tegra-usb.c   | 23 +++++++++++++++++++++++
 include/linux/usb/tegra_usb_phy.h |  1 +
 3 files changed, 25 insertions(+), 33 deletions(-)

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
 
diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index d7d6bd7..cae96ee 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -34,6 +34,7 @@
 #include <asm/mach-types.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/tegra_usb_phy.h>
+#include <linux/regulator/consumer.h>
 
 #define ULPI_VIEWPORT		0x170
 
@@ -673,6 +674,9 @@ static void tegra_usb_phy_close(struct usb_phy *x)
 {
 	struct tegra_usb_phy *phy = container_of(x, struct tegra_usb_phy, u_phy);
 
+	if (!IS_ERR(phy->vbus))
+		regulator_disable(phy->vbus);
+
 	clk_disable_unprepare(phy->pll_u);
 }
 
@@ -772,6 +776,15 @@ static int tegra_usb_phy_init(struct tegra_usb_phy *phy)
 		goto fail;
 	}
 
+	if (!IS_ERR(phy->vbus)) {
+		err = regulator_enable(phy->vbus);
+		if (err) {
+			dev_err(phy->dev,
+				"failed to enable usb vbus regulator: %d\n", err);
+			goto fail;
+		}
+	}
+
 	if (phy->is_ulpi_phy)
 		err = ulpi_open(phy);
 	else
@@ -890,6 +903,16 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	} else
 		tegra_phy->mode = TEGRA_USB_PHY_MODE_OTG;
 
+	/* On some boards, the VBUS regulator doesn't need to be controlled */
+	if (of_find_property(np, "vbus-supply", NULL)) {
+		tegra_phy->vbus = devm_regulator_get(&pdev->dev, "vbus");
+		if (IS_ERR(tegra_phy->vbus))
+			return PTR_ERR(tegra_phy->vbus);
+	} else {
+		dev_notice(&pdev->dev, "no vbus regulator");
+		tegra_phy->vbus = ERR_PTR(-ENODEV);
+	}
+
 	tegra_phy->dev = &pdev->dev;
 	err = tegra_usb_phy_init(tegra_phy);
 	if (err < 0)
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index d2ca919..2b5fa94 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -55,6 +55,7 @@ struct tegra_usb_phy {
 	struct clk *clk;
 	struct clk *pll_u;
 	struct clk *pad_clk;
+	struct regulator *vbus;
 	enum tegra_usb_phy_mode mode;
 	void *config;
 	struct usb_phy *ulpi;
-- 
1.8.1.5
