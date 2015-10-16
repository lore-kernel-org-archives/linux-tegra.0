From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 5/6] dmaengine: tegra-apb: Update driver to use GFP_NOWAIT
Date: Fri, 16 Oct 2015 09:25:56 +0100
Message-ID: <1444983957-18691-6-git-send-email-jonathanh@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The tegra20-apb-dma driver currently uses the flag GFP_ATOMIC when
allocating memory for structures used in conjunction with the DMA
descriptors. It is preferred that dmaengine drivers use GFP_NOWAIT
instead and so the emergency memory pool will not be used by these
drivers.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 35723703d4b9..2bfab8d28b53 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -296,7 +296,7 @@ static struct tegra_dma_desc *tegra_dma_desc_get(
 	spin_unlock_irqrestore(&tdc->lock, flags);
 
 	/* Allocate DMA desc */
-	dma_desc = kzalloc(sizeof(*dma_desc), GFP_ATOMIC);
+	dma_desc = kzalloc(sizeof(*dma_desc), GFP_NOWAIT);
 	if (!dma_desc) {
 		dev_err(tdc2dev(tdc), "dma_desc alloc failed\n");
 		return NULL;
@@ -336,7 +336,7 @@ static struct tegra_dma_sg_req *tegra_dma_sg_req_get(
 	}
 	spin_unlock_irqrestore(&tdc->lock, flags);
 
-	sg_req = kzalloc(sizeof(struct tegra_dma_sg_req), GFP_ATOMIC);
+	sg_req = kzalloc(sizeof(struct tegra_dma_sg_req), GFP_NOWAIT);
 	if (!sg_req)
 		dev_err(tdc2dev(tdc), "sg_req alloc failed\n");
 	return sg_req;
-- 
2.1.4
