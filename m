From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] serial: 8250_tegra: Create Tegra specific 8250 driver
Date: Fri, 24 Jan 2020 14:59:40 +0000
Message-ID: <20200124145940.23194-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-serial-owner@vger.kernel.org>
Sender: linux-serial-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jeff Brasen <jbrasen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Jeff Brasen <jbrasen@nvidia.com>

To support booting NVIDIA Tegra platforms with either Device-Tree or
ACPI, create a Tegra specific 8250 serial driver that supports both
firmware types. Another benefit from doing this, is that the Tegra
specific codec in the generic Open Firmware 8250 driver can now be
removed.

Signed-off-by: Jeff Brasen <jbrasen@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Changes since V1:
- Added support for COMPILE_TEST

 drivers/tty/serial/8250/8250_of.c    |  28 ----
 drivers/tty/serial/8250/8250_tegra.c | 197 +++++++++++++++++++++++++++
 drivers/tty/serial/8250/Kconfig      |   9 ++
 drivers/tty/serial/8250/Makefile     |   1 +
 4 files changed, 207 insertions(+), 28 deletions(-)
 create mode 100644 drivers/tty/serial/8250/8250_tegra.c

diff --git a/drivers/tty/serial/8250/8250_of.c b/drivers/tty/serial/8250/8250_of.c
index 531ad67395e0..5e45cf8dbc6e 100644
--- a/drivers/tty/serial/8250/8250_of.c
+++ b/drivers/tty/serial/8250/8250_of.c
@@ -7,7 +7,6 @@
 #include <linux/console.h>
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/delay.h>
 #include <linux/serial_core.h>
 #include <linux/serial_reg.h>
 #include <linux/of_address.h>
@@ -26,28 +25,6 @@ struct of_serial_info {
 	int line;
 };
 
