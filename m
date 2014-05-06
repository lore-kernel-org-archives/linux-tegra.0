From: Christopher Freeman <cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v1 3/3] dma: tegra: avoid int overflow for transferred count
Date: Tue, 6 May 2014 14:22:23 -0700
Message-ID: <1399411343-12222-4-git-send-email-cfreeman@nvidia.com>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399411343-12222-1-git-send-email-cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christopher Freeman <cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

bytes_transferred will overflow during long audio playbacks.  Since
the driver only ever consults this value modulo bytes_requested, store the
value modulo bytes_requested.

Signed-off-by: Christopher Freeman <cfreeman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 094e97d..e1b80a4 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -583,7 +583,9 @@ static void handle_once_dma_done(struct tegra_dma_channel *tdc,
 	tdc->busy = false;
 	sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq), node);
 	dma_desc = sgreq->dma_desc;
-	dma_desc->bytes_transferred += sgreq->req_len;
+	dma_desc->bytes_transferred = (dma_desc->bytes_transferred +
+					sgreq->req_len) %
+					dma_desc->bytes_requested;
 
 	list_del(&sgreq->node);
 	if (sgreq->last_sg) {
@@ -613,7 +615,9 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 
 	sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq), node);
 	dma_desc = sgreq->dma_desc;
-	dma_desc->bytes_transferred += sgreq->req_len;
+	dma_desc->bytes_transferred = (dma_desc->bytes_transferred +
+					sgreq->req_len) %
+					dma_desc->bytes_requested;
 
 	/* Callback need to be call */
 	if (!dma_desc->cb_count)
@@ -762,8 +766,10 @@ static void tegra_dma_terminate_all(struct dma_chan *dc)
 	if (!list_empty(&tdc->pending_sg_req) && was_busy) {
 		sgreq = list_first_entry(&tdc->pending_sg_req,
 					typeof(*sgreq), node);
-		sgreq->dma_desc->bytes_transferred +=
-				get_current_xferred_count(tdc, sgreq, wcount);
+		sgreq->dma_desc->bytes_transferred =
+				(sgreq->dma_desc->bytes_transferred +
+				 get_current_xferred_count(tdc, sgreq, wcount)) %
+				 sgreq->dma_desc->bytes_requested;
 	}
 	tegra_dma_resume(tdc);
 
@@ -838,8 +844,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
 		if (dma_desc->txd.cookie == cookie) {
 			residual =  dma_desc->bytes_requested -
-					(dma_desc->bytes_transferred %
-						dma_desc->bytes_requested);
+					dma_desc->bytes_transferred;
 			dma_set_residue(txstate, residual);
 			ret = dma_desc->dma_status;
 			spin_unlock_irqrestore(&tdc->lock, flags);
@@ -859,8 +864,7 @@ static enum dma_status tegra_dma_tx_status(struct dma_chan *dc,
 						typeof(*first_entry), node);
 
 			residual =  dma_desc->bytes_requested -
-					(dma_desc->bytes_transferred %
-						dma_desc->bytes_requested);
+					dma_desc->bytes_transferred;
 
 			/* hw byte count only applies to current transaction */
 			if (first_entry &&
-- 
1.7.9.5
