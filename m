From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] soc/tegra: pmc: Avoid usage of uninitialized variable
Date: Thu,  9 Jul 2015 09:59:55 +0200
Message-ID: <1436428795-32000-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Make sure to only drop the reference to the OF node after it's been
successfully obtained.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 1878d4da715d..6b0df8154fa4 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1043,12 +1043,12 @@ void tegra_pmc_init_tsense_reset(struct tegra_pmc *pmc)
 	u32 value, checksum;
 
 	if (!pmc->soc->has_tsense_reset)
-		goto out;
+		return;
 
 	np = of_find_node_by_name(pmc->dev->of_node, "i2c-thermtrip");
 	if (!np) {
 		dev_warn(dev, "i2c-thermtrip node not found, %s.\n", disabled);
-		goto out;
+		return;
 	}
 
 	if (of_property_read_u32(np, "nvidia,i2c-controller-id", &ctrl_id)) {
-- 
2.4.1
