From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] dmaengine: tegra210-adma: Add memcpy support
Date: Tue,  6 Sep 2016 11:42:02 -0700
Message-ID: <c730136b708404e1257eb28bb1dc2cbf13bf6023.1473186743.git.nicoleotsuka@gmail.com>
References: <cover.1473186743.git.nicoleotsuka@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1473186743.git.nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1473186743.git.nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1473186743.git.nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

ADMA supports non-flow controlled Memory-to-Memory direction
transactions. So this patch just adds an initial support for
that. It passed a simple dmatest:
        echo dma1chan0 > /sys/module/dmatest/parameters/channel
	echo 1024 > /sys/module/dmatest/parameters/iterations
	echo 0 > /sys/module/dmatest/parameters/dmatest
	echo 1 > /sys/module/dmatest/parameters/run
	dmesg | grep dmatest
Started 1 threads using dma1chan0
dma1chan0-copy0: summary 1024 tests, 0 failures 2054 iops 16520 KB/s (0)

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra210-adma.c | 105 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 12 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 5b5d298..1a7148d 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -42,9 +42,14 @@
 #define ADMA_CH_CTRL_RX_REQ(val)			(((val) & 0xf) << 24)
 #define ADMA_CH_CTRL_RX_REQ_MAX				10
 #define ADMA_CH_CTRL_DIR(val)				(((val) & 0xf) << 12)
+#define ADMA_CH_CTRL_DIR_MEM2MEM			1
 #define ADMA_CH_CTRL_DIR_AHUB2MEM			2
 #define ADMA_CH_CTRL_DIR_MEM2AHUB			4
-#define ADMA_CH_CTRL_MODE_CONTINUOUS			(2 << 8)
+#define ADMA_CH_CTRL_DIR_AHUB2AHUB			8
+#define ADMA_CH_CTRL_MODE(val)				(((val) & 0x7) << 8)
+#define ADMA_CH_CTRL_MODE_ONCE				1
+#define ADMA_CH_CTRL_MODE_CONTINUOUS			2
+#define ADMA_CH_CTRL_MODE_LINKED_LIST			4
 #define ADMA_CH_CTRL_FLOWCTRL_EN			BIT(1)
 
 #define ADMA_CH_CONFIG					0x28
@@ -264,6 +269,9 @@ static int tegra_adma_request_alloc(struct tegra_adma_chan *tdc,
 		}
 		break;
 
+	case DMA_MEM_TO_MEM:
+		break;
+
 	default:
 		dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
 			 dma_chan_name(&tdc->vc.chan));
@@ -292,6 +300,9 @@ static void tegra_adma_request_free(struct tegra_adma_chan *tdc)
 		clear_bit(tdc->sreq_index, &tdma->rx_requests_reserved);
 		break;
 
+	case DMA_MEM_TO_MEM:
+		break;
+
 	default:
 		dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
 			 dma_chan_name(&tdc->vc.chan));
@@ -409,8 +420,14 @@ static irqreturn_t tegra_adma_isr(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	if (tdc->desc->cyclic)
+	if (tdc->desc->cyclic) {
 		vchan_cyclic_callback(&tdc->desc->vd);
+	} else {
+		/* Disable the channel */
+		tdma_ch_write(tdc, ADMA_CH_CMD, 0);
+		vchan_cookie_complete(&tdc->desc->vd);
+		tdc->desc = NULL;
+	}
 
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
 
@@ -488,42 +505,59 @@ static enum dma_status tegra_adma_tx_status(struct dma_chan *dc,
 static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
 				      struct tegra_adma_desc *desc,
 				      dma_addr_t buf_addr,
+				      dma_addr_t buf_addr2,
 				      enum dma_transfer_direction direction)
 {
 	struct tegra_adma_chan_regs *ch_regs = &desc->ch_regs;
-	unsigned int burst_size, adma_dir;
+	unsigned int num_periods = desc->num_periods;
+	unsigned int burst_size, adma_dir, adma_mode;
 
-	if (desc->num_periods > ADMA_CH_CONFIG_MAX_BUFS)
+	if (num_periods > ADMA_CH_CONFIG_MAX_BUFS)
 		return -EINVAL;
 
 	switch (direction) {
 	case DMA_MEM_TO_DEV:
 		adma_dir = ADMA_CH_CTRL_DIR_MEM2AHUB;
 		burst_size = fls(tdc->sconfig.dst_maxburst);
-		ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(desc->num_periods - 1);
-		ch_regs->ctrl = ADMA_CH_CTRL_TX_REQ(tdc->sreq_index);
+		ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_periods - 1);
+		ch_regs->ctrl = ADMA_CH_CTRL_TX_REQ(tdc->sreq_index) |
+				ADMA_CH_CTRL_FLOWCTRL_EN;
 		ch_regs->src_addr = buf_addr;
 		break;
 
 	case DMA_DEV_TO_MEM:
 		adma_dir = ADMA_CH_CTRL_DIR_AHUB2MEM;
 		burst_size = fls(tdc->sconfig.src_maxburst);
-		ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(desc->num_periods - 1);
-		ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index);
+		ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_periods - 1);
+		ch_regs->ctrl = ADMA_CH_CTRL_RX_REQ(tdc->sreq_index) |
+				ADMA_CH_CTRL_FLOWCTRL_EN;
 		ch_regs->trg_addr = buf_addr;
 		break;
 
