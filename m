From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v8 11/19] dmaengine: tegra-apb: Remove duplicated pending_sg_req checks
Date: Sun,  9 Feb 2020 19:33:48 +0300
Message-ID: <20200209163356.6439-12-digetx@gmail.com>
References: <20200209163356.6439-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200209163356.6439-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

There are few place in the code which check whether pending_sg_req list is
empty despite of the check already being done. Let's remove the duplicated
checks to keep code clean.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 22b88ccff05d..049e98ae1240 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -504,9 +504,6 @@ static void tdc_start_head_req(struct tegra_dma_channel *tdc)
 {
 	struct tegra_dma_sg_req *sg_req;
 
-	if (list_empty(&tdc->pending_sg_req))
-		return;
-
 	sg_req = list_first_entry(&tdc->pending_sg_req, typeof(*sg_req), node);
 	tegra_dma_start(tdc, sg_req);
 	sg_req->configured = true;
@@ -518,9 +515,6 @@ static void tdc_configure_next_head_desc(struct tegra_dma_channel *tdc)
 {
 	struct tegra_dma_sg_req *hsgreq, *hnsgreq;
 
-	if (list_empty(&tdc->pending_sg_req))
-		return;
-
 	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
 	if (!list_is_last(&hsgreq->node, &tdc->pending_sg_req)) {
 		hnsgreq = list_first_entry(&hsgreq->node, typeof(*hnsgreq),
@@ -567,12 +561,6 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
 {
 	struct tegra_dma_sg_req *hsgreq;
 
-	if (list_empty(&tdc->pending_sg_req)) {
-		dev_err(tdc2dev(tdc), "DMA is running without req\n");
-		tegra_dma_stop(tdc);
-		return false;
-	}
-
 	/*
 	 * Check that head req on list should be in flight.
 	 * If it is not in flight then abort transfer as
-- 
2.24.0
