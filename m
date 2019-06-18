From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V3 03/17] gpio: tegra: use resume_noirq for tegra gpio resume
Date: Tue, 18 Jun 2019 00:46:17 -0700
Message-ID: <1560843991-24123-4-git-send-email-skomatineni@nvidia.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

During SC7 resume, PARKED bit clear from the pinmux registers may
cause a glitch on the GPIO lines.

So, Tegra GPIOs restore should happen prior to restoring Tegra pinmux
to keep the GPIO lines in a known good state prior to clearing PARKED
bit.

This patch has fix for this by moving Tegra GPIO restore to happen
during resume_noirq.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/gpio/gpio-tegra.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index f57bfc07ae22..f3c58c597ab9 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -410,7 +410,7 @@ static void tegra_gpio_irq_handler(struct irq_desc *desc)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static int tegra_gpio_resume(struct device *dev)
+static int tegra_gpio_resume_noirq(struct device *dev)
 {
 	struct tegra_gpio_info *tgi = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -506,6 +506,15 @@ static int tegra_gpio_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return irq_set_irq_wake(bank->irq, enable);
 }
+
+static const struct dev_pm_ops tegra_gpio_pm_ops = {
+	.suspend = &tegra_gpio_suspend,
+	.resume_noirq = &tegra_gpio_resume_noirq
+};
+
+#define TEGRA_GPIO_PM	(&tegra_gpio_pm_ops)
+#else
+#define TEGRA_GPIO_PM	NULL
 #endif
 
 #ifdef	CONFIG_DEBUG_FS
@@ -553,10 +562,6 @@ static inline void tegra_gpio_debuginit(struct tegra_gpio_info *tgi)
 
 #endif
 
-static const struct dev_pm_ops tegra_gpio_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_gpio_suspend, tegra_gpio_resume)
-};
-
 static int tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_info *tgi;
@@ -706,7 +711,7 @@ static const struct of_device_id tegra_gpio_of_match[] = {
 static struct platform_driver tegra_gpio_driver = {
 	.driver		= {
 		.name	= "tegra-gpio",
-		.pm	= &tegra_gpio_pm_ops,
+		.pm	= TEGRA_GPIO_PM,
 		.of_match_table = tegra_gpio_of_match,
 	},
 	.probe		= tegra_gpio_probe,
-- 
2.7.4
