From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] regulator: pwm: Support for enable GPIO
Date: Thu, 23 Jun 2016 16:39:44 +0900
Message-ID: <20160623073945.11642-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add an optional enable GPIO to the pwm-regulator driver.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes since v1:
- Do not try to be smart and use the core enable GPIO as this introduces an
  incompatible behavior. Probe and manipulate the GPIO in pwm-regulator.
- Use standard enable-gpios name for GPIO property

 .../bindings/regulator/pwm-regulator.txt           |  7 +++++-
 drivers/regulator/pwm-regulator.c                  | 26 ++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
index ed936f0f34f2..dd6f59cf1455 100644
--- a/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/pwm-regulator.txt
@@ -38,13 +38,18 @@ NB: To be clear, if voltage-table is provided, then the device will be used
 in Voltage Table Mode.  If no voltage-table is provided, then the device will
 be used in Continuous Voltage Mode.
 
+Optional properties:
+--------------------
+- enable-gpios:		GPIO to use to enable/disable the regulator
+
 Any property defined as part of the core regulator binding can also be used.
 (See: ../regulator/regulator.txt)
 
-Continuous Voltage Example:
+Continuous Voltage With Enable GPIO Example:
 	pwm_regulator {
 		compatible = "pwm-regulator;
 		pwms = <&pwm1 0 8448 0>;
+		enable-gpios = <&gpio0 23 GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <1016000>;
 		regulator-max-microvolt = <1114000>;
 		regulator-name = "vdd_logic";
diff --git a/drivers/regulator/pwm-regulator.c b/drivers/regulator/pwm-regulator.c
index ab3cc0235843..90f8b7fd0437 100644
--- a/drivers/regulator/pwm-regulator.c
+++ b/drivers/regulator/pwm-regulator.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/pwm.h>
+#include <linux/gpio/consumer.h>
 
 struct pwm_regulator_data {
 	/*  Shared */
@@ -38,6 +39,9 @@ struct pwm_regulator_data {
 
 	/* Continuous voltage */
 	int volt_uV;
+
+	/* Enable GPIO */
+	struct gpio_desc *enb_gpio;
 };
 
 struct pwm_voltages {
@@ -94,6 +98,9 @@ static int pwm_regulator_enable(struct regulator_dev *dev)
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(dev);
 
+	if (drvdata->enb_gpio)
+		gpiod_set_value_cansleep(drvdata->enb_gpio, 1);
+
 	return pwm_enable(drvdata->pwm);
 }
 
@@ -103,6 +110,9 @@ static int pwm_regulator_disable(struct regulator_dev *dev)
 
 	pwm_disable(drvdata->pwm);
 
+	if (drvdata->enb_gpio)
+		gpiod_set_value_cansleep(drvdata->enb_gpio, 0);
+
 	return 0;
 }
 
@@ -110,6 +120,9 @@ static int pwm_regulator_is_enabled(struct regulator_dev *dev)
 {
 	struct pwm_regulator_data *drvdata = rdev_get_drvdata(dev);
 
+	if (drvdata->enb_gpio && !gpiod_get_value_cansleep(drvdata->enb_gpio))
+		return false;
+
 	return pwm_is_enabled(drvdata->pwm);
 }
 
@@ -248,6 +261,7 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *regulator;
 	struct regulator_config config = { };
 	struct device_node *np = pdev->dev.of_node;
+	enum gpiod_flags gpio_flags;
 	int ret;
 
 	if (!np) {
@@ -285,6 +299,18 @@ static int pwm_regulator_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (init_data->constraints.boot_on || init_data->constraints.always_on)
+		gpio_flags = GPIOD_OUT_HIGH;
+	else
+		gpio_flags = GPIOD_OUT_LOW;
+	drvdata->enb_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
+						    gpio_flags);
+	if (IS_ERR(drvdata->enb_gpio)) {
+		ret = PTR_ERR(drvdata->enb_gpio);
+		dev_err(&pdev->dev, "Failed to get enable GPIO: %d\n", ret);
+		return ret;
+	}
+
 	/*
 	 * FIXME: pwm_apply_args() should be removed when switching to the
 	 * atomic PWM API.
-- 
2.8.3
