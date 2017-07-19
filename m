From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 075/102] soc/tegra: pmc: explicitly request exclusive reset control
Date: Wed, 19 Jul 2017 17:26:19 +0200
Message-ID: <20170719152646.25903-76-p.zabel@pengutronix.de>
References: <20170719152646.25903-1-p.zabel@pengutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-1-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
reset lines") started to transition the reset control request API calls
to explicitly state whether the driver needs exclusive or shared reset
control behavior. Convert all drivers requesting exclusive resets to the
explicit API call so the temporary transition helpers can be removed.

No functional changes.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/soc/tegra/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index e233dd5dcab3d..ee2c3482e9242 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -768,7 +768,7 @@ static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
 		return -ENOMEM;
 
 	for (i = 0; i < count; i++) {
-		pg->resets[i] = of_reset_control_get_by_index(np, i);
+		pg->resets[i] = of_reset_control_get_exclusive_by_index(np, i);
 		if (IS_ERR(pg->resets[i])) {
 			err = PTR_ERR(pg->resets[i]);
 			goto error;
-- 
2.11.0
