From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH 3/4] gpio: use handler in gpio_irq_chip instead of handle_bad_irq
Date: Mon,  8 Jul 2019 07:01:37 -0400
Message-ID: <20190708110138.24657-4-masneyb@onstation.org>
References: <20190708110138.24657-1-masneyb@onstation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190708110138.24657-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com, tglx@linutronix.de, marc.zyngier@arm.com, ilina@codeaurora.org, jonathanh@nvidia.com, skomatineni@nvidia.com, bbiswas@nvidia.com, linux-tegra@vger.kernel.org, david.daney@cavium.com, yamada.masahiro@socionext.com, treding@nvidia.com, bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use the IRQ handler field that's available in the struct gpio_irq_chip
when allocating an IRQ rather than hardcoding the handler to
handle_bad_irq(). The kernel reboots without any messages when testing
this using spmi-gpio on the Nexus 5.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
I didn't have time to dig into more detail about why this is happening.
I suspect the issue is that __irq_do_set_handler() has a special check
for handle_bad_irq:

https://elixir.bootlin.com/linux/latest/source/kernel/irq/chip.c#L974

My post about this:
https://lore.kernel.org/linux-gpio/20190707014620.GA9690@onstation.org/

 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5423242deb81..bc68ebb8f40e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1872,7 +1872,7 @@ static int gpiochip_hierarchy_irq_domain_alloc(struct irq_domain *d,
 				    hwirq + i,
 				    gc->irq.chip,
 				    gc,
-				    handle_bad_irq,
+				    girq->handler,
 				    NULL, NULL);
 		irq_set_probe(irq + i);
 
-- 
2.20.1
