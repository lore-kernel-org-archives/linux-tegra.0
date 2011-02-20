From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 5/7] ARM: tegra: harmony: register sdhci devices
Date: Sat, 19 Feb 2011 23:44:42 -0600
Message-ID: <1298180684-6261-6-git-send-email-olof@lixom.net>
References: <1298180684-6261-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298180684-6261-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the 3 sdhci devices that are available on Harmony as
platform devices. Two go to slots (one 4-lane, one 8-lane),
and one goes to onboard wifi.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony.c |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index 076182f..72952d4 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -31,10 +31,13 @@
 #include <mach/iomap.h>
 #include <mach/irqs.h>
 #include <mach/pinmux-t2.h>
+#include <mach/sdhci.h>
 
 #include "board.h"
 #include "board-harmony.h"
 #include "clock.h"
+#include "devices.h"
+#include "gpio-names.h"
 
 static struct plat_serial8250_port debug_uart_platform_data[] = {
 	{
@@ -60,6 +63,9 @@ static struct platform_device debug_uart = {
 
 static struct platform_device *harmony_devices[] __initdata = {
 	&debug_uart,
+	&tegra_sdhci_device1,
+	&tegra_sdhci_device2,
+	&tegra_sdhci_device4,
 };
 
 static void __init tegra_harmony_fixup(struct machine_desc *desc,
@@ -89,6 +95,25 @@ struct tegra_pcie_info harmony_pcie_info = {
 	},
 };
 
+static struct tegra_sdhci_platform_data sdhci_pdata1 = {
+	.cd_gpio	= -1,
+	.wp_gpio	= -1,
+	.power_gpio	= -1,
+};
+
+static struct tegra_sdhci_platform_data sdhci_pdata2 = {
+	.cd_gpio	= TEGRA_GPIO_PI5,
+	.wp_gpio	= TEGRA_GPIO_PH1,
+	.power_gpio	= TEGRA_GPIO_PT3,
+};
+
+static struct tegra_sdhci_platform_data sdhci_pdata4 = {
+	.cd_gpio	= TEGRA_GPIO_PH2,
+	.wp_gpio	= TEGRA_GPIO_PH3,
+	.power_gpio	= TEGRA_GPIO_PI6,
+	.is_8bit	= 1,
+};
+
 static void __init tegra_harmony_init(void)
 {
 	tegra_common_init();
@@ -97,6 +122,10 @@ static void __init tegra_harmony_init(void)
 
 	harmony_pinmux_init();
 
+	tegra_sdhci_device1.dev.platform_data = &sdhci_pdata1;
+	tegra_sdhci_device2.dev.platform_data = &sdhci_pdata2;
+	tegra_sdhci_device4.dev.platform_data = &sdhci_pdata4;
+
 	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
 
 	tegra_pcie_init(&harmony_pcie_info);
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
