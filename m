From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 2/6] gpio: max77620: Fix missing release of interrupt
Date: Thu,  9 Jul 2020 20:11:59 +0300
Message-ID: <20200709171203.12950-3-digetx@gmail.com>
References: <20200709171203.12950-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200709171203.12950-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The requested interrupt is never released by the driver. Fix this by
using the resource-managed variant of request_threaded_irq().

Fixes: ab3dd9cc24d4 ("gpio: max77620: Fix interrupt handling")
Cc: <stable@vger.kernel.org> # 5.5+
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 4c0c9ec2587d..7f7e8d4bf0d3 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -305,8 +305,9 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	gpiochip_irqchip_add_nested(&mgpio->gpio_chip, &max77620_gpio_irqchip,
 				    0, handle_edge_irq, IRQ_TYPE_NONE);
 
-	ret = request_threaded_irq(gpio_irq, NULL, max77620_gpio_irqhandler,
-				   IRQF_ONESHOT, "max77620-gpio", mgpio);
+	ret = devm_request_threaded_irq(&pdev->dev, gpio_irq, NULL,
+					max77620_gpio_irqhandler, IRQF_ONESHOT,
+					"max77620-gpio", mgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ: %d\n", ret);
 		return ret;
-- 
2.26.0
