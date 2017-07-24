From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 2/4] gpio: tegra: Prefer kcalloc() over kzalloc() with multiplies
Date: Mon, 24 Jul 2017 16:55:06 +0200
Message-ID: <20170724145508.7388-2-thierry.reding@gmail.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170724145508.7388-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Rather than manually compute the size of an array, pass the number and
element size to kcalloc().

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 63ee221f9be9..1d4df290d7ab 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -621,10 +621,10 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	if (tgi->soc->debounce_supported)
 		tgi->gc.set_config = tegra_gpio_set_config;
 
-	tgi->bank_info = devm_kzalloc(&pdev->dev, tgi->bank_count *
+	tgi->bank_info = devm_kcalloc(&pdev->dev, tgi->bank_count,
 				      sizeof(*tgi->bank_info), GFP_KERNEL);
 	if (!tgi->bank_info)
-		return -ENODEV;
+		return -ENOMEM;
 
 	tgi->irq_domain = irq_domain_add_linear(pdev->dev.of_node,
 						tgi->gc.ngpio,
-- 
2.13.3
