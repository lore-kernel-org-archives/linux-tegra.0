From: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 7/7] clocksource/drivers/integrator-ap: parse the chosen node
Date: Tue, 10 Sep 2019 16:47:16 +0300
Message-ID: <1568123236-767-8-git-send-email-claudiu.beznea@microchip.com>
References: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568123236-767-1-git-send-email-claudiu.beznea@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, nsekhar@ti.com, bgolaszewski@baylibre.com, monstr@monstr.eu, john@phrozen.org, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, lftan@altera.com, tglx@linutronix.de, vgupta@synopsys.com, marc.zyngier@arm.com, patrice.chotard@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net, wahrenst@gmx.net, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, linus.walleij@linaro.org, shc_work@mail.ru, kgene@kernel.org, krzk@kernel.org, ysato@users.sourceforge.jp, liviu.dudau@arm.com, sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, shawnguo@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, nios2-dev@lists.rocketboards.org, linux-snps-arc@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, linux-amlogic@lists.infradead.org, openbmc@lists.ozlabs.org, linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: linux-tegra@vger.kernel.org

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

The driver currently uses aliases to know whether the timer is the
clocksource or the clockevent. Add the /chosen/linux,clocksource and
/chosen/linux,clockevent parsing while keeping backward compatibility.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/clocksource/Kconfig               |  1 +
 drivers/clocksource/timer-integrator-ap.c | 21 ++++++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index a642c23b2fba..e1742c0abb03 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -240,6 +240,7 @@ config KEYSTONE_TIMER
 config INTEGRATOR_AP_TIMER
 	bool "Integrator-ap timer driver" if COMPILE_TEST
 	select CLKSRC_MMIO
+	select TIMER_OF
 	help
 	  Enables support for the Integrator-ap timer.
 
diff --git a/drivers/clocksource/timer-integrator-ap.c b/drivers/clocksource/timer-integrator-ap.c
index 8d6f814ace36..78af89e73125 100644
--- a/drivers/clocksource/timer-integrator-ap.c
+++ b/drivers/clocksource/timer-integrator-ap.c
@@ -14,6 +14,7 @@
 #include <linux/interrupt.h>
 #include <linux/sched_clock.h>
 
+#include "timer-of.h"
 #include "timer-sp.h"
 
 static void __iomem * sched_clk_base;
@@ -160,6 +161,12 @@ static int integrator_clockevent_init(unsigned long inrate,
 	return 0;
 }
 
+static struct timer_of to[] = {
+	{ .flags = TIMER_OF_TYPE_CS, },
+	{ .flags = TIMER_OF_TYPE_CE, },
+	{ /* sentinel */ }
+};
+
 static int __init integrator_ap_timer_init_of(struct device_node *node)
 {
 	const char *path;
@@ -169,6 +176,7 @@ static int __init integrator_ap_timer_init_of(struct device_node *node)
 	struct clk *clk;
 	unsigned long rate;
 	struct device_node *alias_node;
+	struct timer_of *to = node->data;
 
 	base = of_io_request_and_map(node, 0, "integrator-timer");
 	if (IS_ERR(base))
@@ -183,6 +191,17 @@ static int __init integrator_ap_timer_init_of(struct device_node *node)
 	rate = clk_get_rate(clk);
 	writel(0, base + TIMER_CTRL);
 
+	if (timer_of_is_clocksource(to))
+		/* The primary timer lacks IRQ, use as clocksource */
+		return integrator_clocksource_init(rate, base);
+
+	if (timer_of_is_clockevent(to)) {
+		/* The secondary timer will drive the clock event */
+		irq = irq_of_parse_and_map(node, 0);
+		return integrator_clockevent_init(rate, base, irq);
+	}
+
+	/* DT ABI compatibility below */
 	err = of_property_read_string(of_aliases,
 				"arm,timer-primary", &path);
 	if (err) {
@@ -227,4 +246,4 @@ static int __init integrator_ap_timer_init_of(struct device_node *node)
 }
 
 TIMER_OF_DECLARE(integrator_ap_timer, "arm,integrator-timer",
-		       integrator_ap_timer_init_of, NULL);
+		       integrator_ap_timer_init_of, to);
-- 
2.7.4
