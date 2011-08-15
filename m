From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v2 08/13] gpio/tegra: Convert to a platform device
Date: Mon, 15 Aug 2011 14:28:15 -0600
Message-ID: <1313440100-17131-9-git-send-email-swarren@nvidia.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1313440100-17131-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpio/gpio-tegra.c |   25 ++++++++++++++-----------
 1 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index df64536..4da4839 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -20,10 +20,10 @@
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-
 #include <linux/io.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 
 #include <asm/mach/irq.h>
 
@@ -332,7 +332,7 @@ static struct irq_chip tegra_gpio_irq_chip = {
  */
 static struct lock_class_key gpio_lock_class;
 
-static int __init tegra_gpio_init(void)
+static int __init tegra_gpio_probe(struct platform_device *pdev)
 {
 	struct tegra_gpio_bank *bank;
 	int gpio;
@@ -346,15 +346,6 @@ static int __init tegra_gpio_init(void)
 		}
 	}
 
-#ifdef CONFIG_OF_GPIO
-	/*
-	 * This isn't ideal, but it gets things hooked up until this
-	 * driver is converted into a platform_device
-	 */
-	tegra_gpio_chip.of_node = of_find_compatible_node(NULL, NULL,
-						"nvidia,tegra20-gpio");
-#endif /* CONFIG_OF_GPIO */
-
 	gpiochip_add(&tegra_gpio_chip);
 
 	for (gpio = 0; gpio < TEGRA_NR_GPIOS; gpio++) {
@@ -383,6 +374,18 @@ static int __init tegra_gpio_init(void)
 	return 0;
 }
 
+static struct platform_driver tegra_gpio_driver = {
+	.driver		= {
+		.name	= "tegra-gpio",
+		.owner	= THIS_MODULE,
+	},
+	.probe		= tegra_gpio_probe,
+};
+
+static int __init tegra_gpio_init(void)
+{
+	return platform_driver_register(&tegra_gpio_driver);
+}
 postcore_initcall(tegra_gpio_init);
 
 void __init tegra_gpio_config(struct tegra_gpio_table *table, int num)
-- 
1.7.0.4
