From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] dma: tegra: don't open code of_device_get_match_data()
Date: Wed, 2 Mar 2016 19:59:26 +0530
Message-ID: <1456928966-1192-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use of_device_get_match_data() for getting matched data
instead of implementing this locally.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes form V1:
- Found that it is possible to move of_device_id table to down
  where this is used i.e. just above the platform driver structure.
  Make this change on V2.
- Added Acked by from Thierry.

 drivers/dma/tegra20-apb-dma.c | 47 ++++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 935da81..3871f29 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1292,40 +1292,19 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
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
 	struct tegra_dma *tdma;
 	int ret;
 	int i;
-	const struct tegra_dma_chip_data *cdata = NULL;
-	const struct of_device_id *match;
+	const struct tegra_dma_chip_data *cdata;
 
-	match = of_match_device(tegra_dma_of_match, &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Error: No device match found\n");
+	cdata = of_device_get_match_data(&pdev->dev);
+	if (!cdata) {
+		dev_err(&pdev->dev, "Error: No device match data found\n");
 		return -ENODEV;
 	}
-	cdata = match->data;
 
 	tdma = devm_kzalloc(&pdev->dev, sizeof(*tdma) + cdata->nr_channels *
 			sizeof(struct tegra_dma_channel), GFP_KERNEL);
@@ -1612,6 +1591,24 @@ static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
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
