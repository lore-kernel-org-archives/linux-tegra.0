From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/4] soc/tegra: pmc: Add specific error messages for initialising a powergate
Date: Thu, 30 Jun 2016 11:56:24 +0100
Message-ID: <1467284187-13320-2-git-send-email-jonathanh@nvidia.com>
References: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467284187-13320-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When initialising a powergate, only a single error message is shown if
the initialisation fails. Add more error messages to give specific
details of what failed if the initialisation failed and remove the
generic failure message.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1f702538f8ec..df61c85e75c7 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -793,11 +793,13 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 	pg = kzalloc(sizeof(*pg), GFP_KERNEL);
 	if (!pg)
-		goto error;
+		return;
 
 	id = tegra_powergate_lookup(pmc, np->name);
-	if (id < 0)
+	if (id < 0) {
+		dev_err(pmc->dev, "powergate lookup failed for %s\n", np->name);
 		goto free_mem;
+	}
 
 	/*
 	 * Clear the bit for this powergate so it cannot be managed
@@ -813,16 +815,23 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 
 	off = !tegra_powergate_is_powered(pg->id);
 
-	if (tegra_powergate_of_get_clks(pg, np))
+	if (tegra_powergate_of_get_clks(pg, np)) {
+		dev_err(pmc->dev, "failed to get clocks for %s\n", np->name);
 		goto set_available;
+	}
 
-	if (tegra_powergate_of_get_resets(pg, np, off))
+	if (tegra_powergate_of_get_resets(pg, np, off)) {
+		dev_err(pmc->dev, "failed to get resets for %s\n", np->name);
 		goto remove_clks;
+	}
 
 	pm_genpd_init(&pg->genpd, NULL, off);
 
-	if (of_genpd_add_provider_simple(np, &pg->genpd))
+	if (of_genpd_add_provider_simple(np, &pg->genpd)) {
+		dev_err(pmc->dev, "failed to add genpd provider for %s\n",
+			np->name);
 		goto remove_resets;
+	}
 
 	dev_dbg(pmc->dev, "added power domain %s\n", pg->genpd.name);
 
@@ -843,9 +852,6 @@ set_available:
 
 free_mem:
 	kfree(pg);
-
-error:
-	dev_err(pmc->dev, "failed to create power domain for %s\n", np->name);
 }
 
 static void tegra_powergate_init(struct tegra_pmc *pmc)
-- 
2.1.4
