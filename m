From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/6] soc/tegra: pmc: Don't populate soc data until register space is mapped
Date: Tue, 28 Jun 2016 11:38:25 +0100
Message-ID: <1467110308-22126-4-git-send-email-jonathanh@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The public functions exported by the PMC driver use the presence of the
soc data pointer to determine if the PMC device is configured and the
registers can be accessed. However, the soc data is populated before the
PMC register space is mapped and this opens a window where the soc data
pointer is valid but the register space has not yet been mapped which
could lead to a crash. Furthermore, if the mapping of the PMC register
space fails, then the soc data pointer is not cleared and so would
expose a larger window where a crash could occur.

Fix this by initialising the soc data pointer after the PMC register
space has been mapped.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2e031c4ad547..ed2b2c83e4eb 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1540,8 +1540,6 @@ static int __init tegra_pmc_early_init(void)
 			pr_err("failed to get PMC registers\n");
 			return -ENXIO;
 		}
-
-		pmc->soc = match->data;
 	}
 
 	pmc->base = ioremap_nocache(regs.start, resource_size(&regs));
@@ -1553,6 +1551,8 @@ static int __init tegra_pmc_early_init(void)
 	mutex_init(&pmc->powergates_lock);
 
 	if (np) {
+		pmc->soc = match->data;
+
 		/* Create a bit-map of the available and valid partitions */
 		for (i = 0; i < pmc->soc->num_powergates; i++)
 			if (pmc->soc->powergates[i])
-- 
2.1.4
