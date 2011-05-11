From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL 1/3] ARM: tegra: trimslice: register i2c busses and devices
Date: Wed, 11 May 2011 14:07:38 +0300
Message-ID: <afc96d35d332d0293dfb5baf3e1b53045627f6a1.1305105580.git.mike@compulab.co.il>
References: <cover.1305105580.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
In-Reply-To: <cover.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
References: <cover.1305105580.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/board-trimslice.c |   39 +++++++++++++++++++++++++++++++++
 1 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegra/board-trimslice.c
index cda4cfd..dcf5fc5 100644
--- a/arch/arm/mach-tegra/board-trimslice.c
+++ b/arch/arm/mach-tegra/board-trimslice.c
@@ -23,6 +23,8 @@
 #include <linux/platform_device.h>
 #include <linux/serial_8250.h>
 #include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/i2c-tegra.h>
 
 #include <asm/mach-types.h>
 #include <asm/mach/arch.h>
@@ -77,6 +79,41 @@ static struct platform_device *trimslice_devices[] __initdata = {
 	&tegra_sdhci_device4,
 };
 
+static struct tegra_i2c_platform_data trimslice_i2c1_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static struct tegra_i2c_platform_data trimslice_i2c2_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static struct tegra_i2c_platform_data trimslice_i2c3_platform_data = {
+	.bus_clk_rate   = 400000,
+};
+
+static struct i2c_board_info trimslice_i2c3_board_info[] = {
+	{
+		I2C_BOARD_INFO("tlv320aic23", 0x1a),
+	},
+	{
+		I2C_BOARD_INFO("em3027", 0x56),
+	},
+};
+
+static void trimslice_i2c_init(void)
+{
+	tegra_i2c_device1.dev.platform_data = &trimslice_i2c1_platform_data;
+	tegra_i2c_device2.dev.platform_data = &trimslice_i2c2_platform_data;
+	tegra_i2c_device3.dev.platform_data = &trimslice_i2c3_platform_data;
+
+	platform_device_register(&tegra_i2c_device1);
+	platform_device_register(&tegra_i2c_device2);
+	platform_device_register(&tegra_i2c_device3);
+
+	i2c_register_board_info(2, trimslice_i2c3_board_info,
+				ARRAY_SIZE(trimslice_i2c3_board_info));
+}
+
 static void __init tegra_trimslice_fixup(struct machine_desc *desc,
 	struct tag *tags, char **cmdline, struct meminfo *mi)
 {
@@ -112,6 +149,8 @@ static void __init tegra_trimslice_init(void)
 	tegra_sdhci_device4.dev.platform_data = &sdhci_pdata4;
 
 	platform_add_devices(trimslice_devices, ARRAY_SIZE(trimslice_devices));
+
+	trimslice_i2c_init();
 }
 
 MACHINE_START(TRIMSLICE, "trimslice")
-- 
1.7.3.1
