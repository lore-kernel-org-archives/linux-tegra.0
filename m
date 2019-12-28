From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 10/16] usb: phy: tegra: Use device-tree notion of reset-GPIO's active-state
Date: Sat, 28 Dec 2019 23:33:52 +0300
Message-ID: <20191228203358.23490-11-digetx@gmail.com>
References: <20191228203358.23490-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191228203358.23490-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It is much more intuitive if reset is treated as asserted when GPIO value
is set to 1. All NVIDIA Tegra device-trees are properly specifying active
state of the reset-GPIO since 2013, let's clean up that part of the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 58 ++++++++-----------------------
 include/linux/usb/tegra_usb_phy.h |  3 +-
 2 files changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 1ecd9f7900af..cc6cca4dcecb 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -306,14 +306,7 @@ static int utmip_pad_close(struct tegra_usb_phy *phy)
 
 static void ulpi_close(struct tegra_usb_phy *phy)
 {
-	int err;
-
-	err = gpio_direction_output(phy->reset_gpio, 0);
-	if (err) {
-		dev_err(phy->u_phy.dev,
-			"ULPI reset GPIO %d direction not asserted: %d\n",
-			phy->reset_gpio, err);
-	}
+	gpiod_set_value_cansleep(phy->reset_gpio, 1);
 }
 
 static int utmip_pad_power_on(struct tegra_usb_phy *phy)
@@ -703,12 +696,7 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 	u32 val;
 	int err;
 
-	err = gpio_direction_output(phy->reset_gpio, 0);
-	if (err) {
-		dev_err(phy->u_phy.dev, "GPIO %d not set to 0: %d\n",
-			phy->reset_gpio, err);
-		return err;
-	}
+	gpiod_set_value_cansleep(phy->reset_gpio, 1);
 
 	err = clk_prepare_enable(phy->clk);
 	if (err)
@@ -716,12 +704,7 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 
 	usleep_range(5000, 10000);
 
-	err = gpio_direction_output(phy->reset_gpio, 1);
-	if (err) {
-		dev_err(phy->u_phy.dev, "GPIO %d not set to 1: %d\n",
-			phy->reset_gpio, err);
-		goto disable_clk;
-	}
+	gpiod_set_value_cansleep(phy->reset_gpio, 0);
 
 	usleep_range(1000, 2000);
 
@@ -784,8 +767,9 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 {
 	clk_disable_unprepare(phy->clk);
+	gpiod_set_value_cansleep(phy->reset_gpio, 1);
 
-	return gpio_direction_output(phy->reset_gpio, 0);
+	return 0;
 }
 
 static void tegra_usb_phy_shutdown(struct usb_phy *u_phy)
@@ -837,15 +821,7 @@ static int tegra_usb_phy_set_suspend(struct usb_phy *u_phy, int suspend)
 
 static int ulpi_open(struct tegra_usb_phy *phy)
 {
-	int err;
-
-	err = gpio_direction_output(phy->reset_gpio, 0);
-	if (err) {
-		dev_err(phy->u_phy.dev,
-			"ULPI reset GPIO %d direction not deasserted: %d\n",
-			phy->reset_gpio, err);
-		return err;
-	}
+	gpiod_set_value_cansleep(phy->reset_gpio, 1);
 
 	return 0;
 }
@@ -1081,6 +1057,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	struct tegra_usb_phy *tegra_phy;
 	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
+	struct gpio_desc *gpiod;
 	struct resource *res;
 	struct usb_phy *phy;
 	int err;
@@ -1158,15 +1135,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	case USBPHY_INTERFACE_MODE_ULPI:
 		tegra_phy->is_ulpi_phy = true;
 
-		tegra_phy->reset_gpio =
-			of_get_named_gpio(np, "nvidia,phy-reset-gpio", 0);
-
-		if (!gpio_is_valid(tegra_phy->reset_gpio)) {
-			dev_err(&pdev->dev,
-				"Invalid GPIO: %d\n", tegra_phy->reset_gpio);
-			return tegra_phy->reset_gpio;
-		}
-
 		tegra_phy->clk = devm_clk_get(&pdev->dev, "ulpi-link");
 		err = PTR_ERR_OR_ZERO(tegra_phy->clk);
 		if (err) {
@@ -1175,13 +1143,17 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 			return err;
 		}
 
-		err = devm_gpio_request(&pdev->dev, tegra_phy->reset_gpio,
-					"ulpi_phy_reset_b");
+		gpiod = devm_gpiod_get_from_of_node(&pdev->dev, np,
+						    "nvidia,phy-reset-gpio",
+						    0, GPIOD_OUT_HIGH,
+						    "ulpi_phy_reset_b");
+		err = PTR_ERR_OR_ZERO(gpiod);
 		if (err) {
-			dev_err(&pdev->dev, "Request failed for GPIO %d: %d\n",
-				tegra_phy->reset_gpio, err);
+			dev_err(&pdev->dev,
+				"Request failed for reset GPIO: %d\n", err);
 			return err;
 		}
+		tegra_phy->reset_gpio = gpiod;
 
 		phy = devm_otg_ulpi_create(&pdev->dev,
 					   &ulpi_viewport_access_ops, 0);
diff --git a/include/linux/usb/tegra_usb_phy.h b/include/linux/usb/tegra_usb_phy.h
index 0c5c3ea8b2d7..6b857fe13b35 100644
--- a/include/linux/usb/tegra_usb_phy.h
+++ b/include/linux/usb/tegra_usb_phy.h
@@ -17,6 +17,7 @@
 #define __TEGRA_USB_PHY_H
 
 #include <linux/clk.h>
+#include <linux/gpio.h>
 #include <linux/reset.h>
 #include <linux/usb/otg.h>
 
@@ -76,7 +77,7 @@ struct tegra_usb_phy {
 	struct usb_phy u_phy;
 	bool is_legacy_phy;
 	bool is_ulpi_phy;
-	int reset_gpio;
+	struct gpio_desc *reset_gpio;
 	struct reset_control *pad_rst;
 };
 
-- 
2.24.0
