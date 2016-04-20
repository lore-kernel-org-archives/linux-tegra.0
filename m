From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V3 1/4] gpio: tegra: Don't open code of_device_get_match_data()
Date: Wed, 20 Apr 2016 19:00:55 +0530
Message-ID: <1461159058-1439-2-git-send-email-ldewangan@nvidia.com>
References: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461159058-1439-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, swarren@wwwdotorg.org, gnurou@gmail.com, thierry.reding@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use of_device_get_match_data() for getting matched data
instead of implementing this locally.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Reviewed-by: Stephen Warren <swarren@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

---
Collected reviewed/ack by from Stephen, Alexandre and Thieery.
---
 drivers/gpio/gpio-tegra.c | 50 +++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 790bb11..1b0c497 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -75,6 +75,11 @@ struct tegra_gpio_bank {
 #endif
 };
 
+struct tegra_gpio_soc_config {
+	u32 bank_stride;
+	u32 upper_offset;
+};
+
 static struct device *dev;
 static struct irq_domain *irq_domain;
 static void __iomem *regs;
@@ -445,27 +450,6 @@ static const struct dev_pm_ops tegra_gpio_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
 };
 
-struct tegra_gpio_soc_config {
-	u32 bank_stride;
-	u32 upper_offset;
-};
-
-static struct tegra_gpio_soc_config tegra20_gpio_config = {
-	.bank_stride = 0x80,
-	.upper_offset = 0x800,
-};
-
-static struct tegra_gpio_soc_config tegra30_gpio_config = {
-	.bank_stride = 0x100,
-	.upper_offset = 0x80,
-};
-
-static const struct of_device_id tegra_gpio_of_match[] = {
-	{ .compatible = "nvidia,tegra30-gpio", .data = &tegra30_gpio_config },
-	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
-	{ },
-};
-
 /* This lock class tells lockdep that GPIO irqs are in a different
  * category than their parents, so it won't report false recursion.
  */
@@ -473,8 +457,7 @@ static struct lock_class_key gpio_lock_class;
 
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match;
-	struct tegra_gpio_soc_config *config;
+	const struct tegra_gpio_soc_config *config;
 	struct resource *res;
 	struct tegra_gpio_bank *bank;
 	int ret;
@@ -484,12 +467,11 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 
 	dev = &pdev->dev;
 
-	match = of_match_device(tegra_gpio_of_match, &pdev->dev);
-	if (!match) {
+	config = of_device_get_match_data(&pdev->dev);
+	if (!config) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		return -ENODEV;
 	}
-	config = (struct tegra_gpio_soc_config *)match->data;
 
 	tegra_gpio_bank_stride = config->bank_stride;
 	tegra_gpio_upper_offset = config->upper_offset;
@@ -578,6 +560,22 @@ static int tegra_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static struct tegra_gpio_soc_config tegra20_gpio_config = {
+	.bank_stride = 0x80,
+	.upper_offset = 0x800,
+};
+
+static struct tegra_gpio_soc_config tegra30_gpio_config = {
+	.bank_stride = 0x100,
+	.upper_offset = 0x80,
+};
+
+static const struct of_device_id tegra_gpio_of_match[] = {
+	{ .compatible = "nvidia,tegra30-gpio", .data = &tegra30_gpio_config },
+	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
+	{ },
+};
+
 static struct platform_driver tegra_gpio_driver = {
 	.driver		= {
 		.name	= "tegra-gpio",
-- 
2.1.4
