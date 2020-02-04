From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch V4 10/19] usb: gadget: tegra-xudc: Add usb-phy support
Date: Tue, 4 Feb 2020 16:46:56 +0530
Message-ID: <1580815025-10915-11-git-send-email-nkristam@nvidia.com>
References: <1580815025-10915-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1580815025-10915-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

usb-phy is used to get notified on the USB role changes. Get usb-phy from
the UTMI PHY.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V4:
 - Addressed nit comments from Thierry.
 - usb_phy_event is used to detect device mode instead of usb_role.
---
V2-V3:
 - No changes in this version
---
 drivers/usb/gadget/udc/tegra-xudc.c | 48 ++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index acecdcf..7411dd15 100644
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
@@ -487,6 +489,9 @@ struct tegra_xudc {
 	bool suspended;
 	bool powergated;
 
+	struct usb_phy *usbphy;
+	struct notifier_block vbus_nb;
+
 	struct completion disconnect_complete;
 
 	bool selfpowered;
@@ -669,6 +674,31 @@ static void tegra_xudc_usb_role_sw_work(struct work_struct *work)
 		tegra_xudc_device_mode_off(xudc);
 }
 
+static int tegra_xudc_vbus_notify(struct notifier_block *nb,
+					 unsigned long action, void *data)
+{
+	struct tegra_xudc *xudc = container_of(nb, struct tegra_xudc,
+					       vbus_nb);
+	struct usb_phy *usbphy = (struct usb_phy *)data;
+
+	dev_dbg(xudc->dev, "%s(): event is %d\n", __func__, usbphy->last_event);
+
+	if ((xudc->device_mode && usbphy->last_event == USB_EVENT_VBUS) ||
+	    (!xudc->device_mode && usbphy->last_event != USB_EVENT_VBUS)) {
+		dev_dbg(xudc->dev, "Same role(%d) received. Ignore",
+			xudc->device_mode);
+		return NOTIFY_OK;
+	}
+
+	xudc->device_mode = (usbphy->last_event == USB_EVENT_VBUS) ? true :
+								     false;
+
+	if (!xudc->suspended)
+		schedule_work(&xudc->usb_role_sw_work);
+
+	return NOTIFY_OK;
+}
+
 static void tegra_xudc_plc_reset_work(struct work_struct *work)
 {
 	struct delayed_work *dwork = to_delayed_work(work);
@@ -1937,6 +1967,9 @@ static int tegra_xudc_gadget_start(struct usb_gadget *gadget,
 		xudc_writel(xudc, val, CTRL);
 	}
 
+	if (xudc->usbphy)
+		otg_set_peripheral(xudc->usbphy->otg, gadget);
+
 	xudc->driver = driver;
 unlock:
 	dev_dbg(xudc->dev, "%s: ret value is %d", __func__, ret);
@@ -1957,6 +1990,9 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
 
 	spin_lock_irqsave(&xudc->lock, flags);
 
+	if (xudc->usbphy)
+		otg_set_peripheral(xudc->usbphy->otg, NULL);
+
 	val = xudc_readl(xudc, CTRL);
 	val &= ~(CTRL_IE | CTRL_ENABLE);
 	xudc_writel(xudc, val, CTRL);
@@ -3561,9 +3597,15 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&xudc->port_reset_war_work,
 				tegra_xudc_port_reset_war_work);
 
-	/* Set the mode as device mode and this keeps phy always ON */
-	xudc->device_mode = true;
-	schedule_work(&xudc->usb_role_sw_work);
+	xudc->vbus_nb.notifier_call = tegra_xudc_vbus_notify;
+	xudc->usbphy = devm_usb_get_phy_by_node(xudc->dev,
+						xudc->utmi_phy->dev.of_node,
+						&xudc->vbus_nb);
+	if (IS_ERR(xudc->usbphy)) {
+		err = PTR_ERR(xudc->usbphy);
+		dev_err(xudc->dev, "failed to get USB PHY: %d\n", err);
+		goto free_eps;
+	}
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.7.4
