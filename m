From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 6/7] USB: EHCI: make ehci-tegra a separate driver
Date: Wed,  5 Jun 2013 14:03:08 -0600
Message-ID: <1370462589-3090-7-git-send-email-swarren@wwwdotorg.org>
References: <1370462589-3090-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370462589-3090-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Separate the Tegra on-chip host controller driver from
ehci-hcd host code so that it can be built as a separate driver module.
This work is part of enabling multi-platform kernels on ARM.

Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[swarren, reworked Manjunath's patches to split them more logically,
minor re-order of added lines to better match layout of other split-up
HCD drivers and existing code, add MODULE_DEVICE_TABLE, fix
MODULE_LICENSE, adapted to change in earlier patches which removed the
ehci_driver_overrides addition, removed all PM code and solved circular
dependencies.]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
v3:
* Removed use of tegra_ehci_power_up() from egra_ehci_hcd_shutdown().
* Made tegra_overrides const/initconst not initdata.
* Added comment re: need for overrides in ehci_tegra_init().
v2:
* Set non-standard fields in tegra_ehci_hc_driver manually, rather than
  relying on an expanded struct ehci_driver_overrides.
* Save orig_hub_control rather than relying on ehci_hub_control being
  exported.
* Rebased on new versions of earlier patches.
---
 drivers/usb/host/Kconfig      |   2 +-
 drivers/usb/host/Makefile     |   1 +
 drivers/usb/host/ehci-hcd.c   |   5 --
 drivers/usb/host/ehci-tegra.c | 128 ++++++++++++++++++++++++------------------
 4 files changed, 76 insertions(+), 60 deletions(-)

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index cb4b83b..5c049eb 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -200,7 +200,7 @@ config USB_EHCI_MSM
 	  has an external PHY.
 
 config USB_EHCI_TEGRA
-       boolean "NVIDIA Tegra HCD support"
+       tristate "NVIDIA Tegra HCD support"
        depends on ARCH_TEGRA
        select USB_EHCI_ROOT_HUB_TT
        select USB_PHY
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index b41fa5f..bea7112 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -33,6 +33,7 @@ obj-$(CONFIG_USB_EHCI_HCD_SPEAR)	+= ehci-spear.o
 obj-$(CONFIG_USB_EHCI_S5P)	+= ehci-s5p.o
 obj-$(CONFIG_USB_EHCI_HCD_AT91) += ehci-atmel.o
 obj-$(CONFIG_USB_EHCI_MSM)	+= ehci-msm.o
+obj-$(CONFIG_USB_EHCI_TEGRA)	+= ehci-tegra.o
 
 obj-$(CONFIG_USB_OXU210HP_HCD)	+= oxu210hp-hcd.o
 obj-$(CONFIG_USB_ISP116X_HCD)	+= isp116x-hcd.o
diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index e8a6f3d..7abf1ce 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -1269,11 +1269,6 @@ MODULE_LICENSE ("GPL");
 #define	PLATFORM_DRIVER		ehci_hcd_msp_driver
 #endif
 
-#ifdef CONFIG_USB_EHCI_TEGRA
-#include "ehci-tegra.c"
-#define PLATFORM_DRIVER		tegra_ehci_driver
-#endif
-
 #ifdef CONFIG_SPARC_LEON
 #include "ehci-grlib.c"
 #define PLATFORM_DRIVER		ehci_grlib_driver
diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 8063429..338c8a5 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -17,25 +17,44 @@
  */
 
 #include <linux/clk.h>
+#include <linux/clk/tegra.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/platform_device.h>
-#include <linux/platform_data/tegra_usb.h>
-#include <linux/irq.h>
-#include <linux/usb/otg.h>
 #include <linux/gpio.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/platform_data/tegra_usb.h>
 #include <linux/pm_runtime.h>
+#include <linux/slab.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/tegra_usb_phy.h>
-#include <linux/clk/tegra.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/otg.h>
+
+#include "ehci.h"
 
 #define TEGRA_USB_BASE			0xC5000000
 #define TEGRA_USB2_BASE			0xC5004000
 #define TEGRA_USB3_BASE			0xC5008000
 
+#define PORT_WAKE_BITS (PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
+
 #define TEGRA_USB_DMA_ALIGN 32
 
