From: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] ARM: tegra: Add support for USB2 port on Seaboard
Date: Wed,  8 Feb 2012 19:24:58 +0800
Message-ID: <1328700298-14408-1-git-send-email-jilin@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

1. ULPI_RESET* is routed to GPIO_PV1, based on schematic file.
2. Reference clock to ULPI PHY is 24MHz. It comes from PLL_P_OUT4.
3. Because PLL_P_OUT4 is assigned to provide clock to ULPI PHY. We use
PLL_C_OUT1 as clock source to SCLK (also update its children like HCLK
and PCLK).
4. Also modify the clock rate of SCLK from 108MHz to 120MHz (copied from
ChromeOs kernel code).

Signed-off-by: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-seaboard.c |    6 ++++++
 arch/arm/mach-tegra/devices.c        |    5 +++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c
index bf13ea3..462ba1d 100644
--- a/arch/arm/mach-tegra/board-seaboard.c
+++ b/arch/arm/mach-tegra/board-seaboard.c
@@ -64,6 +64,11 @@ static struct platform_device debug_uart = {
 
 static __initdata struct tegra_clk_init_table seaboard_clk_init_table[] = {
 	/* name		parent		rate		enabled */
+	{ "pll_p_out4",	"pll_p",	24000000,	true },
+	{ "pll_c_out1",	"pll_c",	120000000,	true },
+	{ "sclk",	"pll_c_out1",	120000000,	true },
+	{ "hclk",	"sclk",		120000000,	true },
+	{ "pclk",	"hclk",		60000000,	true },
 	{ "uartb",	"pll_p",	216000000,	true},
 	{ "uartd",	"pll_p",	216000000,	true},
 	{ "pll_a",	"pll_p_out1",	56448000,	true },
@@ -203,6 +208,7 @@ static int seaboard_ehci_init(void)
 	gpio_set_value(TEGRA_GPIO_USB1, 1);
 
 	platform_device_register(&tegra_ehci1_device);
+	platform_device_register(&tegra_ehci2_device);
 	platform_device_register(&tegra_ehci3_device);
 
 	return 0;
diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devices.c
index 7a2a02d..977716e 100644
--- a/arch/arm/mach-tegra/devices.c
+++ b/arch/arm/mach-tegra/devices.c
@@ -441,8 +441,13 @@ static struct resource tegra_usb3_resources[] = {
 };
 
 static struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config = {
+#ifdef CONFIG_MACH_SEABOARD
+	/* Use GPIO PV1 for phy reset */
+	.reset_gpio = TEGRA_GPIO_PV1,
+#else
 	/* All existing boards use GPIO PV0 for phy reset */
 	.reset_gpio = TEGRA_GPIO_PV0,
+#endif
 	.clk = "cdev2",
 };
 
-- 
1.7.3
