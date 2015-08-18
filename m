From: Jon Hunter <jonathanh@nvidia.com>
Subject: [RFC PATCH 3/7] DMA: tegra-apb: Clean-up and simplify setting up of transfer parameters
Date: Tue, 18 Aug 2015 14:49:11 +0100
Message-ID: <1439905755-25150-4-git-send-email-jonathanh@nvidia.com>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Most of the DMA transfer parameters that are configured for scatter-gather
or cyclic transfers are the same. Therefore, move the setup of common
parameters into the tegra_dma_get_xfer_params() function used for both
scatter-gather and cyclic transfers.

Note that TEGRA_APBDMA_AHBSEQ_WRAP_NONE is defined as 0 and so this setting
can be completely removed.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 53 ++++++++++++++++---------------------------
 1 file changed, 19 insertions(+), 34 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index e552a4efef71..c1eb25075756 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -940,7 +940,8 @@ static inline int get_burst_size(struct tegra_dma_channel *tdc,
 
 static int tegra_dma_get_xfer_params(struct tegra_dma_channel *tdc,
 				     struct tegra_dma_channel_regs *ch_regs,
-				     enum dma_transfer_direction direction)
+				     enum dma_transfer_direction direction,
+				     unsigned int flags)
 {
 	switch (direction) {
 	case DMA_MEM_TO_DEV:
@@ -948,48 +949,32 @@ static int tegra_dma_get_xfer_params(struct tegra_dma_channel *tdc,
 		ch_regs->apb_seq = get_bus_width(tdc,
 					tdc->dma_sconfig.dst_addr_width);
 		ch_regs->csr = TEGRA_APBDMA_CSR_DIR;
-		return 0;
+		break;
 	case DMA_DEV_TO_MEM:
 		ch_regs->apb_ptr = tdc->dma_sconfig.src_addr;
 		ch_regs->apb_seq = get_bus_width(tdc,
 					tdc->dma_sconfig.src_addr_width);
 		ch_regs->csr = 0;
-		return 0;
+		break;
 	default:
 		dev_err(tdc2dev(tdc), "Dma direction is not supported\n");
 		return -EINVAL;
 	}
-	return -EINVAL;
-}
-
-static int tegra_dma_get_xfer_params_sg(struct tegra_dma_channel *tdc,
-					struct tegra_dma_sg_req *sg_req,
-					enum dma_transfer_direction direction,
-					unsigned int flags)
-{
-	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
-	int ret;
-
-	ret = tegra_dma_get_xfer_params(tdc, ch_regs, direction);
-	if (ret < 0)
-		return ret;
 
+	ch_regs->apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
 	ch_regs->ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
-	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
-					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
 	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
 
-	ch_regs->csr |= TEGRA_APBDMA_CSR_ONCE | TEGRA_APBDMA_CSR_FLOW;
+	ch_regs->csr |= TEGRA_APBDMA_CSR_FLOW;
 	ch_regs->csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+
 	if (flags & DMA_PREP_INTERRUPT)
 		ch_regs->csr |= TEGRA_APBDMA_CSR_IE_EOC;
 
-	ch_regs->apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
-
 	return 0;
 }
 
-static int tegra_dma_get_xfer_params_cyclic(struct tegra_dma_channel *tdc,
+static int tegra_dma_get_xfer_params_sg(struct tegra_dma_channel *tdc,
 					struct tegra_dma_sg_req *sg_req,
 					enum dma_transfer_direction direction,
 					unsigned int flags)
@@ -997,23 +982,23 @@ static int tegra_dma_get_xfer_params_cyclic(struct tegra_dma_channel *tdc,
 	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
 	int ret;
 
-	ret = tegra_dma_get_xfer_params(tdc, ch_regs, direction);
+	ret = tegra_dma_get_xfer_params(tdc, ch_regs, direction, flags);
 	if (ret < 0)
 		return ret;
 
-	ch_regs->ahb_seq = TEGRA_APBDMA_AHBSEQ_INTR_ENB;
-	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_WRAP_NONE <<
-					TEGRA_APBDMA_AHBSEQ_WRAP_SHIFT;
-	ch_regs->ahb_seq |= TEGRA_APBDMA_AHBSEQ_BUS_WIDTH_32;
+	ch_regs->csr |= TEGRA_APBDMA_CSR_ONCE;
 
-	ch_regs->csr |= TEGRA_APBDMA_CSR_FLOW;
-	if (flags & DMA_PREP_INTERRUPT)
-		ch_regs->csr |= TEGRA_APBDMA_CSR_IE_EOC;
-	ch_regs->csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
+	return 0;
+}
 
-	ch_regs->apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
+static int tegra_dma_get_xfer_params_cyclic(struct tegra_dma_channel *tdc,
+					struct tegra_dma_sg_req *sg_req,
+					enum dma_transfer_direction direction,
+					unsigned int flags)
+{
+	struct tegra_dma_channel_regs *ch_regs = &sg_req->ch_regs;
 
-	return 0;
+	return tegra_dma_get_xfer_params(tdc, ch_regs, direction, flags);
 }
 
 static void tegra_dma_prep_wcount(struct tegra_dma_channel *tdc,
-- 
2.1.4
