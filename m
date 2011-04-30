From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2] ARM: Tegra: dt: Set up an OF IRQ translation range
Date: Fri, 29 Apr 2011 22:10:08 -0600
Message-ID: <1304136608-11584-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Without this, none of the devicetree devices in tegra-harmony.dts can
map interrupts, and the system fails to boot.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Add a Tegra-specific compatible value, search by that value, minor
    formatting fixes.

 arch/arm/boot/dts/tegra-harmony.dts |    3 +++
 arch/arm/mach-tegra/board-dt.c      |   14 ++++++++++++++
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/tegra-harmony.dts
index 82fa0c2..a22c1bb 100644
--- a/arch/arm/boot/dts/tegra-harmony.dts
+++ b/arch/arm/boot/dts/tegra-harmony.dts
@@ -25,8 +25,11 @@
 		ranges;
 
 		intc: intc {
+			compatible = "nvidia,tegra250-gic", "arm,gic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			reg = < 0x50041000 0x1000
+			        0x50040100 0x100 >;
 		};
 	};
 
diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
index 0efedb8..fb0d75d 100644
--- a/arch/arm/mach-tegra/board-dt.c
+++ b/arch/arm/mach-tegra/board-dt.c
@@ -22,7 +22,9 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_fdt.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/pda_power.h>
 #include <linux/io.h>
@@ -137,8 +139,20 @@ static struct of_device_id tegra_dt_match_table[] __initdata = {
 	{}
 };
 
+struct of_device_id gic_match[] __initdata = {
+	{ .compatible = "nvidia,tegra250-gic", },
+	{}
+};
+
 static void __init tegra_dt_init(void)
 {
+	struct device_node *node;
+
+	node = of_find_matching_node_by_address(NULL, gic_match,
+						TEGRA_ARM_INT_DIST_BASE);
+	if (node)
+		of_irq_domain_add_simple(node, INT_GIC_BASE, INT_MAIN_NR);
+
 	/*
 	 * Before registering devices; tell Linux about which device nodes
 	 * are intended to be registered so that it doesn't create devices
-- 
1.7.1
