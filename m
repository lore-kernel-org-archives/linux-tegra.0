From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] arm/tegra: Harmony: Configure PMC for low-level interrupts
Date: Wed, 21 Sep 2011 16:10:40 -0600
Message-ID: <1316643040-7998-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Without this, the PMC continually detects an interrupt when the PMU_IRQ
line is high, causing the tps6686x IRQ handler thread to hog an entire
CPU.

This change was originally written by Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> for Seaboard
in the ChromeOS kernel.

Long-term, this should probably be moved into some kind of PMU driver,
or perhaps integrated into the GPIO/IRQ/pinmux system?

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-power.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-power.c b/arch/arm/mach-tegra/board-harmony-power.c
index 5ad8b2f..21d1285 100644
--- a/arch/arm/mach-tegra/board-harmony-power.c
+++ b/arch/arm/mach-tegra/board-harmony-power.c
@@ -18,10 +18,11 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
-
+#include <linux/io.h>
 #include <linux/regulator/machine.h>
 #include <linux/mfd/tps6586x.h>
 
+#include <mach/iomap.h>
 #include <mach/irqs.h>
 
 #include "board-harmony.h"
@@ -113,6 +114,16 @@ static struct i2c_board_info __initdata harmony_regulators[] = {
 
 int __init harmony_regulator_init(void)
 {
+	void __iomem *pmc = IO_ADDRESS(TEGRA_PMC_BASE);
+	u32 pmc_ctrl;
+
+	/*
+	 * Configure the power management controller to trigger PMU
+	 * interrupts when low
+	 */
+	pmc_ctrl = readl(pmc + PMC_CTRL);
+	writel(pmc_ctrl | PMC_CTRL_INTR_LOW, pmc + PMC_CTRL);
+
 	i2c_register_board_info(3, harmony_regulators, 1);
 
 	return 0;
-- 
1.7.0.4
