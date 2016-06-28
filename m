From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/6] soc/tegra: pmc: Add missing of_node_put
Date: Tue, 28 Jun 2016 11:38:27 +0100
Message-ID: <1467110308-22126-6-git-send-email-jonathanh@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add missing of_node_put() in PMC early initialisation function.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 483d54623ec5..e62acaef140a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1572,6 +1572,8 @@ static int __init tegra_pmc_early_init(void)
 			value &= ~PMC_CNTRL_INTR_POLARITY;
 
 		tegra_pmc_writel(value, PMC_CNTRL);
+
+		of_node_put(np);
 	}
 
 	return 0;
-- 
2.1.4
