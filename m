From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 5/5] soc/tegra: pmc: Remove genpd when adding provider fails
Date: Sat, 22 Oct 2016 20:23:56 +0100
Message-ID: <1477164236-29351-6-git-send-email-jonathanh@nvidia.com>
References: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477164236-29351-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 3fe577107ccf ("PM / Domains: Add support for removing PM
domains") add support for removing PM domains. Update the Tegra PMC
driver to remove PM domains if we fail to add a provider for the PM
domain.

Please note that the code under 'power_on_cleanup' label does not
really belong in the clean-up error path for tegra_powergate_add().
To keep the error path simple, remove this label and move the
associated code to where it needs to be invoked.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index b6efb62ad1dd..ec4a33f49ff8 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -834,8 +834,11 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 		goto remove_clks;
 	}
 
-	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS))
-		goto power_on_cleanup;
+	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
+		if (off)
+			WARN_ON(tegra_powergate_power_up(pg, true));
+		goto remove_resets;
+	}
 
 	/*
 	 * FIXME: If XHCI is enabled for Tegra, then power-up the XUSB
@@ -846,8 +849,11 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	 * to be unused.
 	 */
 	if (IS_ENABLED(CONFIG_USB_XHCI_TEGRA) &&
-	    (id == TEGRA_POWERGATE_XUSBA || id == TEGRA_POWERGATE_XUSBC))
-		goto power_on_cleanup;
+	    (id == TEGRA_POWERGATE_XUSBA || id == TEGRA_POWERGATE_XUSBC)) {
+		if (off)
+			WARN_ON(tegra_powergate_power_up(pg, true));
+		goto remove_resets;
+	}
 
 	err = pm_genpd_init(&pg->genpd, NULL, off);
 	if (err < 0) {
@@ -860,16 +866,15 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	if (err < 0) {
 		dev_err(pmc->dev, "failed to add genpd provider for %s: %d\n",
 			np->name, err);
-		goto remove_resets;
+		goto remove_genpd;
 	}
 
 	dev_dbg(pmc->dev, "added power domain %s\n", pg->genpd.name);
 
 	return;
 
-power_on_cleanup:
-	if (off)
-		WARN_ON(tegra_powergate_power_up(pg, true));
+remove_genpd:
+	pm_genpd_remove(&pg->genpd);
 
 remove_resets:
 	while (pg->num_resets--)
-- 
1.9.1
