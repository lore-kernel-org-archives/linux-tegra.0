From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC/RFT PATCH 1/3] gpio: tegra: remove gpio_to_irq() from hw irq handlers
Date: Sat, 8 Jul 2017 17:44:11 -0500
Message-ID: <20170708224413.18281-2-grygorii.strashko@ti.com>
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
 drivers/gpio/gpio-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 88529d3..31b9a86 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -389,7 +389,8 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 				chained_irq_exit(chip, desc);
 			}
 
-			generic_handle_irq(gpio_to_irq(gpio + pin));
+			generic_handle_irq(irq_find_mapping(tgi->irq_domain,
+							    gpio + pin));
 		}
 	}
 
-- 
2.10.1
