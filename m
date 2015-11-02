From: Martyn Welch <martyn.welch@collabora.co.uk>
Subject: [RFC 5/8] pinctrl: tegra-xusb: Support PHY subnodes
Date: Mon,  2 Nov 2015 11:55:20 +0000
Message-ID: <1446465323-9493-6-git-send-email-martyn.welch@collabora.co.uk>
References: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446465323-9493-1-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org
Cc: thierry.reding@gmail.com, swarren@wwwdotorg.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, abrestic@chromium.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/pinctrl/pinctrl-tegra-xusb.c | 492 ++++++++++++++++++++---------------
 include/soc/tegra/xusb.h             |   7 +
 2 files changed, 296 insertions(+), 203 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 2578220..f359b42 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -33,11 +33,6 @@
 #include "core.h"
 #include "pinctrl-utils.h"
 
-#define TEGRA_XUSB_UTMI_PHYS	3
-#define TEGRA_XUSB_USB3_PHYS	2
-#define TEGRA_XUSB_HSIC_PHYS	2
-#define TEGRA_XUSB_NUM_PHYS	9
-
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PADX_SHIFT(x) ((x) ? 15 : 0)
 #define FUSE_SKU_CALIB_HS_CURR_LEVEL_PAD_MASK 0x3f
 #define FUSE_SKU_CALIB_HS_IREF_CAP_SHIFT 13
@@ -254,13 +249,25 @@ struct tegra_xusb_fuse_calibration {
 	u32 hs_squelch_level;
 };
 
