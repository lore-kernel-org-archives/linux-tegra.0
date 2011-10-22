From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 1/3] ARM: tegra: paz00: add support for the embedded controller
Date: Sat, 22 Oct 2011 22:16:32 +0200
Message-ID: <b5f0dc6e7996a21d4493f8e7765e322fe6d8b7ef.1319313020.git.marvin24@gmx.de>
References: <cover.1319313019.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1319313019.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1319313019.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1319313019.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This adds support for the embedded controller known as NVEC. The driver
lives currently in the staging tree and we aim to promote it one level
higher in the near future.

The NVEC driver uses the I2C resources of the master controller for now
until slave support is added to the i2c-tegra driver.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/mach-tegra/board-paz00-pinmux.c |    1 +
 arch/arm/mach-tegra/board-paz00.c        |   11 +++++++++++
 arch/arm/mach-tegra/board-paz00.h        |    3 +++
 3 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-paz00-pinmux.c b/arch/arm/mach-tegra/board-paz00-pinmux.c
index fb20894..0a0e27a 100644
--- a/arch/arm/mach-tegra/board-paz00-pinmux.c
+++ b/arch/arm/mach-tegra/board-paz00-pinmux.c
@@ -154,6 +154,7 @@ static struct tegra_gpio_table gpio_table[] = {
 	{ .gpio = TEGRA_WIFI_PWRN,	.enable = true },
 	{ .gpio = TEGRA_WIFI_RST,	.enable = true },
 	{ .gpio = TEGRA_WIFI_LED,	.enable = true },
+	{ .gpio = TEGRA_NVEC_REQ,	.enable = true },
 };
 
 void paz00_pinmux_init(void)
diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index 602f8dd..3f46b37 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -44,6 +44,8 @@
 #include "devices.h"
 #include "gpio-names.h"
 
+#include "../../../drivers/staging/nvec/nvec.h"
+
 static struct plat_serial8250_port debug_uart_platform_data[] = {
 	{
 		/* serial port on JP1 */
@@ -114,6 +116,11 @@ static struct platform_device leds_gpio = {
         },
 };
 
+static struct nvec_platform_data nvec_pdata = {
+	.i2c_addr	= 0x8a,
+	.gpio		= TEGRA_NVEC_REQ,
+};
+
 static struct platform_device *paz00_devices[] __initdata = {
 	&debug_uart,
 	&tegra_sdhci_device4,
@@ -127,6 +134,10 @@ static void paz00_i2c_init(void)
 	platform_device_register(&tegra_i2c_device1);
 	platform_device_register(&tegra_i2c_device2);
 	platform_device_register(&tegra_i2c_device4);
+
+	tegra_i2c_device3.name = "nvec";
+	tegra_i2c_device3.dev.platform_data = &nvec_pdata;
+	platform_device_register(&tegra_i2c_device3);
 }
 
 static void paz00_usb_init(void)
diff --git a/arch/arm/mach-tegra/board-paz00.h b/arch/arm/mach-tegra/board-paz00.h
index 2dc1899..7e978f3 100644
--- a/arch/arm/mach-tegra/board-paz00.h
+++ b/arch/arm/mach-tegra/board-paz00.h
@@ -32,6 +32,9 @@
 #define TEGRA_WIFI_RST		TEGRA_GPIO_PD1
 #define TEGRA_WIFI_LED		TEGRA_GPIO_PD0
 
+/* EC */
+#define TEGRA_NVEC_REQ		TEGRA_GPIO_PV2
+
 void paz00_pinmux_init(void);
 
 #endif
-- 
1.7.5.4
