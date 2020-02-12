From: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v6 2/5] phy: tegra: xusb: Add Tegra194 support
Date: Wed, 12 Feb 2020 14:11:30 +0800
Message-ID: <20200212061133.11665-3-jckuo@nvidia.com>
References: <20200212061133.11665-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200212061133.11665-1-jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add support for the XUSB pad controller found on Tegra194 SoCs. It is
mostly similar to the same IP found on Tegra186, but the number of
pads exposed differs, as do the programming sequences. Because most of
the Tegra194 XUSB PADCTL registers definition and programming sequence
are the same as Tegra186, Tegra194 XUSB PADCTL can share the same
driver, xusb-tegra186.c, with Tegra186 XUSB PADCTL.

Tegra194 XUSB PADCTL supports up to USB 3.1 Gen 2 speed, however, it
is possible for some platforms have long signal trace that could not
provide sufficient electrical environment for Gen 2 speed. This patch
adds a "maximum-speed" property to usb3 ports which can be used to
specify the maximum supported speed for any particular USB 3.1 port.
For a port that is not capable of SuperSpeedPlus, "maximum-speed"
property should carry "super-speed".

Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v6: none
Changes in v5:
- re-use "maximum-speed" instead of adding "nvidia,disable-gen2"
Changes in v4: none
Changes in v3: none
Changes in v2:
- removed unnecessary #if/#endif pairs
- introduce new soc->supports_gen2 flag which indicate whether or not
  a soc supports USB 3.1 Gen 2 speed

 drivers/phy/tegra/Makefile        |  1 +
 drivers/phy/tegra/xusb-tegra186.c | 73 +++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.c          | 17 +++++++
 drivers/phy/tegra/xusb.h          |  5 +++
 4 files changed, 96 insertions(+)

diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index 320dd389f34d..89b84067cb4c 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -6,4 +6,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_124_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
+phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 01f7d979c9a8..f16016dcd260 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -63,6 +63,10 @@
 #define  SSPX_ELPG_CLAMP_EN(x)			BIT(0 + (x) * 3)
 #define  SSPX_ELPG_CLAMP_EN_EARLY(x)		BIT(1 + (x) * 3)
 #define  SSPX_ELPG_VCORE_DOWN(x)		BIT(2 + (x) * 3)
+#define XUSB_PADCTL_SS_PORT_CFG			0x2c
+#define   PORTX_SPEED_SUPPORT_SHIFT(x)		((x) * 4)
+#define   PORTX_SPEED_SUPPORT_MASK		(0x3)
+#define     PORT_SPEED_SUPPORT_GEN1		(0x0)
 
 #define XUSB_PADCTL_USB2_OTG_PADX_CTL0(x)	(0x88 + (x) * 0x40)
 #define  HS_CURR_LEVEL(x)			((x) & 0x3f)
@@ -622,6 +626,15 @@ static int tegra186_usb3_phy_power_on(struct phy *phy)
 
 	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_CAP);
 
+	if (padctl->soc->supports_gen2 && port->disable_gen2) {
+		value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_CFG);
+		value &= ~(PORTX_SPEED_SUPPORT_MASK <<
+			PORTX_SPEED_SUPPORT_SHIFT(index));
+		value |= (PORT_SPEED_SUPPORT_GEN1 <<
+			PORTX_SPEED_SUPPORT_SHIFT(index));
+		padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_CFG);
+	}
+
 	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM_1);
 	value &= ~SSPX_ELPG_VCORE_DOWN(index);
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM_1);
@@ -919,6 +932,66 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
 
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+static const char * const tegra194_xusb_padctl_supply_names[] = {
+	"avdd-usb",
+	"vclamp-usb",
+};
+
+static const struct tegra_xusb_lane_soc tegra194_usb2_lanes[] = {
+	TEGRA186_LANE("usb2-0", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-1", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-2", 0,  0, 0, usb2),
+	TEGRA186_LANE("usb2-3", 0,  0, 0, usb2),
+};
+
+static const struct tegra_xusb_pad_soc tegra194_usb2_pad = {
+	.name = "usb2",
+	.num_lanes = ARRAY_SIZE(tegra194_usb2_lanes),
+	.lanes = tegra194_usb2_lanes,
+	.ops = &tegra186_usb2_pad_ops,
+};
+
+static const struct tegra_xusb_lane_soc tegra194_usb3_lanes[] = {
+	TEGRA186_LANE("usb3-0", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-1", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-2", 0,  0, 0, usb3),
+	TEGRA186_LANE("usb3-3", 0,  0, 0, usb3),
+};
+
+static const struct tegra_xusb_pad_soc tegra194_usb3_pad = {
+	.name = "usb3",
+	.num_lanes = ARRAY_SIZE(tegra194_usb3_lanes),
+	.lanes = tegra194_usb3_lanes,
+	.ops = &tegra186_usb3_pad_ops,
+};
+
+static const struct tegra_xusb_pad_soc * const tegra194_pads[] = {
+	&tegra194_usb2_pad,
+	&tegra194_usb3_pad,
+};
+
+const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra194_pads),
+	.pads = tegra194_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 4,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 4,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+};
+EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
+#endif
+
 MODULE_AUTHOR("JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB Pad Controller driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index f98ec3922c02..90b8fb187cf4 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -65,6 +65,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.compatible = "nvidia,tegra186-xusb-padctl",
 		.data = &tegra186_xusb_padctl_soc,
 	},
+#endif
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
+	{
+		.compatible = "nvidia,tegra194-xusb-padctl",
+		.data = &tegra194_xusb_padctl_soc,
+	},
 #endif
 	{ }
 };
@@ -726,6 +732,7 @@ static int tegra_xusb_usb3_port_parse_dt(struct tegra_xusb_usb3_port *usb3)
 {
 	struct tegra_xusb_port *port = &usb3->base;
 	struct device_node *np = port->dev.of_node;
+	enum usb_device_speed maximum_speed;
 	u32 value;
 	int err;
 
@@ -739,6 +746,16 @@ static int tegra_xusb_usb3_port_parse_dt(struct tegra_xusb_usb3_port *usb3)
 
 	usb3->internal = of_property_read_bool(np, "nvidia,internal");
 
+	if (device_property_present(&port->dev, "maximum-speed")) {
+		maximum_speed =  usb_get_maximum_speed(&port->dev);
+		if (maximum_speed == USB_SPEED_SUPER)
+			usb3->disable_gen2 = true;
+		else if (maximum_speed == USB_SPEED_SUPER_PLUS)
+			usb3->disable_gen2 = false;
+		else
+			return -EINVAL;
+	}
+
 	usb3->supply = devm_regulator_get(&port->dev, "vbus");
 	return PTR_ERR_OR_ZERO(usb3->supply);
 }
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index da94fcce6307..e2152d4f1dbf 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -333,6 +333,7 @@ struct tegra_xusb_usb3_port {
 	bool context_saved;
 	unsigned int port;
 	bool internal;
+	bool disable_gen2;
 
 	u32 tap1;
 	u32 amp;
@@ -392,6 +393,7 @@ struct tegra_xusb_padctl_soc {
 
 	const char * const *supply_names;
 	unsigned int num_supplies;
+	bool supports_gen2;
 	bool need_fake_usb3_port;
 };
 
@@ -448,5 +450,8 @@ extern const struct tegra_xusb_padctl_soc tegra210_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
 extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_194_SOC)
+extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
+#endif
 
 #endif /* __PHY_TEGRA_XUSB_H */
-- 
2.17.1
