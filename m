From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 1/3] ARM: tegra: paz00: add support for wakeup gpio key
Date: Wed, 26 Oct 2011 21:59:20 +0200
Message-ID: <b1fec796b032671247b44da77d37eb01f513b222.1319658296.git.marvin24@gmx.de>
References: <cover.1319658296.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1319658296.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds support for a wakeup gpio which is connected to the
embedded controller. This will be used later on for wakeup from suspend.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/mach-tegra/board-paz00.c |   29 ++++++++++++++++++++++++++++-
 arch/arm/mach-tegra/board-paz00.h |    3 +++
 2 files changed, 31 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 602f8dd..35fe372 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -23,8 +23,11 @@
 #include <linux/serial_8250.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/gpio.h>
+#include <linux/gpio_keys.h>
 #include <linux/pda_power.h>
 #include <linux/io.h>
+#include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/rfkill-gpio.h>
 
@@ -36,7 +39,6 @@
 #include <mach/iomap.h>
 #include <mach/irqs.h>
 #include <mach/sdhci.h>
-#include <mach/gpio.h>
 
 #include "board.h"
 #include "board-paz00.h"
@@ -114,12 +116,37 @@ static struct platform_device leds_gpio = {
         },
 };
 
+static struct gpio_keys_button paz00_gpio_keys_buttons[] = {
+	{
+		.code		= KEY_POWER,
+		.gpio		= TEGRA_GPIO_POWERKEY,
+		.active_low	= 1,
+		.desc		= "Power",
+		.type		= EV_KEY,
+		.wakeup		= 1,
+	},
+};
+
+static struct gpio_keys_platform_data paz00_gpio_keys = {
+	.buttons	= paz00_gpio_keys_buttons,
+	.nbuttons	= ARRAY_SIZE(paz00_gpio_keys_buttons),
+};
+
+static struct platform_device gpio_keys_device = {
+	.name	= "gpio-keys",
+	.id	= -1,
+	.dev	= {
+		.platform_data = &paz00_gpio_keys,
+	},
+};
+
 static struct platform_device *paz00_devices[] __initdata = {
 	&debug_uart,
 	&tegra_sdhci_device4,
 	&tegra_sdhci_device1,
 	&wifi_rfkill_device,
 	&leds_gpio,
+	&gpio_keys_device,
 };
 
 static void paz00_i2c_init(void)
diff --git a/arch/arm/mach-tegra/board-paz00.h b/arch/arm/mach-tegra/board-paz00.h
index 2dc1899..de5d22b 100644
--- a/arch/arm/mach-tegra/board-paz00.h
+++ b/arch/arm/mach-tegra/board-paz00.h
@@ -32,6 +32,9 @@
 #define TEGRA_WIFI_RST		TEGRA_GPIO_PD1
 #define TEGRA_WIFI_LED		TEGRA_GPIO_PD0
 
+/* WakeUp */
+#define TEGRA_GPIO_POWERKEY	TEGRA_GPIO_PJ7
+
 void paz00_pinmux_init(void);
 
 #endif
-- 
1.7.5.4
