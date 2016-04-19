From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 2/3] gpio: tegra: Remove the need of keeping device handle for gpio driver
Date: Tue, 19 Apr 2016 15:13:39 +0530
Message-ID: <1461059020-25373-2-git-send-email-ldewangan@nvidia.com>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Remove the file static device handle variable for keeping device handle
of driver as this is just required for error prints. The required device
handle are available from gpiochip structure.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 1b0c497..de022a9 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -80,7 +80,6 @@ struct tegra_gpio_soc_config {
 	u32 upper_offset;
 };
 
-static struct device *dev;
 static struct irq_domain *irq_domain;
 static void __iomem *regs;
 static u32 tegra_gpio_bank_count;
@@ -240,7 +239,8 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	ret = gpiochip_lock_as_irq(&tegra_gpio_chip, gpio);
 	if (ret) {
-		dev_err(dev, "unable to lock Tegra GPIO %d as IRQ\n", gpio);
+		dev_err(tegra_gpio_chip.parent,
+			"unable to lock Tegra GPIO %d as IRQ\n", gpio);
 		return ret;
 	}
 
@@ -465,8 +465,6 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	int i;
 	int j;
 
-	dev = &pdev->dev;
-
 	config = of_device_get_match_data(&pdev->dev);
 	if (!config) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
@@ -488,6 +486,8 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	}
 
 	tegra_gpio_chip.ngpio = tegra_gpio_bank_count * 32;
+	tegra_gpio_chip.parent = &pdev->dev;
+
 
 	tegra_gpio_banks = devm_kzalloc(&pdev->dev,
 			tegra_gpio_bank_count * sizeof(*tegra_gpio_banks),
-- 
2.1.4
