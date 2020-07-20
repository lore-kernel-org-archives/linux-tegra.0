From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 4/7] phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
Date: Mon, 20 Jul 2020 15:25:45 +0530
Message-ID: <1595238948-20531-5-git-send-email-nkristam@nvidia.com>
References: <1595238948-20531-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595238948-20531-1-git-send-email-nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When USB charger is enabled, UTMI PAD needs to be protected according
to the direction and current level. Add support for the same on Tegra210
and Tegra186.

Signed-off-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V5:
 - No changes.
---
V4:
 - Added Acked-by updates to commit message.
---
V3:
 - Alligned function and its arguments.
 - Fixed other comments from Thierry.
---
V2:
 - Commit message coorected.
 - Patch re-based.
---
 drivers/phy/tegra/xusb-tegra186.c | 40 +++++++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb-tegra210.c | 32 +++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h          | 13 +++++++++++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index f862254..59b78a7 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -68,6 +68,13 @@
 #define   PORTX_SPEED_SUPPORT_MASK		(0x3)
 #define     PORT_SPEED_SUPPORT_GEN1		(0x0)
 
+#define USB2_BATTERY_CHRG_OTGPADX_CTL1(x)       (0x84 + (x) * 0x40)
+#define  PD_VREG                                (1 << 6)
+#define  VREG_LEV(x)                            (((x) & 0x3) << 7)
+#define  VREG_DIR(x)                            (((x) & 0x3) << 11)
+#define  VREG_DIR_IN                            VREG_DIR(1)
+#define  VREG_DIR_OUT                           VREG_DIR(2)
+
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
 #define  HS_CURR_LEVEL(x)			((x) & 0x3f)
 #define  TERM_SEL				BIT(25)
@@ -289,6 +296,37 @@ static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 	usb2->powered_on = false;
 }
 
+static void
+tegra186_xusb_padctl_utmi_pad_set_protection(struct tegra_xusb_port *port,
+					     int level,
+					     enum tegra_vbus_dir dir)
+{
+	u32 value;
+	struct tegra_xusb_padctl *padctl = port->padctl;
+	unsigned int index = port->index;
+
+	value = padctl_readl(padctl, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	if (level < 0) {
+		/* disable pad protection */
+		value |= PD_VREG;
+		value &= ~VREG_LEV(~0);
+		value &= ~VREG_DIR(~0);
+	} else {
+		if (dir == TEGRA_VBUS_SOURCE)
+			value |= VREG_DIR_OUT;
+		else if (dir == TEGRA_VBUS_SINK)
+			value |= VREG_DIR_IN;
+
+		value &= ~PD_VREG;
+		value &= ~VREG_DIR(~0);
+		value &= ~VREG_LEV(~0);
+		value |= VREG_LEV(level);
+	}
+
+	padctl_writel(padctl, value, USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+}
+
 static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
 					       bool status)
 {
@@ -935,6 +973,8 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.vbus_override = tegra186_xusb_padctl_vbus_override,
 	.utmi_pad_power_on = tegra_phy_xusb_utmi_pad_power_on,
 	.utmi_pad_power_down = tegra_phy_xusb_utmi_pad_power_down,
+	.utmi_pad_set_protection =
+			tegra186_xusb_padctl_utmi_pad_set_protection,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
index 2e5f71c..3aff284 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -74,6 +74,8 @@
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_MASK 0x3
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV_VAL 0x1
 #define XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18 (1 << 6)
+#define USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(x) (((x) & 0x3) << 7)
+#define USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(x) (((x) & 0x3) << 11)
 
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x) (0x088 + (x) * 0x40)
 #define XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI (1 << 29)
@@ -1116,6 +1118,34 @@ static void tegra210_usb2_pad_power_down(struct phy *phy)
 	usb2->powered_on = false;
 }
 
+static void
+tegra210_xusb_padctl_utmi_pad_set_protection(struct tegra_xusb_port *port,
+					     int level,
+					     enum tegra_vbus_dir dir)
+{
+	u32 value;
+	struct tegra_xusb_padctl *padctl = port->padctl;
+	unsigned int index = port->index;
+
+	value = padctl_readl(padctl,
+			     XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+
+	if (level < 0) {
+		/* disable pad protection */
+		value |= XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
+		value &= USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(~0);
+		value &= ~USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(~0);
+	} else {
+		value &= ~XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_FIX18;
+		value &= ~USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_DIR(~0);
+		value &= USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(~0);
+		value |= USB2_BATTERY_CHRG_OTGPAD_CTL1_VREG_LEV(level);
+	}
+
+	padctl_writel(padctl, value,
+		      XUSB_PADCTL_USB2_BATTERY_CHRG_OTGPADX_CTL1(index));
+}
+
 static int tegra210_usb2_phy_set_mode(struct phy *phy, enum phy_mode mode,
 				      int submode)
 {
@@ -2291,6 +2321,8 @@ static const struct tegra_xusb_padctl_ops tegra210_xusb_padctl_ops = {
 	.utmi_port_reset = tegra210_utmi_port_reset,
 	.utmi_pad_power_on = tegra210_usb2_pad_power_on,
 	.utmi_pad_power_down = tegra210_usb2_pad_power_down,
+	.utmi_pad_set_protection =
+			tegra210_xusb_padctl_utmi_pad_set_protection,
 };
 
 static const char * const tegra210_xusb_padctl_supply_names[] = {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 6995fc4..475bcc6 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -259,6 +259,17 @@ to_sata_pad(struct tegra_xusb_pad *pad)
  */
 struct tegra_xusb_port_ops;
 
+/*
+ * Tegra OTG port VBUS direction:
+ * default (based on port capability) or
+ * as source or sink
+ */
+enum tegra_vbus_dir {
+	TEGRA_VBUS_DEFAULT,
+	TEGRA_VBUS_SOURCE,
+	TEGRA_VBUS_SINK
+};
+
 struct tegra_xusb_port {
 	struct tegra_xusb_padctl *padctl;
 	struct tegra_xusb_lane *lane;
@@ -398,6 +409,8 @@ struct tegra_xusb_padctl_ops {
 	int (*utmi_port_reset)(struct phy *phy);
 	void (*utmi_pad_power_on)(struct phy *phy);
 	void (*utmi_pad_power_down)(struct phy *phy);
+	void (*utmi_pad_set_protection)(struct tegra_xusb_port *port,
+					int level, enum tegra_vbus_dir dir);
 };
 
 struct tegra_xusb_padctl_soc {
-- 
2.7.4
