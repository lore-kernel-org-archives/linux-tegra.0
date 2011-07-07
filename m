From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL v3 3/3] ARM: tegra: trimslice: enable USB ports
Date: Thu,  7 Jul 2011 09:04:35 +0300
Message-ID: <1ae2af212056bfb3dbe0420cfe3f055a064667d0.1309955711.git.mike@compulab.co.il>
References: <cover.1309955711.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1309955711.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-trimslice-pinmux.c |    5 ++-
 arch/arm/mach-tegra/board-trimslice.c        |   40 ++++++++++++++++++++++++++
 arch/arm/mach-tegra/board-trimslice.h        |    3 ++
 3 files changed, 47 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-trimslice-pinmux.c b/arch/arm/mach-tegra/board-trimslice-pinmux.c
index 321c610..82646a4 100644
--- a/arch/arm/mach-tegra/board-trimslice-pinmux.c
+++ b/arch/arm/mach-tegra/board-trimslice-pinmux.c
@@ -126,7 +126,7 @@ static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
 	{TEGRA_PINGROUP_SPIH,  TEGRA_MUX_SPI2_ALT,      TEGRA_PUPD_PULL_UP,     TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_UAA,   TEGRA_MUX_ULPI,          TEGRA_PUPD_PULL_UP,     TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_UAB,   TEGRA_MUX_ULPI,          TEGRA_PUPD_PULL_UP,     TEGRA_TRI_TRISTATE},
-	{TEGRA_PINGROUP_UAC,   TEGRA_MUX_RSVD2,         TEGRA_PUPD_NORMAL,      TEGRA_TRI_TRISTATE},
+	{TEGRA_PINGROUP_UAC,   TEGRA_MUX_RSVD2,         TEGRA_PUPD_NORMAL,      TEGRA_TRI_NORMAL},
 	{TEGRA_PINGROUP_UAD,   TEGRA_MUX_IRDA,          TEGRA_PUPD_PULL_UP,     TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_UCA,   TEGRA_MUX_UARTC,         TEGRA_PUPD_PULL_UP,     TEGRA_TRI_TRISTATE},
 	{TEGRA_PINGROUP_UCB,   TEGRA_MUX_UARTC,         TEGRA_PUPD_PULL_UP,     TEGRA_TRI_TRISTATE},
@@ -145,6 +145,9 @@ static __initdata struct tegra_pingroup_config trimslice_pinmux[] = {
 static struct tegra_gpio_table gpio_table[] = {
 	{ .gpio = TRIMSLICE_GPIO_SD4_CD, .enable = true	}, /* mmc4 cd */
 	{ .gpio = TRIMSLICE_GPIO_SD4_WP, .enable = true	}, /* mmc4 wp */
+
+	{ .gpio = TRIMSLICE_GPIO_USB1_MODE, .enable = true }, /* USB1 mode */
+	{ .gpio = TRIMSLICE_GPIO_USB2_RST,  .enable = true }, /* USB2 PHY rst */
 };
 
 void __init trimslice_pinmux_init(void)
diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
index a19e90b..a8fff42 100644
--- a/arch/arm/mach-tegra/board-trimslice.c
+++ b/arch/arm/mach-tegra/board-trimslice.c
@@ -25,6 +25,8 @@
 #include <linux/io.h>
 #include <linux/i2c.h>
 #include <linux/i2c-tegra.h>
+#include <linux/platform_data/tegra_usb.h>
+#include <linux/gpio.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -32,6 +34,8 @@
 
 #include <mach/iomap.h>
 #include <mach/sdhci.h>
+#include <mach/usb_phy.h>
+#include <mach/gpio.h>
 
 #include "board.h"
 #include "clock.h"
@@ -123,6 +127,41 @@ static void trimslice_i2c_init(void)
 				ARRAY_SIZE(trimslice_i2c3_board_info));
 }
 
+struct tegra_ulpi_config ehci2_phy_config = {
+	.reset_gpio = TRIMSLICE_GPIO_USB2_RST,
+	.clk = "cdev2",
+};
+
+static struct tegra_ehci_platform_data ehci_ulpi_data = {
+	.operating_mode = TEGRA_USB_HOST,
+	.phy_config = &ehci2_phy_config,
+};
+
+static struct tegra_ehci_platform_data ehci_utmi_data = {
+	.operating_mode = TEGRA_USB_HOST,
+};
+
+static void trimslice_usb_init(void)
+{
+	int err;
+
+	tegra_ehci3_device.dev.platform_data = &ehci_utmi_data;
+	platform_device_register(&tegra_ehci3_device);
+
+	tegra_ehci2_device.dev.platform_data = &ehci_ulpi_data;
+	platform_device_register(&tegra_ehci2_device);
+
+	err = gpio_request_one(TRIMSLICE_GPIO_USB1_MODE, GPIOF_OUT_INIT_HIGH,
+			       "usb1mode");
+	if (err) {
+		pr_err("TrimSlice: failed to obtain USB1 mode gpio: %d\n", err);
+		return;
+	}
+
+	tegra_ehci1_device.dev.platform_data = &ehci_utmi_data;
+	platform_device_register(&tegra_ehci1_device);
+}
+
 static void __init tegra_trimslice_fixup(struct machine_desc *desc,
 	struct tag *tags, char **cmdline, struct meminfo *mi)
 {
@@ -164,6 +203,7 @@ static void __init tegra_trimslice_init(void)
 	platform_add_devices(trimslice_devices, ARRAY_SIZE(trimslice_devices));
 
 	trimslice_i2c_init();
+	trimslice_usb_init();
 }
 
 MACHINE_START(TRIMSLICE, "trimslice")
diff --git a/arch/arm/mach-tegra/board-trimslice.h b/arch/arm/mach-tegra/board-trimslice.h
index e8ef629..7a7dee8 100644
--- a/arch/arm/mach-tegra/board-trimslice.h
+++ b/arch/arm/mach-tegra/board-trimslice.h
@@ -20,6 +20,9 @@
 #define TRIMSLICE_GPIO_SD4_CD	TEGRA_GPIO_PP1	/* mmc4 cd */
 #define TRIMSLICE_GPIO_SD4_WP	TEGRA_GPIO_PP2	/* mmc4 wp */
 
+#define TRIMSLICE_GPIO_USB1_MODE	TEGRA_GPIO_PV2 /* USB1 mode */
+#define TRIMSLICE_GPIO_USB2_RST		TEGRA_GPIO_PV0 /* USB2 PHY reset */
+
 void trimslice_pinmux_init(void);
 
 #endif
-- 
1.7.3.1