-struct tegra_xusb_usb3_port {
-	unsigned int lane;
+struct tegra_xusb_usb3_phy {
+	struct tegra_xusb_padctl *padctl;
 	bool context_saved;
-	u32 tap1_val;
-	u32 amp_val;
-	u32 ctle_z_val;
-	u32 ctle_g_val;
+	unsigned int index;
+	unsigned int lane;
+	unsigned int port;
+
+	u32 tap1;
+	u32 amp;
+	u32 ctle_z;
+	u32 ctle_g;
+};
+
+struct tegra_xusb_utmi_phy {
+	struct tegra_xusb_padctl *padctl;
+	unsigned int index;
+
+	unsigned int hs_curr_level_offset;
+	struct regulator *supply;
 };
 
 struct tegra_xusb_padctl {
@@ -284,10 +291,7 @@ struct tegra_xusb_padctl {
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox_chan;
 
-	struct tegra_xusb_usb3_port usb3_ports[TEGRA_XUSB_USB3_PHYS];
 	unsigned int utmi_enable;
-	unsigned int hs_curr_level_offset[TEGRA_XUSB_UTMI_PHYS];
-	struct regulator *vbus[TEGRA_XUSB_UTMI_PHYS];
 	struct regulator *vddio_hsic;
 };
 
@@ -337,19 +341,6 @@ static inline bool lane_is_pcie_or_sata(unsigned int lane)
 	return lane >= PIN_PCIE_0 && lane <= PIN_SATA_0;
 }
 
-static int lane_to_usb3_port(struct tegra_xusb_padctl *padctl,
-			     unsigned int lane)
-{
-	unsigned int i;
-
-	for (i = 0; i < TEGRA_XUSB_USB3_PHYS; i++) {
-		if (padctl->usb3_ports[i].lane == lane)
-			return i;
-	}
-
-	return -EINVAL;
-}
-
 static int tegra_xusb_padctl_get_groups_count(struct pinctrl_dev *pinctrl)
 {
 	struct tegra_xusb_padctl *padctl = pinctrl_dev_get_drvdata(pinctrl);
@@ -382,8 +373,6 @@ static int tegra_xusb_padctl_get_group_pins(struct pinctrl_dev *pinctrl,
 
 enum tegra_xusb_padctl_param {
 	TEGRA_XUSB_PADCTL_IDDQ,
-	TEGRA_XUSB_PADCTL_USB3_PORT,
-	TEGRA_XUSB_PADCTL_USB2_PORT,
 	TEGRA_XUSB_PADCTL_HSIC_STROBE_TRIM,
 	TEGRA_XUSB_PADCTL_HSIC_RX_STROBE_TRIM,
 	TEGRA_XUSB_PADCTL_HSIC_RX_DATA_TRIM,
@@ -400,8 +389,6 @@ static const struct tegra_xusb_padctl_property {
 	enum tegra_xusb_padctl_param param;
 } properties[] = {
 	{ "nvidia,iddq", TEGRA_XUSB_PADCTL_IDDQ },
-	{ "nvidia,usb3-port", TEGRA_XUSB_PADCTL_USB3_PORT },
-	{ "nvidia,usb2-port", TEGRA_XUSB_PADCTL_USB2_PORT },
 	{ "nvidia,hsic-strobe-trim", TEGRA_XUSB_PADCTL_HSIC_STROBE_TRIM },
 	{ "nvidia,hsic-rx-strobe-trim", TEGRA_XUSB_PADCTL_HSIC_RX_STROBE_TRIM },
 	{ "nvidia,hsic-rx-data-trim", TEGRA_XUSB_PADCTL_HSIC_RX_DATA_TRIM },
@@ -620,28 +607,6 @@ static int tegra_xusb_padctl_pinconf_group_get(struct pinctrl_dev *pinctrl,
 			value = 1;
 		break;
 
-	case TEGRA_XUSB_PADCTL_USB3_PORT:
-		value = lane_to_usb3_port(padctl, group);
-		if (value < 0) {
-			dev_err(padctl->dev,
-				"Pin %d not mapped to USB3 port\n", group);
-			return -EINVAL;
-		}
-		break;
-
-	case TEGRA_XUSB_PADCTL_USB2_PORT:
-		port = lane_to_usb3_port(padctl, group);
-		if (port < 0) {
-			dev_err(padctl->dev,
-				"Pin %d not mapped to USB3 port\n", group);
-			return -EINVAL;
-		}
-
-		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP) >>
-			XUSB_PADCTL_SS_PORT_MAP_PORTX_SHIFT(port);
-		value &= XUSB_PADCTL_SS_PORT_MAP_PORT_MASK;
-		break;
-
 	case TEGRA_XUSB_PADCTL_HSIC_STROBE_TRIM:
 		if (!lane_is_hsic(group)) {
 			dev_err(padctl->dev, "Pin %d not an HSIC\n", group);
@@ -744,10 +709,15 @@ static int tegra_xusb_padctl_pinconf_group_get(struct pinctrl_dev *pinctrl,
 			dev_err(padctl->dev, "Pin %d is not an OTG pad\n",
 				group);
 			return -EINVAL;
-		}
+		} else {
+			unsigned int index = group - PIN_OTG_0;
+			struct tegra_xusb_utmi_phy *utmi;
+			struct phy *phy;
 
-		port = group - PIN_OTG_0;
-		value = padctl->hs_curr_level_offset[port];
+			phy = padctl->phys[TEGRA_XUSB_PADCTL_UTMI_P0 + index];
+			utmi = phy_get_drvdata(phy);
+			value = utmi->hs_curr_level_offset;
+		}
 		break;
 
 	default:
@@ -795,50 +765,6 @@ static int tegra_xusb_padctl_pinconf_group_set(struct pinctrl_dev *pinctrl,
 			padctl_writel(padctl, regval, lane->offset);
 			break;
 
-		case TEGRA_XUSB_PADCTL_USB3_PORT:
-			if (value >= TEGRA_XUSB_USB3_PHYS) {
-				dev_err(padctl->dev, "Invalid USB3 port: %lu\n",
-					value);
-				return -EINVAL;
-			}
-			if (!lane_is_pcie_or_sata(group)) {
-				dev_err(padctl->dev,
-					"USB3 port not applicable for pin %d\n",
-					group);
-				return -EINVAL;
-			}
-
-			padctl->usb3_ports[value].lane = group;
-			break;
-
-		case TEGRA_XUSB_PADCTL_USB2_PORT:
-			if (value >= TEGRA_XUSB_UTMI_PHYS) {
-				dev_err(padctl->dev, "Invalid USB2 port: %lu\n",
-					value);
-				return -EINVAL;
-			}
-			if (!lane_is_pcie_or_sata(group)) {
-				dev_err(padctl->dev,
-					"USB2 port not applicable for pin %d\n",
-					group);
-				return -EINVAL;
-			}
-			port = lane_to_usb3_port(padctl, group);
-			if (port < 0) {
-				dev_err(padctl->dev,
-					"Pin %d not mapped to USB3 port\n",
-					group);
-				return -EINVAL;
-			}
-
-			regval = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
-			regval &= ~(XUSB_PADCTL_SS_PORT_MAP_PORT_MASK <<
-				    XUSB_PADCTL_SS_PORT_MAP_PORTX_SHIFT(port));
-			regval |= value <<
-				XUSB_PADCTL_SS_PORT_MAP_PORTX_SHIFT(port);
-			padctl_writel(padctl, regval, XUSB_PADCTL_SS_PORT_MAP);
-			break;
-
 		case TEGRA_XUSB_PADCTL_HSIC_STROBE_TRIM:
 			if (!lane_is_hsic(group)) {
 				dev_err(padctl->dev, "Pin %d not an HSIC\n",
@@ -988,11 +914,17 @@ static int tegra_xusb_padctl_pinconf_group_set(struct pinctrl_dev *pinctrl,
 				dev_err(padctl->dev,
 					"Pin %d is not an OTG pad\n", group);
 				return -EINVAL;
-			}
+			} else {
+				unsigned int index = group - PIN_OTG_0;
+				struct tegra_xusb_utmi_phy *utmi;
+				struct phy *phy;
+
+				phy = padctl->phys[TEGRA_XUSB_PADCTL_UTMI_P0 + index];
+				utmi = phy_get_drvdata(phy);
 
-			port = group - PIN_OTG_0;
-			value &= XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_MASK;
-			padctl->hs_curr_level_offset[port] = value;
+				value &= XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_MASK;
+				utmi->hs_curr_level_offset = value;
+			}
 			break;
 
 		default:
@@ -1281,36 +1213,46 @@ static const struct phy_ops sata_phy_ops = {
 	.owner = THIS_MODULE,
 };
 
-static int usb3_phy_to_port(struct phy *phy)
+static int usb3_phy_init(struct phy *phy)
 {
-	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
-	unsigned int i;
+	struct tegra_xusb_usb3_phy *usb = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = usb->padctl;
+	u32 value;
+	int err;
 
-	for (i = 0; i < TEGRA_XUSB_USB3_PHYS; i++) {
-		if (phy == padctl->phys[TEGRA_XUSB_PADCTL_USB3_P0 + i])
-			return i;
-	}
-	WARN_ON(1);
+	err = tegra_xusb_padctl_enable(padctl);
+	if (err < 0)
+		return err;
 
-	return -EINVAL;
+	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+	value &= ~(XUSB_PADCTL_SS_PORT_MAP_PORT_MASK <<
+		   XUSB_PADCTL_SS_PORT_MAP_PORTX_SHIFT(usb->index));
+	value |= usb->port <<
+		 XUSB_PADCTL_SS_PORT_MAP_PORTX_SHIFT(usb->index);
+	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
+
+	return 0;
 }
 
-static int usb3_phy_power_on(struct phy *phy)
+static int usb3_phy_exit(struct phy *phy)
 {
-	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
-	int port = usb3_phy_to_port(phy);
-	unsigned int lane;
-	u32 value, offset;
+	struct tegra_xusb_usb3_phy *usb = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = usb->padctl;
+	u32 value;
 
-	if (port < 0)
-		return port;
+	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+	value |= 0x7 << XUSB_PADCTL_SS_PORT_MAP_PORTX_SHIFT(usb->index);
+	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
 
-	lane = padctl->usb3_ports[port].lane;
-	if (!lane_is_pcie_or_sata(lane)) {
-		dev_err(padctl->dev, "USB3 PHY %d mapped to invalid lane: %d\n",
-			port, lane);
-		return -EINVAL;
-	}
+	return tegra_xusb_padctl_disable(padctl);
+}
+
+static int usb3_phy_power_on(struct phy *phy)
+{
+	struct tegra_xusb_usb3_phy *usb = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = usb->padctl;
+	unsigned int port = usb->index;
+	u32 value, offset;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(port));
 	value &= ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_WANDER_MASK <<
@@ -1325,34 +1267,34 @@ static int usb3_phy_power_on(struct phy *phy)
 		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_CDR_CNTL_SHIFT) |
 		 (padctl->soc->rx_eq <<
 		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_SHIFT);
-	if (padctl->usb3_ports[port].context_saved) {
+	if (usb->context_saved) {
 		value &= ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_MASK <<
 			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
 			   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_MASK <<
 			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT));
-		value |= (padctl->usb3_ports[port].ctle_g_val <<
+		value |= (usb->ctle_g <<
 			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
-			 (padctl->usb3_ports[port].ctle_z_val <<
+			 (usb->ctle_z <<
 			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT);
 	}
 	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(port));
 
 	value = padctl->soc->dfe_cntl;
-	if (padctl->usb3_ports[port].context_saved) {
+	if (usb->context_saved) {
 		value &= ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_MASK <<
 			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
 			   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_MASK <<
 			    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT));
-		value |= (padctl->usb3_ports[port].tap1_val <<
+		value |= (usb->tap1 <<
 			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
-			 (padctl->usb3_ports[port].amp_val <<
+			 (usb->amp <<
 			  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT);
 	}
 	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(port));
 
-	offset = (lane == PIN_SATA_0) ?
+	offset = (usb->lane == PIN_SATA_0) ?
 		XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL2 :
-		XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL2(lane - PIN_PCIE_0);
+		XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL2(usb->lane - PIN_PCIE_0);
 	value = padctl_readl(padctl, offset);
 	value &= ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_MASK <<
 		   XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_SHIFT);
@@ -1360,15 +1302,15 @@ static int usb3_phy_power_on(struct phy *phy)
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL2_SPARE_IN_SHIFT;
 	padctl_writel(padctl, value, offset);
 
-	offset = (lane == PIN_SATA_0) ?
+	offset = (usb->lane == PIN_SATA_0) ?
 		XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL5 :
-		XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL5(lane - PIN_PCIE_0);
+		XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL5(usb->lane - PIN_PCIE_0);
 	value = padctl_readl(padctl, offset);
 	value |= XUSB_PADCTL_IOPHY_MISC_PAD_CTL5_RX_QEYE_EN;
 	padctl_writel(padctl, value, offset);
 
 	/* Enable SATA PHY when SATA lane is used */
-	if (lane == PIN_SATA_0) {
+	if (usb->lane == PIN_SATA_0) {
 		value = padctl_readl(padctl, XUSB_PADCTL_IOPHY_PLL_S0_CTL1);
 		value &= ~(XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_MASK <<
 			   XUSB_PADCTL_IOPHY_PLL_S0_CTL1_PLL0_REFCLK_NDIV_SHIFT);
@@ -1399,7 +1341,7 @@ static int usb3_phy_power_on(struct phy *phy)
 	}
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
-	value &= ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_VCORE_DOWN(port);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(port);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
 
 	usleep_range(100, 200);
@@ -1408,10 +1350,8 @@ static int usb3_phy_power_on(struct phy *phy)
 	value &= ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(port);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
 
-	usleep_range(100, 200);
-
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
-	value &= ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN(port);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_VCORE_DOWN(port);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
 
 	return 0;
@@ -1419,13 +1359,11 @@ static int usb3_phy_power_on(struct phy *phy)
 
 static int usb3_phy_power_off(struct phy *phy)
 {
-	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
-	int port = usb3_phy_to_port(phy);
+	struct tegra_xusb_usb3_phy *usb = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = usb->padctl;
+	unsigned int port = usb->index;
 	u32 value;
 
-	if (port < 0)
-		return port;
-
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
 	value |= XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(port);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
@@ -1433,7 +1371,7 @@ static int usb3_phy_power_off(struct phy *phy)
 	usleep_range(100, 200);
 
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM);
-	value |= XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN(port);
+	value |= XUSB_PADCTL_ELPG_PROGRAM_SSPX_ELPG_CLAMP_EN_EARLY(port);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM);
 
 	usleep_range(250, 350);
@@ -1445,20 +1383,21 @@ static int usb3_phy_power_off(struct phy *phy)
 	return 0;
 }
 
-static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
-				 unsigned int port)
+static int tegra_xusb_usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
+					    unsigned int port)
 {
-	unsigned int lane = padctl->usb3_ports[port].lane;
+	struct tegra_xusb_usb3_phy *usb;
 	u32 value, offset;
 
 	if (port >= TEGRA_XUSB_USB3_PHYS)
 		return -EINVAL;
 
-	padctl->usb3_ports[port].context_saved = true;
+	usb = phy_get_drvdata(padctl->phys[TEGRA_XUSB_PADCTL_USB3_P0 + port]);
+	usb->context_saved = true;
 
-	offset = (lane == PIN_SATA_0) ?
+	offset = (usb->lane == PIN_SATA_0) ?
 		XUSB_PADCTL_IOPHY_MISC_PAD_S0_CTL6 :
-		XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL6(lane - PIN_PCIE_0);
+		XUSB_PADCTL_IOPHY_MISC_PAD_PX_CTL6(usb->lane - PIN_PCIE_0);
 
 	value = padctl_readl(padctl, offset);
 	value &= ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
@@ -1469,8 +1408,7 @@ static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
 
 	value = padctl_readl(padctl, offset) >>
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
-	padctl->usb3_ports[port].tap1_val = value &
-		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_TAP_MASK;
+	usb->tap1 = value & XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_TAP_MASK;
 
 	value = padctl_readl(padctl, offset);
 	value &= ~(XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SEL_MASK <<
@@ -1481,17 +1419,16 @@ static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
 
 	value = padctl_readl(padctl, offset) >>
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
-	padctl->usb3_ports[port].amp_val = value &
-		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_AMP_MASK;
+	usb->amp = value & XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_AMP_MASK;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(port));
 	value &= ~((XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_MASK <<
 		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
 		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_MASK <<
 		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT));
-	value |= (padctl->usb3_ports[port].tap1_val <<
+	value |= (usb->tap1 <<
 		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_TAP_SHIFT) |
-		 (padctl->usb3_ports[port].amp_val <<
+		 (usb->amp <<
 		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL4_DFE_CNTL_AMP_SHIFT);
 	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL4(port));
 
@@ -1511,7 +1448,7 @@ static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
 
 	value = padctl_readl(padctl, offset) >>
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
-	padctl->usb3_ports[port].ctle_g_val = value &
+	usb->ctle_g = value &
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_G_Z_MASK;
 
 	value = padctl_readl(padctl, offset);
@@ -1523,7 +1460,7 @@ static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
 
 	value = padctl_readl(padctl, offset) >>
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_SHIFT;
-	padctl->usb3_ports[port].ctle_z_val = value &
+	usb->ctle_z = value &
 		XUSB_PADCTL_IOPHY_MISC_PAD_CTL6_MISC_OUT_G_Z_MASK;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(port));
@@ -1531,9 +1468,9 @@ static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
 		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
 		   (XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_MASK <<
 		    XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT));
-	value |= (padctl->usb3_ports[port].ctle_g_val <<
+	value |= (usb->ctle_g <<
 		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_G_SHIFT) |
-		 (padctl->usb3_ports[port].ctle_z_val <<
+		 (usb->ctle_z <<
 		  XUSB_PADCTL_IOPHY_USB3_PAD_CTL2_RX_EQ_Z_SHIFT);
 	padctl_writel(padctl, value, XUSB_PADCTL_IOPHY_USB3_PADX_CTL2(port));
 
@@ -1541,36 +1478,34 @@ static int usb3_phy_save_context(struct tegra_xusb_padctl *padctl,
 }
 
 static const struct phy_ops usb3_phy_ops = {
-	.init = tegra_xusb_phy_init,
-	.exit = tegra_xusb_phy_exit,
+	.init = usb3_phy_init,
+	.exit = usb3_phy_exit,
 	.power_on = usb3_phy_power_on,
 	.power_off = usb3_phy_power_off,
 	.owner = THIS_MODULE,
 };
 
-static int utmi_phy_to_port(struct phy *phy)
+static int utmi_phy_init(struct phy *phy)
 {
-	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
-	unsigned int i;
+	struct tegra_xusb_utmi_phy *utmi = phy_get_drvdata(phy);
 
-	for (i = 0; i < TEGRA_XUSB_UTMI_PHYS; i++) {
-		if (phy == padctl->phys[TEGRA_XUSB_PADCTL_UTMI_P0 + i])
-			return i;
-	}
-	WARN_ON(1);
+	return tegra_xusb_padctl_enable(utmi->padctl);
+}
 
-	return -EINVAL;
+static int utmi_phy_exit(struct phy *phy)
+{
+	struct tegra_xusb_utmi_phy *utmi = phy_get_drvdata(phy);
+
+	return tegra_xusb_padctl_disable(utmi->padctl);
 }
 
 static int utmi_phy_power_on(struct phy *phy)
 {
-	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
-	int port = utmi_phy_to_port(phy);
-	int err;
+	struct tegra_xusb_utmi_phy *utmi = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = utmi->padctl;
+	unsigned int port = utmi->index;
 	u32 value;
-
-	if (port < 0)
-		return port;
+	int err;
 
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 	value &= ~((XUSB_PADCTL_USB2_BIAS_PAD_CTL0_HS_SQUELCH_LEVEL_MASK <<
@@ -1601,7 +1536,7 @@ static int utmi_phy_power_on(struct phy *phy)
 		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD2 |
 		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI);
 	value |= (padctl->calib.hs_curr_level[port] +
-		  padctl->hs_curr_level_offset[port]) <<
+		  utmi->hs_curr_level_offset) <<
 		XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_SHIFT;
 	value |= padctl->soc->hs_slew <<
 		XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_SHIFT;
@@ -1623,7 +1558,7 @@ static int utmi_phy_power_on(struct phy *phy)
 		  XUSB_PADCTL_USB2_OTG_PAD_CTL1_HS_IREF_CAP_SHIFT);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(port));
 
-	err = regulator_enable(padctl->vbus[port]);
+	err = regulator_enable(utmi->supply);
 	if (err)
 		return err;
 
@@ -1643,15 +1578,10 @@ out:
 
 static int utmi_phy_power_off(struct phy *phy)
 {
-	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
-	int port = utmi_phy_to_port(phy);
+	struct tegra_xusb_utmi_phy *utmi = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = utmi->padctl;
 	u32 value;
 
-	if (port < 0)
-		return port;
-
-	regulator_disable(padctl->vbus[port]);
-
 	mutex_lock(&padctl->lock);
 
 	if (WARN_ON(padctl->utmi_enable == 0))
@@ -1665,13 +1595,14 @@ static int utmi_phy_power_off(struct phy *phy)
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL0);
 
 out:
+	regulator_disable(utmi->supply);
 	mutex_unlock(&padctl->lock);
 	return 0;
 }
 
 static const struct phy_ops utmi_phy_ops = {
-	.init = tegra_xusb_phy_init,
-	.exit = tegra_xusb_phy_exit,
+	.init = utmi_phy_init,
+	.exit = utmi_phy_exit,
 	.power_on = utmi_phy_power_on,
 	.power_off = utmi_phy_power_off,
 	.owner = THIS_MODULE,
@@ -1775,7 +1706,7 @@ static void tegra_xusb_phy_mbox_work(struct work_struct *work)
 	switch (msg->cmd) {
 	case MBOX_CMD_SAVE_DFE_CTLE_CTX:
 		resp.data = msg->data;
-		if (usb3_phy_save_context(padctl, msg->data) < 0)
+		if (tegra_xusb_usb3_phy_save_context(padctl, msg->data) < 0)
 			resp.cmd = MBOX_CMD_NAK;
 		else
 			resp.cmd = MBOX_CMD_ACK;
@@ -2045,34 +1976,189 @@ static int tegra_xusb_read_fuse_calibration(struct tegra_xusb_padctl *padctl)
 	return 0;
 }
 
+static int tegra_xusb_padctl_find_pin_by_name(struct tegra_xusb_padctl *padctl,
+					      const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < padctl->soc->num_pins; i++) {
+		const struct pinctrl_pin_desc *pin = &padctl->soc->pins[i];
+
+		if (strcmp(pin->name, name) == 0)
+			return pin->number;
+	}
+
+	return -ENODEV;
+}
+
+static struct device_node *
+tegra_xusb_padctl_find_phy_node(struct tegra_xusb_padctl *padctl,
+				const char *type, unsigned int index)
+{
+	struct device_node *np;
+
+	np = of_find_node_by_name(padctl->dev->of_node, "phys");
+	if (np) {
+		struct device_node *of_node;
+		char *name;
+
+		name = kasprintf(GFP_KERNEL, "%s-%u", type, index);
+		of_node = of_find_node_by_name(np, name);
+		kfree(name);
+
+		of_node_put(np);
+		np = of_node;
+	}
+
+	return np;
+}
+
+static int tegra_xusb_usb3_phy_parse_dt(struct phy *phy)
+{
+	struct tegra_xusb_usb3_phy *usb = phy_get_drvdata(phy);
+	struct device_node *np = phy->dev.of_node;
+	const char *lane = NULL;
+	u32 value;
+	int err;
+
+	if (!np)
+		return 0;
+
+	/* only a single lane can be mapped to each USB3 port */
+	err = of_property_count_strings(np, "nvidia,lanes");
+	if (err < 0 && err != -EINVAL) {
+		dev_err(&phy->dev, "failed to get number of lanes: %d\n", err);
+		return err;
+	}
+
+	if (err > 1)
+		dev_warn(&phy->dev, "found %d lanes, expected 1\n", err);
+
+	err = of_property_read_string(np, "nvidia,lanes", &lane);
+	if (err < 0) {
+		dev_err(&phy->dev, "failed to read lanes: %d\n", err);
+		return err;
+	}
+
+	if (lane) {
+		err = tegra_xusb_padctl_find_pin_by_name(usb->padctl, lane);
+		if (err < 0) {
+			dev_err(&phy->dev, "unknown pin: %s\n", lane);
+			return err;
+		}
+
+		if (!lane_is_pcie_or_sata(err)) {
+			dev_err(&phy->dev,
+				"USB3 PHY %u mapped to invalid lane %s\n",
+				usb->index, lane);
+			return -EINVAL;
+		}
+
+		usb->lane = err;
+	}
+
+	err = of_property_read_u32_index(np, "nvidia,port", 0, &value);
+	if (err < 0) {
+		dev_err(&phy->dev, "failed to read port: %d\n", err);
+		return err;
+	}
+
+	usb->port = value;
+
+	return 0;
+}
+
+static struct phy *tegra_xusb_usb3_phy_create(struct tegra_xusb_padctl *padctl,
+					      unsigned int index)
+{
+	struct tegra_xusb_usb3_phy *usb;
+	struct device_node *np;
+	struct phy *phy;
+	int err;
+
+	/*
+	 * If there is no supplemental configuration in the device tree the
+	 * PHY is unusable. But it is valid to configure only a single PHY,
+	 * hence return NULL instead of an error to mark the PHY as not in
+	 * use. Similarly if the PHY is marked as disabled, don't register
+	 * it.
+	 */
+	np = tegra_xusb_padctl_find_phy_node(padctl, "usb3", index);
+	if (!np || !of_device_is_available(np))
+		return NULL;
+
+	phy = devm_phy_create(padctl->dev, np, &usb3_phy_ops);
+	if (IS_ERR(phy))
+		return phy;
+
+	usb = devm_kzalloc(&phy->dev, sizeof(*usb), GFP_KERNEL);
+	if (!usb)
+		return ERR_PTR(-ENOMEM);
+
+	phy_set_drvdata(phy, usb);
+	usb->padctl = padctl;
+	usb->index = index;
+
+	err = tegra_xusb_usb3_phy_parse_dt(phy);
+	if (err < 0)
+		return ERR_PTR(err);
+
+	return phy;
+}
+
+static struct phy *tegra_xusb_utmi_phy_create(struct tegra_xusb_padctl *padctl,
+					      unsigned int index)
+{
+	struct tegra_xusb_utmi_phy *utmi;
+	struct device_node *np;
+	struct phy *phy;
+
+	/*
+	 * UTMI PHYs don't require additional properties, but if the PHY is
+	 * marked as disabled there is no reason to register it.
+	 */
+	np = tegra_xusb_padctl_find_phy_node(padctl, "utmi", index);
+	if (np && !of_device_is_available(np))
+		return NULL;
+
+	phy = devm_phy_create(padctl->dev, np, &utmi_phy_ops);
+	if (IS_ERR(phy))
+		return ERR_CAST(phy);
+
+	utmi = devm_kzalloc(&phy->dev, sizeof(*utmi), GFP_KERNEL);
+	if (!utmi)
+		return ERR_PTR(-ENOMEM);
+
+	phy_set_drvdata(phy, utmi);
+	utmi->padctl = padctl;
+	utmi->index = index;
+
+	utmi->supply = devm_regulator_get(&phy->dev, "vbus");
+	if (IS_ERR(utmi->supply))
+		return ERR_CAST(utmi->supply);
+
+	return phy;
+}
+
 static int tegra_xusb_setup_usb(struct tegra_xusb_padctl *padctl)
 {
 	struct phy *phy;
 	unsigned int i;
 
 	for (i = 0; i < TEGRA_XUSB_USB3_PHYS; i++) {
-		phy = devm_phy_create(padctl->dev, NULL, &usb3_phy_ops);
+		phy = tegra_xusb_usb3_phy_create(padctl, i);
 		if (IS_ERR(phy))
 			return PTR_ERR(phy);
 
 		padctl->phys[TEGRA_XUSB_PADCTL_USB3_P0 + i] = phy;
-		phy_set_drvdata(phy, padctl);
 	}
 
 	for (i = 0; i < TEGRA_XUSB_UTMI_PHYS; i++) {
-		char reg_name[sizeof("vbus-N")];
-
-		sprintf(reg_name, "vbus-%d", i);
-		padctl->vbus[i] = devm_regulator_get(padctl->dev, reg_name);
-		if (IS_ERR(padctl->vbus[i]))
-			return PTR_ERR(padctl->vbus[i]);
-
-		phy = devm_phy_create(padctl->dev, NULL, &utmi_phy_ops);
+		phy = tegra_xusb_utmi_phy_create(padctl, i);
 		if (IS_ERR(phy))
 			return PTR_ERR(phy);
 
 		padctl->phys[TEGRA_XUSB_PADCTL_UTMI_P0 + i] = phy;
-		phy_set_drvdata(phy, padctl);
 	}
 
 	padctl->vddio_hsic = devm_regulator_get(padctl->dev, "vddio-hsic");
diff --git a/include/soc/tegra/xusb.h b/include/soc/tegra/xusb.h
index 5ce5e12..0136dc1 100644
--- a/include/soc/tegra/xusb.h
+++ b/include/soc/tegra/xusb.h
@@ -10,6 +10,13 @@
 #ifndef __SOC_TEGRA_XUSB_H__
 #define __SOC_TEGRA_XUSB_H__
 
+#define TEGRA_XUSB_USB3_PHYS 2
+#define TEGRA_XUSB_UTMI_PHYS 3
+#define TEGRA_XUSB_HSIC_PHYS 2
+#define TEGRA_XUSB_NUM_USB_PHYS (TEGRA_XUSB_USB3_PHYS + TEGRA_XUSB_UTMI_PHYS + \
+				 TEGRA_XUSB_HSIC_PHYS)
+#define TEGRA_XUSB_NUM_PHYS (TEGRA_XUSB_NUM_USB_PHYS + 2) /* + SATA & PCIe */
+
 /* Command requests from the firmware */
 enum tegra_xusb_mbox_cmd {
 	MBOX_CMD_MSG_ENABLED = 1,
-- 
2.1.4
