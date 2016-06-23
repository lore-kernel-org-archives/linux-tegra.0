From: Mark Brown <broonie@kernel.org>
Subject: Applied "regulator: pwm: Support for enable GPIO" to the regulator tree
Date: Thu, 23 Jun 2016 11:36:30 +0100
Message-ID: <E1bG1zq-0001lE-Kq@debutante>
References: <20160623073945.11642-1-acourbot@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160623073945.11642-1-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org

The patch

   regulator: pwm: Support for enable GPIO

has been applied to the regulator tree at

   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 27bfa8893b15a3fa22a593c90a48c8bcb1f9c75b Mon Sep 17 00:00:00 2001
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 23 Jun 2016 16:39:44 +0900
Subject: [PATCH] regulator: pwm: Support for enable GPIO

Add an optional enable GPIO to the pwm-regulator driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
2.8.1
