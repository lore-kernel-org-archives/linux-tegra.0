From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] ARM: tegra: Remove duplicate PMU interrupt inversion code
Date: Wed, 25 Jan 2012 14:43:29 -0700
Message-ID: <1327527809-10179-3-git-send-email-swarren@nvidia.com>
References: <1327527809-10179-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327527809-10179-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The new PMC driver now configures the PMU interrupt inversion, so board
files don't need to poke the PMC registers directly to achieve this.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-harmony-power.c |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/arch/arm/mach-tegra/board-harmony-power.c b/arch/arm/mach-tegra/board-harmony-power.c
index 21d1285..976edfb 100644
--- a/arch/arm/mach-tegra/board-harmony-power.c
+++ b/arch/arm/mach-tegra/board-harmony-power.c
@@ -18,18 +18,13 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/gpio.h>
-#include <linux/io.h>
 #include <linux/regulator/machine.h>
 #include <linux/mfd/tps6586x.h>
 
-#include <mach/iomap.h>
 #include <mach/irqs.h>
 
 #include "board-harmony.h"
 
-#define PMC_CTRL		0x0
-#define PMC_CTRL_INTR_LOW	(1 << 17)
-
 static struct regulator_consumer_supply tps658621_ldo0_supply[] = {
 	REGULATOR_SUPPLY("pex_clk", NULL),
 };
@@ -114,16 +109,6 @@ static struct i2c_board_info __initdata harmony_regulators[] = {
 
 int __init harmony_regulator_init(void)
 {
-	void __iomem *pmc = IO_ADDRESS(TEGRA_PMC_BASE);
-	u32 pmc_ctrl;
-
-	/*
-	 * Configure the power management controller to trigger PMU
-	 * interrupts when low
-	 */
-	pmc_ctrl = readl(pmc + PMC_CTRL);
-	writel(pmc_ctrl | PMC_CTRL_INTR_LOW, pmc + PMC_CTRL);
-
 	i2c_register_board_info(3, harmony_regulators, 1);
 
 	return 0;
-- 
1.7.0.4
