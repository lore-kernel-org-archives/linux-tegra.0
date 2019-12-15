From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/3] gpio: tegra: Use NOIRQ phase for suspend/resume
Date: Sun, 15 Dec 2019 21:30:47 +0300
Message-ID: <20191215183047.9414-4-digetx@gmail.com>
References: <20191215183047.9414-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191215183047.9414-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

All GPIO interrupts are disabled during of the NOIRQ suspend/resume
phase, thus there is no need to manually disable the interrupts. This
patch doesn't fix any problem, this is just a minor clean-up.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpio/gpio-tegra.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 4790dfec7758..acb99eff9939 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -416,11 +416,8 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 static int tegra_gpio_resume(struct device *dev)
 {
 	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
-	unsigned long flags;
 	unsigned int b, p;
 
-	local_irq_save(flags);
-
 	for (b = 0; b < tgi->bank_count; b++) {
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
@@ -448,17 +445,14 @@ static int tegra_gpio_resume(struct device *dev)
 		}
 	}
 
-	local_irq_restore(flags);
 	return 0;
 }
 
 static int tegra_gpio_suspend(struct device *dev)
 {
 	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
-	unsigned long flags;
 	unsigned int b, p;
 
-	local_irq_save(flags);
 	for (b = 0; b < tgi->bank_count; b++) {
 		struct tegra_gpio_bank *bank = &tgi->bank_info[b];
 
@@ -488,7 +482,7 @@ static int tegra_gpio_suspend(struct device *dev)
 					  GPIO_INT_ENB(tgi, gpio));
 		}
 	}
-	local_irq_restore(flags);
+
 	return 0;
 }
 
@@ -562,7 +556,7 @@ static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 #endif
 
 static const struct dev_pm_ops tegra_gpio_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
 static int tegra_gpio_probe(struct platform_device *pdev)
-- 
2.24.0
