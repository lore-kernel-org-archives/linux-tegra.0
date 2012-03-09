From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 1/2] tegra: Implement pre-console putc() for fdt warning
Date: Thu,  8 Mar 2012 18:52:56 -0800
Message-ID: <1331261577-21099-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When there is not device tree file available to U-Boot, we panic.
Implement board_pre_console_putc() so that this panic will be displayed
on the serial console.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/cpu/armv7/tegra2/board.c |   58 +++++++++++++++++++++++++++++++++++++
 1 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/arch/arm/cpu/armv7/tegra2/board.c b/arch/arm/cpu/armv7/tegra2/board.c
index 349d50e..4ca1e1f 100644
--- a/arch/arm/cpu/armv7/tegra2/board.c
+++ b/arch/arm/cpu/armv7/tegra2/board.c
@@ -23,9 +23,11 @@
 
 #include <common.h>
 #include <asm/io.h>
+#include <ns16550.h>
 #include "ap20.h"
 #include <asm/arch/clock.h>
 #include <asm/arch/funcmux.h>
+#include <asm/arch/gpio.h>
 #include <asm/arch/sys_proto.h>
 #include <asm/arch/tegra2.h>
 #include <asm/arch/pmc.h>
@@ -37,6 +39,7 @@ enum {
 	UARTA	= 1 << 0,
 	UARTB	= 1 << 1,
 	UARTD	= 1 << 3,
+	UART_ALL = 0xf,
 	UART_COUNT = 4,
 };
 
@@ -149,3 +152,58 @@ void enable_caches(void)
 	dcache_enable();
 }
 #endif
+
+
+/*
+ * Possible UART locations: we ignore UARTC at 0x70006200 and UARTE at
+ * 0x70006400, since we don't have code to init them
+ */
+static u32 uart_reg_addr[] = {
+	NV_PA_APB_UARTA_BASE,
+	NV_PA_APB_UARTB_BASE,
+	NV_PA_APB_UARTD_BASE,
+	0
+};
+
+#ifdef CONFIG_PRE_CONSOLE_PUTC
+/*
+ * This is called when we have no console. About the only reason that this
+ * happen is if we don't have a valid fdt. So we don't know what kind of
+ * Tegra board we are. We blindly try to print a message every which way we
+ * know.
+ */
+void board_pre_console_putc(int ch)
+{
+	int uart_ids = UART_ALL;	/* turn it all on! */
+	u32 *uart_addr;
+	int clock_freq, multiplier, baudrate, divisor;
+
+	/* Try to enable all possible UARTs */
+	setup_uarts(uart_ids);
+
+	/*
+	 * Seaboard has a UART switch on PI3. We might be a Seaboard,
+	 * so flip it!
+	 */
+#ifdef CONFIG_SPI_UART_SWITCH
+	gpio_direction_output(GPIO_PI3, 0);
+#endif
+
+	/*
+	 * Now send the string out all the Tegra UARTs. We don't try all
+	 * possible configurations, but this could be added if required.
+	 */
+	clock_freq = CONFIG_DEFAULT_NS16550_CLK;
+	multiplier = CONFIG_DEFAULT_NS16550_MULT;
+	baudrate = CONFIG_BAUDRATE;
+	divisor = (clock_freq + (baudrate * (multiplier / 2))) /
+			(multiplier * baudrate);
+
+	for (uart_addr = uart_reg_addr; *uart_addr; uart_addr++) {
+		NS16550_init((NS16550_t)*uart_addr, divisor);
+		NS16550_putc((NS16550_t)*uart_addr, ch);
+		if (ch == '\n')
+			NS16550_putc((NS16550_t)*uart_addr, '\r');
+	}
+}
+#endif
-- 
1.7.7.3
