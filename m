From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH] gpiolib: probe deferral error reporting
Date: Fri, 20 Jul 2018 09:54:49 +0200
Message-ID: <20180720075449.26711-1-marcel@ziswiler.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Actually report the error code from devm_regulator_get() which may as
well just be a probe deferral.

This is e.g. what one gets upon booting a Colibri T20:

gpiochip_add_data_with_key: GPIOs 0..223 (tegra-gpio) failed to register

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2e2a6f8db405..40c65eb1d97b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1408,9 +1408,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 err_free_gdev:
 	ida_simple_remove(&gpio_ida, gdev->id);
 	/* failures here can mean systems won't boot... */
-	pr_err("%s: GPIOs %d..%d (%s) failed to register\n", __func__,
+	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
 	       gdev->base, gdev->base + gdev->ngpio - 1,
-	       chip->label ? : "generic");
+	       chip->label ? : "generic", status);
 	kfree(gdev);
 	return status;
 }
-- 
2.14.4
