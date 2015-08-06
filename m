From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/4] DMA: tegra-apb: Remove unused variables
Date: Thu, 6 Aug 2015 14:32:30 +0100
Message-ID: <1438867953-11378-2-git-send-email-jonathanh@nvidia.com>
References: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The callback and callback_param members of the tegra_dma_sg_req structure
are never used. The dma-engine structure, dma_async_tx_descriptor, defines
the same members and these are the ones used by the driver. Therefore,
remove the unused versions from the tegra_dma_sg_req structure.

The half_done member of tegra_dma_channel structure is configured but
never used and so remove it.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index eaf585e8286b..cf8cff7827f0 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -155,7 +155,6 @@ struct tegra_dma_sg_req {
 	int				req_len;
 	bool				configured;
 	bool				last_sg;
-	bool				half_done;
 	struct list_head		node;
 	struct tegra_dma_desc		*dma_desc;
 };
@@ -203,8 +202,6 @@ struct tegra_dma_channel {
 	/* ISR handler and tasklet for bottom half of isr handling */
 	dma_isr_handler		isr_handler;
 	struct tasklet_struct	tasklet;
-	dma_async_tx_callback	callback;
-	void			*callback_param;
 
 	/* Channel-slave specific configuration */
 	unsigned int slave_id;
@@ -1136,7 +1133,6 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		sg_req->ch_regs.apb_seq = apb_seq;
 		sg_req->ch_regs.ahb_seq = ahb_seq;
 		sg_req->configured = false;
-		sg_req->half_done = false;
 		sg_req->last_sg = false;
 		sg_req->dma_desc = dma_desc;
 		sg_req->req_len = len;
-- 
2.1.4
