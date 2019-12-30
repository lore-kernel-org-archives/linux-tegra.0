From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 06/18] phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
Date: Mon, 30 Dec 2019 16:39:43 +0530
Message-ID: <1577704195-2535-7-git-send-email-nkristam@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add support for set_mode on USB 2 phy. This allow XUSB host/device mode
drivers to configure the hardware to corresponding modes.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2-V3:
 - No changes in this version
---
 drivers/phy/tegra/xusb-tegra210.c | 126 ++++++++++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 394913b..6610b1d7 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -236,6 +236,7 @@
 #define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT 18
 #define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK 0xf
 #define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING 8
+#define XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_GROUNDED 0
 
 struct tegra210_xusb_fuse_calibration {
 	u32 hs_curr_level[4];
@@ -935,6 +936,98 @@ static int tegra210_usb2_phy_exit(struct phy *phy)
 	return tegra210_xusb_padctl_disable(lane->pad->padctl);
 }
 
+static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
+					      bool status)
+{
+	u32 value;
+
+	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
+
+	if (status) {
+		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
+		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
+			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
+		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
+			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
+	} else {
+		value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
+	}
+
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
+
+	return 0;
+}
+
+static int tegra210_xusb_padctl_id_override(struct tegra_xusb_padctl *padctl,
+					    bool status)
+{
+	u32 value;
+
+	dev_dbg(padctl->dev, "%s id override\n", status ? "set" : "clear");
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
+
+	if (status) {
+		if (value & XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON) {
+			value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
+			padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
+			usleep_range(1000, 2000);
+
+			value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
+		}
+
+		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
+			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
+		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_GROUNDED <<
+			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
+	} else {
+		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
+			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
+		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
+			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
+	}
+
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
+
+	return 0;
+}
+
+static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
+				      int submode)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb2_port *port = tegra_xusb_find_usb2_port(padctl,
+								lane->index);
+	int err = 0;
+
+	mutex_lock(&padctl->lock);
+
+	dev_dbg(&port->base.dev, "%s: mode %d", __func__, mode);
+
+	if (mode == PHY_MODE_USB_OTG) {
+		if (submode == USB_ROLE_HOST) {
+			tegra210_xusb_padctl_id_override(padctl, true);
+
+			err = regulator_enable(port->supply);
+		} else if (submode == USB_ROLE_DEVICE) {
+			tegra210_xusb_padctl_vbus_override(padctl, true);
+		} else if (submode == USB_ROLE_NONE) {
+			if (regulator_is_enabled(port->supply))
+				regulator_disable(port->supply);
+
+			tegra210_xusb_padctl_id_override(padctl, false);
+			tegra210_xusb_padctl_vbus_override(padctl, false);
+		}
+	}
+
+	mutex_unlock(&padctl->lock);
+
+	return err;
+}
+
 static int tegra210_usb2_phy_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
@@ -1048,9 +1141,11 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 	padctl_writel(padctl, value,
 		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
 
-	err = regulator_enable(port->supply);
-	if (err)
-		return err;
+	if (port->supply && port->mode == USB_DR_MODE_HOST) {
+		err = regulator_enable(port->supply);
+		if (err)
+			return err;
+	}
 
 	mutex_lock(&padctl->lock);
 
@@ -1164,6 +1259,7 @@ static const struct phy_ops tegra210_usb2_phy_ops = {
 	.exit = tegra210_usb2_phy_exit,
 	.power_on = tegra210_usb2_phy_power_on,
 	.power_off = tegra210_usb2_phy_power_off,
+	.set_mode = tegra210_usb2_phy_set_mode,
 	.owner = THIS_MODULE,
 };
 
@@ -2023,30 +2119,6 @@ static const struct tegra_xusb_port_ops tegra210_usb3_port_ops = {
 	.map = tegra210_usb3_port_map,
 };
 
-static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
-					      bool status)
-{
-	u32 value;
-
-	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
-
-	value = padctl_readl(padctl, XUSB_PADCTL_USB2_VBUS_ID);
-
-	if (status) {
-		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
-		value &= ~(XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_MASK <<
-			   XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT);
-		value |= XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_FLOATING <<
-			 XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_SHIFT;
-	} else {
-		value &= ~XUSB_PADCTL_USB2_VBUS_ID_OVERRIDE_VBUS_ON;
-	}
-
-	padctl_writel(padctl, value, XUSB_PADCTL_USB2_VBUS_ID);
-
-	return 0;
-}
-
 static int tegra210_utmi_port_reset(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl;
-- 
2.7.4
