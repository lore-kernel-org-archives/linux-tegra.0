From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 1/2] usb: phy: tegra: Cleanup error messages
Date: Mon, 11 Dec 2017 02:07:37 +0300
Message-ID: <ddf583790b551999ef063107be12a2d85e7b6a86.1512946782.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Tegra's PHY driver has a mix of pr_err() and dev_err(), let's switch to
dev_err() and use common errors message formatting across the driver for
consistency.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/usb/phy/phy-tegra-usb.c | 72 +++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index 7d5db625f800..019968a5d0ab 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -236,10 +236,14 @@ static void set_phcd(struct tegra_usb_phy *phy, bool enable)
 
 static int utmip_pad_open(struct tegra_usb_phy *phy)
 {
+	int err;
+
 	phy->pad_clk = devm_clk_get(phy->u_phy.dev, "utmi-pads");
 	if (IS_ERR(phy->pad_clk)) {
-		pr_err("%s: can't get utmip pad clock\n", __func__);
-		return PTR_ERR(phy->pad_clk);
+		err = PTR_ERR(phy->pad_clk);
+		dev_err(phy->u_phy.dev,
+			"Failed to get UTMIP pad clock: %d\n", err);
+		return err;
 	}
 
 	return 0;
@@ -282,7 +286,8 @@ static int utmip_pad_power_off(struct tegra_usb_phy *phy)
 	void __iomem *base = phy->pad_regs;
 
 	if (!utmip_pad_count) {
-		pr_err("%s: utmip pad already powered off\n", __func__);
+		dev_err(phy->u_phy.dev,
+			"%s: UTMIP pad already powered off\n", __func__);
 		return -EINVAL;
 	}
 
@@ -337,7 +342,8 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
 		set_phcd(phy, true);
 
 	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID, 0) < 0)
-		pr_err("%s: timeout waiting for phy to stabilize\n", __func__);
+		dev_err(phy->u_phy.dev,
+			"%s: Timeout waiting for PHY to stabilize\n", __func__);
 }
 
 static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
@@ -369,7 +375,8 @@ static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
 
 	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
 						     USB_PHY_CLK_VALID))
-		pr_err("%s: timeout waiting for phy to stabilize\n", __func__);
+		dev_err(phy->u_phy.dev,
+			"%s: Timeout waiting for PHY to stabilize\n", __func__);
 }
 
 static int utmi_phy_power_on(struct tegra_usb_phy *phy)
@@ -616,15 +623,15 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 
 	ret = gpio_direction_output(phy->reset_gpio, 0);
 	if (ret < 0) {
-		dev_err(phy->u_phy.dev, "gpio %d not set to 0\n",
-			phy->reset_gpio);
+		dev_err(phy->u_phy.dev, "%s: GPIO %d not set to 0: %d\n",
+			__func__, phy->reset_gpio, ret);
 		return ret;
 	}
 	msleep(5);
 	ret = gpio_direction_output(phy->reset_gpio, 1);
 	if (ret < 0) {
-		dev_err(phy->u_phy.dev, "gpio %d not set to 1\n",
-			phy->reset_gpio);
+		dev_err(phy->u_phy.dev, "%s: GPIO %d not set to 1: %d\n",
+			__func__, phy->reset_gpio, ret);
 		return ret;
 	}
 
@@ -660,13 +667,15 @@ static int ulpi_phy_power_on(struct tegra_usb_phy *phy)
 	/* Fix VbusInvalid due to floating VBUS */
 	ret = usb_phy_io_write(phy->ulpi, 0x40, 0x08);
 	if (ret) {
-		pr_err("%s: ulpi write failed\n", __func__);
+		dev_err(phy->u_phy.dev, "%s: ULPI write failed: %d\n",
+			__func__, ret);
 		return ret;
 	}
 
 	ret = usb_phy_io_write(phy->ulpi, 0x80, 0x0B);
 	if (ret) {
-		pr_err("%s: ulpi write failed\n", __func__);
+		dev_err(phy->u_phy.dev, "%s: ULPI write failed: %d\n",
+			__func__, ret);
 		return ret;
 	}
 
