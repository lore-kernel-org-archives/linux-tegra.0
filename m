From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 4/6] gpio: max77620: Don't shadow error code of platform_get_irq()
Date: Wed,  8 Jul 2020 23:23:53 +0300
Message-ID: <20200708202355.28507-5-digetx@gmail.com>
References: <20200708202355.28507-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200708202355.28507-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The platform_get_irq() returns a positive interrupt number on success and
negative error code on failure (zero shouldn't ever happen in practice, it
would produce a noisy warning). Hence let's return the error code directly
instead of overriding it with -ENODEV.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-max77620.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index 39d431da2dbc..9121d2507f60 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -264,12 +264,14 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 {
 	struct max77620_chip *chip =  dev_get_drvdata(pdev->dev.parent);
 	struct max77620_gpio *mgpio;
-	int gpio_irq;
+	unsigned int gpio_irq;
 	int ret;
 
-	gpio_irq = platform_get_irq(pdev, 0);
-	if (gpio_irq <= 0)
-		return -ENODEV;
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	gpio_irq = ret;
 
 	mgpio = devm_kzalloc(&pdev->dev, sizeof(*mgpio), GFP_KERNEL);
 	if (!mgpio)
-- 
2.26.0
