From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V1 08/12] soc/tegra: pmc: allow support for more tegra wake models
Date: Tue, 21 May 2019 16:31:19 -0700
Message-ID: <1558481483-22254-9-git-send-email-skomatineni@nvidia.com>
References: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558481483-22254-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: jckuo@nvidia.com, talho@nvidia.com, josephl@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch allows to create separate irq_set_wake and irq_set_type
implementations for different tegra designs PMC that has different
wake models which require difference wake registers and different
programming sequence.

AOWAKE model support is available for Tegra186 and Tegra194 only
and it resides within PMC and supports tiered wake architecture.

Tegra210 and prior tegra designs uses PMC directly to receive wake
events and coordinate the wake sequence.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 5648e5c09ef5..f77ce4b827e3 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -235,6 +235,8 @@ struct tegra_pmc_soc {
 	void (*setup_irq_polarity)(struct tegra_pmc *pmc,
 				   struct device_node *np,
 				   bool invert);
+	int (*pmc_irq_set_wake)(struct irq_data *data, unsigned int on);
+	int (*pmc_irq_set_type)(struct irq_data *data, unsigned int type);
 
 	const char * const *reset_sources;
 	unsigned int num_reset_sources;
@@ -1915,12 +1917,15 @@ static const struct irq_domain_ops tegra_pmc_irq_domain_ops = {
 	.alloc = tegra_pmc_irq_alloc,
 };
 
-static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
+static int tegra186_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	unsigned int offset, bit;
 	u32 value;
 
+	if (data->hwirq < 0)
+		return 0;
+
 	offset = data->hwirq / 32;
 	bit = data->hwirq % 32;
 
@@ -1943,12 +1948,12 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
 	return 0;
 }
 
-static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
+static int tegra186_pmc_irq_set_type(struct irq_data *data, unsigned int type)
 {
 	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
 	u32 value;
 
-	if (data->hwirq == ULONG_MAX)
+	if (data->hwirq < 0)
 		return 0;
 
 	value = readl(pmc->wake + WAKE_AOWAKE_CNTRL(data->hwirq));
@@ -1996,8 +2001,10 @@ static int tegra_pmc_irq_init(struct tegra_pmc *pmc)
 	pmc->irq.irq_unmask = irq_chip_unmask_parent;
 	pmc->irq.irq_eoi = irq_chip_eoi_parent;
 	pmc->irq.irq_set_affinity = irq_chip_set_affinity_parent;
-	pmc->irq.irq_set_type = tegra_pmc_irq_set_type;
-	pmc->irq.irq_set_wake = tegra_pmc_irq_set_wake;
+	if (pmc->soc->pmc_irq_set_type)
+		pmc->irq.irq_set_type = pmc->soc->pmc_irq_set_type;
+	if (pmc->soc->pmc_irq_set_wake)
+		pmc->irq.irq_set_wake = pmc->soc->pmc_irq_set_wake;
 
 	pmc->domain = irq_domain_add_hierarchy(parent, 0, 96, pmc->dev->of_node,
 					       &tegra_pmc_irq_domain_ops, pmc);
@@ -2670,6 +2677,8 @@ static const struct tegra_pmc_soc tegra186_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.pmc_irq_set_wake = tegra186_pmc_irq_set_wake,
+	.pmc_irq_set_type = tegra186_pmc_irq_set_type,
 	.reset_sources = tegra186_reset_sources,
 	.num_reset_sources = ARRAY_SIZE(tegra186_reset_sources),
 	.reset_levels = tegra186_reset_levels,
@@ -2748,6 +2757,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
 	.regs = &tegra186_pmc_regs,
 	.init = NULL,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.pmc_irq_set_wake = tegra186_pmc_irq_set_wake,
+	.pmc_irq_set_type = tegra186_pmc_irq_set_type,
 	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
 	.wake_events = tegra194_wake_events,
 };
-- 
2.7.4
