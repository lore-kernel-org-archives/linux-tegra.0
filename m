From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7 13/19] dmaengine: tegra-apb: Don't stop cyclic DMA in a case of error condition
Date: Mon,  3 Feb 2020 01:28:48 +0300
Message-ID: <20200202222854.18409-14-digetx@gmail.com>
References: <20200202222854.18409-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200202222854.18409-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no harm in keeping DMA active in the case of error condition,
which should never happen in practice anyways. This will become useful
for the next patch, which will keep RPM enabled only during of DMA
transfer, and thus, it will be much nicer if cyclic DMA handler could
not touch the DMA-enable state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index c7dc27ef1856..50abce608318 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -571,9 +571,7 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
 	 */
 	hsgreq = list_first_entry(&tdc->pending_sg_req, typeof(*hsgreq), node);
 	if (!hsgreq->configured) {
-		tegra_dma_stop(tdc);
-		dev_err(tdc2dev(tdc), "Error in DMA transfer, aborting DMA\n");
-		tegra_dma_abort_all(tdc);
+		dev_err_ratelimited(tdc2dev(tdc), "Error in DMA transfer\n");
 		return false;
 	}
 
@@ -772,7 +770,10 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	if (!list_empty(&tdc->pending_sg_req) && was_busy) {
 		sgreq = list_first_entry(&tdc->pending_sg_req, typeof(*sgreq),
 					 node);
-		sgreq->dma_desc->bytes_transferred +=
+		dma_desc = sgreq->dma_desc;
+
+		if (dma_desc->dma_status != DMA_ERROR)
+			dma_desc->bytes_transferred +=
 				get_current_xferred_count(tdc, sgreq, wcount);
 	}
 	tegra_dma_resume(tdc);
-- 
2.24.0
