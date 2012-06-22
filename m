From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] dma: tegra: set DMA_CYCLIC capability
Date: Fri, 22 Jun 2012 17:12:43 +0530
Message-ID: <1340365364-16276-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, dan.j.williams@intel.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra's APB DMA driver support the cyclic mode of data
transfer and hence setting the DMA_CYCLIC caps for dma
channels.

This is require when generic sound dmaengine pcm driver
request for dma channel with CYCLIC capability.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 134ea7c..b4bd50c 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1306,6 +1306,8 @@ static int __devinit tegra_dma_probe(struct platform_device *pdev)
 
 	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
+	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
+
 	tdma->dma_dev.dev = &pdev->dev;
 	tdma->dma_dev.device_alloc_chan_resources =
 					tegra_dma_alloc_chan_resources;
-- 
1.7.1.1
