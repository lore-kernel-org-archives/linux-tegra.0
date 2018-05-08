From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] memory: tegra: Register SMMU after MC driver became ready
Date: Tue,  8 May 2018 19:55:30 +0300
Message-ID: <20180508165530.12746-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Memory Controller driver invokes SMMU driver registration and MC's
registers mapping is shared with SMMU. This mapping goes away if MC
driver probing fails after SMMU registration.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/mc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 49dd7ad1459f..22ec959db7d3 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -692,15 +692,6 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_SMMU)) {
-		mc->smmu = tegra_smmu_probe(&pdev->dev, mc->soc->smmu, mc);
-		if (IS_ERR(mc->smmu)) {
-			dev_err(&pdev->dev, "failed to probe SMMU: %ld\n",
-				PTR_ERR(mc->smmu));
-			return PTR_ERR(mc->smmu);
-		}
-	}
-
 	err = tegra_mc_reset_setup(mc);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to register reset controller: %d\n",
@@ -726,6 +717,15 @@ static int tegra_mc_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (IS_ENABLED(CONFIG_TEGRA_IOMMU_SMMU)) {
+		mc->smmu = tegra_smmu_probe(&pdev->dev, mc->soc->smmu, mc);
+		if (IS_ERR(mc->smmu)) {
+			dev_err(&pdev->dev, "failed to probe SMMU: %ld\n",
+				PTR_ERR(mc->smmu));
+			return PTR_ERR(mc->smmu);
+		}
+	}
+
 	return 0;
 }
 
-- 
2.17.0
