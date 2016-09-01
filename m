From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH] dmaengine: tegra210-adma: Add memcpy support
Date: Thu,  1 Sep 2016 15:43:16 -0700
Message-ID: <1472769797-31650-1-git-send-email-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org

ADMA supports Memory-to-Memory direction transactions. So this patch
just adds an initial support for that. It passed a simple dmatest:
	echo dma1chan0 > /sys/module/dmatest/parameters/channel
	echo 1024 > /sys/module/dmatest/parameters/iterations
	echo 0 > /sys/module/dmatest/parameters/dmatest
	echo 1 > /sys/module/dmatest/parameters/run
	dmesg | grep dmatest
Started 1 threads using dma1chan0
dma1chan0-copy0: summary 1024 tests, 0 failures 2054 iops 16520 KB/s (0)

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/dma/tegra210-adma.c | 91 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 09b46f7..712b61f 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -42,9 +42,13 @@
 #define ADMA_CH_CTRL_RX_REQ(val)			(((val) & 0xf) << 24)
 #define ADMA_CH_CTRL_RX_REQ_MAX				10
 #define ADMA_CH_CTRL_DIR(val)				(((val) & 0xf) << 12)
+#define ADMA_CH_CTRL_DIR_MEM2MEM			1
 #define ADMA_CH_CTRL_DIR_AHUB2MEM			2
 #define ADMA_CH_CTRL_DIR_MEM2AHUB			4
+#define ADMA_CH_CTRL_DIR_AHUB2AHUB			8
+#define ADMA_CH_CTRL_MODE_ONCE				(1 << 8)
 #define ADMA_CH_CTRL_MODE_CONTINUOUS			(2 << 8)
+#define ADMA_CH_CTRL_MODE_LINKED_LIST			(4 << 8)
 #define ADMA_CH_CTRL_FLOWCTRL_EN			BIT(1)
 
 #define ADMA_CH_CONFIG					0x28
@@ -111,6 +115,7 @@ struct tegra_adma_desc {
 	size_t				buf_len;
 	size_t				period_len;
 	size_t				num_periods;
+	bool				cyclic;
 };
 
 /*
@@ -263,6 +268,9 @@ static int tegra_adma_request_alloc(struct tegra_adma_chan *tdc,
 		}
 		break;
 
+	case DMA_MEM_TO_MEM:
+		break;
+
 	default:
 		dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
 			 dma_chan_name(&tdc->vc.chan));
@@ -291,6 +299,9 @@ static void tegra_adma_request_free(struct tegra_adma_chan *tdc)
 		clear_bit(tdc->sreq_index, &tdma->rx_requests_reserved);
 		break;
 
+	case DMA_MEM_TO_MEM:
+		break;
+
 	default:
 		dev_WARN(tdma->dev, "channel %s has invalid transfer type\n",
 			 dma_chan_name(&tdc->vc.chan));
@@ -408,7 +419,14 @@ static irqreturn_t tegra_adma_isr(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	vchan_cyclic_callback(&tdc->desc->vd);
+	if (tdc->desc->cyclic) {
+		vchan_cyclic_callback(&tdc->desc->vd);
+	} else {
+		/* Disable the channel */
+		tdma_ch_write(tdc, ADMA_CH_CMD, 0);
+		vchan_cookie_complete(&tdc->desc->vd);
+		tdc->desc = NULL;
+	}
 
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
 
@@ -486,31 +504,47 @@ static enum dma_status tegra_adma_tx_status(struct dma_chan *dc,
 static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
 				      struct tegra_adma_desc *desc,
 				      dma_addr_t buf_addr,
+				      dma_addr_t buf_addr2,
 				      enum dma_transfer_direction direction)
 {
 	struct tegra_adma_chan_regs *ch_regs = &desc->ch_regs;
+	unsigned int num_periods = desc->num_periods;
 	unsigned int burst_size, adma_dir;
 
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
+				ADMA_CH_CTRL_MODE_CONTINUOUS |
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
+				ADMA_CH_CTRL_MODE_CONTINUOUS |
+				ADMA_CH_CTRL_FLOWCTRL_EN;
 		ch_regs->trg_addr = buf_addr;
 		break;
 
+	case DMA_MEM_TO_MEM:
+		adma_dir = ADMA_CH_CTRL_DIR_MEM2MEM;
+		burst_size = ADMA_CH_CONFIG_BURST_16;
+		ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_periods - 1) |
+				  ADMA_CH_CONFIG_TRG_BUF(num_periods - 1);
+		ch_regs->ctrl |= ADMA_CH_CTRL_MODE_ONCE;
+		ch_regs->src_addr = buf_addr;
+		ch_regs->trg_addr = buf_addr2;
+		break;
+
 	default:
 		dev_err(tdc2dev(tdc), "DMA direction is not supported\n");
 		return -EINVAL;
@@ -519,9 +553,7 @@ static int tegra_adma_set_xfer_params(struct tegra_adma_chan *tdc,
 	if (!burst_size || burst_size > ADMA_CH_CONFIG_BURST_16)
 		burst_size = ADMA_CH_CONFIG_BURST_16;
 
-	ch_regs->ctrl |= ADMA_CH_CTRL_DIR(adma_dir) |
-			 ADMA_CH_CTRL_MODE_CONTINUOUS |
-			 ADMA_CH_CTRL_FLOWCTRL_EN;
+	ch_regs->ctrl |= ADMA_CH_CTRL_DIR(adma_dir);
 	ch_regs->config |= ADMA_CH_CONFIG_BURST_SIZE(burst_size);
 	ch_regs->config |= ADMA_CH_CONFIG_WEIGHT_FOR_WRR(1);
 	ch_regs->fifo_ctrl = ADMA_CH_FIFO_CTRL_DEFAULT;
@@ -557,11 +589,43 @@ static struct dma_async_tx_descriptor *tegra_adma_prep_dma_cyclic(
 	if (!desc)
 		return NULL;
 
+	desc->cyclic = true;
 	desc->buf_len = buf_len;
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
@@ -738,6 +802,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
+	dma_cap_set(DMA_MEMCPY, tdma->dma_dev.cap_mask);
 
 	tdma->dma_dev.dev = &pdev->dev;
 	tdma->dma_dev.device_alloc_chan_resources =
@@ -746,14 +811,18 @@ static int tegra_adma_probe(struct platform_device *pdev)
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
