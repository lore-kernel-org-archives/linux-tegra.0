From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 2/7] phy: tegra: xusb: Add support for UTMI pad power control
Date: Mon, 20 Jul 2020 15:25:43 +0530
Message-ID: <1595238948-20531-3-git-send-email-nkristam@nvidia.com>
References: <1595238948-20531-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595238948-20531-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for UTMI pad power on and off API's via soc ops. These API
can be used by operations like charger detect to power on and off UTMI
pad if needed. Update powered_on flag in the pad power control API's.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V4-V5:
 - No changes
---
V3:
 - Added Acked-by updates to commit message.
---
V2:
 - Patch re-based.
---
 drivers/phy/tegra/xusb-tegra186.c | 51 ++++++++++++++++++---------------------
 drivers/phy/tegra/xusb.h          |  2 ++
 2 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 5d64f69..f862254 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -192,12 +192,8 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	u32 value;
 	int err;
 
-	mutex_lock(&padctl->lock);
-
-	if (priv->bias_pad_enable++ > 0) {
-		mutex_unlock(&padctl->lock);
+	if (priv->bias_pad_enable++ > 0)
 		return;
-	}
 
 	err = clk_prepare_enable(priv->usb2_trk_clk);
 	if (err < 0)
@@ -221,8 +217,6 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 	value &= ~USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
-
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
@@ -230,44 +224,29 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
 	struct tegra186_xusb_padctl *priv = to_tegra186_xusb_padctl(padctl);
 	u32 value;
 
-	mutex_lock(&padctl->lock);
-
-	if (WARN_ON(priv->bias_pad_enable == 0)) {
-		mutex_unlock(&padctl->lock);
+	if (WARN_ON(priv->bias_pad_enable == 0))
 		return;
-	}
 
-	if (--priv->bias_pad_enable > 0) {
-		mutex_unlock(&padctl->lock);
+	if (--priv->bias_pad_enable > 0)
 		return;
-	}
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 	value |= USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
 	clk_disable_unprepare(priv->usb2_trk_clk);
-
-	mutex_unlock(&padctl->lock);
 }
 
 static void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
-	struct tegra_xusb_usb2_port *port;
-	struct device *dev = padctl->dev;
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
 	unsigned int index = lane->index;
 	u32 value;
 
-	if (!phy)
-		return;
-
-	port = tegra_xusb_find_usb2_port(padctl, index);
-	if (!port) {
-		dev_err(dev, "no port found for USB2 lane %u\n", index);
+	if (!phy || usb2->powered_on)
 		return;
-	}
 
 	tegra186_utmi_bias_pad_power_on(padctl);
 
@@ -280,16 +259,19 @@ static void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 	value &= ~USB2_OTG_PD_DR;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+
+	usb2->powered_on = true;
 }
 
 static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
 	unsigned int index = lane->index;
 	u32 value;
 
-	if (!phy)
+	if (!phy || !usb2->powered_on)
 		return;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
@@ -303,6 +285,8 @@ static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 	udelay(2);
 
 	tegra186_utmi_bias_pad_power_off(padctl);
+
+	usb2->powered_on = false;
 }
 
 static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
@@ -413,6 +397,8 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
 		return -ENODEV;
 	}
 
+	mutex_lock(&padctl->lock);
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_PAD_MUX);
 	value &= ~(USB2_PORT_MASK << USB2_PORT_SHIFT(index));
 	value |= (PORT_XUSB << USB2_PORT_SHIFT(index));
@@ -464,14 +450,23 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
 
 	/* TODO: pad power saving */
 	tegra_phy_xusb_utmi_pad_power_on(phy);
+
+	mutex_unlock(&padctl->lock);
 	return 0;
 }
 
 static int tegra186_utmi_phy_power_off(struct phy *phy)
 {
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+
+	mutex_lock(&padctl->lock);
+
 	/* TODO: pad power saving */
 	tegra_phy_xusb_utmi_pad_power_down(phy);
 
+	mutex_unlock(&padctl->lock);
+
 	return 0;
 }
 
@@ -938,6 +933,8 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.probe = tegra186_xusb_padctl_probe,
 	.remove = tegra186_xusb_padctl_remove,
 	.vbus_override = tegra186_xusb_padctl_vbus_override,
+	.utmi_pad_power_on = tegra_phy_xusb_utmi_pad_power_on,
+	.utmi_pad_power_down = tegra_phy_xusb_utmi_pad_power_down,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ea35af7..6995fc4 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -396,6 +396,8 @@ struct tegra_xusb_padctl_ops {
 				    unsigned int index, bool enable);
 	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
 	int (*utmi_port_reset)(struct phy *phy);
+	void (*utmi_pad_power_on)(struct phy *phy);
+	void (*utmi_pad_power_down)(struct phy *phy);
 };
 
 struct tegra_xusb_padctl_soc {
-- 
2.7.4
