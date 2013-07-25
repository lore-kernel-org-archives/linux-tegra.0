From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 8/9] usb: phy: tegra: Use DT helpers for phy_type
Date: Thu, 25 Jul 2013 21:38:08 +0300
Message-ID: <1374777489-13093-9-git-send-email-ttynkkynen@nvidia.com>
References: <1374777489-13093-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374777489-13093-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use the new of_usb_get_phy_mode helper function for parsing phy_type
from the device tree.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index fb5bc8c..fb469f1 100644
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
@@ -860,6 +861,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct tegra_usb_phy *tegra_phy = NULL;
 	struct device_node *np = pdev->dev.of_node;
+	enum usb_phy_interface phy_type;
 	int err;
 
 	tegra_phy = devm_kzalloc(&pdev->dev, sizeof(*tegra_phy), GFP_KERNEL);
@@ -884,12 +886,12 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
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
@@ -899,8 +901,10 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
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
