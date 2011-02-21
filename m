From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 1/6] ARM: tegra: add tegra_gpio_table and tegra_gpio_config
Date: Mon, 21 Feb 2011 13:06:41 -0600
Message-ID: <1298315206-8887-2-git-send-email-olof@lixom.net>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298315206-8887-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

To give one place to setup the pins that are used as GPIOs instead
of as their pinmuxed functions. Specifying enabled as false explicitly
disables the gpio mode of that pin (if left on by firmware).

This should remove the need for calling these from specific drivers and
thus reduce tegra-specific code from them.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-pinmux.c |   13 +++++++++++++
 arch/arm/mach-tegra/gpio.c                 |   16 +++++++++++++++-
 arch/arm/mach-tegra/include/mach/gpio.h    |    7 +++++++
 3 files changed, 35 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-pinmux.c b/arch/arm/mach-tegra/board-harmony-pinmux.c
index 50b15d5..98b9ab2 100644
--- a/arch/arm/mach-tegra/board-harmony-pinmux.c
+++ b/arch/arm/mach-tegra/board-harmony-pinmux.c
@@ -16,7 +16,9 @@
 
 #include <linux/kernel.h>
 #include <mach/pinmux.h>
+#include <mach/gpio.h>
 
+#include "gpio-names.h"
 #include "board-harmony.h"
 
 static struct tegra_pingroup_config harmony_pinmux[] = {
@@ -138,7 +140,18 @@ static struct tegra_pingroup_config harmony_pinmux[] = {
 	{TEGRA_PINGROUP_XM2D,  TEGRA_MUX_NONE,          TEGRA_PUPD_NORMAL,    TEGRA_TRI_NORMAL},
 };
 
+static struct tegra_gpio_table gpio_table[] = {
+	{ .gpio = TEGRA_GPIO_PI5,	.enable = true	}, /* mmc2 cd	*/
+	{ .gpio = TEGRA_GPIO_PH1,	.enable = true	}, /* mmc2 wp	*/
+	{ .gpio = TEGRA_GPIO_PT3,	.enable = true	}, /* mmc2 pwr	*/
+	{ .gpio = TEGRA_GPIO_PH2,	.enable = true	}, /* mmc4 cd	*/
+	{ .gpio = TEGRA_GPIO_PH3,	.enable = true	}, /* mmc4 wp	*/
+	{ .gpio = TEGRA_GPIO_PI6,	.enable = true	}, /* mmc4 pwr	*/
+};
+
 void harmony_pinmux_init(void)
 {
 	tegra_pinmux_config_table(harmony_pinmux, ARRAY_SIZE(harmony_pinmux));
+
+	tegra_gpio_config(gpio_table, ARRAY_SIZE(gpio_table));
 }
diff --git a/arch/arm/mach-tegra/gpio.c b/arch/arm/mach-tegra/gpio.c
index 132dcd6..3fe9e1c 100644
--- a/arch/arm/mach-tegra/gpio.c
+++ b/arch/arm/mach-tegra/gpio.c
@@ -379,7 +379,21 @@ static int __init tegra_gpio_init(void)
 	return 0;
 }
 
-postcore_initcall(tegra_gpio_init);
+void __init tegra_gpio_config(struct tegra_gpio_table *table, int num)
+{
+	int i;
+
+	tegra_gpio_init();
+
+	for (i = 0; i < num; i++) {
+		int gpio = table[i].gpio;
+
+		if (table[i].enable)
+			tegra_gpio_enable(gpio);
+		else
+			tegra_gpio_disable(gpio);
+	}
+}
 
 #ifdef	CONFIG_DEBUG_FS
 
diff --git a/arch/arm/mach-tegra/include/mach/gpio.h b/arch/arm/mach-tegra/include/mach/gpio.h
index e31f486..2369fba 100644
--- a/arch/arm/mach-tegra/include/mach/gpio.h
+++ b/arch/arm/mach-tegra/include/mach/gpio.h
@@ -20,6 +20,7 @@
 #ifndef __MACH_TEGRA_GPIO_H
 #define __MACH_TEGRA_GPIO_H
 
+#include <linux/init.h>
 #include <mach/irqs.h>
 
 #define TEGRA_NR_GPIOS		INT_GPIO_NR
@@ -47,6 +48,12 @@ static inline int irq_to_gpio(unsigned int irq)
 	return -EINVAL;
 }
 
+struct tegra_gpio_table {
+	int	gpio;	/* GPIO number */
+	bool	enable;	/* Enable for GPIO at init? */
+};
+
+void __init tegra_gpio_config(struct tegra_gpio_table *table, int num);
 void tegra_gpio_enable(int gpio);
 void tegra_gpio_disable(int gpio);
 
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
