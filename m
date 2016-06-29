From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] dmaengine: tegra-apb: Remove duplicated residue calculation
Date: Wed, 29 Jun 2016 17:08:38 +0100
Message-ID: <1467216519-7200-2-git-send-email-jonathanh@nvidia.com>
References: <1467216519-7200-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467216519-7200-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The calculation of the DMA residue for the Tegra APB DMA is duplicated
in two places in the tegra_dma_tx_status() function. Remove this
duplicated code by moving calculation to the end of the function and
only calculating if we found a valid descriptor.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 0c7defbeefe7..6da9e1032236 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -819,13 +819,8 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 	/* Check on wait_ack desc status */
 	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
 		if (dma_desc->txd.cookie == cookie) {
-			residual =  dma_desc->bytes_requested -
-					(dma_desc->bytes_transferred %
-						dma_desc->bytes_requested);
-			dma_set_residue(txstate, residual);
 			ret = dma_desc->dma_status;
-			spin_unlock_irqrestore(&tdc->lock, flags);
-			return ret;
+			goto found;
 		}
 	}
 
@@ -833,17 +828,22 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 	list_for_each_entry(sg_req, &tdc->pending_sg_req, node) {
 		dma_desc = sg_req->dma_desc;
 		if (dma_desc->txd.cookie == cookie) {
-			residual =  dma_desc->bytes_requested -
-					(dma_desc->bytes_transferred %
-						dma_desc->bytes_requested);
-			dma_set_residue(txstate, residual);
 			ret = dma_desc->dma_status;
-			spin_unlock_irqrestore(&tdc->lock, flags);
-			return ret;
+			goto found;
 		}
 	}
 
 	dev_dbg(tdc2dev(tdc), "cookie %d not found\n", cookie);
+	dma_desc = NULL;
+
+found:
+	if (dma_desc) {
+		residual = dma_desc->bytes_requested -
+			   (dma_desc->bytes_transferred %
+			    dma_desc->bytes_requested);
+		dma_set_residue(txstate, residual);
+	}
+
 	spin_unlock_irqrestore(&tdc->lock, flags);
 	return ret;
 }
-- 
2.1.4
