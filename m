From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 7/8] soc: tegra: pmc: Remove additional check for a valid partition
Date: Thu, 11 Feb 2016 18:03:25 +0000
Message-ID: <1455213806-21871-8-git-send-email-jonathanh@nvidia.com>
References: <1455213806-21871-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455213806-21871-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The function tegra_powergate_is_powered() verifies that the partition
being queried is valid and so there is no need to check this before
calling tegra_powergate_is_powered() in powergate_show(). So remove this
extra check.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/soc/tegra/pmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e75782b47267..8e358dbffaed 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -434,16 +434,18 @@ static struct notifier_block tegra_pmc_restart_handler = {
 static int powergate_show(struct seq_file *s, void *data)
 {
 	unsigned int i;
+	int status;
 
 	seq_printf(s, " powergate powered\n");
 	seq_printf(s, "------------------\n");
 
 	for (i = 0; i < pmc->soc->num_powergates; i++) {
-		if (!pmc->soc->powergates[i])
+		status = tegra_powergate_is_powered(i);
+		if (status < 0)
 			continue;
 
 		seq_printf(s, " %9s %7s\n", pmc->soc->powergates[i],
-			   tegra_powergate_is_powered(i) ? "yes" : "no");
+			   status ? "yes" : "no");
 	}
 
 	return 0;
-- 
2.1.4
