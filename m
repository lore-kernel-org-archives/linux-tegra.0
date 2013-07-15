From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH v2 8/9] usb: phy: tegra: Use DT helpers for phy_type
Date: Mon, 15 Jul 2013 22:53:48 +0300
Message-ID: <1373918029-28977-9-git-send-email-ttynkkynen@nvidia.com>
References: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1373918029-28977-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, swarren@wwwdotorg.org, gregkh@linuxfoundation.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use the new of_usb_get_phy_mode helper function for parsing phy_type
from the device tree.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 0d48f4e..3ded872 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -31,6 +31,7 @@
 #include <linux/of_gpio.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/ulpi.h>
+#include <linux/usb/of.h>
 #include <asm/mach-types.h>
 #include <linux/usb/ehci_def.h>
 #include <linux/usb/tegra_usb_phy.h>
@@ -859,6 +860,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct tegra_usb_phy *tegra_phy = NULL;
 	struct device_node *np = pdev->dev.of_node;
+	enum usb_phy_interface phy_type;
 	int err;
 
 	tegra_phy = devm_kzalloc(&pdev->dev, sizeof(*tegra_phy), GFP_KERNEL);
@@ -883,12 +885,12 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	tegra_phy->is_legacy_phy =
 		of_property_read_bool(np, "nvidia,has-legacy-mode");
 
-	err = of_property_match_string(np, "phy_type", "ulpi");
-	if (err < 0) {
+	phy_type = of_usb_get_phy_mode(np);
+	if (phy_type == USBPHY_INTERFACE_MODE_UTMI) {
 		err = utmi_phy_probe(tegra_phy, pdev);
 		if (err < 0)
 			return err;
-	} else {
+	} else if (phy_type == USBPHY_INTERFACE_MODE_ULPI) {
 		tegra_phy->is_ulpi_phy = true;
 
 		tegra_phy->reset_gpio =
@@ -898,8 +900,10 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 				tegra_phy->reset_gpio);
 			return tegra_phy->reset_gpio;
 		}
-
 		tegra_phy->config = NULL;
+	} else {
+		dev_err(&pdev->dev, "phy_type is invalid or unsupported\n");
+		return -EINVAL;
 	}
 
 	err = of_property_match_string(np, "dr_mode", "otg");
-- 
1.8.1.5
