From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 18/19] dmaengine: tegra-apb: Remove unused function argument
Date: Sun,  9 Feb 2020 19:33:55 +0300
Message-ID: <20200209163356.6439-19-digetx@gmail.com>
References: <20200209163356.6439-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200209163356.6439-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Remove unused function argument from handle_continuous_head_request().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 7b9d59bbd2c1..3e0373b89195 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -553,7 +553,6 @@ static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
 }
 
 static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
-					   struct tegra_dma_sg_req *last_sg_req,
 					   bool to_terminate)
 {
 	struct tegra_dma_sg_req *hsgreq;
@@ -638,7 +637,7 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 	if (!list_is_last(&sgreq->node, &tdc->pending_sg_req)) {
 		list_move_tail(&sgreq->node, &tdc->pending_sg_req);
 		sgreq->configured = false;
-		st = handle_continuous_head_request(tdc, sgreq, to_terminate);
+		st = handle_continuous_head_request(tdc, to_terminate);
 		if (!st)
 			dma_desc->dma_status = DMA_ERROR;
 	}
-- 
2.24.0
