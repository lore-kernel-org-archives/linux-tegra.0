From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/1] dma: tegra: don't open code of_device_get_match_data()
Date: Tue, 1 Mar 2016 18:54:40 +0530
Message-ID: <1456838680-3220-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, swarren@wwwdotorg.org, thierry.reding@gmail.com
Cc: gnurou@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Use of_device_get_match_data() for getting matched data
instead of implementing this locally.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 935da81..ced588f 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1317,15 +1317,13 @@ static int tegra_dma_probe(struct platform_device *pdev)
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
-- 
2.1.4
