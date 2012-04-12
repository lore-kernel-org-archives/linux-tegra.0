From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Changes to power management in ehci-tegra
Date: Thu, 12 Apr 2012 14:07:26 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1204121401360.1496-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Benoit or anyone else:

Right now the ehci-tegra driver powers down the EHCI controller during 
bus suspend, if the appropriate parameter is set.  This is not the 
right thing to do, and it will break under some newly added changes to 
the USB core.

Instead, the driver should leave the controller powered up during bus 
suspend, and power it down during controller suspend.  Below is a patch 
that attempts to do this.

I have no way to test this patch; I haven't even compiled it.  Please 
see if it works okay, or if it needs to be fixed at all.

Thanks,

Alan Stern



 drivers/usb/host/ehci-tegra.c |  368 +++++++++++++++++++++---------------------
 1 file changed, 188 insertions(+), 180 deletions(-)

Index: usb-3.4/drivers/usb/host/ehci-tegra.c
===================================================================
--- usb-3.4.orig/drivers/usb/host/ehci-tegra.c
+++ usb-3.4/drivers/usb/host/ehci-tegra.c
@@ -24,6 +24,7 @@
 #include <linux/gpio.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/pm_runtime.h>
 
 #include <mach/usb_phy.h>
 #include <mach/iomap.h>
@@ -37,9 +38,7 @@ struct tegra_ehci_hcd {
 	struct clk *emc_clk;
 	struct usb_phy *transceiver;
 	int host_resumed;
-	int bus_suspended;
 	int port_resuming;
-	int power_down_on_bus_suspend;
 	enum tegra_usb_phy_port_speed port_speed;
 };
 
@@ -273,120 +272,6 @@ static void tegra_ehci_restart(struct us
 	up_write(&ehci_cf_port_reset_rwsem);
 }
 
