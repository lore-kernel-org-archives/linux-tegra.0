From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V3 07/18] phy: tegra: xusb: Add set_mode support for utmi phy on Tegra186
Date: Mon, 30 Dec 2019 16:39:44 +0530
Message-ID: <1577704195-2535-8-git-send-email-nkristam@nvidia.com>
References: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1577704195-2535-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add support for set_mode on utmi phy. This allow XUSB host/device mode
drivers to configure the hardware to corresponding modes.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
V2-V3:
 - No changes in this version
---
 drivers/phy/tegra/xusb-tegra186.c | 109 ++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 22 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 84c2739..9a45160 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -301,6 +301,92 @@ static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 	tegra186_utmi_bias_pad_power_off(padctl);
 }
 
+static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
+					       bool status)
+{
+	u32 value;
+
+	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
+
+	value = padctl_readl(padctl, USB2_VBUS_ID);
+
+	if (status) {
+		value |= VBUS_OVERRIDE;
+		value &= ~ID_OVERRIDE(~0);
+		value |= ID_OVERRIDE_FLOATING;
+	} else {
+		value &= ~VBUS_OVERRIDE;
+	}
+
+	padctl_writel(padctl, value, USB2_VBUS_ID);
+
+	return 0;
+}
+
+static int tegra186_xusb_padctl_id_override(struct tegra_xusb_padctl *padctl,
+					    bool status)
+{
+	u32 value;
+
+	dev_dbg(padctl->dev, "%s id override\n", status ? "set" : "clear");
+
+	value = padctl_readl(padctl, USB2_VBUS_ID);
+
+	if (status) {
+		if (value & VBUS_OVERRIDE) {
+			value &= ~VBUS_OVERRIDE;
+			padctl_writel(padctl, value, USB2_VBUS_ID);
+			usleep_range(1000, 2000);
+
+			value = padctl_readl(padctl, USB2_VBUS_ID);
+		}
+
+		value &= ~ID_OVERRIDE(~0);
+		value |= ID_OVERRIDE_GROUNDED;
+	} else {
+		value &= ~ID_OVERRIDE(~0);
+		value |= ID_OVERRIDE_FLOATING;
+	}
+
+	padctl_writel(padctl, value, USB2_VBUS_ID);
+
+	return 0;
+}
+
+static int tegra186_utmi_phy_set_mode(struct phy *phy, enum phy_mode mode,
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
+			tegra186_xusb_padctl_id_override(padctl, true);
+
+			err = regulator_enable(port->supply);
+		} else if (submode == USB_ROLE_DEVICE) {
+			tegra186_xusb_padctl_vbus_override(padctl, true);
+		} else if (submode == USB_ROLE_NONE) {
+			if (regulator_is_enabled(port->supply))
+				regulator_disable(port->supply);
+
+			tegra186_xusb_padctl_id_override(padctl, false);
+			tegra186_xusb_padctl_vbus_override(padctl, false);
+		}
+	}
+
+	mutex_unlock(&padctl->lock);
+
+	return err;
+}
+
 static int tegra186_utmi_phy_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
@@ -439,6 +525,7 @@ static const struct phy_ops utmi_phy_ops = {
 	.exit = tegra186_utmi_phy_exit,
 	.power_on = tegra186_utmi_phy_power_on,
 	.power_off = tegra186_utmi_phy_power_off,
+	.set_mode = tegra186_utmi_phy_set_mode,
 	.owner = THIS_MODULE,
 };
 
@@ -857,28 +944,6 @@ static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
 {
 }
 
-static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
-					       bool status)
-{
-	u32 value;
-
-	dev_dbg(padctl->dev, "%s vbus override\n", status ? "set" : "clear");
-
-	value = padctl_readl(padctl, USB2_VBUS_ID);
-
-	if (status) {
-		value |= VBUS_OVERRIDE;
-		value &= ~ID_OVERRIDE(~0);
-		value |= ID_OVERRIDE_FLOATING;
-	} else {
-		value &= ~VBUS_OVERRIDE;
-	}
-
-	padctl_writel(padctl, value, USB2_VBUS_ID);
-
-	return 0;
-}
-
 static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.probe = tegra186_xusb_padctl_probe,
 	.remove = tegra186_xusb_padctl_remove,
-- 
2.7.4