-#ifdef CONFIG_ARCH_TEGRA
-static void tegra_serial_handle_break(struct uart_port *p)
-{
-	unsigned int status, tmout = 10000;
-
-	do {
-		status = p->serial_in(p, UART_LSR);
-		if (status & (UART_LSR_FIFOE | UART_LSR_BRK_ERROR_BITS))
-			status = p->serial_in(p, UART_RX);
-		else
-			break;
-		if (--tmout == 0)
-			break;
-		udelay(1);
-	} while (1);
-}
-#else
-static inline void tegra_serial_handle_break(struct uart_port *port)
-{
-}
-#endif
-
 static int of_8250_rs485_config(struct uart_port *port,
 				  struct serial_rs485 *rs485)
 {
@@ -211,10 +188,6 @@ static int of_platform_serial_setup(struct platform_device *ofdev,
 	port->rs485_config = of_8250_rs485_config;
 
 	switch (type) {
-	case PORT_TEGRA:
-		port->handle_break = tegra_serial_handle_break;
-		break;
-
 	case PORT_RT2880:
 		port->iotype = UPIO_AU;
 		break;
@@ -359,7 +332,6 @@ static const struct of_device_id of_platform_serial_table[] = {
 	{ .compatible = "ns16550",  .data = (void *)PORT_16550, },
 	{ .compatible = "ns16750",  .data = (void *)PORT_16750, },
 	{ .compatible = "ns16850",  .data = (void *)PORT_16850, },
-	{ .compatible = "nvidia,tegra20-uart", .data = (void *)PORT_TEGRA, },
 	{ .compatible = "nxp,lpc3220-uart", .data = (void *)PORT_LPC3220, },
 	{ .compatible = "ralink,rt2880-uart", .data = (void *)PORT_RT2880, },
 	{ .compatible = "intel,xscale-uart", .data = (void *)PORT_XSCALE, },
diff --git a/drivers/tty/serial/8250/8250_tegra.c b/drivers/tty/serial/8250/8250_tegra.c
new file mode 100644
index 000000000000..e639ce833132
--- /dev/null
+++ b/drivers/tty/serial/8250/8250_tegra.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  Serial Port driver for Tegra devices
+ *
+ *  Copyright (c) 2020, NVIDIA CORPORATION. All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/clk.h>
+#include <linux/console.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "8250.h"
+
+struct tegra_uart {
+	struct clk *clk;
+	struct reset_control *rst;
+	int line;
+};
+
+static void tegra_uart_handle_break(struct uart_port *p)
+{
+	unsigned int status, tmout = 10000;
+
+	do {
+		status = p->serial_in(p, UART_LSR);
+		if (status & (UART_LSR_FIFOE | UART_LSR_BRK_ERROR_BITS))
+			status = p->serial_in(p, UART_RX);
+		else
+			break;
+		if (--tmout == 0)
+			break;
+		udelay(1);
+	} while (1);
+}
+
+static int tegra_uart_probe(struct platform_device *pdev)
+{
+	struct uart_8250_port port8250;
+	struct tegra_uart *uart;
+	struct uart_port *port;
+	struct resource *res;
+	int ret;
+
+	uart = devm_kzalloc(&pdev->dev, sizeof(*uart), GFP_KERNEL);
+	if (!uart)
+		return -ENOMEM;
+
+	memset(&port8250, 0, sizeof(port8250));
+
+	port = &port8250.port;
+	spin_lock_init(&port->lock);
+
+	port->flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
+		      UPF_FIXED_TYPE;
+	port->iotype = UPIO_MEM32;
+	port->regshift = 2;
+	port->type = PORT_TEGRA;
+	port->irqflags |= IRQF_SHARED;
+	port->dev = &pdev->dev;
+	port->handle_break = tegra_uart_handle_break;
+
+	ret = of_alias_get_id(pdev->dev.of_node, "serial");
+	if (ret >= 0)
+		port->line = ret;
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0)
+		return ret;
+
+	port->irq = ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	port->membase = devm_ioremap(&pdev->dev, res->start,
+				     resource_size(res));
+	if (!port->membase)
+		return -ENOMEM;
+
+	port->mapbase = res->start;
+	port->mapsize = resource_size(res);
+
+	uart->rst = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+	if (IS_ERR(uart->rst))
+		return PTR_ERR(uart->rst);
+
+	if (device_property_read_u32(&pdev->dev, "clock-frequency",
+				     &port->uartclk)) {
+		uart->clk = devm_clk_get(&pdev->dev, NULL);
+		if (IS_ERR(uart->clk)) {
+			dev_err(&pdev->dev, "failed to get clock!\n");
+			return -ENODEV;
+		}
+
+		ret = clk_prepare_enable(uart->clk);
+		if (ret < 0)
+			return ret;
+
+		port->uartclk = clk_get_rate(uart->clk);
+	}
+
+	ret = reset_control_deassert(uart->rst);
+	if (ret)
+		goto err_clkdisable;
+
+	ret = serial8250_register_8250_port(&port8250);
+	if (ret < 0)
+		goto err_clkdisable;
+
+	platform_set_drvdata(pdev, uart);
+	uart->line = ret;
+
+	return 0;
+
+err_clkdisable:
+	clk_disable_unprepare(uart->clk);
+
+	return ret;
+}
+
+static int tegra_uart_remove(struct platform_device *pdev)
+{
+	struct tegra_uart *uart = platform_get_drvdata(pdev);
+
+	serial8250_unregister_port(uart->line);
+	reset_control_assert(uart->rst);
+	clk_disable_unprepare(uart->clk);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int tegra_uart_suspend(struct device *dev)
+{
+	struct tegra_uart *uart = dev_get_drvdata(dev);
+	struct uart_8250_port *port8250 = serial8250_get_port(uart->line);
+	struct uart_port *port = &port8250->port;
+
+	serial8250_suspend_port(uart->line);
+
+	if (!uart_console(port) || console_suspend_enabled)
+		clk_disable_unprepare(uart->clk);
+
+	return 0;
+}
+
+static int tegra_uart_resume(struct device *dev)
+{
+	struct tegra_uart *uart = dev_get_drvdata(dev);
+	struct uart_8250_port *port8250 = serial8250_get_port(uart->line);
+	struct uart_port *port = &port8250->port;
+
+	if (!uart_console(port) || console_suspend_enabled)
+		clk_prepare_enable(uart->clk);
+
+	serial8250_resume_port(uart->line);
+
+	return 0;
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(tegra_uart_pm_ops, tegra_uart_suspend,
+			 tegra_uart_resume);
+
+static const struct of_device_id tegra_uart_of_match[] = {
+	{ .compatible = "nvidia,tegra20-uart", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tegra_uart_of_match);
+
+static const struct acpi_device_id tegra_uart_acpi_match[] = {
+	{ "NVDA0100", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, tegra_uart_acpi_match);
+
+static struct platform_driver tegra_uart_driver = {
+	.driver = {
+		.name = "tegra-uart",
+		.pm = &tegra_uart_pm_ops,
+		.of_match_table = tegra_uart_of_match,
+		.acpi_match_table = ACPI_PTR(tegra_uart_acpi_match),
+	},
+	.probe = tegra_uart_probe,
+	.remove = tegra_uart_remove,
+};
+
+module_platform_driver(tegra_uart_driver);
+
+MODULE_AUTHOR("Jeff Brasen <jbrasen@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra 8250 Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index f16824bbb573..af0688156dd0 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -500,6 +500,15 @@ config SERIAL_8250_PXA
 	  applicable to both devicetree and legacy boards, and early console is
 	  part of its support.
 
+config SERIAL_8250_TEGRA
+	tristate "8250 support for Tegra serial ports"
+	default SERIAL_8250
+	depends on SERIAL_8250
+	depends on ARCH_TEGRA || COMPILE_TEST
+	help
+	  Select this option if you have machine with an NVIDIA Tegra SoC and
+	  wish to enable 8250 serial driver for the Tegra serial interfaces.
+
 config SERIAL_OF_PLATFORM
 	tristate "Devicetree based probing for 8250 ports"
 	depends on SERIAL_8250 && OF
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 51a6079d3f1f..a8bfb654d490 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -37,6 +37,7 @@ obj-$(CONFIG_SERIAL_8250_INGENIC)	+= 8250_ingenic.o
 obj-$(CONFIG_SERIAL_8250_LPSS)		+= 8250_lpss.o
 obj-$(CONFIG_SERIAL_8250_MID)		+= 8250_mid.o
 obj-$(CONFIG_SERIAL_8250_PXA)		+= 8250_pxa.o
+obj-$(CONFIG_SERIAL_8250_TEGRA)		+= 8250_tegra.o
 obj-$(CONFIG_SERIAL_OF_PLATFORM)	+= 8250_of.o
 
 CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
-- 
2.17.1
