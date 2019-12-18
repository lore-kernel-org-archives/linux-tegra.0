From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V2 04/18] phy: tegra: xusb: Add usb-phy support
Date: Wed, 18 Dec 2019 14:46:17 +0530
Message-ID: <1576660591-10383-5-git-send-email-nkristam@nvidia.com>
References: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1576660591-10383-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

For USB 2 ports that has usb-role-switch enabled, add usb-phy for
corresponding USB 2 phy. USB role changes from role switch are then
updated to corresponding host and device mode drivers via usb-phy notifier
block.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2:
 - Added dev_set_drvdata for port->dev.
---
 drivers/phy/tegra/xusb.c | 71 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h |  2 ++
 2 files changed, 73 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index dc00b42..5bde8f1 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -533,6 +533,8 @@ static int tegra_xusb_port_init(struct tegra_xusb_port *port,
 	if (err < 0)
 		goto unregister;
 
+	dev_set_drvdata(&port->dev, port);
+
 	return 0;
 
 unregister:
@@ -545,6 +547,8 @@ static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
 	if (!IS_ERR_OR_NULL(port->usb_role_sw)) {
 		of_platform_depopulate(&port->dev);
 		usb_role_switch_unregister(port->usb_role_sw);
+		cancel_work_sync(&port->usb_phy_work);
+		usb_remove_phy(&port->usb_phy);
 	}
 	device_unregister(&port->dev);
 }
@@ -556,16 +560,59 @@ static const char *const modes[] = {
 	[USB_DR_MODE_OTG] = "otg",
 };
 
+static void tegra_xusb_usb_phy_work(struct work_struct *work)
+{
+	struct tegra_xusb_port *port = container_of(work,
+				struct tegra_xusb_port, usb_phy_work);
+	enum usb_role role = usb_role_switch_get_role(port->usb_role_sw);
+
+	dev_dbg(&port->dev, "%s calling notifier for role %d\n", __func__,
+		role);
+
+	atomic_notifier_call_chain(&port->usb_phy.notifier, role,
+				   &port->usb_phy);
+}
+
 static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
 {
+	struct tegra_xusb_port *port = dev_get_drvdata(dev);
+
 	dev_dbg(dev, "%s calling notifier for role is %d\n", __func__, role);
 
+	schedule_work(&port->usb_phy_work);
+
+	return 0;
+}
+
+static int tegra_xusb_set_peripheral(struct usb_otg *otg,
+					struct usb_gadget *gadget)
+{
+	struct tegra_xusb_port *port = container_of(otg->usb_phy,
+					struct tegra_xusb_port, usb_phy);
+
+	if (gadget != NULL)
+		schedule_work(&port->usb_phy_work);
+
+	return 0;
+}
+
+static int tegra_xusb_set_host(struct usb_otg *otg, struct usb_bus *host)
+{
+	struct tegra_xusb_port *port = container_of(otg->usb_phy,
+					struct tegra_xusb_port, usb_phy);
+
+	if (host != NULL)
+		schedule_work(&port->usb_phy_work);
+
 	return 0;
 }
 
+
 static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 {
 	int err = 0;
+	struct tegra_xusb_lane *lane = tegra_xusb_find_lane(port->padctl,
+							"usb2", port->index);
 	struct usb_role_switch_desc role_sx_desc = {
 					.set = tegra_xusb_role_sw_set,
 					.fwnode = dev_fwnode(&port->dev),
@@ -578,6 +625,30 @@ static int tegra_xusb_setup_usb_role_switch(struct tegra_xusb_port *port)
 		if (err != EPROBE_DEFER)
 			dev_err(&port->dev, "Failed to register USB role SW: %d",
 				err);
+		return err;
+	}
+
+	INIT_WORK(&port->usb_phy_work, tegra_xusb_usb_phy_work);
+
+	port->usb_phy.otg = devm_kzalloc(&port->dev,
+					 sizeof(struct usb_otg), GFP_KERNEL);
+	if (!port->usb_phy.otg)
+		return -ENOMEM;
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
+		dev_err(&port->dev, "Failed to add usbphy: %d\n", err);
+		return err;
 	}
 
 	/* populate connector entry */
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
