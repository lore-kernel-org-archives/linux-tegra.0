From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio: tegra: Make lockdep class file-scoped
Date: Mon,  6 Jun 2016 18:56:27 +0200
Message-ID: <20160606165627.32676-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit b546be0db955 ("gpio: tegra: Get rid of all file scoped global
variables") moved all file scoped variables into the driver-private
structure to allow potentially multiple instances of the driver. The
change also included turning the lockdep class into a driver-private
field, which doesn't work and produces error messages such as this:

	[    0.142310] BUG: key ffff8000fb3f7ab0 not in .data!

Make the lockdep class file-scoped again to fix this issue.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Hi Linus,

The commit that broke this went into v4.7-rc1, so it'd be good to get
this merged within the v4.7 release cycle.

 drivers/gpio/gpio-tegra.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index ec891a27952f..661b0e34e067 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -98,7 +98,6 @@ struct tegra_gpio_info {
 	const struct tegra_gpio_soc_config	*soc;
 	struct gpio_chip			gc;
 	struct irq_chip				ic;
-	struct lock_class_key			lock_class;
 	u32					bank_count;
 };
 
@@ -547,6 +546,12 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
+/*
+ * This lock class tells lockdep that GPIO irqs are in a different category
+ * than their parents, so it won't report false recursion.
+ */
+static struct lock_class_key gpio_lock_class;
+
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	const struct tegra_gpio_soc_config *config;
@@ -660,7 +665,7 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 		bank = &tgi->bank_info[GPIO_BANK(gpio)];
 
-		irq_set_lockdep_class(irq, &tgi->lock_class);
+		irq_set_lockdep_class(irq, &gpio_lock_class);
 		irq_set_chip_data(irq, bank);
 		irq_set_chip_and_handler(irq, &tgi->ic, handle_simple_irq);
 	}
-- 
2.8.3

