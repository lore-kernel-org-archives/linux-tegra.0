From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: [Patch V11 04/11] phy: tegra: xusb: Add vbus override support on Tegra186
Date: Fri, 18 Oct 2019 15:08:09 +0530
Message-ID: <1571391496-20834-5-git-send-email-nkristam@nvidia.com>
References: <1571391496-20834-1-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1571391496-20834-1-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@kernel.org, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Nagarjuna Kristam <nkristam@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra XUSB device control driver needs to control vbus override
during its operations, add API for the support.

Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 6f3afaf..84c2739 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -857,9 +857,32 @@ static void tegra186_xusb_padctl_remove(struct tegra_xusb_padctl *padctl)
 {
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
 static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.probe = tegra186_xusb_padctl_probe,
 	.remove = tegra186_xusb_padctl_remove,
+	.vbus_override = tegra186_xusb_padctl_vbus_override,
 };
 
 static const char * const tegra186_xusb_padctl_supply_names[] = {
-- 
2.7.4
