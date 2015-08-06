From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/4] DMA: tegra-apb: Remove unnecessary return statements and variables
Date: Thu, 6 Aug 2015 14:32:32 +0100
Message-ID: <1438867953-11378-4-git-send-email-jonathanh@nvidia.com>
References: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some void functions have unnecessary return statements at the end
(reported by sparse) and so remove these. Also remove the return variables
from functions tegra_dma_prep_slave_sg() and tegra_dma_prep_slave_cyclic()
because the value is not used.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 11edcca7619b..53a8075dcec8 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -598,7 +598,6 @@ static void handle_once_dma_done(struct tegra_dma_channel *tdc,
 		return;
 
 	tdc_start_head_req(tdc);
-	return;
 }
 
 static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
@@ -625,7 +624,6 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 		if (!st)
 			dma_desc->dma_status = DMA_ERROR;
 	}
-	return;
 }
 
 static void tegra_dma_tasklet(unsigned long data)
@@ -717,7 +715,6 @@ static void tegra_dma_issue_pending(struct dma_chan *dc)
 	}
 end:
 	spin_unlock_irqrestore(&tdc->lock, flags);
-	return;
 }
 
 static int tegra_dma_terminate_all(struct dma_chan *dc)
@@ -929,7 +926,6 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	struct tegra_dma_sg_req  *sg_req = NULL;
 	u32 burst_size;
 	enum dma_slave_buswidth slave_bw;
-	int ret;
 
 	if (!tdc->config_init) {
 		dev_err(tdc2dev(tdc), "dma channel is not configured\n");
@@ -940,9 +936,8 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 		return NULL;
 	}
 
-	ret = get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
-				&burst_size, &slave_bw);
-	if (ret < 0)
+	if (get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
+				&burst_size, &slave_bw) < 0)
 		return NULL;
 
 	INIT_LIST_HEAD(&req_list);
@@ -1045,7 +1040,6 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 	dma_addr_t mem = buf_addr;
 	u32 burst_size;
 	enum dma_slave_buswidth slave_bw;
-	int ret;
 
 	if (!buf_len || !period_len) {
 		dev_err(tdc2dev(tdc), "Invalid buffer/period len\n");
@@ -1084,12 +1078,10 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		return NULL;
 	}
 
-	ret = get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
-				&burst_size, &slave_bw);
-	if (ret < 0)
+	if (get_transfer_param(tdc, direction, &apb_ptr, &apb_seq, &csr,
+				&burst_size, &slave_bw) < 0)
 		return NULL;
 
-
 	ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
 	ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
 					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
-- 
2.1.4
