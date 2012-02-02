From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: dt: Explicitly configure all serial ports on Tegra Cardhu
Date: Thu,  2 Feb 2012 12:24:19 -0700
Message-ID: <1328210659-16869-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The ports are used as follows:
UART1/A: Routed to debug dongle
UART2/B: GPS
UART3/C: Bluetooth
UART4/D: Routed to debug dongle
UART5/E: Not connected

The debug dongle has jumpers to connect either UART1/A or UART4/D to
the DB-9 connector. UART1/A is typically used on Cardhu, and is the option
we assume here.

For now, only enable UART1/A, and explicitly disable all other ports.

The explicit disable prevents the message "of_serial 70006040.serial:
no clock-frequency property set" being printed during boot.

Enabling the other ports requires their clocks to be enabled, or accesses
to the registers will hang. At present, this requires adding entries into
board-dt-tegra30.c's tegra_dt_clk_init_table[]. Lets punt on that and wait
for the common clock bindings to set this all up, although that will also
requiring adding clock support to 8250.c.

While we're at it, fix board-dt-tegra30.c to enable the correct clock for
the debug UART. We got away with this before, because the bootloader already
enabled it.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/boot/dts/tegra-cardhu.dts     |   16 ++++++++++++++++
 arch/arm/mach-tegra/board-dt-tegra30.c |    2 +-
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-cardhu.dts b/arch/arm/boot/dts/tegra-cardhu.dts
index 7326350..ac3fb75 100644
--- a/arch/arm/boot/dts/tegra-cardhu.dts
+++ b/arch/arm/boot/dts/tegra-cardhu.dts
@@ -14,6 +14,22 @@
 		clock-frequency = < 408000000 >;
 	};
 
+	serial@70006040 {
+		status = "disable";
+	};
+
+	serial@70006200 {
+		status = "disable";
+	};
+
+	serial@70006300 {
+		status = "disable";
+	};
+
+	serial@70006400 {
+		status = "disable";
+	};
+
 	i2c@7000c000 {
 		clock-frequency = <100000>;
 	};
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 918cbbf..731a231 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -60,7 +60,7 @@ struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 
 static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
 	/* name		parent		rate		enabled */
-	{ "uartd",	"pll_p",	408000000,	true },
+	{ "uarta",	"pll_p",	408000000,	true },
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.0.4
