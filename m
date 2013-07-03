From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 05/11] ARM: tegra114: shut off the CPU rail when the last CPU in suspend
Date: Wed, 3 Jul 2013 17:50:41 +0800
Message-ID: <1372845047-25147-6-git-send-email-josephl@nvidia.com>
References: <1372845047-25147-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1372845047-25147-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

When the last CPU core in suspend, the CPU power rail can be turned off
by setting flags to flow controller. Then the flow controller will inform
PMC to turn off the CPU rail when the last CPU goes into suspend.

Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
V2:
* presumably we need to code the cut off the CRAIL after Tegra114, modify the
  code for that
---
 arch/arm/mach-tegra/flowctrl.h |  5 +++++
 arch/arm/mach-tegra/pmc.c      | 16 +++++++++++++++-
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/flowctrl.h b/arch/arm/mach-tegra/flowctrl.h
index de0acb9..c89aac6 100644
--- a/arch/arm/mach-tegra/flowctrl.h
+++ b/arch/arm/mach-tegra/flowctrl.h
@@ -35,6 +35,11 @@
 #define FLOW_CTRL_CPU0_CSR		0x8
 #define	FLOW_CTRL_CSR_INTR_FLAG		(1 << 15)
 #define FLOW_CTRL_CSR_EVENT_FLAG	(1 << 14)
+#define FLOW_CTRL_CSR_ENABLE_EXT_CRAIL	(1 << 13)
+#define FLOW_CTRL_CSR_ENABLE_EXT_NCPU	(1 << 12)
+#define FLOW_CTRL_CSR_ENABLE_EXT_MASK ( \
+		FLOW_CTRL_CSR_ENABLE_EXT_NCPU | \
+		FLOW_CTRL_CSR_ENABLE_EXT_CRAIL)
 #define FLOW_CTRL_CSR_ENABLE		(1 << 0)
 #define FLOW_CTRL_HALT_CPU1_EVENTS	0x14
 #define FLOW_CTRL_CPU1_CSR		0x18
diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
index eb3fa4a..8345fcd 100644
--- a/arch/arm/mach-tegra/pmc.c
+++ b/arch/arm/mach-tegra/pmc.c
@@ -21,6 +21,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 
+#include "flowctrl.h"
 #include "fuse.h"
 #include "pm.h"
 #include "pmc.h"
@@ -195,13 +196,26 @@ enum tegra_suspend_mode tegra_pmc_get_suspend_mode(void)
 
 void tegra_pmc_pm_set(enum tegra_suspend_mode mode)
 {
-	u32 reg;
+	u32 reg, csr_reg;
 	unsigned long rate = 0;
 
 	reg = tegra_pmc_readl(PMC_CTRL);
 	reg |= TEGRA_POWER_CPU_PWRREQ_OE;
 	reg &= ~TEGRA_POWER_EFFECT_LP0;
 
+	switch (tegra_chip_id) {
+	case TEGRA20:
+	case TEGRA30:
+		break;
+	default:
+		/* Turn off CRAIL */
+		csr_reg = flowctrl_read_cpu_csr(0);
+		csr_reg &= ~FLOW_CTRL_CSR_ENABLE_EXT_MASK;
+		csr_reg |= FLOW_CTRL_CSR_ENABLE_EXT_CRAIL;
+		flowctrl_write_cpu_csr(0, csr_reg);
+		break;
+	}
+
 	switch (mode) {
 	case TEGRA_SUSPEND_LP2:
 		rate = clk_get_rate(tegra_pclk);
-- 
1.8.3.2
