From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH REPOST] dma: tegra: assume CONFIG_OF
Date: Mon, 11 Mar 2013 16:30:26 -0600
Message-ID: <1363041026-31890-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <djbw-b10kYP2dOMg@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra only supports, and always enables, device tree. Remove all ifdefs
and runtime checks for DT support from the driver.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |   22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index fcee27e..5a0b66c 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1213,7 +1213,6 @@ static const struct tegra_dma_chip_data tegra20_dma_chip_data = {
 	.support_channel_pause	= false,
 };
 
-#if defined(CONFIG_OF)
 /* Tegra30 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
 	.nr_channels		= 32,
@@ -1243,7 +1242,6 @@ static const struct of_device_id tegra_dma_of_match[] = {
 	},
 };
 MODULE_DEVICE_TABLE(of, tegra_dma_of_match);
-#endif
 
 static int tegra_dma_probe(struct platform_device *pdev)
 {
@@ -1252,20 +1250,14 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	int ret;
 	int i;
 	const struct tegra_dma_chip_data *cdata = NULL;
+	const struct of_device_id *match;
 
-	if (pdev->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_device(of_match_ptr(tegra_dma_of_match),
-					&pdev->dev);
-		if (!match) {
-			dev_err(&pdev->dev, "Error: No device match found\n");
-			return -ENODEV;
-		}
-		cdata = match->data;
-	} else {
-		/* If no device tree then fallback to tegra20 */
-		cdata = &tegra20_dma_chip_data;
+	match = of_match_device(tegra_dma_of_match, &pdev->dev);
+	if (!match) {
+		dev_err(&pdev->dev, "Error: No device match found\n");
+		return -ENODEV;
 	}
+	cdata = match->data;
 
 	tdma = devm_kzalloc(&pdev->dev, sizeof(*tdma) + cdata->nr_channels *
 			sizeof(struct tegra_dma_channel), GFP_KERNEL);
@@ -1460,7 +1452,7 @@ static struct platform_driver tegra_dmac_driver = {
 		.name	= "tegra-apbdma",
 		.owner = THIS_MODULE,
 		.pm	= &tegra_dma_dev_pm_ops,
-		.of_match_table = of_match_ptr(tegra_dma_of_match),
+		.of_match_table = tegra_dma_of_match,
 	},
 	.probe		= tegra_dma_probe,
 	.remove		= tegra_dma_remove,
-- 
1.7.10.4
