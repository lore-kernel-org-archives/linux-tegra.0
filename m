From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] gpio: max77620: Add missing dependency on GPIOLIB_IRQCHIP
Date: Mon,  6 Jan 2020 04:51:54 +0300
Message-ID: <20200106015154.12040-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Driver fails to compile in a minimized kernel's configuration because of
the missing dependency on GPIOLIB_IRQCHIP.

 error: ‘struct gpio_chip’ has no member named ‘irq’
   44 |   virq = irq_find_mapping(gpio->gpio_chip.irq.domain, offset);

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 29689c7384ee..9e99d09a64c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1146,6 +1146,7 @@ config GPIO_MADERA
 config GPIO_MAX77620
 	tristate "GPIO support for PMIC MAX77620 and MAX20024"
 	depends on MFD_MAX77620
+	select GPIOLIB_IRQCHIP
 	help
 	  GPIO driver for MAX77620 and MAX20024 PMIC from Maxim Semiconductor.
 	  MAX77620 PMIC has 8 pins that can be configured as GPIOs. The
-- 
2.24.0
