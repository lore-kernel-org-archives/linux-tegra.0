From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch V5 09/21] usb: gadget: tegra-xudc: Remove usb-role-switch support
Date: Mon, 10 Feb 2020 13:41:35 +0530
Message-ID: <1581322307-11140-10-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Padctl driver will act as a central driver to receive USB role changes via
usb-role-switch. This is updated to corresponding host, device drivers.
Hence remove usb-role-switch from XUDC driver.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V5:
 - Removed select USB_ROLE_SWITCH from Kconfig.
---
V4
 - Updated device_mode variable with usb_role and remove role variable.
 - Removed debug log related to always on.
---
V2-V3:
 - No changes in this version
---
 drivers/usb/gadget/udc/tegra-xudc.c | 58 +++++--------------------------------
 2 files changed, 7 insertions(+), 52 deletions(-)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 797d6ac..ae70ce2 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -445,7 +445,6 @@ config USB_TEGRA_XUDC
 	tristate "NVIDIA Tegra Superspeed USB 3.0 Device Controller"
 	depends on ARCH_TEGRA || COMPILE_TEST
 	depends on PHY_TEGRA_XUSB
-	select USB_ROLE_SWITCH
 	help
 	 Enables NVIDIA Tegra USB 3.0 device mode controller driver.
 
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 634c2c1..acecdcf 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -477,8 +477,7 @@ struct tegra_xudc {
 
 	struct clk_bulk_data *clks;
 
-	enum usb_role device_mode;
-	struct usb_role_switch *usb_role_sw;
+	bool device_mode;
 	struct work_struct usb_role_sw_work;
 
 	struct phy *usb3_phy;
@@ -609,8 +608,6 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 	dev_dbg(xudc->dev, "device mode on\n");
 
 	tegra_xusb_padctl_set_vbus_override(xudc->padctl, true);
-
-	xudc->device_mode = USB_ROLE_DEVICE;
 }
 
 static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
@@ -643,8 +640,6 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 		xudc_writel(xudc, val, PORTSC);
 	}
 
-	xudc->device_mode = USB_ROLE_NONE;
-
 	/* Wait for disconnect event. */
 	if (connected)
 		wait_for_completion(&xudc->disconnect_complete);
@@ -668,29 +663,10 @@ static void tegra_xudc_usb_role_sw_work(struct work_struct *work)
 	struct tegra_xudc *xudc = container_of(work, struct tegra_xudc,
 					       usb_role_sw_work);
 
-	if (!xudc->usb_role_sw ||
-		usb_role_switch_get_role(xudc->usb_role_sw) == USB_ROLE_DEVICE)
+	if (xudc->device_mode)
 		tegra_xudc_device_mode_on(xudc);
 	else
 		tegra_xudc_device_mode_off(xudc);
-
-}
-
-static int tegra_xudc_usb_role_sw_set(struct device *dev, enum usb_role role)
-{
-	struct tegra_xudc *xudc = dev_get_drvdata(dev);
-	unsigned long flags;
-
-	dev_dbg(dev, "%s role is %d\n", __func__, role);
-
-	spin_lock_irqsave(&xudc->lock, flags);
-
-	if (!xudc->suspended)
-		schedule_work(&xudc->usb_role_sw_work);
-
-	spin_unlock_irqrestore(&xudc->lock, flags);
-
-	return 0;
 }
 
 static void tegra_xudc_plc_reset_work(struct work_struct *work)
@@ -729,8 +705,7 @@ static void tegra_xudc_port_reset_war_work(struct work_struct *work)
 
 	spin_lock_irqsave(&xudc->lock, flags);
 
-	if ((xudc->device_mode == USB_ROLE_DEVICE)
-			      && xudc->wait_for_sec_prc) {
+	if (xudc->device_mode && xudc->wait_for_sec_prc) {
 		pls = (xudc_readl(xudc, PORTSC) & PORTSC_PLS_MASK) >>
 			PORTSC_PLS_SHIFT;
 		dev_dbg(xudc->dev, "pls = %x\n", pls);
@@ -3457,7 +3432,6 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 {
 	struct tegra_xudc *xudc;
 	struct resource *res;
-	struct usb_role_switch_desc role_sx_desc = { 0 };
 	unsigned int i;
 	int err;
 
@@ -3587,23 +3561,9 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
 				tegra_xudc_port_reset_war_work);
 
-	if (of_property_read_bool(xudc->dev->of_node, "usb-role-switch")) {
-		role_sx_desc.set = tegra_xudc_usb_role_sw_set;
-		role_sx_desc.fwnode = dev_fwnode(xudc->dev);
-
-		xudc->usb_role_sw = usb_role_switch_register(xudc->dev,
-							&role_sx_desc);
-		if (IS_ERR(xudc->usb_role_sw)) {
-			err = PTR_ERR(xudc->usb_role_sw);
-			dev_err(xudc->dev, "Failed to register USB role SW: %d",
-					   err);
-			goto free_eps;
-		}
-	} else {
-		/* Set the mode as device mode and this keeps phy always ON */
-		dev_info(xudc->dev, "Set usb role to device mode always");
-		schedule_work(&xudc->usb_role_sw_work);
-	}
+	/* Set the mode as device mode and this keeps phy always ON */
+	xudc->device_mode = true;
+	schedule_work(&xudc->usb_role_sw_work);
 
 	pm_runtime_enable(&pdev->dev);
 
@@ -3643,11 +3603,7 @@ static int tegra_xudc_remove(struct platform_device *pdev)
 	pm_runtime_get_sync(xudc->dev);
 
 	cancel_delayed_work(&xudc->plc_reset_work);
