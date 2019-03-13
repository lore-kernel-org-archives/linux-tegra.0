From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 2/2] dmaengine: tegra210-adma: update system sleep callbacks
Date: Wed, 13 Mar 2019 17:02:37 +0530
Message-ID: <1552476757-22360-2-git-send-email-spujar@nvidia.com>
References: <1552476757-22360-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552476757-22360-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dan.j.williams@intel.com, vkoul@kernel.org
Cc: treding@nvidia.com, jonathanh@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If the driver is active till late suspend, where runtime PM cannot run,
force suspend is essential in such case to put the device in low power
state. Thus pm_runtime_force_suspend and pm_runtime_force_resume are
used as system sleep callbacks during system wide PM transitions.
Late system sleep callbacks are used to ensure, for instance, that the
sound core has suspended any on-going activity, including stopping the
ADMA if active, before we attempt to suspend the ADMA.

Suggested-by: Jonathan Hunter <jonathanh@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/dma/tegra210-adma.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 650cd9c..253d312 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -796,17 +796,11 @@ static int tegra_adma_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int tegra_adma_pm_suspend(struct device *dev)
-{
-	return pm_runtime_suspended(dev) == false;
-}
-#endif
-
 static const struct dev_pm_ops tegra_adma_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_adma_runtime_suspend,
 			   tegra_adma_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(tegra_adma_pm_suspend, NULL)
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				     pm_runtime_force_resume)
 };
 
 static struct platform_driver tegra_admac_driver = {
-- 
2.7.4
