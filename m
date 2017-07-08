From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC/RFT PATCH 2/3] gpio: pxa: remove gpio_to_irq() from hw irq handlers
Date: Sat, 8 Jul 2017 17:44:12 -0500
Message-ID: <20170708224413.18281-3-grygorii.strashko@ti.com>
References: <20170708224413.18281-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170708224413.18281-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-tegra@vger.kernel.org

gpio_to_irq() API expected to be used by GPIO consumers and
not drivers and there are no guarantee that its gpiolib implementation
is irq safe.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-pxa.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 832f3e4..6029899 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -451,7 +451,9 @@ static irqreturn_t pxa_gpio_demux_handler(int in_irq, void *d)
 			for_each_set_bit(n, &gedr, BITS_PER_LONG) {
 				loop = 1;
 
-				generic_handle_irq(gpio_to_irq(gpio + n));
+				generic_handle_irq(
+					irq_find_mapping(pchip->irqdomain,
+							 gpio + n));
 			}
 		}
 		handled += loop;
@@ -465,9 +467,9 @@ static irqreturn_t pxa_gpio_direct_handler(int in_irq, void *d)
 	struct pxa_gpio_chip *pchip = d;
 
 	if (in_irq == pchip->irq0) {
-		generic_handle_irq(gpio_to_irq(0));
+		generic_handle_irq(irq_find_mapping(pchip->irqdomain, 0));
 	} else if (in_irq == pchip->irq1) {
-		generic_handle_irq(gpio_to_irq(1));
+		generic_handle_irq(irq_find_mapping(pchip->irqdomain, 1));
 	} else {
 		pr_err("%s() unknown irq %d\n", __func__, in_irq);
 		return IRQ_NONE;
-- 
2.10.1
