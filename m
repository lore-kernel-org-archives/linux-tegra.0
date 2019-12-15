From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/3] gpio: tegra: Properly handle irq_set_irq_wake() error
Date: Sun, 15 Dec 2019 21:30:46 +0300
Message-ID: <20191215183047.9414-3-digetx@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Technically upstream interrupt controller may fail changing of GPIO's bank
wake-state and in this case the GPIO's wake-state shouldn't be changed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index f6a382fbd12d..4790dfec7758 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -497,6 +497,11 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	struct tegra_gpio_bank *bank = irq_data_get_irq_chip_data(d);
 	unsigned int gpio = d->hwirq;
 	u32 port, bit, mask;
+	int err;
+
+	err = irq_set_irq_wake(bank->irq, enable);
+	if (err)
+		return err;
 
 	port = GPIO_PORT(gpio);
 	bit = GPIO_BIT(gpio);
@@ -507,7 +512,7 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 	else
 		bank->wake_enb[port] &= ~mask;
 
-	return irq_set_irq_wake(bank->irq, enable);
+	return 0;
 }
 #endif
 
-- 
2.24.0
