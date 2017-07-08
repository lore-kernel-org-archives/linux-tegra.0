From: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Subject: [RFC/RFT PATCH 0/3] gpiolib: make gpio irqchip compatible with sparse_irq
Date: Sat, 8 Jul 2017 17:44:10 -0500
Message-ID: <20170708224413.18281-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The idea of this changes was inspired by discussion [1].

Now IRQ mappings are always created for all (allowed) GPIOs in GPIO irqchip in
gpiochip_irqchip_add_key() and this goes against the idea of SPARSE_IRQ and,
as result, leads to:
 - increasing of memory consumption because of allocated IRQ descriptors most
of which will never ever be used (especially on platform with a
high number of GPIOs).
 - imposibility to use GPIO irqchip APIs by gpio drivers when HW implements
GPIO IRQ functionality as IRQ crossbar/multiplexer which has only limited
number of IRQ outputs (example from [1], all GPIOs can be mapped on only 8
IRQs).

Hence, remove static IRQ mapping code from gpiochip_irqchip_add_key() and
instead replace irq_find_mapping() with irq_create_mapping() in
gpiochip_to_irq(). Also add additional gpiochip_irqchip_irq_valid() calls
in gpiochip_to_irq() and gpiochip_irq_map().

After this change gpio2irq mapping will happen the following way when GPIO
irqchip APIs are used by gpio driver:
 - IRQ mappings will be created statically if driver passes first_irq>0
vlaue in gpiochip_irqchip_add_key().
 - IRQ mappings will be created dynamically from gpio_to_irq() or
of_irq_get().

Tested on am335x-evm and dra72-evm-revc.
- dra72-evm-revc: number of created irq mappings decreased from 402 -> 135
- am335x-evm: number of created irq mappings decreased from 188 -> 63

It's good to have more testing feedbacks for these patches 
(personally I do not expect regressions, but who knows). One possible side 
effect is "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n" message
during boot, but in this case it might be good to take a look on such GPIO
drivers to understand why they need to allocate IRQ descriptors.

[1] https://www.mail-archive.com/linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg1435847.html

Grygorii Strashko (3):
  gpio: tegra: remove gpio_to_irq() from hw irq handlers
  gpio: pxa: remove gpio_to_irq() from hw irq handlers
  gpiolib: make gpio irqchip compatible with sparse_irq

 drivers/gpio/gpio-pxa.c     |  8 +++++---
 drivers/gpio/gpio-tegra.c   |  3 ++-
 drivers/gpio/gpiolib.c      | 29 ++++++-----------------------
 include/linux/gpio/driver.h |  1 -
 4 files changed, 13 insertions(+), 28 deletions(-)

-- 
2.10.1
