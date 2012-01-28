From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 2/5] ARM: tegra: paz00: fix wrong UART port on mini-pcie plug
Date: Sat, 28 Jan 2012 20:03:05 +0100
Message-ID: <0a4f8570330c89aadfacfa26fe3466817498705a.1327776641.git.marvin24@gmx.de>
References: <cover.1327776641.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1327776641.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

UARTC is connected to the mini-pcie port.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/boot/dts/tegra-paz00.dts |    4 ++--
 arch/arm/mach-tegra/board-paz00.c |    8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-paz00.dts b/arch/arm/boot/dts/tegra-paz00.dts
index 1e08934..f667343 100644
--- a/arch/arm/boot/dts/tegra-paz00.dts
+++ b/arch/arm/boot/dts/tegra-paz00.dts
@@ -58,11 +58,11 @@
 	};
 
 	serial@70006200 {
-		status = "disable";
+		clock-frequency = <216000000>;
 	};
 
 	serial@70006300 {
-		clock-frequency = <216000000>;
+		status = "disable";
 	};
 
 	serial@70006400 {
diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-paz00.c
index fcf4f37..330afdf 100644
--- a/arch/arm/mach-tegra/board-paz00.c
+++ b/arch/arm/mach-tegra/board-paz00.c
@@ -60,9 +60,9 @@ static struct plat_serial8250_port debug_uart_platform_data[] = {
 		.uartclk	= 216000000,
 	}, {
 		/* serial port on mini-pcie */
-		.membase	= IO_ADDRESS(TEGRA_UARTD_BASE),
-		.mapbase	= TEGRA_UARTD_BASE,
-		.irq		= INT_UARTD,
+		.membase	= IO_ADDRESS(TEGRA_UARTC_BASE),
+		.mapbase	= TEGRA_UARTC_BASE,
+		.irq		= INT_UARTC,
 		.flags		= UPF_BOOT_AUTOCONF | UPF_FIXED_TYPE,
 		.type		= PORT_TEGRA,
 		.iotype		= UPIO_MEM,
@@ -174,7 +174,7 @@ static void __init tegra_paz00_fixup(struct tag *tags, char **cmdline,
 static __initdata struct tegra_clk_init_table paz00_clk_init_table[] = {
 	/* name		parent		rate		enabled */
 	{ "uarta",	"pll_p",	216000000,	true },
-	{ "uartd",	"pll_p",	216000000,	true },
+	{ "uartc",	"pll_p",	216000000,	true },
 
 	{ "pll_p_out4",	"pll_p",	24000000,	true },
 	{ "usbd",	"clk_m",	12000000,	false },
-- 
1.7.5.4
