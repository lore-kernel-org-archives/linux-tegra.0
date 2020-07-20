From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 3/7] phy: tegra: xusb: Add USB2 pad power control support for Tegra210
Date: Mon, 20 Jul 2020 15:25:44 +0530
Message-ID: <1595238948-20531-4-git-send-email-nkristam@nvidia.com>
References: <1595238948-20531-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595238948-20531-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add USB2 pad power on and off API's for TEgra210 and provide its control
via soc ops. It can be used by operations like charger detect to power on
and off USB2 pad if needed.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V5:
 - Made tegra210_usb2_pad_power_on() and tegra210_usb2_pad_power_down() static.
---
V4:
 - No changes
---
V3:
 - Added Acked-by updates to commit message.
---
V2:
 - Patch re-based.
---
 drivers/phy/tegra/xusb-tegra210.c | 190 ++++++++++++++++++++++++++------------
 1 file changed, 133 insertions(+), 57 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 66bd461..2e5f71c 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -994,6 +994,128 @@ static int tegra210_xusb_padctl_id_override(struct tegra_xusb_padctl *padctl,
 	return 0;
 }
 
+static void tegra210_usb2_bias_pad_power_on(struct tegra_xusb_usb2_pad *pad)
+{
+	struct tegra_xusb_padctl *padctl = pad->base.padctl;
+	u32 value;
+
+	if (pad->enable++ > 0)
+		return;
+
+	dev_dbg(padctl->dev, "power on BIAS PAD & USB2 tracking\n");
+
+	if (clk_prepare_enable(pad->clk))
+		dev_warn(padctl->dev, "failed to enable BIAS PAD & USB2 tracking\n");
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK <<
+		    XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_SHIFT) |
+		   (XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_MASK <<
+		    XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_SHIFT));
+	value |= (XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_VAL <<
+		  XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_SHIFT) |
+		 (XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_VAL <<
+		  XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_SHIFT);
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
+	value &= ~XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
+
+	udelay(1);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+	value &= ~XUSB_PADCTL_USB2_BIAS_PAD_CTL1_PD_TRK;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+
+	udelay(50);
+}
+
+static void tegra210_usb2_bias_pad_power_off(struct tegra_xusb_usb2_pad *pad)
+{
+	struct tegra_xusb_padctl *padctl = pad->base.padctl;
+	u32 value;
+
+	if (WARN_ON(pad->enable == 0))
+		return;
+
+	if (--pad->enable > 0)
+		return;
+
+	dev_dbg(padctl->dev, "power off USB2 tracking\n");
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
+	value |= XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
+
+	clk_disable_unprepare(pad->clk);
+}
+
+/* must be called under padctl->lock */
+static void tegra210_usb2_pad_power_on(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
+	struct tegra_xusb_usb2_pad *pad = to_usb2_pad(lane->pad);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	u32 value;
+
+	if (!phy)
+		return;
+
+	if (usb2->powered_on)
+		return;
+
+	dev_info(padctl->dev, "power on UTMI pads %d\n", index);
+
+	tegra210_usb2_bias_pad_power_on(pad);
+
+	udelay(2);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+	value &= ~XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+	value &= ~XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+
+	usb2->powered_on = true;
+}
+
+/* must be called under padctl->lock */
+static void tegra210_usb2_pad_power_down(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
+	struct tegra_xusb_usb2_pad *pad = to_usb2_pad(lane->pad);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	unsigned int index = lane->index;
+	u32 value;
+
+	if (!phy)
+		return;
+
+	if (!usb2->powered_on)
+		return;
+
+	dev_info(padctl->dev, "power down UTMI pad %d\n", index);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+	value |= XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+	value |= XUSB_PADCTL_USB2_OTG_PAD_CTL1_PD_DR;
+	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+
+	udelay(2);
+
+	tegra210_usb2_bias_pad_power_off(pad);
+	usb2->powered_on = false;
+}
+
 static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
 				      int submode)
 {
@@ -1037,7 +1159,6 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
-	struct tegra_xusb_usb2_pad *pad = to_usb2_pad(lane->pad);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
 	struct tegra210_xusb_padctl *priv;
 	struct tegra_xusb_usb2_port *port;
@@ -1053,6 +1174,8 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	priv = to_tegra210_xusb_padctl(padctl);
 
+	mutex_lock(&padctl->lock);
+
 	if (port->usb3_port_fake != -1) {
 		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
 		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(
@@ -1148,62 +1271,21 @@ static int tegra210_usb2_phy_power_on(struct phy *phy)
 
 	if (port->supply && port->mode == USB_DR_MODE_HOST) {
 		err = regulator_enable(port->supply);
-		if (err)
+		if (err) {
+			mutex_unlock(&padctl->lock);
 			return err;
+		}
 	}
 
-	mutex_lock(&padctl->lock);
-
-	if (pad->enable > 0) {
-		pad->enable++;
-		mutex_unlock(&padctl->lock);
-		return 0;
-	}
-
-	err = clk_prepare_enable(pad->clk);
-	if (err)
-		goto disable_regulator;
+	tegra210_usb2_pad_power_on(phy);
 
-	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
-	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_MASK <<
-		    XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_SHIFT) |
-		   (XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_MASK <<
-		    XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_SHIFT));
-	value |= (XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_VAL <<
-		  XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_START_TIMER_SHIFT) |
-		 (XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_VAL <<
-		  XUSB_PADCTL_USB2_BIAS_PAD_CTL1_TRK_DONE_RESET_TIMER_SHIFT);
-	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
-	value &= ~XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
-	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
-
-	udelay(1);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
-	value &= ~XUSB_PADCTL_USB2_BIAS_PAD_CTL1_PD_TRK;
-	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
-
-	udelay(50);
-
-	clk_disable_unprepare(pad->clk);
-
-	pad->enable++;
 	mutex_unlock(&padctl->lock);
-
 	return 0;
-
-disable_regulator:
-	regulator_disable(port->supply);
-	mutex_unlock(&padctl->lock);
-	return err;
 }
 
 static int tegra210_usb2_phy_power_off(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
-	struct tegra_xusb_usb2_pad *pad = to_usb2_pad(lane->pad);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
 	struct tegra_xusb_usb2_port *port;
 	u32 value;
@@ -1217,6 +1299,8 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
 
 	mutex_lock(&padctl->lock);
 
+	tegra210_usb2_pad_power_down(phy);
+
 	if (port->usb3_port_fake != -1) {
 		value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
 		value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(
@@ -1243,18 +1327,8 @@ static int tegra210_usb2_phy_power_off(struct phy *phy)
 		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
 	}
 
-	if (WARN_ON(pad->enable == 0))
-		goto out;
-
-	if (--pad->enable > 0)
-		goto out;
-
-	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
-	value |= XUSB_PADCTL_USB2_BIAS_PAD_CTL0_PD;
-	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
-
-out:
 	regulator_disable(port->supply);
+
 	mutex_unlock(&padctl->lock);
 	return 0;
 }
@@ -2215,6 +2289,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.hsic_set_idle = tegra210_hsic_set_idle,
 	.vbus_override = tegra210_xusb_padctl_vbus_override,
 	.utmi_port_reset = tegra210_utmi_port_reset,
+	.utmi_pad_power_on = tegra210_usb2_pad_power_on,
+	.utmi_pad_power_down = tegra210_usb2_pad_power_down,
 };
 
 static const char * const tegra210_xusb_padctl_supply_names[] = {
-- 
2.7.4
