From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 4/9] ARM: gemini: fix race in installing GPIO chained IRQ
 handler
Date: Tue, 16 Jun 2015 23:06:35 +0100
Message-ID: <E1Z4z07-0002SO-Gv@rmk-PC.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The gemini code was installing its chained interrupt handler (which
enables the interrupt) before it was setting its data, which is bad if
the IRQ was previously pending.  Avoid this problem by converting it to
irq_set_chained_handler_and_data().

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
Depends on patch 1.

 arch/arm/mach-gemini/gpio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-gemini/gpio.c b/arch/arm/mach-gemini/gpio.c
index f8cb5710d6ee..3292f2e6ed6f 100644
--- a/arch/arm/mach-gemini/gpio.c
+++ b/arch/arm/mach-gemini/gpio.c
@@ -223,8 +223,8 @@ void __init gemini_gpio_init(void)
 			set_irq_flags(j, IRQF_VALID);
 		}
 
-		irq_set_chained_handler(IRQ_GPIO(i), gpio_irq_handler);
-		irq_set_handler_data(IRQ_GPIO(i), (void *)i);
+		irq_set_chained_handler_and_data(IRQ_GPIO(i), gpio_irq_handler,
+						 (void *)i);
 	}
 
 	BUG_ON(gpiochip_add(&gemini_gpio_chip));
-- 
2.1.0
