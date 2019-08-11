From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] irqchip/tegra: Clean up coding style
Date: Sun, 11 Aug 2019 21:30:44 +0300
Message-ID: <20190811183044.13925-2-digetx@gmail.com>
References: <20190811183044.13925-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811183044.13925-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Make coding style to conform to the kernel's standard by fixing checkpatch
warnings about "line over 80 characters".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/irqchip/irq-tegra.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
index 14dcacc2ad38..f829a5990dae 100644
--- a/drivers/irqchip/irq-tegra.c
+++ b/drivers/irqchip/irq-tegra.c
@@ -74,7 +74,7 @@ static struct tegra_ictlr_info *lic;
 
 static inline void tegra_ictlr_write_mask(struct irq_data *d, unsigned long reg)
 {
-	void __iomem *base = (void __iomem __force *)d->chip_data;
+	void __iomem *base = lic->base[d->hwirq / 32];
 	u32 mask;
 
 	mask = BIT(d->hwirq % 32);
@@ -142,7 +142,8 @@ static int tegra_ictlr_suspend(void)
 		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
 
 		/* Enable the wakeup sources of ictlr */
-		writel_relaxed(lic->ictlr_wake_mask[i], ictlr + ICTLR_CPU_IER_SET);
+		writel_relaxed(lic->ictlr_wake_mask[i],
+			       ictlr + ICTLR_CPU_IER_SET);
 	}
 	local_irq_restore(flags);
 
@@ -222,7 +223,6 @@ static int tegra_ictlr_domain_alloc(struct irq_domain *domain,
 {
 	struct irq_fwspec *fwspec = data;
 	struct irq_fwspec parent_fwspec;
-	struct tegra_ictlr_info *info = domain->host_data;
 	irq_hw_number_t hwirq;
 	unsigned int i;
 
@@ -235,13 +235,9 @@ static int tegra_ictlr_domain_alloc(struct irq_domain *domain,
 	if (hwirq >= (num_ictlrs * 32))
 		return -EINVAL;
 
-	for (i = 0; i < nr_irqs; i++) {
-		int ictlr = (hwirq + i) / 32;
-
+	for (i = 0; i < nr_irqs; i++)
 		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
-					      &tegra_ictlr_chip,
-					      (void __force *)info->base[ictlr]);
-	}
+					      &tegra_ictlr_chip, NULL);
 
 	parent_fwspec = *fwspec;
 	parent_fwspec.fwnode = domain->parent->fwnode;
@@ -312,7 +308,6 @@ static int __init tegra_ictlr_init(struct device_node *node,
 	     "%pOF: Found %u interrupt controllers in DT; expected %u.\n",
 	     node, num_ictlrs, soc->num_ictlrs);
 
-
 	domain = irq_domain_add_hierarchy(parent_domain, 0, num_ictlrs * 32,
 					  node, &tegra_ictlr_domain_ops,
 					  lic);
-- 
2.22.0
