From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 REPOST3] dma: tegra: add support for Tegra148/124
Date: Mon,  6 Jan 2014 11:16:45 -0700
Message-ID: <1389032205-2503-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Kunal Agrawal <kunala-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra148 introduces a few changes to the APB DMA HW registers. Update the
driver to cope with them. Tegra124 inherits these changes.

* The register address stride between DMA channels increases.

* A new per-channel WCOUNT register is introduced.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Kunal Agrawal <kunala-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
[swarren, remove .dts file change, rewrote commit description, removed
some duplicate/unused code and register IO]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v3:
* Remove some unnecessary parentheses.
v2:
* Remove some unused #defines that had incorrect names or values.
* Remove unnecessary initialization of wcount local variable.

This can be applied directly to the usual dmaengine branch; I've checked
it doesn't conflict with the patches going through other trees which
convert the driver to use the standard reset framework, or implement a
DT DMA provider.
---
 drivers/dma/tegra20-apb-dma.c | 62 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index d11bb3620f27..03ad64ecaaf0 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -100,6 +100,11 @@
 #define TEGRA_APBDMA_APBSEQ_DATA_SWAP		BIT(27)
 #define TEGRA_APBDMA_APBSEQ_WRAP_WORD_1		(1 << 16)
 
+/* Tegra148 specific registers */
+#define TEGRA_APBDMA_CHAN_WCOUNT		0x20
+
+#define TEGRA_APBDMA_CHAN_WORD_TRANSFER		0x24
+
 /*
  * If any burst is in flight and DMA paused then this is the time to complete
  * on-flight burst and update DMA status register.
@@ -109,21 +114,22 @@
 /* Channel base address offset from APBDMA base address */
 #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
 
-/* DMA channel register space size */
-#define TEGRA_APBDMA_CHANNEL_REGISTER_SIZE	0x20
-
 struct tegra_dma;
 
 /*
  * tegra_dma_chip_data Tegra chip specific DMA data
  * @nr_channels: Number of channels available in the controller.
+ * @channel_reg_size: Channel register size/stride.
  * @max_dma_count: Maximum DMA transfer count supported by DMA controller.
  * @support_channel_pause: Support channel wise pause of dma.
+ * @support_separate_wcount_reg: Support separate word count register.
  */
 struct tegra_dma_chip_data {
 	int nr_channels;
+	int channel_reg_size;
 	int max_dma_count;
 	bool support_channel_pause;
+	bool support_separate_wcount_reg;
 };
 
 /* DMA channel registers */
@@ -133,6 +139,7 @@ struct tegra_dma_channel_regs {
 	unsigned long	apb_ptr;
 	unsigned long	ahb_seq;
 	unsigned long	apb_seq;
+	unsigned long	wcount;
 };
 
 /*
@@ -426,6 +433,8 @@ static void tegra_dma_start(struct tegra_dma_channel *tdc,
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, ch_regs->apb_ptr);
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBSEQ, ch_regs->ahb_seq);
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, ch_regs->ahb_ptr);
+	if (tdc->tdma->chip_data->support_separate_wcount_reg)
+		tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT, ch_regs->wcount);
 
 	/* Start DMA */
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
@@ -465,6 +474,9 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
 	/* Safe to program new configuration */
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, nsg_req->ch_regs.apb_ptr);
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBPTR, nsg_req->ch_regs.ahb_ptr);
+	if (tdc->tdma->chip_data->support_separate_wcount_reg)
+		tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
+						nsg_req->ch_regs.wcount);
 	tdc_write(tdc, TEGRA_APBDMA_CHAN_CSR,
 				nsg_req->ch_regs.csr | TEGRA_APBDMA_CSR_ENB);
 	nsg_req->configured = true;
@@ -718,6 +730,7 @@ static void tegra_dma_terminate_all(struct dma_chan *dc)
 	struct tegra_dma_desc *dma_desc;
 	unsigned long flags;
 	unsigned long status;
+	unsigned long wcount;
 	bool was_busy;
 
 	spin_lock_irqsave(&tdc->lock, flags);
@@ -738,6 +751,10 @@ static void tegra_dma_terminate_all(struct dma_chan *dc)
 		tdc->isr_handler(tdc, true);
 		status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
 	}
+	if (tdc->tdma->chip_data->support_separate_wcount_reg)
+		wcount = tdc_read(tdc, TEGRA_APBDMA_CHAN_WORD_TRANSFER);
+	else
+		wcount = status;
 
 	was_busy = tdc->busy;
 	tegra_dma_stop(tdc);
