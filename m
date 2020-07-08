From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 5/5] gpio: max77620: Move variable declaration
Date: Wed,  8 Jul 2020 11:26:34 +0300
Message-ID: <20200708082634.30191-6-digetx@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200708082634.30191-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Let's move the virq variable declaration to a top-level scope just to
make the code a bit more visually appealing.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpio/gpio-max77620.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 8d54bc4307c2..6861980da0d8 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -27,7 +27,7 @@ struct max77620_gpio {
 static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 {
 	struct max77620_gpio *gpio = data;
-	unsigned int value, offset;
+	unsigned int value, offset, virq;
 	unsigned long pending;
 	int err;
 
@@ -42,8 +42,6 @@ static irqreturn_t max77620_gpio_irqhandler(int irq, void *data)
 		return IRQ_NONE;
 
 	for_each_set_bit(offset, &pending, MAX77620_GPIO_NR) {
-		unsigned int virq;
-
 		virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);
 		handle_nested_irq(virq);
 	}
-- 
2.26.0
