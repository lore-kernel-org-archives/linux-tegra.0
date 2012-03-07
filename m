From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V1] i2c: gpio: Use open drain support from gpio driver
Date: Wed,  7 Mar 2012 19:08:14 +0530
Message-ID: <1331127494-6913-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The gpio core driver (gpio library) supports the open
drain pin handling. Therefore, it is not require it
to handle in the i2c-gpio driver, just require
to pass the OPEN_DRAIN type flag when requesting the gpio.

Remove the handling of open drain pin in the i2c-gpio driver.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/i2c/busses/i2c-gpio.c |   78 ++++++++++++++--------------------------
 1 files changed, 27 insertions(+), 51 deletions(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index 69fbfae..662a747 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -16,22 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
 
-/* Toggle SDA by changing the direction of the pin */
-static void i2c_gpio_setsda_dir(void *data, int state)
-{
-	struct i2c_gpio_platform_data *pdata = data;
-
-	if (state)
-		gpio_direction_input(pdata->sda_pin);
-	else
-		gpio_direction_output(pdata->sda_pin, 0);
-}
-
-/*
- * Toggle SDA by changing the output value of the pin. This is only
- * valid for pins configured as open drain (i.e. setting the value
- * high effectively turns off the output driver.)
- */
+/* Toggle SDA by setting value, gpio library take care of open drain pins.*/
 static void i2c_gpio_setsda_val(void *data, int state)
 {
 	struct i2c_gpio_platform_data *pdata = data;
@@ -39,23 +24,7 @@ static void i2c_gpio_setsda_val(void *data, int state)
 	gpio_set_value(pdata->sda_pin, state);
 }
 
-/* Toggle SCL by changing the direction of the pin. */
-static void i2c_gpio_setscl_dir(void *data, int state)
-{
-	struct i2c_gpio_platform_data *pdata = data;
-
-	if (state)
-		gpio_direction_input(pdata->scl_pin);
-	else
-		gpio_direction_output(pdata->scl_pin, 0);
-}
-
-/*
- * Toggle SCL by changing the output value of the pin. This is used
- * for pins that are configured as open drain and for output-only
- * pins. The latter case will break the i2c protocol, but it will
- * often work in practice.
- */
+ /* Toggle SCL by setting value, gpio library take care of open drain pins.*/
 static void i2c_gpio_setscl_val(void *data, int state)
 {
 	struct i2c_gpio_platform_data *pdata = data;
@@ -83,6 +52,8 @@ static int __devinit i2c_gpio_probe(struct platform_device *pdev)
 	struct i2c_algo_bit_data *bit_data;
 	struct i2c_adapter *adap;
 	int ret;
+	unsigned long sda_gpio_flags;
+	unsigned long scl_gpio_flags;
 
 	pdata = pdev->dev.platform_data;
 	if (!pdata)
@@ -96,28 +67,33 @@ static int __devinit i2c_gpio_probe(struct platform_device *pdev)
 	if (!bit_data)
 		goto err_alloc_bit_data;
 
-	ret = gpio_request(pdata->sda_pin, "sda");
-	if (ret)
+	/* Initially, SCL and SDA pin should be HIGH */
+	sda_gpio_flags = GPIOF_OUT_INIT_HIGH;
+	scl_gpio_flags = GPIOF_OUT_INIT_HIGH;
+
+	if (pdata->sda_is_open_drain)
+		sda_gpio_flags |= GPIOF_OPEN_DRAIN;
+
+	if (pdata->scl_is_open_drain && !pdata->scl_is_output_only)
+		scl_gpio_flags |= GPIOF_OPEN_DRAIN;
+
+
+
+	ret = gpio_request_one(pdata->sda_pin, sda_gpio_flags, "sda");
+	if (ret) {
+		pr_err("%s(): Error in requesting sda gpio%d, ret %d\n",
+				__func__, pdata->sda_pin, ret);
 		goto err_request_sda;
-	ret = gpio_request(pdata->scl_pin, "scl");
-	if (ret)
+	}
+	ret = gpio_request_one(pdata->scl_pin, scl_gpio_flags, "scl");
+	if (ret) {
+		pr_err("%s(): Error in requesting scl gpio%d, ret %d\n",
+				__func__, pdata->scl_pin, ret);
 		goto err_request_scl;
-
-	if (pdata->sda_is_open_drain) {
-		gpio_direction_output(pdata->sda_pin, 1);
-		bit_data->setsda = i2c_gpio_setsda_val;
-	} else {
-		gpio_direction_input(pdata->sda_pin);
-		bit_data->setsda = i2c_gpio_setsda_dir;
 	}
 
-	if (pdata->scl_is_open_drain || pdata->scl_is_output_only) {
-		gpio_direction_output(pdata->scl_pin, 1);
-		bit_data->setscl = i2c_gpio_setscl_val;
-	} else {
-		gpio_direction_input(pdata->scl_pin);
-		bit_data->setscl = i2c_gpio_setscl_dir;
-	}
+	bit_data->setsda = i2c_gpio_setsda_val;
+	bit_data->setscl = i2c_gpio_setscl_val;
 
 	if (!pdata->scl_is_output_only)
 		bit_data->getscl = i2c_gpio_getscl;
-- 
1.7.1.1
