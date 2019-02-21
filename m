From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 3/5] phy: tegra: xusb: Parse dual-role mode property
Date: Thu, 21 Feb 2019 16:46:32 +0100
Message-ID: <20190221154634.10684-4-thierry.reding@gmail.com>
References: <20190221154634.10684-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190221154634.10684-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The device tree bindings document the "mode" property of "ports"
subnodes, but the driver was not parsing the property. In preparation
for adding role switching, parse the property at probe time.

Based on work by JC Kuo <jckuo@nvidia.com>.

Reviewed-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb.c | 21 +++++++++++++++++++++
 drivers/phy/tegra/xusb.h |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index e3bc60cfe6a1..57a2d08ef6da 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -546,13 +546,34 @@ static void tegra_xusb_port_unregister(struct tegra_xusb_port *port)
 	device_unregister(&port->dev);
 }
 
+static const char *const modes[] = {
+	[USB_DR_MODE_UNKNOWN] = "",
+	[USB_DR_MODE_HOST] = "host",
+	[USB_DR_MODE_PERIPHERAL] = "peripheral",
+	[USB_DR_MODE_OTG] = "otg",
+};
+
 static int tegra_xusb_usb2_port_parse_dt(struct tegra_xusb_usb2_port *usb2)
 {
 	struct tegra_xusb_port *port = &usb2->base;
 	struct device_node *np = port->dev.of_node;
+	const char *mode;
 
 	usb2->internal = of_property_read_bool(np, "nvidia,internal");
 
+	if (!of_property_read_string(np, "mode", &mode)) {
+		int err = match_string(modes, ARRAY_SIZE(modes), mode);
+		if (err < 0) {
+			dev_err(&port->dev, "invalid value %s for \"mode\"\n",
+				mode);
+			usb2->mode = USB_DR_MODE_UNKNOWN;
+		} else {
+			usb2->mode = err;
+		}
+	} else {
+		usb2->mode = USB_DR_MODE_HOST;
+	}
+
 	usb2->supply = devm_regulator_get(&port->dev, "vbus");
 	return PTR_ERR_OR_ZERO(usb2->supply);
 }
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index b49dbc36efa3..bb60fc09c752 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -19,6 +19,8 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
+#include <linux/usb/otg.h>
+
 /* legacy entry points for backwards-compatibility */
 int tegra_xusb_padctl_legacy_probe(struct platform_device *pdev);
 int tegra_xusb_padctl_legacy_remove(struct platform_device *pdev);
@@ -271,6 +273,7 @@ struct tegra_xusb_usb2_port {
 	struct tegra_xusb_port base;
 
 	struct regulator *supply;
+	enum usb_dr_mode mode;
 	bool internal;
 };
 
-- 
2.20.1
