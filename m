From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/3] gpio: max77620: Do not allocate IRQs upfront
Date: Wed,  2 Oct 2019 14:28:24 +0200
Message-ID: <20191002122825.3948322-2-thierry.reding@gmail.com>
References: <20191002122825.3948322-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002122825.3948322-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Timo Alho <talho@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

regmap_add_irq_chip() will try to allocate all of the IRQ descriptors
upfront if passed a non-zero irq_base parameter. However, the intention
is to allocate IRQ descriptors on an as-needed basis if possible. Pass 0
instead of -1 to fix that use-case.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-max77620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max77620.c b/drivers/gpio/gpio-max77620.c
index faf86ea9c51a..c58b56e5291e 100644
--- a/drivers/gpio/gpio-max77620.c
+++ b/drivers/gpio/gpio-max77620.c
@@ -304,7 +304,7 @@ static int max77620_gpio_probe(struct platform_device *pdev)
 	}
 
 	ret = devm_regmap_add_irq_chip(&pdev->dev, chip->rmap, gpio_irq,
-				       IRQF_ONESHOT, -1,
+				       IRQF_ONESHOT, 0,
 				       &max77620_gpio_irq_chip,
 				       &chip->gpio_irq_data);
 	if (ret < 0) {
-- 
2.23.0
