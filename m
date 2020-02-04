From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V4 05/19] phy: tegra: xusb: Add support to get companion USB 3 port
Date: Tue, 4 Feb 2020 16:46:51 +0530
Message-ID: <1580815025-10915-6-git-send-email-nkristam@nvidia.com>
References: <1580815025-10915-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1580815025-10915-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra XUSB host, device mode driver requires the USB 3 companion port
number for corresponding USB 2 port. Add API to retrieve the same.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
Reviewed-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
V4:
 - Addressed comment from Thierry.
 - Added Acked-by info.
---
V3:
 - Added Reviewed-by updates to commit message.
---
V2:
 - Added -ENODEV as return instead of -1, to sync other errors.
---
 drivers/phy/tegra/xusb.c       | 21 +++++++++++++++++++++
 include/linux/phy/tegra/xusb.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 2c0e29c..a8f0a0b 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1294,6 +1294,27 @@ int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_port_reset);
 
+int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
+				    unsigned int port)
+{
+	struct tegra_xusb_usb2_port *usb2;
+	struct tegra_xusb_usb3_port *usb3;
+	int i;
+
+	usb2 = tegra_xusb_find_usb2_port(padctl, port);
+	if (!usb2)
+		return -EINVAL;
+
+	for (i = 0; i < padctl->soc->ports.usb3.count; i++) {
+		usb3 = tegra_xusb_find_usb3_port(padctl, i);
+		if (usb3 && usb3->port == usb2->base.index)
+			return usb3->base.index;
+	}
+
+	return -ENODEV;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_get_usb3_companion);
+
 MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
 MODULE_DESCRIPTION("Tegra XUSB Pad Controller driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index 1235865..71d9569 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -21,4 +21,6 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
 					bool val);
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
+int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
+					 unsigned int port);
 #endif /* PHY_TEGRA_XUSB_H */
-- 
2.7.4
