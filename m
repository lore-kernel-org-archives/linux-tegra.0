From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 REPOST 4/7] USB: EHCI: tegra: remove all power management
Date: Thu, 13 Jun 2013 11:24:10 -0600
Message-ID: <1371144253-21295-5-git-send-email-swarren@wwwdotorg.org>
References: <1371144253-21295-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371144253-21295-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The PM routines in ehci-tegra.c use APIs such as ehci_reset(),
ehci_halt(), and ehci_tdi_reset() that would need to be exported to
convert ehci-tegra.c into a separate module from ehci-hcd.c. However,
we'd prefer not to export them.

Instead, simply remove all power management functionality. Runtime PM
was disabled since it didn't work correctly, and system suspend isn't
yet supported in a meaningful way. So, this change doesn't lose any
functionality.

Hopefully the power management logic can be reimplemented in a cleaner
way in the future.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
---
v3:
* Also remove tegra_ehci_power_up(), tegra_ehci_shutdown(), struct
  tegra_ehci_hcd.host_resumed.
* Add back .bus_{suspend,resume} entries in tegra_ehci_hc_driver.
v2: New patch.
---
 drivers/usb/host/ehci-tegra.c | 246 +-----------------------------------------
 1 file changed, 1 insertion(+), 245 deletions(-)

diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 289b9b8..dde5189 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -46,30 +46,11 @@ struct tegra_ehci_hcd {
 	struct tegra_usb_phy *phy;
 	struct clk *clk;
 	struct usb_phy *transceiver;
-	int host_resumed;
 	int port_resuming;
 	bool needs_double_reset;
 	enum tegra_usb_phy_port_speed port_speed;
 };
 
-static void tegra_ehci_power_up(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-
-	clk_prepare_enable(tegra->clk);
-	usb_phy_set_suspend(hcd->phy, 0);
-	tegra->host_resumed = 1;
-}
-
-static void tegra_ehci_power_down(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-
-	tegra->host_resumed = 0;
-	usb_phy_set_suspend(hcd->phy, 1);
-	clk_disable_unprepare(tegra->clk);
-}
-
 static int tegra_ehci_internal_port_reset(
 	struct ehci_hcd	*ehci,
 	u32 __iomem	*portsc_reg
@@ -248,39 +229,6 @@ done:
 	return retval;
 }
 
