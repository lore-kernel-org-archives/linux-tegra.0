From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dmaengine: tegra: Remove some whitespace funkiness
Date: Tue, 14 Jun 2016 16:18:46 +0200
Message-ID: <20160614141846.22524-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

There are some places where whitespace is used in very funky ways. Fix
the most serious ones to make the code easier on the eye.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 01e316f73559..80c490faca85 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -484,7 +484,7 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 	 * load new configuration.
 	 */
 	tegra_dma_pause(tdc, false);
-	status  = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
+	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
 
 	/*
 	 * If interrupt is pending then do nothing as the ISR will handle
@@ -905,7 +905,6 @@ static int get_transfer_param(struct tegra_dma_channel *tdc,
 	unsigned long *apb_seq,	unsigned long *csr, unsigned int *burst_size,
 	enum dma_slave_buswidth *slave_bw)
 {
-
 	switch (direction) {
 	case DMA_MEM_TO_DEV:
 		*apb_addr = tdc->dma_sconfig.dst_addr;
@@ -948,8 +947,8 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	struct tegra_dma_desc *dma_desc;
-	unsigned int	    i;
-	struct scatterlist      *sg;
+	unsigned int i;
+	struct scatterlist *sg;
 	unsigned long csr, ahb_seq, apb_ptr, apb_seq;
 	struct list_head req_list;
 	struct tegra_dma_sg_req  *sg_req = NULL;
@@ -1062,7 +1061,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	struct tegra_dma_desc *dma_desc = NULL;
-	struct tegra_dma_sg_req  *sg_req = NULL;
+	struct tegra_dma_sg_req *sg_req = NULL;
 	unsigned long csr, ahb_seq, apb_ptr, apb_seq;
 	int len;
 	size_t remain_len;
@@ -1204,7 +1203,6 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	struct tegra_dma *tdma = tdc->tdma;
-
 	struct tegra_dma_desc *dma_desc;
 	struct tegra_dma_sg_req *sg_req;
 	struct list_head dma_desc_list;
@@ -1305,7 +1303,7 @@ static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
 
 static int tegra_dma_probe(struct platform_device *pdev)
 {
-	struct resource	*res;
+	struct resource *res;
 	struct tegra_dma *tdma;
 	int ret;
 	int i;
-- 
2.8.3
