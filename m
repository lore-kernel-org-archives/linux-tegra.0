From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] gpio: max77620: Replace 8 with MAX77620_GPIO_NR
Date: Wed,  8 Jul 2020 18:58:34 +0300
Message-ID: <20200708155834.19762-3-digetx@gmail.com>
References: <20200708155834.19762-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200708155834.19762-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The MAX77620_GPIO_NR enum value represents the total number of GPIOs,
let's use it instead of a raw value in order to improve the code's
readability a tad.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/gpio-max77620.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 970ad6397a56..08bd5b141437 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -19,8 +19,8 @@ struct max77620_gpio {
 	struct regmap		*rmap;
 	struct device		*dev;
 	struct mutex		buslock; /* irq_bus_lock */
-	unsigned int		irq_type[8];
-	bool			irq_enabled[8];
+	unsigned int		irq_type[MAX77620_GPIO_NR];
+	bool			irq_enabled[MAX77620_GPIO_NR];
 };
 
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
@@ -38,7 +38,7 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 
 	pending = value;
 
-	for_each_set_bit(offset, &pending, 8) {
+	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
 		unsigned int virq;
 
 		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
-- 
2.26.0