+#define DRIVER_DESC "Tegra EHCI driver"
+#define DRV_NAME "tegra-ehci"
+
+static struct hc_driver __read_mostly tegra_ehci_hc_driver;
+
+static int (*orig_hub_control)(struct usb_hcd *hcd,
+				u16 typeReq, u16 wValue, u16 wIndex,
+				char *buf, u16 wLength);
+
 struct tegra_ehci_hcd {
 	struct ehci_hcd *ehci;
 	struct tegra_usb_phy *phy;
@@ -218,25 +237,13 @@ static int tegra_ehci_hub_control(
 	spin_unlock_irqrestore(&ehci->lock, flags);
 
 	/* Handle the hub control events here */
-	return ehci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
+	return orig_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
+
 done:
 	spin_unlock_irqrestore(&ehci->lock, flags);
 	return retval;
 }
 
-static int tegra_ehci_setup(struct usb_hcd *hcd)
-{
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-
-	/* EHCI registers start at offset 0x100 */
-	ehci->caps = hcd->regs + 0x100;
-
-	/* switch to host mode */
-	hcd->has_tt = 1;
-
-	return ehci_setup(hcd);
-}
-
 struct dma_aligned_buffer {
 	void *kmalloc_ptr;
 	void *old_xfer_buffer;
@@ -316,38 +323,6 @@ static void tegra_ehci_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
 	free_dma_aligned_buffer(urb);
 }
 
-static const struct hc_driver tegra_ehci_hc_driver = {
-	.description		= hcd_name,
-	.product_desc		= "Tegra EHCI Host Controller",
-	.hcd_priv_size		= sizeof(struct ehci_hcd),
-	.flags			= HCD_USB2 | HCD_MEMORY,
-
-	/* standard ehci functions */
-	.irq			= ehci_irq,
-	.start			= ehci_run,
-	.stop			= ehci_stop,
-	.urb_enqueue		= ehci_urb_enqueue,
-	.urb_dequeue		= ehci_urb_dequeue,
-	.endpoint_disable	= ehci_endpoint_disable,
-	.endpoint_reset		= ehci_endpoint_reset,
-	.get_frame_number	= ehci_get_frame,
-	.hub_status_data	= ehci_hub_status_data,
-	.clear_tt_buffer_complete = ehci_clear_tt_buffer_complete,
-	.relinquish_port	= ehci_relinquish_port,
-	.port_handed_over	= ehci_port_handed_over,
-
-	/* modified ehci functions for tegra */
-	.reset			= tegra_ehci_setup,
-	.shutdown		= ehci_shutdown,
-	.map_urb_for_dma	= tegra_ehci_map_urb_for_dma,
-	.unmap_urb_for_dma	= tegra_ehci_unmap_urb_for_dma,
-	.hub_control		= tegra_ehci_hub_control,
-#ifdef CONFIG_PM
-	.bus_suspend		= ehci_bus_suspend,
-	.bus_resume		= ehci_bus_resume,
-#endif
-};
-
 static int setup_vbus_gpio(struct platform_device *pdev,
 			   struct tegra_ehci_platform_data *pdata)
 {
@@ -444,6 +419,9 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		err = -ENOMEM;
 		goto cleanup_clk;
 	}
+	tegra->ehci = hcd_to_ehci(hcd);
+
+	hcd->has_tt = 1;
 	hcd->phy = u_phy;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -460,6 +438,7 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		err = -ENOMEM;
 		goto cleanup_hcd_create;
 	}
+	tegra->ehci->caps = hcd->regs + 0x100;
 
 	err = usb_phy_init(hcd->phy);
 	if (err) {
@@ -482,8 +461,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_phy;
 	}
 
-	tegra->ehci = hcd_to_ehci(hcd);
-
 	irq = platform_get_irq(pdev, 0);
 	if (!irq) {
 		dev_err(&pdev->dev, "Failed to get IRQ\n");
@@ -558,7 +535,50 @@ static struct platform_driver tegra_ehci_driver = {
 	.remove		= tegra_ehci_remove,
 	.shutdown	= tegra_ehci_hcd_shutdown,
 	.driver		= {
-		.name	= "tegra-ehci",
+		.name	= DRV_NAME,
 		.of_match_table = tegra_ehci_of_match,
 	}
 };
+
+static const struct ehci_driver_overrides tegra_overrides __initconst = {
+	.extra_priv_size	= sizeof(struct tegra_ehci_hcd),
+};
+
+static int __init ehci_tegra_init(void)
+{
+	if (usb_disabled())
+		return -ENODEV;
+
+	pr_info(DRV_NAME ": " DRIVER_DESC "\n");
+
+	ehci_init_driver(&tegra_ehci_hc_driver, &tegra_overrides);
+
+	/*
+	 * The Tegra HW has some unusual quirks, which require Tegra-specific
+	 * workarounds. We override certain hc_driver functions here to
+	 * achieve that. We explicitly do not enhance ehci_driver_overrides to
+	 * allow this more easily, since this is an unusual case, and we don't
+	 * want to encourage others to override these functions by making it
+	 * too easy.
+	 */
+
+	orig_hub_control = tegra_ehci_hc_driver.hub_control;
+
+	tegra_ehci_hc_driver.map_urb_for_dma = tegra_ehci_map_urb_for_dma;
+	tegra_ehci_hc_driver.unmap_urb_for_dma = tegra_ehci_unmap_urb_for_dma;
+	tegra_ehci_hc_driver.hub_control = tegra_ehci_hub_control;
+
+	return platform_driver_register(&tegra_ehci_driver);
+}
+module_init(ehci_tegra_init);
+
+static void __exit ehci_tegra_cleanup(void)
+{
+	platform_driver_unregister(&tegra_ehci_driver);
+}
+module_exit(ehci_tegra_cleanup);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
+MODULE_DEVICE_TABLE(of, tegra_ehci_of_match);
-- 
1.8.1.5