@@ -727,28 +736,30 @@ static int ulpi_open(struct tegra_usb_phy *phy)
 
 	phy->clk = devm_clk_get(phy->u_phy.dev, "ulpi-link");
 	if (IS_ERR(phy->clk)) {
-		pr_err("%s: can't get ulpi clock\n", __func__);
-		return PTR_ERR(phy->clk);
+		err = PTR_ERR(phy->clk);
+		dev_err(phy->u_phy.dev, "Failed to get ULPI clock: %d\n", err);
+		return err;
 	}
 
 	err = devm_gpio_request(phy->u_phy.dev, phy->reset_gpio,
 		"ulpi_phy_reset_b");
 	if (err < 0) {
-		dev_err(phy->u_phy.dev, "request failed for gpio: %d\n",
-		       phy->reset_gpio);
+		dev_err(phy->u_phy.dev, "Request failed for GPIO %d: %d\n",
+			phy->reset_gpio, err);
 		return err;
 	}
 
 	err = gpio_direction_output(phy->reset_gpio, 0);
 	if (err < 0) {
-		dev_err(phy->u_phy.dev, "gpio %d direction not set to output\n",
-		       phy->reset_gpio);
+		dev_err(phy->u_phy.dev,
+			"GPIO %d direction not set to output: %d\n",
+			phy->reset_gpio, err);
 		return err;
 	}
 
 	phy->ulpi = otg_ulpi_create(&ulpi_viewport_access_ops, 0);
 	if (!phy->ulpi) {
-		dev_err(phy->u_phy.dev, "otg_ulpi_create returned NULL\n");
+		dev_err(phy->u_phy.dev, "Failed to create ULPI OTG\n");
 		err = -ENOMEM;
 		return err;
 	}
@@ -765,8 +776,10 @@ static int tegra_usb_phy_init(struct tegra_usb_phy *phy)
 
 	phy->pll_u = devm_clk_get(phy->u_phy.dev, "pll_u");
 	if (IS_ERR(phy->pll_u)) {
-		pr_err("Can't get pll_u clock\n");
-		return PTR_ERR(phy->pll_u);
+		err = PTR_ERR(phy->pll_u);
+		dev_err(phy->u_phy.dev,
+			"Failed to get pll_u clock: %d\n", err);
+		return err;
 	}
 
 	err = clk_prepare_enable(phy->pll_u);
@@ -781,7 +794,8 @@ static int tegra_usb_phy_init(struct tegra_usb_phy *phy)
 		}
 	}
 	if (!phy->freq) {
-		pr_err("invalid pll_u parent rate %ld\n", parent_rate);
+		dev_err(phy->u_phy.dev, "Invalid pll_u parent rate %ld\n",
+			parent_rate);
 		err = -EINVAL;
 		goto fail;
 	}
@@ -790,7 +804,7 @@ static int tegra_usb_phy_init(struct tegra_usb_phy *phy)
 		err = regulator_enable(phy->vbus);
 		if (err) {
 			dev_err(phy->u_phy.dev,
-				"failed to enable usb vbus regulator: %d\n",
+				"Failed to enable USB VBUS regulator: %d\n",
 				err);
 			goto fail;
 		}
@@ -854,7 +868,8 @@ static int read_utmi_param(struct platform_device *pdev, const char *param,
 	int err = of_property_read_u32(pdev->dev.of_node, param, &value);
 	*dest = (u8)value;
 	if (err < 0)
-		dev_err(&pdev->dev, "Failed to read USB UTMI parameter %s: %d\n",
+		dev_err(&pdev->dev,
+			"Failed to read USB UTMI parameter %s: %d\n",
 			param, err);
 	return err;
 }
@@ -870,14 +885,14 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegra_phy,
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (!res) {
-		dev_err(&pdev->dev, "Failed to get UTMI Pad regs\n");
+		dev_err(&pdev->dev, "Failed to get UTMI pad regs\n");
 		return  -ENXIO;
 	}
 
 	tegra_phy->pad_regs = devm_ioremap(&pdev->dev, res->start,
 		resource_size(res));
 	if (!tegra_phy->pad_regs) {
-		dev_err(&pdev->dev, "Failed to remap UTMI Pad regs\n");
+		dev_err(&pdev->dev, "Failed to remap UTMI pad regs\n");
 		return -ENOMEM;
 	}
 
@@ -1019,15 +1034,16 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 		tegra_phy->reset_gpio =
 			of_get_named_gpio(np, "nvidia,phy-reset-gpio", 0);
 		if (!gpio_is_valid(tegra_phy->reset_gpio)) {
-			dev_err(&pdev->dev, "invalid gpio: %d\n",
-				tegra_phy->reset_gpio);
+			dev_err(&pdev->dev,
+				"Invalid GPIO: %d\n", tegra_phy->reset_gpio);
 			return tegra_phy->reset_gpio;
 		}
 		tegra_phy->config = NULL;
 		break;
 
 	default:
-		dev_err(&pdev->dev, "phy_type is invalid or unsupported\n");
+		dev_err(&pdev->dev, "phy_type %u is invalid or unsupported\n",
+			phy_type);
 		return -EINVAL;
 	}
 
-- 
2.15.1
