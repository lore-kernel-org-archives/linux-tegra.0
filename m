From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] dmaengine: tegra-apb: Return the actual descriptor status
Date: Wed, 29 Jun 2016 17:08:39 +0100
Message-ID: <1467216519-7200-3-git-send-email-jonathanh@nvidia.com>
References: <1467216519-7200-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467216519-7200-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 71f7e6cc5500 ('dmaengine: tegra20-apb-dma: Only calculate residue
if txstate exists') changed the tegra_dma_tx_status() function to only
calculate the residue if there is a valid 'txstate' pointer for storing
the residue. Although this makes sense, this changed the behaviour of
the function tegra_dma_tx_status() such that if the pointer 'txstate' is
not valid, then we will return whatever state is returned by
dma_cookie_status() and no longer return the state by looking up the DMA
descriptor and returning it's state.

Please note that dma_cookie_status() will either return DMA_COMPLETE or
DMA_IN_PROGRESS. However, if dma_cookie_status() returns DMA_IN_PROGRESS
the actual status could be DMA_ERROR which will only be seen from
checking the descriptor status. Therefore, even if 'txstate' is not
valid, still check to see if there is a valid descriptor for the cookie
in question and if so return the descriptor state. Finally, ensure the
residue is still not calculated if the 'txstate' is not valid.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 6da9e1032236..6ab9eb98588a 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -811,7 +811,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 	unsigned int residual;
 
 	ret = dma_cookie_status(dc, cookie, txstate);
-	if (ret == DMA_COMPLETE || !txstate)
+	if (ret == DMA_COMPLETE)
 		return ret;
 
 	spin_lock_irqsave(&tdc->lock, flags);
@@ -837,7 +837,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 	dma_desc = NULL;
 
 found:
-	if (dma_desc) {
+	if (dma_desc && txstate) {
 		residual = dma_desc->bytes_requested -
 			   (dma_desc->bytes_transferred %
 			    dma_desc->bytes_requested);
-- 
2.1.4
