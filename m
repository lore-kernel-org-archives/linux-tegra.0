From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL 6/6] ARM: tegra: trimslice: enable MMC/SD slots
Date: Tue, 29 Mar 2011 10:06:40 +0200
Message-ID: <a2be60ea6633864f1f022feb6aea993817e25492.1301385132.git.mike@compulab.co.il>
References: <cover.1301385131.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1301385131.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

TrimSlice has MicroSD and standard MMC/SD slots.
Register sdhci devices and enable GPIOs for MMC/SD slot.

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-trimslice-pinmux.c |    5 +++++
 arch/arm/mach-tegra/board-trimslice.c        |   19 +++++++++++++++++++
 arch/arm/mach-tegra/board-trimslice.h        |    3 +++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/mach-tegra/board-trimslice-pinmux.c
index 6d4fc9f..4574ac0 100644
--- a/arch/arm/mach-tegra/board-trimslice-pinmux.c
+++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
@@ -16,8 +16,11 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+
 #include <mach/pinmux.h>
+#include <mach/gpio.h>
 
+#include "gpio-names.h"
 #include "board-trimslice.h"
 
 static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
@@ -142,4 +145,6 @@ static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
 void __init trimslice_pinmux_init(void)
 {
 	tegra_pinmux_config_table(trimslice_pinmux, ARRAY_SIZE(trimslice_pinmux));
+	tegra_gpio_enable(TRIMSLICE_GPIO_SD4_CD);
+	tegra_gpio_enable(TRIMSLICE_GPIO_SD4_WP);
 }
diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
index d7cfaa1..6b5d136 100644
--- a/arch/arm/mach-tegra/board-trimslice.c
+++ b/arch/arm/mach-tegra/board-trimslice.c
@@ -29,9 +29,12 @@
 #include <asm/setup.h>
 
 #include <mach/iomap.h>
+#include <mach/sdhci.h>
 
 #include "board.h"
 #include "clock.h"
+#include "devices.h"
+#include "gpio-names.h"
 
 #include "board-trimslice.h"
 
@@ -56,9 +59,22 @@ static struct platform_device debug_uart = {
 		.platform_data	= debug_uart_platform_data,
 	},
 };
+static struct tegra_sdhci_platform_data sdhci_pdata1 = {
+	.cd_gpio	= -1,
+	.wp_gpio	= -1,
+	.power_gpio	= -1,
+};
+
+static struct tegra_sdhci_platform_data sdhci_pdata4 = {
+	.cd_gpio	= TRIMSLICE_GPIO_SD4_CD,
+	.wp_gpio	= TRIMSLICE_GPIO_SD4_WP,
+	.power_gpio	= -1,
+};
 
 static struct platform_device *trimslice_devices[] __initdata = {
 	&debug_uart,
+	&tegra_sdhci_device1,
+	&tegra_sdhci_device4,
 };
 
 static void __init tegra_trimslice_fixup(struct machine_desc *desc,
@@ -97,6 +113,9 @@ static void __init tegra_trimslice_init(void)
 
 	trimslice_pinmux_init();
 
+	tegra_sdhci_device1.dev.platform_data = &sdhci_pdata1;
+	tegra_sdhci_device4.dev.platform_data = &sdhci_pdata4;
+
 	platform_add_devices(trimslice_devices, ARRAY_SIZE(trimslice_devices));
 }
 
diff --git a/arch/arm/mach-tegra/board-trimslice.h b/arch/arm/mach-tegra/board-trimslice.h
index 16ec0f0..e8ef629 100644
--- a/arch/arm/mach-tegra/board-trimslice.h
+++ b/arch/arm/mach-tegra/board-trimslice.h
@@ -17,6 +17,9 @@
 #ifndef _MACH_TEGRA_BOARD_TRIMSLICE_H
 #define _MACH_TEGRA_BOARD_TRIMSLICE_H
 
+#define TRIMSLICE_GPIO_SD4_CD	TEGRA_GPIO_PP1	/* mmc4 cd */
+#define TRIMSLICE_GPIO_SD4_WP	TEGRA_GPIO_PP2	/* mmc4 wp */
+
 void trimslice_pinmux_init(void);
 
 #endif
-- 
1.7.3.1
