From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 01/11] usb: ehci-tegra: Add vbus_gpio to platform data
Date: Fri, 30 Mar 2012 16:59:54 -0600
Message-ID: <1333148404-17691-2-git-send-email-swarren@wwwdotorg.org>
References: <1333148404-17691-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333148404-17691-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add a vbus_gpio field to platform data. This mirrors the device tree
property nvidia,vbus-gpio. This makes the VBUS GPIO handling identical
between booting with board files and device tree; the driver always does
it.

This removes the need for board files to request and initialize the GPIO
early during their boot process, perhaps even before the GPIO driver is
ready to process the request.

Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/devices.c           |    3 +++
 drivers/usb/host/ehci-tegra.c           |   13 +++++++------
 include/linux/platform_data/tegra_usb.h |    1 +
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devices.c
index c3b9900..fcd872d 100644
--- a/arch/arm/mach-tegra/devices.c
+++ b/arch/arm/mach-tegra/devices.c
@@ -448,17 +448,20 @@ static struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config = {
 struct tegra_ehci_platform_data tegra_ehci1_pdata = {
 	.operating_mode = TEGRA_USB_OTG,
 	.power_down_on_bus_suspend = 1,
+	.vbus_gpio = -1,
 };
 
 struct tegra_ehci_platform_data tegra_ehci2_pdata = {
 	.phy_config = &tegra_ehci2_ulpi_phy_config,
 	.operating_mode = TEGRA_USB_HOST,
 	.power_down_on_bus_suspend = 1,
+	.vbus_gpio = -1,
 };
 
 struct tegra_ehci_platform_data tegra_ehci3_pdata = {
 	.operating_mode = TEGRA_USB_HOST,
 	.power_down_on_bus_suspend = 1,
+	.vbus_gpio = -1,
 };
 
 static u64 tegra_ehci_dmamask = DMA_BIT_MASK(32);
diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 3de48a2..faed4c4 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -579,15 +579,16 @@ static const struct hc_driver tegra_ehci_hc_driver = {
 	.port_handed_over	= ehci_port_handed_over,
 };
 
-static int setup_vbus_gpio(struct platform_device *pdev)
+static int setup_vbus_gpio(struct platform_device *pdev,
+			   struct tegra_ehci_platform_data *pdata)
 {
 	int err = 0;
 	int gpio;
 
-	if (!pdev->dev.of_node)
-		return 0;
-
-	gpio = of_get_named_gpio(pdev->dev.of_node, "nvidia,vbus-gpio", 0);
+	gpio = pdata->vbus_gpio;
+	if (!gpio_is_valid(gpio))
+		gpio = of_get_named_gpio(pdev->dev.of_node,
+					 "nvidia,vbus-gpio", 0);
 	if (!gpio_is_valid(gpio))
 		return 0;
 
@@ -631,7 +632,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &tegra_ehci_dma_mask;
 
-	setup_vbus_gpio(pdev);
+	setup_vbus_gpio(pdev, pdata);
 
 	tegra = kzalloc(sizeof(struct tegra_ehci_hcd), GFP_KERNEL);
 	if (!tegra)
diff --git a/include/linux/platform_data/tegra_usb.h b/include/linux/platform_data/tegra_usb.h
index 6bca5b5..66c673f 100644
--- a/include/linux/platform_data/tegra_usb.h
+++ b/include/linux/platform_data/tegra_usb.h
@@ -26,6 +26,7 @@ struct tegra_ehci_platform_data {
 	/* power down the phy on bus suspend */
 	int power_down_on_bus_suspend;
 	void *phy_config;
+	int vbus_gpio;
 };
 
 #endif /* _TEGRA_USB_H_ */
-- 
1.7.0.4
