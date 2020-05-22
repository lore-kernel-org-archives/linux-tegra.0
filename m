From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 04/13] gpio: tegra: mask GPIO IRQs during IRQ shutdown
Date: Fri, 22 May 2020 10:51:33 -0400
Message-ID: <20200522145142.435086-4-sashal@kernel.org>
References: <20200522145142.435086-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200522145142.435086-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Stephen Warren <swarren@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

[ Upstream commit 0cf253eed5d2bdf7bb3152457b38f39b012955f7 ]

The driver currently leaves GPIO IRQs unmasked even when the GPIO IRQ
client has released the GPIO IRQ. This allows the HW to raise IRQs, and
SW to process them, after shutdown. Fix this by masking the IRQ when it's
shut down. This is usually taken care of by the irqchip core, but since
this driver has a custom irq_shutdown implementation, it must do this
explicitly itself.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
Link: https://lore.kernel.org/r/20200427232605.11608-1-swarren@wwwdotorg.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 1eb857e2f62f..dd801f5d5253 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -356,6 +356,7 @@ static void tegra_gpio_irq_shutdown(struct irq_data *d)
 	struct tegra_gpio_info *tgi = bank->tgi;
 	unsigned int gpio = d->hwirq;
 
+	tegra_gpio_irq_mask(d);
 	gpiochip_unlock_as_irq(&tgi->gc, gpio);
 }
 
-- 
2.25.1
