From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 3/3] ARM: tegra: Initialize flow controller from DT
Date: Tue, 26 Aug 2014 08:14:04 +0200
Message-ID: <1409033644-24376-3-git-send-email-thierry.reding@gmail.com>
References: <1409033644-24376-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409033644-24376-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Use a matching device tree node to initialize the flow controller driver
instead of hard-coding the I/O address. This is necessary to get rid of
the iomap.h include, which in turn make it easier to share this code
with 64-bit Tegra SoCs.

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes in v2:
- implement fallback when the device tree node is missing
- while at it, reorder includes alphabetically

 arch/arm/mach-tegra/flowctrl.c | 44 +++++++++++++++++++++++++++++++++++-------
 arch/arm/mach-tegra/flowctrl.h |  2 ++
 arch/arm/mach-tegra/tegra.c    |  2 ++
 3 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctrl.c
index ec55d1de1b55..475e783992fd 100644
--- a/arch/arm/mach-tegra/flowctrl.c
+++ b/arch/arm/mach-tegra/flowctrl.c
@@ -22,11 +22,12 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
 
 #include <soc/tegra/fuse.h>
 
 #include "flowctrl.h"
-#include "iomap.h"
 
 static u8 flowctrl_offset_halt_cpu[] = {
 	FLOW_CTRL_HALT_CPU0_EVENTS,
@@ -42,23 +43,22 @@ static u8 flowctrl_offset_cpu_csr[] = {
 	FLOW_CTRL_CPU1_CSR + 16,
 };
 
+static void __iomem *tegra_flowctrl_base;
+
 static void flowctrl_update(u8 offset, u32 value)
 {
-	void __iomem *addr = IO_ADDRESS(TEGRA_FLOW_CTRL_BASE) + offset;
-
-	writel(value, addr);
+	writel(value, tegra_flowctrl_base + offset);
 
 	/* ensure the update has reached the flow controller */
 	wmb();
-	readl_relaxed(addr);
+	readl_relaxed(tegra_flowctrl_base + offset);
 }
 
 u32 flowctrl_read_cpu_csr(unsigned int cpuid)
 {
 	u8 offset = flowctrl_offset_cpu_csr[cpuid];
-	void __iomem *addr = IO_ADDRESS(TEGRA_FLOW_CTRL_BASE) + offset;
 
-	return readl(addr);
+	return readl(tegra_flowctrl_base + offset);
 }
 
 void flowctrl_write_cpu_csr(unsigned int cpuid, u32 value)
@@ -139,3 +139,33 @@ void flowctrl_cpu_suspend_exit(unsigned int cpuid)
 	reg |= FLOW_CTRL_CSR_EVENT_FLAG;		/* clear event */
 	flowctrl_write_cpu_csr(cpuid, reg);
 }
+
+static const struct of_device_id matches[] __initconst = {
+	{ .compatible = "nvidia,tegra124-flowctrl" },
+	{ .compatible = "nvidia,tegra114-flowctrl" },
+	{ .compatible = "nvidia,tegra30-flowctrl" },
+	{ .compatible = "nvidia,tegra20-flowctrl" },
+	{ }
+};
+
+void __init tegra_flowctrl_init(void)
+{
+	/* hardcoded fallback if device tree node is missing */
+	unsigned long base = 0x60007000;
+	unsigned long size = SZ_4K;
+	struct device_node *np;
+
+	np = of_find_matching_node(NULL, matches);
+	if (np) {
+		struct resource res;
+
+		if (of_address_to_resource(np, 0, &res) == 0) {
+			size = resource_size(&res);
+			base = res.start;
+		}
+
+		of_node_put(np);
+	}
+
+	tegra_flowctrl_base = ioremap_nocache(base, size);
+}
diff --git a/arch/arm/mach-tegra/flowctrl.h b/arch/arm/mach-tegra/flowctrl.h
index c89aac60a143..73a9c5016c1a 100644
--- a/arch/arm/mach-tegra/flowctrl.h
+++ b/arch/arm/mach-tegra/flowctrl.h
@@ -59,6 +59,8 @@ void flowctrl_write_cpu_halt(unsigned int cpuid, u32 value);
 
 void flowctrl_cpu_suspend_enter(unsigned int cpuid);
 void flowctrl_cpu_suspend_exit(unsigned int cpuid);
+
+void tegra_flowctrl_init(void);
 #endif
 
 #endif
diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
index 5ef5173dec83..ef016af1c9e7 100644
--- a/arch/arm/mach-tegra/tegra.c
+++ b/arch/arm/mach-tegra/tegra.c
@@ -48,6 +48,7 @@
 #include "board.h"
 #include "common.h"
 #include "cpuidle.h"
+#include "flowctrl.h"
 #include "iomap.h"
 #include "irq.h"
 #include "pm.h"
@@ -74,6 +75,7 @@ static void __init tegra_init_early(void)
 {
 	of_register_trusted_foundations();
 	tegra_cpu_reset_handler_init();
+	tegra_flowctrl_init();
 }
 
 static void __init tegra_dt_init_irq(void)
-- 
2.0.4
