From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 10/9] pinctrl: tegra-xusb: Support adjusted HS_CURR_LEVEL
Date: Fri, 22 Aug 2014 11:28:08 -0700
Message-ID: <1408732088-28010-1-git-send-email-abrestic@chromium.org>
References: <1408381705-3623-1-git-send-email-abrestic@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1408381705-3623-1-git-send-email-abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu-XCtybt49RKsYaV1qd6yewg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On some boards, e.g. Blaze, the fused per-UTMI pad HS_CURR_LEVEL value
must be adjusted before being applied.  Add support for a new pinconfig
property "nvidia,otg-hs-curr-level-offset" which will apply the specified
offset to the fused HS_CURR_LEVEL value.

Signed-off-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
On Blaze, the OTG pads should be configured like this:
...
	otgp0 {
		nvidia,lanes = "otg-0";
		nvidia,function = "xusb";
		nvidia,otg-hs-curr-level-offset = <4>;
	};
	otgp1 {
		nvidia,lanes = "otg-1";
		nvidia,function = "xusb";
	};
	otgp2 {
		nvidia,lanes = "otg-2";
		nvidia,function = "xusb";
		nvidia,otg-hs-curr-level-offset = <2>;
	};
...
It is otherwise compatible with the Venice2 XUSB/XHCI DT bits.
---
 .../pinctrl/nvidia,tegra124-xusb-padctl.txt        |  4 ++-
 drivers/pinctrl/pinctrl-tegra-xusb.c               | 36 +++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
index 606a5db..23df0bc 100644
--- a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-xusb-padctl.txt
@@ -69,6 +69,8 @@ Optional properties:
 - nvidia,hsic-tx-slew-n: HSIC TX SLEWN value.
 - nvidia,hsic-tx-slew-p: HSIC TX SLEWP value.
 - nvidia,hsic-auto-term: Enables HSIC AUTO_TERM. (0: no, 1: yes)
+- nvidia,otg-hs-curr-level-offset: Offset to be applied to the pad's fused
+  HS_CURR_LEVEL value.
 
 Note that not all of these properties are valid for all lanes. Lanes can be
 divided into three groups:
@@ -77,7 +79,7 @@ divided into three groups:
 
     Valid functions for this group are: "snps", "xusb", "uart", "rsvd".
 
-    None of the other properties apply to this group.
+    The nvidia,otg-hs-curr-level-offset property only applies.
 
   - ulpi-0, hsic-0, hsic-1:
 
diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinctrl-tegra-xusb.c
index 1091ce7..46ee0f1 100644
--- a/drivers/pinctrl/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
@@ -282,6 +282,7 @@ struct tegra_xusb_padctl {
 
 	struct tegra_xusb_usb3_port usb3_ports[TEGRA_XUSB_USB3_PHYS];
 	unsigned int utmi_enable;
+	unsigned int hs_curr_level_offset[TEGRA_XUSB_UTMI_PHYS];
 	struct regulator *vbus[TEGRA_XUSB_UTMI_PHYS];
 	struct regulator *vddio_hsic;
 };
@@ -298,6 +299,12 @@ static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
 	return readl(padctl->regs + offset);
 }
 
+static inline bool is_otg_lane(unsigned int lane)
+{
+	return lane >= TEGRA_XUSB_PADCTL_PIN_OTG_0 &&
+		lane <= TEGRA_XUSB_PADCTL_PIN_OTG_2;
+}
+
 static inline bool is_hsic_lane(unsigned int lane)
 {
 	return lane >= TEGRA_XUSB_PADCTL_PIN_HSIC_0 &&
@@ -349,6 +356,7 @@ enum tegra_xusb_padctl_param {
 	TEGRA_XUSB_PADCTL_HSIC_TX_RSLEWN,
 	TEGRA_XUSB_PADCTL_HSIC_TX_RSLEWP,
 	TEGRA_XUSB_PADCTL_HSIC_AUTO_TERM,
+	TEGRA_XUSB_PADCTL_OTG_HS_CURR_LEVEL_OFFSET,
 };
 
 static const struct tegra_xusb_padctl_property {
@@ -365,6 +373,8 @@ static const struct tegra_xusb_padctl_property {
 	{ "nvidia,hsic-tx-rslew-n", TEGRA_XUSB_PADCTL_HSIC_TX_RSLEWN },
 	{ "nvidia,hsic-tx-rslew-p", TEGRA_XUSB_PADCTL_HSIC_TX_RSLEWP },
 	{ "nvidia,hsic-auto-term", TEGRA_XUSB_PADCTL_HSIC_AUTO_TERM },
+	{ "nvidia,otg-hs-curr-level-offset",
+	  TEGRA_XUSB_PADCTL_OTG_HS_CURR_LEVEL_OFFSET },
 };
 
 #define TEGRA_XUSB_PADCTL_PACK(param, value) ((param) << 16 | (value))
@@ -678,6 +688,17 @@ static int tegra_xusb_padctl_pinconf_group_get(struct pinctrl_dev *pinctrl,
 			value = 0;
 		break;
 
+	case TEGRA_XUSB_PADCTL_OTG_HS_CURR_LEVEL_OFFSET:
+		if (!is_otg_lane(group)) {
+			dev_err(padctl->dev, "Pin %d is not an OTG pad\n",
+				group);
+			return -EINVAL;
+		}
+
+		port = group - TEGRA_XUSB_PADCTL_PIN_OTG_0;
+		value = padctl->hs_curr_level_offset[port];
+		break;
+
 	default:
 		dev_err(padctl->dev, "invalid configuration parameter: %04x\n",
 			param);
@@ -895,6 +916,18 @@ static int tegra_xusb_padctl_pinconf_group_set(struct pinctrl_dev *pinctrl,
 				      XUSB_PADCTL_HSIC_PADX_CTL1(port));
 			break;
 
+		case TEGRA_XUSB_PADCTL_OTG_HS_CURR_LEVEL_OFFSET:
+			if (!is_otg_lane(group)) {
+				dev_err(padctl->dev,
+					"Pin %d is not an OTG pad\n", group);
+				return -EINVAL;
+			}
+
+			port = group - TEGRA_XUSB_PADCTL_PIN_OTG_0;
+			value &= XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_MASK;
+			padctl->hs_curr_level_offset[port] = value;
+			break;
+
 		default:
 			dev_err(padctl->dev,
 				"invalid configuration parameter: %04x\n",
@@ -1485,7 +1518,8 @@ static int utmi_phy_power_on(struct phy *phy)
 		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD |
 		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD2 |
 		   XUSB_PADCTL_USB2_OTG_PAD_CTL0_PD_ZI);
-	value |= padctl->calib.hs_curr_level[port] <<
+	value |= (padctl->calib.hs_curr_level[port] +
+		  padctl->hs_curr_level_offset[port]) <<
 		XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_CURR_LEVEL_SHIFT;
 	value |= padctl->soc->hs_slew <<
 		XUSB_PADCTL_USB2_OTG_PAD_CTL0_HS_SLEW_SHIFT;
-- 
2.1.0.rc2.206.gedb03e5
