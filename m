From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/5] soc/tegra: pmc: Check return code for pm_genpd_init()
Date: Sat, 22 Oct 2016 20:23:55 +0100
Message-ID: <1477164236-29351-5-git-send-email-jonathanh@nvidia.com>
References: <1477164236-29351-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477164236-29351-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 7eb231c337e0 ("PM / Domains: Convert pm_genpd_init() to return
an error code") updated pm_genpd_init() to return an error code. Update
the Tegra PMC driver to check the return value from pm_genpd_init() and
handle any errors returned.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 8c9797379949..b6efb62ad1dd 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -849,7 +849,12 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	    (id == TEGRA_POWERGATE_XUSBA || id == TEGRA_POWERGATE_XUSBC))
 		goto power_on_cleanup;
 
-	pm_genpd_init(&pg->genpd, NULL, off);
+	err = pm_genpd_init(&pg->genpd, NULL, off);
+	if (err < 0) {
+		dev_err(pmc->dev, "failed to initialise genpd for %s: %d\n",
+			np->name, err);
+		goto remove_resets;
+	}
 
 	err = of_genpd_add_provider_simple(np, &pg->genpd);
 	if (err < 0) {
-- 
1.9.1
