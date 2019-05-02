From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 4/6] dmaengine: tegra210-adma: add pause/resume support
Date: Thu, 2 May 2019 18:25:15 +0530
Message-ID: <1556801717-31507-5-git-send-email-spujar@nvidia.com>
References: <1556801717-31507-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1556801717-31507-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

During an audio playback session it is observed that, audio goes off after
few seconds of continuous pause and play. No audio is heard even when the
playback is resumed.

The reason for above is, currently ADMA driver does not handle DMA_PAUSE/
DMA_RESUME and relevant callbacks for dma_device are not implemented. This
patch implements device_pause and device_resume callbacks for the device.
During pause TRANSFER_PAUSE bit of dma channel control register is set and
the same is cleared during resume.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/dma/tegra210-adma.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 115ee10f..f26c458 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -30,6 +30,7 @@
 #define ADMA_CH_CMD					0x00
 #define ADMA_CH_STATUS					0x0c
 #define ADMA_CH_STATUS_XFER_EN				BIT(0)
+#define ADMA_CH_STATUS_XFER_PAUSED			BIT(1)
 
 #define ADMA_CH_INT_STATUS				0x10
 #define ADMA_CH_INT_STATUS_XFER_DONE			BIT(0)
@@ -41,6 +42,7 @@
 #define ADMA_CH_CTRL_DIR_MEM2AHUB			4
 #define ADMA_CH_CTRL_MODE_CONTINUOUS			(2 << 8)
 #define ADMA_CH_CTRL_FLOWCTRL_EN			BIT(1)
+#define ADMA_CH_CTRL_XFER_PAUSE_SHIFT			0
 
 #define ADMA_CH_CONFIG					0x28
 #define ADMA_CH_CONFIG_SRC_BUF(val)			(((val) & 0x7) << 28)
@@ -67,6 +69,8 @@
 #define ADMA_GLOBAL_CMD					0x00
 #define ADMA_GLOBAL_SOFT_RESET				0x04
 
+#define TEGRA_ADMA_BURST_COMPLETE_TIME			20
+
 #define ADMA_CH_FIFO_CTRL_DEFAULT	(ADMA_CH_FIFO_CTRL_OVRFW_THRES(1) | \
 					 ADMA_CH_FIFO_CTRL_STARV_THRES(1))
 
@@ -437,6 +441,51 @@ static void tegra_adma_issue_pending(struct dma_chan *dc)
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
 }
 
+static bool tegra_adma_is_paused(struct tegra_adma_chan *tdc)
+{
+	u32 csts;
+
+	csts = tdma_ch_read(tdc, ADMA_CH_STATUS);
+	csts &= ADMA_CH_STATUS_XFER_PAUSED;
+
+	return csts ? true : false;
+}
+
+static int tegra_adma_pause(struct dma_chan *dc)
+{
+	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
+	struct tegra_adma_desc *desc = tdc->desc;
+	struct tegra_adma_chan_regs *ch_regs = &desc->ch_regs;
+	int dcnt = 10;
+
+	ch_regs->ctrl = tdma_ch_read(tdc, ADMA_CH_CTRL);
+	ch_regs->ctrl |= (1 << ADMA_CH_CTRL_XFER_PAUSE_SHIFT);
+	tdma_ch_write(tdc, ADMA_CH_CTRL, ch_regs->ctrl);
+
+	while (dcnt-- && !tegra_adma_is_paused(tdc))
+		udelay(TEGRA_ADMA_BURST_COMPLETE_TIME);
+
+	if (dcnt < 0) {
+		dev_err(tdc2dev(tdc), "unable to pause DMA channel\n");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int tegra_adma_resume(struct dma_chan *dc)
+{
+	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
+	struct tegra_adma_desc *desc = tdc->desc;
+	struct tegra_adma_chan_regs *ch_regs = &desc->ch_regs;
+
+	ch_regs->ctrl = tdma_ch_read(tdc, ADMA_CH_CTRL);
+	ch_regs->ctrl &= ~(1 << ADMA_CH_CTRL_XFER_PAUSE_SHIFT);
+	tdma_ch_write(tdc, ADMA_CH_CTRL, ch_regs->ctrl);
+
+	return 0;
+}
+
 static int tegra_adma_terminate_all(struct dma_chan *dc)
 {
 	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
@@ -798,6 +847,8 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	tdma->dma_dev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
 	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
+	tdma->dma_dev.device_pause = tegra_adma_pause;
+	tdma->dma_dev.device_resume = tegra_adma_resume;
 
 	ret = dma_async_device_register(&tdma->dma_dev);
 	if (ret < 0) {
-- 
2.7.4
