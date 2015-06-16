From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 5/9] gpio: gpio-mxc: fix race in installing chained IRQ
 handler
Date: Tue, 16 Jun 2015 23:06:40 +0100
Message-ID: <E1Z4z0C-0002SX-Lj@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix a race where a pending interrupt could be received and the handler
called before the handler's data has been setup, by converting to
irq_set_chained_handler_and_data().

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
Depends on patch 1.

 drivers/gpio/gpio-mxc.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9f7446a7ac64..e4f42c95c320 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -437,14 +437,13 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		irq_set_chained_handler(port->irq, mx2_gpio_irq_handler);
 	} else {
 		/* setup one handler for each entry */
-		irq_set_chained_handler(port->irq, mx3_gpio_irq_handler);
-		irq_set_handler_data(port->irq, port);
-		if (port->irq_high > 0) {
+		irq_set_chained_handler_and_data(port->irq,
+						 mx3_gpio_irq_handler, port);
+		if (port->irq_high > 0)
 			/* setup handler for GPIO 16 to 31 */
-			irq_set_chained_handler(port->irq_high,
-						mx3_gpio_irq_handler);
-			irq_set_handler_data(port->irq_high, port);
-		}
+			irq_set_chained_handler_and_data(port->irq_high,
+							 mx3_gpio_irq_handler,
+							 port);
 	}
 
 	err = bgpio_init(&port->bgc, &pdev->dev, 4,
-- 
2.1.0