+	case DMA_MEM_TO_MEM:
+		adma_dir = ADMA_CH_CTRL_DIR_MEM2MEM;
+		burst_size = ADMA_CH_CONFIG_BURST_16;
+		ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_periods - 1) |
+				  ADMA_CH_CONFIG_TRG_BUF(num_periods - 1);
+		ch_regs->src_addr = buf_addr;
+		ch_regs->trg_addr = buf_addr2;
+		break;
+
 	default:
 		dev_err(tdc2dev(tdc), "DMA direction is not supported\n");
 		return -EINVAL;
 	}
 
+	if (desc->cyclic)
+		adma_mode = ADMA_CH_CTRL_MODE_CONTINUOUS;
+	else
+		adma_mode = ADMA_CH_CTRL_MODE_ONCE;
+
 	if (!burst_size || burst_size > ADMA_CH_CONFIG_BURST_16)
 		burst_size = ADMA_CH_CONFIG_BURST_16;
 
 	ch_regs->ctrl |= ADMA_CH_CTRL_DIR(adma_dir) |
-			 ADMA_CH_CTRL_MODE_CONTINUOUS |
-			 ADMA_CH_CTRL_FLOWCTRL_EN;
+			 ADMA_CH_CTRL_MODE(adma_mode);
 	ch_regs->config |= ADMA_CH_CONFIG_BURST_SIZE(burst_size);
 	ch_regs->config |= ADMA_CH_CONFIG_WEIGHT_FOR_WRR(1);
 	ch_regs->fifo_ctrl = ADMA_CH_FIFO_CTRL_DEFAULT;
@@ -564,7 +598,49 @@ static struct dma_async_tx_descriptor *tegra_adma_prep_dma_cyclic(
 	desc->period_len = period_len;
 	desc->num_periods = buf_len / period_len;
 
-	if (tegra_adma_set_xfer_params(tdc, desc, buf_addr, direction)) {
+	if (tegra_adma_set_xfer_params(tdc, desc, buf_addr, 0, direction)) {
+		kfree(desc);
+		return NULL;
+	}
+
+	return vchan_tx_prep(&tdc->vc, &desc->vd, flags);
+}
+
+static struct dma_async_tx_descriptor *tegra_adma_prep_dma_memcpy(
+	struct dma_chan *dc, dma_addr_t dest, dma_addr_t src,
+	size_t buf_len, unsigned long flags)
+{
+	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
+	struct device *dev = dc->device->dev;
+	struct tegra_adma_desc *desc = NULL;
+
+	dev_dbg(dev, "%s channel: %d src=0x%llx dst=0x%llx len=%zu\n",
+		__func__, dc->chan_id, (unsigned long long)src,
+		(unsigned long long)dest, buf_len);
+
+	if (unlikely(!tdc || !buf_len))
+		return NULL;
+
+	/*
+	 * ADMA supports up to 8 periods but it should be sufficient to use
+	 * one period for now which already allows us to transfer up to 1GB
+	 * (28-bit word aligned transfer size). We may add multiple periods
+	 * support to extend the limitation later.
+	 */
+	if (buf_len > ADMA_CH_TC_COUNT_MASK) {
+		dev_err(dev, "only supports up to 1GB transfer size\n");
+		return NULL;
+	}
+
+	desc = kzalloc(sizeof(*desc), GFP_NOWAIT);
+	if (!desc)
+		return NULL;
+
+	desc->num_periods = 1;
+	desc->buf_len = buf_len;
+	desc->period_len = buf_len;
+
+	if (tegra_adma_set_xfer_params(tdc, desc, src, dest, DMA_MEM_TO_MEM)) {
 		kfree(desc);
 		return NULL;
 	}
@@ -741,6 +817,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
+	dma_cap_set(DMA_MEMCPY, tdma->dma_dev.cap_mask);
 
 	tdma->dma_dev.dev = &pdev->dev;
 	tdma->dma_dev.device_alloc_chan_resources =
@@ -749,14 +826,18 @@ static int tegra_adma_probe(struct platform_device *pdev)
 					tegra_adma_free_chan_resources;
 	tdma->dma_dev.device_issue_pending = tegra_adma_issue_pending;
 	tdma->dma_dev.device_prep_dma_cyclic = tegra_adma_prep_dma_cyclic;
+	tdma->dma_dev.device_prep_dma_memcpy = tegra_adma_prep_dma_memcpy;
 	tdma->dma_dev.device_config = tegra_adma_slave_config;
 	tdma->dma_dev.device_tx_status = tegra_adma_tx_status;
 	tdma->dma_dev.device_terminate_all = tegra_adma_terminate_all;
 	tdma->dma_dev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	tdma->dma_dev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
-	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
+	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV) |
+				   BIT(DMA_MEM_TO_MEM);
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
 
+	tdma->dma_dev.copy_align = DMAENGINE_ALIGN_4_BYTES;
+
 	ret = dma_async_device_register(&tdma->dma_dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "ADMA registration failed: %d\n", ret);
-- 
2.1.4
