From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 1/3] soc/tegra: pmc: Initialise power partitions early
Date: Tue, 28 Jun 2016 12:20:42 +0100
Message-ID: <1467112844-26927-2-git-send-email-jonathanh@nvidia.com>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If CONFIG_PM_GENERIC_DOMAINS is not enabled, then power partitions
associated with a device will not be enabled automatically by the PM
core when the device is in use. To avoid situations where a device in
a power partition is to be used but the partition is not enabled,
initialise the power partitions for Tegra early in the boot process and
if CONFIG_PM_GENERIC_DOMAINS is not enabled, then power on all
partitions defined in the device-tree blob.

Note that if CONFIG_PM_GENERIC_DOMAINS is not enabled, after the
partitions are turned on, the clocks and resets used as part of the
sequence for turning on the partition are released again as they are no
longer needed by the PMC driver. Another benefit of this is that this
avoids any issues of sharing resets between the PMC driver and other
device drivers that may wish to independently control a particular
reset.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1f702538f8ec..64678ff2173e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -788,7 +788,7 @@ error:
 static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 {
 	struct tegra_powergate *pg;
-	bool off;
+	bool off, err = true;
 	int id;
 
 	pg = kzalloc(sizeof(*pg), GFP_KERNEL);
@@ -819,6 +819,9 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (tegra_powergate_of_get_resets(pg, np, off))
 		goto remove_clks;
 
+	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS))
+		goto power_on_cleanup;
+
 	pm_genpd_init(&pg->genpd, NULL, off);
 
 	if (of_genpd_add_provider_simple(np, &pg->genpd))
@@ -828,6 +831,11 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 	return;
 
+power_on_cleanup:
+	if (off)
+		WARN_ON(tegra_powergate_power_up(pg, true));
+	err = false;
+
 remove_resets:
 	while (pg->num_resets--)
 		reset_control_put(pg->resets[pg->num_resets]);
@@ -845,14 +853,23 @@ free_mem:
 	kfree(pg);
 
 error:
-	dev_err(pmc->dev, "failed to create power domain for %s\n", np->name);
+	if (err)
+		dev_err(pmc->dev, "failed to configure partition %s\n",
+			np->name);
 }
 
-static void tegra_powergate_init(struct tegra_pmc *pmc)
+static void tegra_powergate_init(struct tegra_pmc *pmc,
+				 struct device_node *parent)
 {
 	struct device_node *np, *child;
+	unsigned int i;
 
-	np = of_get_child_by_name(pmc->dev->of_node, "powergates");
+	/* Create a bit-map of the available and valid partitions */
+	for (i = 0; i < pmc->soc->num_powergates; i++)
+		if (pmc->soc->powergates[i])
+			set_bit(i, pmc->powergates_available);
+
+	np = of_get_child_by_name(parent, "powergates");
 	if (!np)
 		return;
 
@@ -1273,8 +1290,6 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	tegra_powergate_init(pmc);
-
 	mutex_lock(&pmc->powergates_lock);
 	iounmap(pmc->base);
 	pmc->base = base;
@@ -1508,7 +1523,6 @@ static int __init tegra_pmc_early_init(void)
 	const struct of_device_id *match;
 	struct device_node *np;
 	struct resource regs;
-	unsigned int i;
 	bool invert;
 	u32 value;
 
@@ -1563,10 +1577,7 @@ static int __init tegra_pmc_early_init(void)
 	if (np) {
 		pmc->soc = match->data;
 
-		/* Create a bit-map of the available and valid partitions */
-		for (i = 0; i < pmc->soc->num_powergates; i++)
-			if (pmc->soc->powergates[i])
-				set_bit(i, pmc->powergates_available);
+		tegra_powergate_init(pmc, np);
 
 		/*
 		 * Invert the interrupt polarity if a PMC device tree node
-- 
2.1.4