-static int tegra_usb_suspend(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-	struct ehci_regs __iomem *hw = tegra->ehci->regs;
-	unsigned long flags;
-
-	spin_lock_irqsave(&tegra->ehci->lock, flags);
-
-	tegra->port_speed = (readl(&hw->port_status[0]) >> 26) & 0x3;
-	ehci_halt(tegra->ehci);
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-
-	spin_unlock_irqrestore(&tegra->ehci->lock, flags);
-
-	tegra_ehci_power_down(hcd);
-	return 0;
-}
-
-static int tegra_usb_resume(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-	struct ehci_hcd	*ehci = hcd_to_ehci(hcd);
-	struct ehci_regs __iomem *hw = ehci->regs;
-	unsigned long val;
-
-	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	tegra_ehci_power_up(hcd);
-
-	if (tegra->port_speed > TEGRA_USB_PHY_PORT_SPEED_HIGH) {
-		/* Wait for the phy to detect new devices
-		 * before we restart the controller */
-		msleep(10);
-		goto restart;
-	}
-
-	/* Force the phy to keep data lines in suspend state */
-	tegra_ehci_phy_restore_start(tegra->phy, tegra->port_speed);
-
-	/* Enable host mode */
-	tdi_reset(ehci);
-
-	/* Enable Port Power */
-	val = readl(&hw->port_status[0]);
-	val |= PORT_POWER;
-	writel(val, &hw->port_status[0]);
-	udelay(10);
-
-	/* Check if the phy resume from LP0. When the phy resume from LP0
-	 * USB register will be reset. */
-	if (!readl(&hw->async_next)) {
-		/* Program the field PTC based on the saved speed mode */
-		val = readl(&hw->port_status[0]);
-		val &= ~PORT_TEST(~0);
-		if (tegra->port_speed == TEGRA_USB_PHY_PORT_SPEED_HIGH)
-			val |= PORT_TEST_FORCE;
-		else if (tegra->port_speed == TEGRA_USB_PHY_PORT_SPEED_FULL)
-			val |= PORT_TEST(6);
-		else if (tegra->port_speed == TEGRA_USB_PHY_PORT_SPEED_LOW)
-			val |= PORT_TEST(7);
-		writel(val, &hw->port_status[0]);
-		udelay(10);
-
-		/* Disable test mode by setting PTC field to NORMAL_OP */
-		val = readl(&hw->port_status[0]);
-		val &= ~PORT_TEST(~0);
-		writel(val, &hw->port_status[0]);
-		udelay(10);
-	}
-
-	/* Poll until CCS is enabled */
-	if (handshake(ehci, &hw->port_status[0], PORT_CONNECT,
-						 PORT_CONNECT, 2000)) {
-		pr_err("%s: timeout waiting for PORT_CONNECT\n", __func__);
-		goto restart;
-	}
-
-	/* Poll until PE is enabled */
-	if (handshake(ehci, &hw->port_status[0], PORT_PE,
-						 PORT_PE, 2000)) {
-		pr_err("%s: timeout waiting for USB_PORTSC1_PE\n", __func__);
-		goto restart;
-	}
-
-	/* Clear the PCI status, to avoid an interrupt taken upon resume */
-	val = readl(&hw->status);
-	val |= STS_PCD;
-	writel(val, &hw->status);
-
-	/* Put controller in suspend mode by writing 1 to SUSP bit of PORTSC */
-	val = readl(&hw->port_status[0]);
-	if ((val & PORT_POWER) && (val & PORT_PE)) {
-		val |= PORT_SUSPEND;
-		writel(val, &hw->port_status[0]);
-
-		/* Wait until port suspend completes */
-		if (handshake(ehci, &hw->port_status[0], PORT_SUSPEND,
-							 PORT_SUSPEND, 1000)) {
-			pr_err("%s: timeout waiting for PORT_SUSPEND\n",
-								__func__);
-			goto restart;
-		}
-	}
-
-	tegra_ehci_phy_restore_end(tegra->phy);
-	return 0;
-
-restart:
-	if (tegra->port_speed <= TEGRA_USB_PHY_PORT_SPEED_HIGH)
-		tegra_ehci_phy_restore_end(tegra->phy);
-
-	tegra_ehci_restart(hcd);
-	return 0;
-}
-
 static void tegra_ehci_shutdown(struct usb_hcd *hcd)
 {
 	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
@@ -434,36 +319,6 @@ static int tegra_ehci_setup(struct usb_h
 	return retval;
 }
 
-#ifdef CONFIG_PM
-static int tegra_ehci_bus_suspend(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-	int error_status = 0;
-
-	error_status = ehci_bus_suspend(hcd);
-	if (!error_status && tegra->power_down_on_bus_suspend) {
-		tegra_usb_suspend(hcd);
-		tegra->bus_suspended = 1;
-	}
-
-	return error_status;
-}
-
-static int tegra_ehci_bus_resume(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-
-	if (tegra->bus_suspended && tegra->power_down_on_bus_suspend) {
-		tegra_usb_resume(hcd);
-		tegra->bus_suspended = 0;
-	}
-
-	tegra_usb_phy_preresume(tegra->phy);
-	tegra->port_resuming = 1;
-	return ehci_bus_resume(hcd);
-}
-#endif
-
 struct temp_buffer {
 	void *kmalloc_ptr;
 	void *old_xfer_buffer;
@@ -574,8 +429,8 @@ static const struct hc_driver tegra_ehci
 	.hub_control		= tegra_ehci_hub_control,
 	.clear_tt_buffer_complete = ehci_clear_tt_buffer_complete,
 #ifdef CONFIG_PM
-	.bus_suspend		= tegra_ehci_bus_suspend,
-	.bus_resume		= tegra_ehci_bus_resume,
+	.bus_suspend		= ehci_bus_suspend,
+	.bus_resume		= ehci_bus_resume,
 #endif
 	.relinquish_port	= ehci_relinquish_port,
 	.port_handed_over	= ehci_port_handed_over,
@@ -608,6 +463,178 @@ static int setup_vbus_gpio(struct platfo
 	return err;
 }
 
+#ifdef CONFIG_PM
+
+static int controller_suspend(struct device *dev)
+{
+	struct tegra_ehci_hcd *tegra =
+			platform_get_drvdata(to_platform_device(dev));
+	struct ehci_hcd	*ehci = tegra->ehci;
+	struct usb_hcd *hcd = ehci_to_hcd(ehci);
+	struct ehci_regs __iomem *hw = ehci->regs;
+	unsigned long flags;
+
+	if (time_before(jiffies, ehci->next_statechange))
+		msleep(10);
+
+	spin_lock_irqsave(&ehci->lock, flags);
+
+	tegra->port_speed = (readl(&hw->port_status[0]) >> 26) & 0x3;
+	ehci_halt(ehci);
+	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+
+	spin_unlock_irqrestore(&ehci->lock, flags);
+
+	tegra_ehci_power_down(hcd);
+	return 0;
+}
+
+static int controller_resume(struct device *dev)
+{
+	struct tegra_ehci_hcd *tegra =
+			platform_get_drvdata(to_platform_device(dev));
+	struct ehci_hcd	*ehci = tegra->ehci;
+	struct usb_hcd *hcd = ehci_to_hcd(ehci);
+	struct ehci_regs __iomem *hw = ehci->regs;
+	unsigned long val;
+
+	set_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
+	tegra_ehci_power_up(hcd);
+
+	if (tegra->port_speed > TEGRA_USB_PHY_PORT_SPEED_HIGH) {
+		/* Wait for the phy to detect new devices
+		 * before we restart the controller */
+		msleep(10);
+		goto restart;
+	}
+
+	/* Force the phy to keep data lines in suspend state */
+	tegra_ehci_phy_restore_start(tegra->phy, tegra->port_speed);
+
+	/* Enable host mode */
+	tdi_reset(ehci);
+
+	/* Enable Port Power */
+	val = readl(&hw->port_status[0]);
+	val |= PORT_POWER;
+	writel(val, &hw->port_status[0]);
+	udelay(10);
+
+	/* Check if the phy resume from LP0. When the phy resume from LP0
+	 * USB register will be reset. */
+	if (!readl(&hw->async_next)) {
+		/* Program the field PTC based on the saved speed mode */
+		val = readl(&hw->port_status[0]);
+		val &= ~PORT_TEST(~0);
+		if (tegra->port_speed == TEGRA_USB_PHY_PORT_SPEED_HIGH)
+			val |= PORT_TEST_FORCE;
+		else if (tegra->port_speed == TEGRA_USB_PHY_PORT_SPEED_FULL)
+			val |= PORT_TEST(6);
+		else if (tegra->port_speed == TEGRA_USB_PHY_PORT_SPEED_LOW)
+			val |= PORT_TEST(7);
+		writel(val, &hw->port_status[0]);
+		udelay(10);
+
+		/* Disable test mode by setting PTC field to NORMAL_OP */
+		val = readl(&hw->port_status[0]);
+		val &= ~PORT_TEST(~0);
+		writel(val, &hw->port_status[0]);
+		udelay(10);
+	}
+
+	/* Poll until CCS is enabled */
+	if (handshake(ehci, &hw->port_status[0], PORT_CONNECT,
+						 PORT_CONNECT, 2000)) {
+		pr_err("%s: timeout waiting for PORT_CONNECT\n", __func__);
+		goto restart;
+	}
+
+	/* Poll until PE is enabled */
+	if (handshake(ehci, &hw->port_status[0], PORT_PE,
+						 PORT_PE, 2000)) {
+		pr_err("%s: timeout waiting for USB_PORTSC1_PE\n", __func__);
+		goto restart;
+	}
+
+	/* Clear the PCI status, to avoid an interrupt taken upon resume */
+	val = readl(&hw->status);
+	val |= STS_PCD;
+	writel(val, &hw->status);
+
+	/* Put controller in suspend mode by writing 1 to SUSP bit of PORTSC */
+	val = readl(&hw->port_status[0]);
+	if ((val & PORT_POWER) && (val & PORT_PE)) {
+		val |= PORT_SUSPEND;
+		writel(val, &hw->port_status[0]);
+
+		/* Wait until port suspend completes */
+		if (handshake(ehci, &hw->port_status[0], PORT_SUSPEND,
+							 PORT_SUSPEND, 1000)) {
+			pr_err("%s: timeout waiting for PORT_SUSPEND\n",
+								__func__);
+			goto restart;
+		}
+	}
+
+	tegra_ehci_phy_restore_end(tegra->phy);
+	goto done;
+
+ restart:
+	if (tegra->port_speed <= TEGRA_USB_PHY_PORT_SPEED_HIGH)
+		tegra_ehci_phy_restore_end(tegra->phy);
+
+	tegra_ehci_restart(hcd);
+
+ done:
+	tegra_usb_phy_preresume(tegra->phy);
+	tegra->port_resuming = 1;
+	return 0;
+}
+
+static int tegra_ehci_suspend(struct device *dev)
+{
+	struct tegra_ehci_hcd *tegra =
+			platform_get_drvdata(to_platform_device(dev));
+	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
+	int rc = 0;
+
+	if (HCD_HW_ACCESSIBLE(hcd))
+		rc = controller_suspend(dev);
+	return rc;
+}
+
+static int tegra_ehci_resume(struct device *dev)
+{
+	int rc;
+
+	rc = controller_resume(dev);
+	if (rc == 0) {
+		pm_runtime_disable(dev);
+		pm_runtime_set_active(dev);
+		pm_runtime_enable(dev);
+	}
+	return rc;
+}
+
+static int tegra_ehci_runtime_suspend(struct device *dev)
+{
+	return controller_suspend(dev);
+}
+
+static int tegra_ehci_resume(struct device *dev)
+{
+	return controller_resume(dev);
+}
+
+static const struct dev_pm_ops tegra_ehci_pm_ops = {
+	.suspend	= tegra_ehci_suspend,
+	.resume		= tegra_ehci_resume,
+	.runtime_suspend = tegra_ehci_runtime_suspend,
+	.runtime_resume	= tegra_ehci_runtime_resume,
+};
+
+#endif
+
 static u64 tegra_ehci_dma_mask = DMA_BIT_MASK(32);
 
 static int tegra_ehci_probe(struct platform_device *pdev)
@@ -722,7 +749,6 @@ static int tegra_ehci_probe(struct platf
 	}
 
 	tegra->host_resumed = 1;
-	tegra->power_down_on_bus_suspend = pdata->power_down_on_bus_suspend;
 	tegra->ehci = hcd_to_ehci(hcd);
 
 	irq = platform_get_irq(pdev, 0);
@@ -747,6 +773,12 @@ static int tegra_ehci_probe(struct platf
 		goto fail;
 	}
 
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+	if (!pdata->power_down_on_bus_suspend)
+		pm_runtime_forbid(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 	return err;
 
 fail:
@@ -773,33 +805,6 @@ fail_hcd:
 	return err;
 }
 
-#ifdef CONFIG_PM
-static int tegra_ehci_resume(struct platform_device *pdev)
-{
-	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
-
-	if (tegra->bus_suspended)
-		return 0;
-
-	return tegra_usb_resume(hcd);
-}
-
-static int tegra_ehci_suspend(struct platform_device *pdev, pm_message_t state)
-{
-	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
-	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
-
-	if (tegra->bus_suspended)
-		return 0;
-
-	if (time_before(jiffies, tegra->ehci->next_statechange))
-		msleep(10);
-
-	return tegra_usb_suspend(hcd);
-}
-#endif
-
 static int tegra_ehci_remove(struct platform_device *pdev)
 {
 	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
@@ -808,6 +813,10 @@ static int tegra_ehci_remove(struct plat
 	if (tegra == NULL || hcd == NULL)
 		return -EINVAL;
 
+	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
+
 #ifdef CONFIG_USB_OTG_UTILS
 	if (tegra->transceiver) {
 		otg_set_host(tegra->transceiver->otg, NULL);
@@ -848,13 +857,12 @@ static struct of_device_id tegra_ehci_of
 static struct platform_driver tegra_ehci_driver = {
 	.probe		= tegra_ehci_probe,
 	.remove		= tegra_ehci_remove,
-#ifdef CONFIG_PM
-	.suspend	= tegra_ehci_suspend,
-	.resume		= tegra_ehci_resume,
-#endif
 	.shutdown	= tegra_ehci_hcd_shutdown,
 	.driver		= {
 		.name	= "tegra-ehci",
 		.of_match_table = tegra_ehci_of_match,
+#ifdef CONFIG_PM
+		.pm	= &tegra_ehci_pm_ops,
+#endif
 	}
 };
