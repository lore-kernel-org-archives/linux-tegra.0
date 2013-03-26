From: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V5 9/9] pwm_bl: Add mandatory backlight power regulator
Date: Mon, 25 Mar 2013 18:21:53 -0700
Message-ID: <1364260913-25490-10-git-send-email-achew@nvidia.com>
References: <1364260913-25490-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364260913-25490-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org
Cc: thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Many backlights need to be explicitly powered.  Typically, this is done
with a GPIO.  For flexibility, we generalize the power mechanism to a
regulator.

If a power regulator is not needed, then a dummy fixed regulator can be
given to the backlight driver.  If a GPIO is used to enable the backlight,
then a fixed regulator can be instantiated to control the GPIO.

The backlight power regulator can be specified in the device tree node
for the backlight, or can be done with legacy board setup code in the
usual way.

Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Peter Ujfalusi <peter.ujfalusi-l0cyMroinI0@public.gmane.org>
---
 .../bindings/video/backlight/pwm-backlight.txt     | 14 +++++
 drivers/video/backlight/pwm_bl.c                   | 59 ++++++++++++++++++----
 2 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
index 1e4fc72..cb2d46a 100644
--- a/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
+++ b/Documentation/devicetree/bindings/video/backlight/pwm-backlight.txt
@@ -10,6 +10,11 @@ Required properties:
       last value in the array represents a 100% duty cycle (brightest).
   - default-brightness-level: the default brightness level (index into the
       array defined by the "brightness-levels" property)
+  - power-supply: A phandle to the regulator device tree node. This
+      regulator will be turned on and off as the pwm is enabled and disabled.
+      Many backlights are enabled via a GPIO. In this case, we instantiate
+      a fixed regulator and give that to power-supply. If a regulator
+      is not needed, then provide a dummy fixed regulator.
 
 Optional properties:
   - pwm-names: a list of names for the PWM devices specified in the
@@ -19,10 +24,19 @@ Optional properties:
 
 Example:
 
+	bl_en: fixed-regulator {
+                compatible = "regulator-fixed";
+                regulator-name = "bl-en-supply";
+                regulator-boot-on;
+                gpio = <&some_gpio>;
+                enable-active-high;
+	};
+
 	backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm 0 5000000>;
 
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <6>;
+		power-supply = <&bl_en>;
 	};
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 1fea627..ddd66d0 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -20,10 +20,13 @@
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/slab.h>
+#include <linux/regulator/consumer.h>
 
 struct pwm_bl_data {
 	struct pwm_device	*pwm;
 	struct device		*dev;
+	bool			enabled;
+	struct regulator	*power_supply;
 	unsigned int		period;
 	unsigned int		lth_brightness;
 	unsigned int		*levels;
@@ -35,6 +38,42 @@ struct pwm_bl_data {
 	void			(*exit)(struct device *);
 };
 
+static void pwm_backlight_enable(struct backlight_device *bl)
+{
+	struct pwm_bl_data *pb = dev_get_drvdata(&bl->dev);
+	int ret;
+
+	/* Bail if we are already enabled. */
+	if (pb->enabled)
+		return;
+
+	pwm_enable(pb->pwm);
+
+	ret = regulator_enable(pb->power_supply);
+	if (ret)
+		dev_warn(&bl->dev, "Failed to enable regulator: %d", ret);
+
+	pb->enabled = true;
+}
+
+static void pwm_backlight_disable(struct backlight_device *bl)
+{
+	struct pwm_bl_data *pb = dev_get_drvdata(&bl->dev);
+	int ret;
+
+	/* Bail if we are already disabled. */
+	if (!pb->enabled)
+		return;
+
+	ret = regulator_disable(pb->power_supply);
+	if (ret)
+		dev_warn(&bl->dev, "Failed to disable regulator: %d", ret);
+
+	pwm_disable(pb->pwm);
+
+	pb->enabled = false;
+}
+
 static int pwm_backlight_update_status(struct backlight_device *bl)
 {
 	struct pwm_bl_data *pb = bl_get_data(bl);
@@ -51,7 +90,7 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 
 	if (brightness == 0) {
 		pwm_config(pb->pwm, 0, pb->period);
-		pwm_disable(pb->pwm);
+		pwm_backlight_disable(bl);
 	} else {
 		int duty_cycle;
 
@@ -65,7 +104,7 @@ static int pwm_backlight_update_status(struct backlight_device *bl)
 		duty_cycle = pb->lth_brightness +
 		     (duty_cycle * (pb->period - pb->lth_brightness) / max);
 		pwm_config(pb->pwm, duty_cycle, pb->period);
-		pwm_enable(pb->pwm);
+		pwm_backlight_enable(bl);
 	}
 
 	if (pb->notify_after)
@@ -138,12 +177,6 @@ static int pwm_backlight_parse_dt(struct device *dev,
 		data->max_brightness--;
 	}
 
-	/*
-	 * TODO: Most users of this driver use a number of GPIOs to control
-	 *       backlight power. Support for specifying these needs to be
-	 *       added.
-	 */
-
 	return 0;
 }
 
@@ -206,6 +239,12 @@ static int pwm_backlight_probe(struct platform_device *pdev)
 	pb->exit = data->exit;
 	pb->dev = &pdev->dev;
 
+	pb->power_supply = devm_regulator_get(&pdev->dev, "power");
+	if (IS_ERR(pb->power_supply)) {
+		ret = PTR_ERR(pb->power_supply);
+		goto err_alloc;
+	}
+
 	pb->pwm = devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(pb->pwm)) {
 		dev_err(&pdev->dev, "unable to request PWM, trying legacy API\n");
@@ -268,7 +307,7 @@ static int pwm_backlight_remove(struct platform_device *pdev)
 
 	backlight_device_unregister(bl);
 	pwm_config(pb->pwm, 0, pb->period);
-	pwm_disable(pb->pwm);
+	pwm_backlight_disable(bl);
 	if (pb->exit)
 		pb->exit(&pdev->dev);
 	return 0;
@@ -283,7 +322,7 @@ static int pwm_backlight_suspend(struct device *dev)
 	if (pb->notify)
 		pb->notify(pb->dev, 0);
 	pwm_config(pb->pwm, 0, pb->period);
-	pwm_disable(pb->pwm);
+	pwm_backlight_disable(bl);
 	if (pb->notify_after)
 		pb->notify_after(pb->dev, 0);
 	return 0;
-- 
1.8.1.5
