From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 4/6] ARM: tegra: harmony: register sdhci devices
Date: Mon, 21 Feb 2011 13:06:44 -0600
Message-ID: <1298315206-8887-5-git-send-email-olof@lixom.net>
References: <1298315206-8887-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1298315206-8887-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add the 3 sdhci devices that are available on Harmony as
platform devices. Two go to slots (one 4-lane, one 8-lane),
and one goes to onboard wifi.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
index f6ad58b..8059c50 100644
--- a/arch/arm/mach-tegra/board-harmony.c
+++ b/arch/arm/mach-tegra/board-harmony.c
@@ -30,10 +30,14 @@
 
 #include <mach/iomap.h>
 #include <mach/irqs.h>
+#include <mach/pinmux-t2.h>
+#include <mach/sdhci.h>
 
 #include "board.h"
 #include "board-harmony.h"
 #include "clock.h"
+#include "devices.h"
+#include "gpio-names.h"
 
 static struct plat_serial8250_port debug_uart_platform_data[] = {
 	{
@@ -59,6 +63,9 @@ static struct platform_device debug_uart = {
 
 static struct platform_device *harmony_devices[] __initdata = {
 	&debug_uart,
+	&tegra_sdhci_device1,
+	&tegra_sdhci_device2,
+	&tegra_sdhci_device4,
 };
 
 static void __init tegra_harmony_fixup(struct machine_desc *desc,
@@ -85,6 +92,10 @@ static void __init tegra_harmony_init(void)
 
 	harmony_pinmux_init();
 
+	tegra_sdhci_device1.dev.platform_data = &sdhci_pdata1;
+	tegra_sdhci_device2.dev.platform_data = &sdhci_pdata2;
+	tegra_sdhci_device4.dev.platform_data = &sdhci_pdata4;
+
 	platform_add_devices(harmony_devices, ARRAY_SIZE(harmony_devices));
 }
 
-- 
1.7.0.4

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
