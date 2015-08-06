From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/4] DMA: tegra-apb: Avoid unnecessary channel base address calculation
Date: Thu, 6 Aug 2015 14:32:31 +0100
Message-ID: <1438867953-11378-3-git-send-email-jonathanh@nvidia.com>
References: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Everytime a DMA channel register is accessed, the channel base address
is calculated by adding the DMA base address and the channel register
offset. Avoid this calculation and simply calculate the channel base
address once at probe time for each DMA channel.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index cf8cff7827f0..11edcca7619b 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -187,7 +187,7 @@ struct tegra_dma_channel {
 	bool			config_init;
 	int			id;
 	int			irq;
-	unsigned long		chan_base_offset;
+	void __iomem		*chan_addr;
 	spinlock_t		lock;
 	bool			busy;
 	struct tegra_dma	*tdma;
@@ -239,12 +239,12 @@ static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
 static inline void tdc_write(struct tegra_dma_channel *tdc,
 		u32 reg, u32 val)
 {
-	writel(val, tdc->tdma->base_addr + tdc->chan_base_offset + reg);
+	writel(val, tdc->chan_addr + reg);
 }
 
 static inline u32 tdc_read(struct tegra_dma_channel *tdc, u32 reg)
 {
-	return readl(tdc->tdma->base_addr + tdc->chan_base_offset + reg);
+	return readl(tdc->chan_addr + reg);
 }
 
 static inline struct tegra_dma_channel *to_tegra_dma_chan(struct dma_chan *dc)
@@ -1373,8 +1373,9 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < cdata->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 
-		tdc->chan_base_offset = TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET +
-					i * cdata->channel_reg_size;
+		tdc->chan_addr = tdma->base_addr +
+				 TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET +
+				 (i * cdata->channel_reg_size);
 
 		res = platform_get_resource(pdev, IORESOURCE_IRQ, i);
 		if (!res) {
-- 
2.1.4
