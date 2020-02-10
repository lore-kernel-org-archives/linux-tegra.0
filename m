From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [Patch V5 04/21] phy: tegra: xusb: Add usb-phy support
Date: Mon, 10 Feb 2020 13:41:30 +0530
Message-ID: <1581322307-11140-5-git-send-email-nkristam@nvidia.com>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1581322307-11140-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For USB 2 ports that has usb-role-switch enabled, add usb-phy for
corresponding USB 2 phy. USB role changes from role switch are then
updated to corresponding host and device mode drivers via usb-phy notifier
block.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V5:
 - No changes.
---
V4:
 - Addressed nit comments from Thierry.
 - usb_phy_event is set accoring to received usb_role.
 - Added Acked-by info.
V3:
 - Updated arguments and variable allignments as per Thierry inputs.
---
V2:
 - Added dev_set_drvdata for port->dev.
---
 drivers/phy/tegra/xusb.c | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h |  2 ++
 2 files changed, 86 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0fdbaa2..2c0e29c 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -532,6 +532,8 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
 	if (err < 0)
 		goto unregister;
 
+	dev_set_drvdata(&port->dev, port);
+
 	return 0;
 
 unregister:
@@ -544,6 +546,8 @@ static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
 	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
 		of_platform_depopulate(&port->dev);
 		usb_role_switch_unregister(port->usb_role_sw);
+		cancel_work_sync(&port->usb_phy_work);
+		usb_remove_phy(&port->usb_phy);
 	}
 
 	device_unregister(&port->dev);
@@ -562,15 +566,70 @@ static const char * const usb_roles[] = {
 	[USB_ROLE_DEVICE]	= "device",
 };
 
+static enum usb_phy_events to_usb_phy_event(enum usb_role role)
+{
+	switch (role) {
+	case USB_ROLE_DEVICE: return USB_EVENT_VBUS;
+	case USB_ROLE_HOST: return USB_EVENT_ID;
+	default: return USB_EVENT_NONE;
+	}
+}
+
+static void tegra_xusb_usb_phy_work(struct work_struct *work)
+{
+	struct tegra_xusb_port *port = container_of(work,
+						    struct tegra_xusb_port,
+						    usb_phy_work);
+	enum usb_role role = usb_role_switch_get_role(port->usb_role_sw);
+
+	usb_phy_set_event(&port->usb_phy, to_usb_phy_event(role));
+
+	dev_dbg(&port->dev, "%s(): calling notifier for role %s\n", __func__,
+		usb_roles[role]);
+
+	atomic_notifier_call_chain(&port->usb_phy.notifier, 0, &port->usb_phy);
+}
+
 static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
 {
+	struct tegra_xusb_port *port = dev_get_drvdata(dev);
+
 	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
 
+	schedule_work(&port->usb_phy_work);
+
+	return 0;
+}
+
+static int tegra_xusb_set_peripheral(struct usb_otg *otg,
+				     struct usb_gadget *gadget)
+{
+	struct tegra_xusb_port *port = container_of(otg->usb_phy,
+						    struct tegra_xusb_port,
+						    usb_phy);
+
+	if (gadget != NULL)
+		schedule_work(&port->usb_phy_work);
+
 	return 0;
 }
 
+static int tegra_xusb_set_host(struct usb_otg *otg, struct usb_bus *host)
+{
+	struct tegra_xusb_port *port = container_of(otg->usb_phy,
+						    struct tegra_xusb_port,
+						    usb_phy);
+
+	if (host != NULL)
+		schedule_work(&port->usb_phy_work);
+
+	return 0;
+}
+
+
 static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 {
+	struct tegra_xusb_lane *lane;
 	struct usb_role_switch_desc role_sx_desc = {
 		.fwnode = dev_fwnode(&port->dev),
 		.set = tegra_xusb_role_sw_set,
@@ -597,6 +656,31 @@ static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 		return err;
 	}
 
+	INIT_WORK(&port->usb_phy_work, tegra_xusb_usb_phy_work);
+
+	port->usb_phy.otg = devm_kzalloc(&port->dev, sizeof(struct usb_otg),
+					 GFP_KERNEL);
+	if (!port->usb_phy.otg)
+		return -ENOMEM;
+
+	lane = tegra_xusb_find_lane(port->padctl, "usb2", port->index);
+
+	/*
+	 * Assign phy dev to usb-phy dev. Host/device drivers can use phy
+	 * reference to retrieve usb-phy details.
+	 */
+	port->usb_phy.dev = &lane->pad->lanes[port->index]->dev;
+	port->usb_phy.dev->driver = port->padctl->dev->driver;
+	port->usb_phy.otg->usb_phy = &port->usb_phy;
+	port->usb_phy.otg->set_peripheral = tegra_xusb_set_peripheral;
+	port->usb_phy.otg->set_host = tegra_xusb_set_host;
+
+	err = usb_add_phy_dev(&port->usb_phy);
+	if (err < 0) {
+		dev_err(&port->dev, "Failed to add USB PHY: %d\n", err);
+		return err;
+	}
+
 	/* populate connector entry */
 	of_platform_populate(port->dev.of_node, NULL, NULL, &port->dev);
 
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 9f27899..2345657 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -268,6 +268,8 @@ struct tegra_xusb_port {
 	struct device dev;
 
 	struct usb_role_switch *usb_role_sw;
+	struct work_struct usb_phy_work;
+	struct usb_phy usb_phy;
 
 	const struct tegra_xusb_port_ops *ops;
 };
-- 
2.7.4
