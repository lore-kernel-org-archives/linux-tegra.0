From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 3/3] memory: tegra30-emc: Correct error message for timed out auto calibration
Date: Fri, 20 Dec 2019 05:08:49 +0300
Message-ID: <20191220020849.11175-4-digetx@gmail.com>
References: <20191220020849.11175-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191220020849.11175-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The code waits for auto calibration to be finished and not to be disabled.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra30-emc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index 2f91437a5f20..581565591ebe 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -632,8 +632,7 @@ static int emc_prepare_timing_change(struct tegra_emc *emc, unsigned long rate)
 				!(val & EMC_AUTO_CAL_STATUS_ACTIVE), 1, 300);
 			if (err) {
 				dev_err(emc->dev,
-					"failed to disable auto-cal: %d\n",
-					err);
+					"auto-cal finish timeout: %d\n", err);
 				return err;
 			}
 
-- 
2.24.0
