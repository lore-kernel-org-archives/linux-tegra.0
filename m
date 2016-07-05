From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio: of: Allow overriding the device node
Date: Tue,  5 Jul 2016 14:11:14 +0200
Message-ID: <20160705121114.10650-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When registering a GPIO chip, drivers can override the device tree node
associated with the chip by setting the chip's ->of_node field. If set,
this field is supposed to take precedence over the ->parent->of_node
field, but the code doesn't actually do that.

Commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
struct gg_data") exposes this because it now no longer matches on the
GPIO chip's ->of_node field, but the GPIO device's ->of_node field that
is set using the procedure described above.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 47a3cc0e437b..eae7664b2723 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1047,13 +1047,14 @@ int gpiochip_add_data(struct gpio_chip *chip, void *data)
 	if (chip->parent) {
 		gdev->dev.parent = chip->parent;
 		gdev->dev.of_node = chip->parent->of_node;
-	} else {
+	}
+
 #ifdef CONFIG_OF_GPIO
 	/* If the gpiochip has an assigned OF node this takes precedence */
-		if (chip->of_node)
-			gdev->dev.of_node = chip->of_node;
+	if (chip->of_node)
+		gdev->dev.of_node = chip->of_node;
 #endif
-	}
+
 	gdev->id = ida_simple_get(&gpio_ida, 0, 0, GFP_KERNEL);
 	if (gdev->id < 0) {
 		status = gdev->id;
-- 
2.8.3

