From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 11/11] irqchip/gic: Add helper functions for GIC setup and teardown
Date: Tue, 10 May 2016 16:14:45 +0100
Message-ID: <1462893285-13515-12-git-send-email-jonathanh@nvidia.com>
References: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462893285-13515-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Move the code that sets-up a GIC via device-tree into it's own
function and add a generic function for GIC teardown that can be used
for both device-tree and ACPI to unmap the GIC memory.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/irqchip/irq-gic.c | 61 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index 435ff2e1795a..9aec6db6ebe5 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -1190,6 +1190,17 @@ void __init gic_init(unsigned int gic_nr, int irq_start,
 	__gic_init_bases(gic, irq_start, NULL);
 }
 
+static void gic_teardown(struct gic_chip_data *gic)
+{
+	if (WARN_ON(!gic))
+		return;
+
+	if (gic->raw_dist_base)
+		iounmap(gic->raw_dist_base);
+	if (gic->raw_cpu_base)
+		iounmap(gic->raw_cpu_base);
+}
+
 #ifdef CONFIG_OF
 static int gic_cnt __initdata;
 
@@ -1231,6 +1242,30 @@ static bool gic_check_eoimode(struct device_node *node, void __iomem **base)
 	return true;
 }
 
+static int gic_of_setup(struct gic_chip_data *gic, struct device_node *node)
+{
+	if (!gic || !node)
+		return -EINVAL;
+
+	gic->raw_dist_base = of_iomap(node, 0);
+	if (WARN(!gic->raw_dist_base, "unable to map gic dist registers\n"))
+		goto error;
+
+	gic->raw_cpu_base = of_iomap(node, 1);
+	if (WARN(!gic->raw_cpu_base, "unable to map gic cpu registers\n"))
+		goto error;
+
+	if (of_property_read_u32(node, "cpu-offset", &gic->percpu_offset))
+		gic->percpu_offset = 0;
+
+	return 0;
+
+error:
+	gic_teardown(gic);
+
+	return -ENOMEM;
+}
+
 static void __init gic_of_setup_kvm_info(struct device_node *node)
 {
 	int ret;
@@ -1268,15 +1303,9 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 
 	gic = &gic_data[gic_cnt];
 
-	gic->raw_dist_base = of_iomap(node, 0);
-	if (WARN(!gic->raw_dist_base, "unable to map gic dist registers\n"))
-		return -ENOMEM;
-
-	gic->raw_cpu_base = of_iomap(node, 1);
-	if (WARN(!gic->raw_cpu_base, "unable to map gic cpu registers\n")) {
-		iounmap(gic->raw_dist_base);
-		return -ENOMEM;
-	}
+	ret = gic_of_setup(gic, node);
+	if (ret)
+		return ret;
 
 	/*
 	 * Disable split EOI/Deactivate if either HYP is not available
@@ -1285,13 +1314,9 @@ gic_of_init(struct device_node *node, struct device_node *parent)
 	if (gic_cnt == 0 && !gic_check_eoimode(node, &gic->raw_cpu_base))
 		static_key_slow_dec(&supports_deactivate);
 
-	if (of_property_read_u32(node, "cpu-offset", &gic->percpu_offset))
-		gic->percpu_offset = 0;
-
 	ret = __gic_init_bases(gic, -1, &node->fwnode);
 	if (ret) {
-		iounmap(gic->raw_dist_base);
-		iounmap(gic->raw_cpu_base);
+		gic_teardown(gic);
 		return ret;
 	}
 
@@ -1455,7 +1480,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 				     ACPI_GICV2_DIST_MEM_SIZE);
 	if (!gic->raw_dist_base) {
 		pr_err("Unable to map GICD registers\n");
-		iounmap(gic->raw_cpu_base);
+		gic_teardown(gic);
 		return -ENOMEM;
 	}
 
@@ -1473,8 +1498,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 	domain_handle = irq_domain_alloc_fwnode(gic->raw_dist_base);
 	if (!domain_handle) {
 		pr_err("Unable to allocate domain handle\n");
-		iounmap(gic->raw_cpu_base);
-		iounmap(gic->raw_dist_base);
+		gic_teardown(gic);
 		return -ENOMEM;
 	}
 
@@ -1482,8 +1506,7 @@ static int __init gic_v2_acpi_init(struct acpi_subtable_header *header,
 	if (ret) {
 		pr_err("Failed to initialise GIC\n");
 		irq_domain_free_fwnode(domain_handle);
-		iounmap(gic->raw_cpu_base);
-		iounmap(gic->raw_dist_base);
+		gic_teardown(gic);
 		return ret;
 	}
 
-- 
2.1.4
