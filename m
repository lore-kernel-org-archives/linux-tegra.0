From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] dma: tegra: rename driver and compatible to match with dts
Date: Mon, 2 Jul 2012 13:52:08 +0530
Message-ID: <1341217328-6676-2-git-send-email-ldewangan@nvidia.com>
References: <1341217328-6676-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341217328-6676-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, dan.j.williams@intel.com, swarren@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Rename the compatible name and driver name to match with
tegra dts file and as per clock driver.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index c0836a7..340c617 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1177,10 +1177,10 @@ static struct tegra_dma_chip_data tegra30_dma_chip_data = {
 
 static const struct of_device_id tegra_dma_of_match[] __devinitconst = {
 	{
-		.compatible = "nvidia,tegra30-apbdma-new",
+		.compatible = "nvidia,tegra30-apbdma",
 		.data = &tegra30_dma_chip_data,
 	}, {
-		.compatible = "nvidia,tegra20-apbdma-new",
+		.compatible = "nvidia,tegra20-apbdma",
 		.data = &tegra20_dma_chip_data,
 	}, {
 	},
@@ -1395,7 +1395,7 @@ static const struct dev_pm_ops tegra_dma_dev_pm_ops __devinitconst = {
 
 static struct platform_driver tegra_dmac_driver = {
 	.driver = {
-		.name	= "tegra20-apbdma",
+		.name	= "tegra-apbdma",
 		.owner = THIS_MODULE,
 		.pm	= &tegra_dma_dev_pm_ops,
 		.of_match_table = of_match_ptr(tegra_dma_of_match),
-- 
1.7.1.1
