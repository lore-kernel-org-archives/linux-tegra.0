From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] soc/tegra: pmc: fix child-node lookup
Date: Wed, 15 Nov 2017 10:44:58 +0100
Message-ID: <20171115094458.31666-1-johan@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix child-node lookup during probe, which ended up searching the whole
device tree depth-first starting at the parent rather than just matching
on its children.

To make things worse, the parent pmc node could end up being prematurely
freed as of_find_node_by_name() drops a reference to its first argument.

Fixes: 3568df3d31d6 ("soc: tegra: Add thermal reset (thermtrip) support to PMC")
Cc: stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>     # 4.0
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 0453ff6839a7..7e9ef3431bea 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1321,7 +1321,7 @@ static void tegra_pmc_init_tsense_reset(struct tegra_pmc *pmc)
 	if (!pmc->soc->has_tsense_reset)
 		return;
 
-	np = of_find_node_by_name(pmc->dev->of_node, "i2c-thermtrip");
+	np = of_get_child_by_name(pmc->dev->of_node, "i2c-thermtrip");
 	if (!np) {
 		dev_warn(dev, "i2c-thermtrip node not found, %s.\n", disabled);
 		return;
-- 
2.15.0
