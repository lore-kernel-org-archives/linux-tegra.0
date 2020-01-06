From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 13/20] usb: phy: tegra: Use device-tree notion of reset-GPIO's active-state
Date: Mon,  6 Jan 2020 04:34:09 +0300
Message-ID: <20200106013416.9604-14-digetx@gmail.com>
References: <20200106013416.9604-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200106013416.9604-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

It is much more intuitive if reset is treated as asserted when GPIO value
is set to 1. All NVIDIA Tegra device-trees are properly specifying active
state of the reset-GPIO since 2013, let's clean up that part of the code.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c   | 70 +++++++------------------------
 include/linux/usb/tegra_usb_phy.h |  3 +-
 2 files changed, 18 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index f9acbab477cf..c431968d0433 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -693,12 +693,7 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
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
@@ -706,12 +701,7 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 
 	usleep_range(5000, 6000);
 
-	err = gpio_direction_output(phy->reset_gpio, 1);
-	if (err) {
-		dev_err(phy->u_phy.dev, "GPIO %d not set to 1: %d\n",
-			phy->reset_gpio, err);
-		goto disable_clk;
-	}
+	gpiod_set_value_cansleep(phy->reset_gpio, 0);
 
 	usleep_range(1000, 2000);
 
@@ -773,16 +763,8 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 
 static int ulpi_phy_power_off(struct tegra_usb_phy *phy)
 {
-	int err;
-
-	err = gpio_direction_output(phy->reset_gpio, 0);
-	if (err) {
-		dev_err(phy->u_phy.dev, "reset GPIO not asserted: %d\n", err);
-		return err;
-	}
-
+	gpiod_set_value_cansleep(phy->reset_gpio, 1);
 	usleep_range(5000, 6000);
-
 	clk_disable_unprepare(phy->clk);
 
 	return 0;
@@ -857,21 +839,6 @@ static int tegra_usb_phy_set_suspend(struct usb_phy *u_phy, int suspend)
 		return tegra_usb_phy_power_on(phy);
 }
 
-static int ulpi_open(struct tegra_usb_phy *phy)
-{
-	int err;
-
-	err = gpio_direction_output(phy->reset_gpio, 0);
-	if (err) {
-		dev_err(phy->u_phy.dev,
-			"ULPI reset GPIO %d direction not asserted: %d\n",
-			phy->reset_gpio, err);
-		return err;
-	}
-
-	return 0;
-}
-
 static int tegra_usb_phy_init(struct usb_phy *u_phy)
 {
 	struct tegra_usb_phy *phy = to_tegra_usb_phy(u_phy);
@@ -907,12 +874,11 @@ static int tegra_usb_phy_init(struct usb_phy *u_phy)
 		goto fail;
 	}
 
-	if (phy->is_ulpi_phy)
-		err = ulpi_open(phy);
-	else
+	if (!phy->is_ulpi_phy) {
 		err = utmip_pad_open(phy);
-	if (err)
-		goto fail;
+		if (err)
+			goto fail;
+	}
 
 	err = tegra_usb_phy_power_on(phy);
 	if (err)
@@ -1101,6 +1067,7 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	struct tegra_usb_phy *tegra_phy;
 	enum usb_phy_interface phy_type;
 	struct reset_control *reset;
+	struct gpio_desc *gpiod;
 	struct resource *res;
 	struct usb_phy *phy;
 	int err;
@@ -1178,15 +1145,6 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
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
@@ -1195,13 +1153,17 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
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
index 3ae73bdc6245..c29d1b4c9381 100644
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
 	bool powered_on;
 };
-- 
2.24.0