-static void tegra_ehci_restart(struct usb_hcd *hcd)
-{
-	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
-
-	ehci_reset(ehci);
-
-	/* setup the frame list and Async q heads */
-	ehci_writel(ehci, ehci->periodic_dma, &ehci->regs->frame_list);
-	ehci_writel(ehci, (u32)ehci->async->qh_dma, &ehci->regs->async_next);
-	/* setup the command register and set the controller in RUN mode */
-	ehci->command &= ~(CMD_LRESET|CMD_IAAD|CMD_PSE|CMD_ASE|CMD_RESET);
-	ehci->command |= CMD_RUN;
-	ehci_writel(ehci, ehci->command, &ehci->regs->command);
-
-	down_write(&ehci_cf_port_reset_rwsem);
-	ehci_writel(ehci, FLAG_CF, &ehci->regs->configured_flag);
-	/* flush posted writes */
-	ehci_readl(ehci, &ehci->regs->command);
-	up_write(&ehci_cf_port_reset_rwsem);
-}
-
-static void tegra_ehci_shutdown(struct usb_hcd *hcd)
-{
-	struct tegra_ehci_hcd *tegra = dev_get_drvdata(hcd->self.controller);
-
-	/* ehci_shutdown touches the USB controller registers, make sure
-	 * controller has clocks to it */
-	if (!tegra->host_resumed)
-		tegra_ehci_power_up(hcd);
-
-	ehci_shutdown(hcd);
-}
-
 static int tegra_ehci_setup(struct usb_hcd *hcd)
 {
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
@@ -395,7 +343,7 @@ static const struct hc_driver tegra_ehci_hc_driver = {
 
 	/* modified ehci functions for tegra */
 	.reset			= tegra_ehci_setup,
-	.shutdown		= tegra_ehci_shutdown,
+	.shutdown		= ehci_shutdown,
 	.map_urb_for_dma	= tegra_ehci_map_urb_for_dma,
 	.unmap_urb_for_dma	= tegra_ehci_unmap_urb_for_dma,
 	.hub_control		= tegra_ehci_hub_control,
@@ -432,182 +380,6 @@ static int setup_vbus_gpio(struct platform_device *pdev,
 	return err;
 }
 
-#ifdef CONFIG_PM
-
-static int controller_suspend(struct device *dev)
-{
-	struct tegra_ehci_hcd *tegra =
-			platform_get_drvdata(to_platform_device(dev));
-	struct ehci_hcd	*ehci = tegra->ehci;
-	struct usb_hcd *hcd = ehci_to_hcd(ehci);
-	struct ehci_regs __iomem *hw = ehci->regs;
-	unsigned long flags;
-
-	if (time_before(jiffies, ehci->next_statechange))
-		msleep(10);
-
-	ehci_halt(ehci);
-
-	spin_lock_irqsave(&ehci->lock, flags);
-	tegra->port_speed = (readl(&hw->port_status[0]) >> 26) & 0x3;
-	clear_bit(HCD_FLAG_HW_ACCESSIBLE, &hcd->flags);
-	spin_unlock_irqrestore(&ehci->lock, flags);
-
-	tegra_ehci_power_down(hcd);
-	return 0;
-}
-
-static int controller_resume(struct device *dev)
-{
-	struct tegra_ehci_hcd *tegra =
-			platform_get_drvdata(to_platform_device(dev));
-	struct ehci_hcd	*ehci = tegra->ehci;
-	struct usb_hcd *hcd = ehci_to_hcd(ehci);
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
-	tegra_ehci_phy_restore_start(hcd->phy, tegra->port_speed);
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
-	if (ehci_handshake(ehci, &hw->port_status[0], PORT_CONNECT,
-						 PORT_CONNECT, 2000)) {
-		pr_err("%s: timeout waiting for PORT_CONNECT\n", __func__);
-		goto restart;
-	}
-
-	/* Poll until PE is enabled */
-	if (ehci_handshake(ehci, &hw->port_status[0], PORT_PE,
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
-		if (ehci_handshake(ehci, &hw->port_status[0], PORT_SUSPEND,
-							 PORT_SUSPEND, 1000)) {
-			pr_err("%s: timeout waiting for PORT_SUSPEND\n",
-								__func__);
-			goto restart;
-		}
-	}
-
-	tegra_ehci_phy_restore_end(hcd->phy);
-	goto done;
-
- restart:
-	if (tegra->port_speed <= TEGRA_USB_PHY_PORT_SPEED_HIGH)
-		tegra_ehci_phy_restore_end(hcd->phy);
-
-	tegra_ehci_restart(hcd);
-
- done:
-	tegra_usb_phy_preresume(hcd->phy);
-	tegra->port_resuming = 1;
-	return 0;
-}
-
-static int tegra_ehci_suspend(struct device *dev)
-{
-	struct tegra_ehci_hcd *tegra =
-			platform_get_drvdata(to_platform_device(dev));
-	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
-	int rc = 0;
-
-	/*
-	 * When system sleep is supported and USB controller wakeup is
-	 * implemented: If the controller is runtime-suspended and the
-	 * wakeup setting needs to be changed, call pm_runtime_resume().
-	 */
-	if (HCD_HW_ACCESSIBLE(hcd))
-		rc = controller_suspend(dev);
-	return rc;
-}
-
-static int tegra_ehci_resume(struct device *dev)
-{
-	int rc;
-
-	rc = controller_resume(dev);
-	if (rc == 0) {
-		pm_runtime_disable(dev);
-		pm_runtime_set_active(dev);
-		pm_runtime_enable(dev);
-	}
-	return rc;
-}
-
-static int tegra_ehci_runtime_suspend(struct device *dev)
-{
-	return controller_suspend(dev);
-}
-
-static int tegra_ehci_runtime_resume(struct device *dev)
-{
-	return controller_resume(dev);
-}
-
-static const struct dev_pm_ops tegra_ehci_pm_ops = {
-	.suspend	= tegra_ehci_suspend,
-	.resume		= tegra_ehci_resume,
-	.runtime_suspend = tegra_ehci_runtime_suspend,
-	.runtime_resume	= tegra_ehci_runtime_resume,
-};
-
-#endif
-
 /* Bits of PORTSC1, which will get cleared by writing 1 into them */
 #define TEGRA_PORTSC1_RWC_BITS (PORT_CSC | PORT_PEC | PORT_OCC)
 
@@ -746,7 +518,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_phy;
 	}
 
-	tegra->host_resumed = 1;
 	tegra->ehci = hcd_to_ehci(hcd);
 
 	irq = platform_get_irq(pdev, 0);
@@ -773,14 +544,6 @@ static int tegra_ehci_probe(struct platform_device *pdev)
 		goto cleanup_phy;
 	}
 
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_get_noresume(&pdev->dev);
-
-	/* Don't skip the pm_runtime_forbid call if wakeup isn't working */
-	/* if (!pdata->power_down_on_bus_suspend) */
-		pm_runtime_forbid(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_put_sync(&pdev->dev);
 	return err;
 
 cleanup_phy:
@@ -800,10 +563,6 @@ static int tegra_ehci_remove(struct platform_device *pdev)
 	struct tegra_ehci_hcd *tegra = platform_get_drvdata(pdev);
 	struct usb_hcd *hcd = ehci_to_hcd(tegra->ehci);
 
-	pm_runtime_get_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_put_noidle(&pdev->dev);
-
 	if (!IS_ERR(tegra->transceiver))
 		otg_set_host(tegra->transceiver->otg, NULL);
 
@@ -837,8 +596,5 @@ static struct platform_driver tegra_ehci_driver = {
 	.driver		= {
 		.name	= "tegra-ehci",
 		.of_match_table = tegra_ehci_of_match,
-#ifdef CONFIG_PM
-		.pm	= &tegra_ehci_pm_ops,
-#endif
 	}
 };
-- 
1.8.1.5