@@ -746,7 +763,7 @@ static void tegra_dma_terminate_all(struct dma_chan *dc)
 		sgreq = list_first_entry(&tdc->pending_sg_req,
 					typeof(*sgreq), node);
 		sgreq->dma_desc->bytes_transferred +=
-				get_current_xferred_count(tdc, sgreq, status);
+				get_current_xferred_count(tdc, sgreq, wcount);
 	}
 	tegra_dma_resume(tdc);
 
@@ -908,6 +925,17 @@ static int get_transfer_param(struct tegra_dma_channel *tdc,
 	return -EINVAL;
 }
 
+static void tegra_dma_prep_wcount(struct tegra_dma_channel *tdc,
+	struct tegra_dma_channel_regs *ch_regs, u32 len)
+{
+	u32 len_field = (len - 4) & 0xFFFC;
+
+	if (tdc->tdma->chip_data->support_separate_wcount_reg)
+		ch_regs->wcount = len_field;
+	else
+		ch_regs->csr |= len_field;
+}
+
 static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
 	enum dma_transfer_direction direction, unsigned long flags,
@@ -991,7 +1019,8 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 
 		sg_req->ch_regs.apb_ptr = apb_ptr;
 		sg_req->ch_regs.ahb_ptr = mem;
-		sg_req->ch_regs.csr = csr | ((len - 4) & 0xFFFC);
+		sg_req->ch_regs.csr = csr;
+		tegra_dma_prep_wcount(tdc, &sg_req->ch_regs, len);
 		sg_req->ch_regs.apb_seq = apb_seq;
 		sg_req->ch_regs.ahb_seq = ahb_seq;
 		sg_req->configured = false;
@@ -1120,7 +1149,8 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		ahb_seq |= get_burst_size(tdc, burst_size, slave_bw, len);
 		sg_req->ch_regs.apb_ptr = apb_ptr;
 		sg_req->ch_regs.ahb_ptr = mem;
-		sg_req->ch_regs.csr = csr | ((len - 4) & 0xFFFC);
+		sg_req->ch_regs.csr = csr;
+		tegra_dma_prep_wcount(tdc, &sg_req->ch_regs, len);
 		sg_req->ch_regs.apb_seq = apb_seq;
 		sg_req->ch_regs.ahb_seq = ahb_seq;
 		sg_req->configured = false;
@@ -1234,27 +1264,45 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 /* Tegra20 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra20_dma_chip_data = {
 	.nr_channels		= 16,
+	.channel_reg_size	= 0x20,
 	.max_dma_count		= 1024UL * 64,
 	.support_channel_pause	= false,
+	.support_separate_wcount_reg = false,
 };
 
 /* Tegra30 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
 	.nr_channels		= 32,
+	.channel_reg_size	= 0x20,
 	.max_dma_count		= 1024UL * 64,
 	.support_channel_pause	= false,
+	.support_separate_wcount_reg = false,
 };
 
 /* Tegra114 specific DMA controller information */
 static const struct tegra_dma_chip_data tegra114_dma_chip_data = {
 	.nr_channels		= 32,
+	.channel_reg_size	= 0x20,
 	.max_dma_count		= 1024UL * 64,
 	.support_channel_pause	= true,
+	.support_separate_wcount_reg = false,
+};
+
+/* Tegra148 specific DMA controller information */
+static const struct tegra_dma_chip_data tegra148_dma_chip_data = {
+	.nr_channels		= 32,
+	.channel_reg_size	= 0x40,
+	.max_dma_count		= 1024UL * 64,
+	.support_channel_pause	= true,
+	.support_separate_wcount_reg = true,
 };
 
 
 static const struct of_device_id tegra_dma_of_match[] = {
 	{
+		.compatible = "nvidia,tegra148-apbdma",
+		.data = &tegra148_dma_chip_data,
+	}, {
 		.compatible = "nvidia,tegra114-apbdma",
 		.data = &tegra114_dma_chip_data,
 	}, {
@@ -1348,7 +1396,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 
 		tdc->chan_base_offset = TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET +
-					i * TEGRA_APBDMA_CHANNEL_REGISTER_SIZE;
+					i * cdata->channel_reg_size;
 
 		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
 		if (!res) {
-- 
1.8.1.5
