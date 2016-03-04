From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH ] dmaengine: tegra: Move of_device_id table near to its user
Date: Fri, 4 Mar 2016 15:55:11 +0530
Message-ID: <1457087111-15549-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

After using the function of_device_get_match_data(), the
of_device_id table for tegra20 dma is not used by probe()
and hence moving it near to place where platform driver is
defined as this table used only on this data structure.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
As per recommendation on patch
Re: [PATCH V2] dma: tegra: don't open code of_device_get_match_data()
to have movement of code in different patch.

 drivers/dma/tegra20-apb-dma.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index ced588f..3871f29 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1292,25 +1292,6 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
 	.support_separate_wcount_reg = true,
 };
 
-
-static const struct of_device_id tegra_dma_of_match[] = {
-	{
-		.compatible = "nvidia,tegra148-apbdma",
-		.data = &tegra148_dma_chip_data,
-	}, {
-		.compatible = "nvidia,tegra114-apbdma",
-		.data = &tegra114_dma_chip_data,
-	}, {
-		.compatible = "nvidia,tegra30-apbdma",
-		.data = &tegra30_dma_chip_data,
-	}, {
-		.compatible = "nvidia,tegra20-apbdma",
-		.data = &tegra20_dma_chip_data,
-	}, {
-	},
-};
-MODULE_DEVICE_TABLE(of, tegra_dma_of_match);
-
 static int tegra_dma_probe(struct platform_device *pdev)
 {
 	struct resource	*res;
@@ -1610,6 +1591,24 @@ static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_pm_suspend, tegra_dma_pm_resume)
 };
 
+static const struct of_device_id tegra_dma_of_match[] = {
+	{
+		.compatible = "nvidia,tegra148-apbdma",
+		.data = &tegra148_dma_chip_data,
+	}, {
+		.compatible = "nvidia,tegra114-apbdma",
+		.data = &tegra114_dma_chip_data,
+	}, {
+		.compatible = "nvidia,tegra30-apbdma",
+		.data = &tegra30_dma_chip_data,
+	}, {
+		.compatible = "nvidia,tegra20-apbdma",
+		.data = &tegra20_dma_chip_data,
+	}, {
+	},
+};
+MODULE_DEVICE_TABLE(of, tegra_dma_of_match);
+
 static struct platform_driver tegra_dmac_driver = {
 	.driver = {
 		.name	= "tegra-apbdma",
-- 
2.1.4
