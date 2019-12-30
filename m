From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 10/18] usb: gadget: tegra-xudc: Add usb-phy support
Date: Mon, 30 Dec 2019 16:39:47 +0530
Message-ID: <1577704195-2535-11-git-send-email-nkristam@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

usb-phy is used to get notified on the USB role changes. Get usb-phy from
the utmi phy.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2-V3:
 - No changes in this version
---
 drivers/usb/gadget/udc/tegra-xudc.c | 39 +++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 6ddb974..0f27d57 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -26,7 +26,9 @@
 #include <linux/reset.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb/otg.h>
 #include <linux/usb/role.h>
+#include <linux/usb/phy.h>
 #include <linux/workqueue.h>
 
 /* XUSB_DEV registers */
@@ -488,6 +490,9 @@ struct tegra_xudc {
 	bool suspended;
 	bool powergated;
 
+	struct usb_phy *usbphy;
+	struct notifier_block vbus_nb;
+
 	struct completion disconnect_complete;
 
 	bool selfpowered;
@@ -678,7 +683,22 @@ static void tegra_xudc_usb_role_sw_work(struct work_struct *work)
 		tegra_xudc_device_mode_on(xudc);
 	else
 		tegra_xudc_device_mode_off(xudc);
+}
+
+static int tegra_xudc_vbus_notifier(struct notifier_block *nb,
+					 unsigned long action, void *data)
+{
+	struct tegra_xudc *xudc = container_of(nb, struct tegra_xudc,
+					       vbus_nb);
+
+	dev_dbg(xudc->dev, "%s action is %ld\n", __func__, action);
+
+	xudc->role = (enum usb_role)action;
 
+	if (!xudc->suspended)
+		schedule_work(&xudc->usb_role_sw_work);
+
+	return NOTIFY_OK;
 }
 
 static void tegra_xudc_plc_reset_work(struct work_struct *work)
@@ -1949,6 +1969,9 @@ static int tegra_xudc_gadget_start(struct usb_gadget *gadget,
 		xudc_writel(xudc, val, CTRL);
 	}
 
+	if (xudc->usbphy)
+		otg_set_peripheral(xudc->usbphy->otg, gadget);
+
 	xudc->driver = driver;
 unlock:
 	dev_dbg(xudc->dev, "%s: ret value is %d", __func__, ret);
@@ -1969,6 +1992,9 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
 
 	spin_lock_irqsave(&xudc->lock, flags);
 
+	if (xudc->usbphy)
+		otg_set_peripheral(xudc->usbphy->otg, NULL);
+
 	val = xudc_readl(xudc, CTRL);
 	val &= ~(CTRL_IE | CTRL_ENABLE);
 	xudc_writel(xudc, val, CTRL);
@@ -3573,10 +3599,15 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
 				tegra_xudc_port_reset_war_work);
 
-	/* Set the mode as device mode and this keeps phy always ON */
-	dev_info(xudc->dev, "Set usb role to device mode always");
-	xudc->role = USB_ROLE_DEVICE;
-	schedule_work(&xudc->usb_role_sw_work);
+	xudc->vbus_nb.notifier_call = tegra_xudc_vbus_notifier;
+	xudc->usbphy = devm_usb_get_phy_by_node(xudc->dev,
+						xudc->utmi_phy->dev.of_node,
+						&xudc->vbus_nb);
+	if (IS_ERR(xudc->usbphy)) {
+		err = PTR_ERR(xudc->usbphy);
+		dev_err(xudc->dev, "failed to get usbphy phy: %d\n", err);
+		goto free_eps;
+	}
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.7.4
