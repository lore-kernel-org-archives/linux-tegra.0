From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 4/6] soc/tegra: pmc: Ensure mutex is always initialised
Date: Tue, 28 Jun 2016 11:38:26 +0100
Message-ID: <1467110308-22126-5-git-send-email-jonathanh@nvidia.com>
References: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467110308-22126-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The mutex used by the PMC driver may not be initialised if early
initialisation of the driver fails. If this does happen, then it could
be possible for callers of the public PMC functions to still attempt to
acquire the mutex. Fix this by initialising the mutex as soon as
possible to ensure it will always be initialised.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index ed2b2c83e4eb..483d54623ec5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1504,6 +1504,8 @@ static int __init tegra_pmc_early_init(void)
 	bool invert;
 	u32 value;
 
+	mutex_init(&pmc->powergates_lock);
+
 	np = of_find_matching_node_and_match(NULL, tegra_pmc_match, &match);
 	if (!np) {
 		/*
@@ -1548,8 +1550,6 @@ static int __init tegra_pmc_early_init(void)
 		return -ENXIO;
 	}
 
-	mutex_init(&pmc->powergates_lock);
-
 	if (np) {
 		pmc->soc = match->data;
 
-- 
2.1.4
