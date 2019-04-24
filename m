From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1] dmaengine: tegra: Use relaxed versions of readl/writel
Date: Thu, 25 Apr 2019 02:17:08 +0300
Message-ID: <20190424231708.21219-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

The readl/writel functions are inserting memory barrier in order to
ensure that memory stores are completed. On Tegra20 and Tegra30 this
results in L2 cache syncing which isn't a cheapest operation. The
tegra20-apb-dma driver doesn't need to synchronize generic memory
accesses, hence use the relaxed versions of the functions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index cf462b1abc0b..e646e1c7b299 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -241,23 +241,23 @@ struct tegra_dma {
 
 static inline void tdma_write(struct tegra_dma *tdma, u32 reg, u32 val)
 {
-	writel(val, tdma->base_addr + reg);
+	writel_relaxed(val, tdma->base_addr + reg);
 }
 
 static inline u32 tdma_read(struct tegra_dma *tdma, u32 reg)
 {
-	return readl(tdma->base_addr + reg);
+	return readl_relaxed(tdma->base_addr + reg);
 }
 
 static inline void tdc_write(struct tegra_dma_channel *tdc,
 		u32 reg, u32 val)
 {
-	writel(val, tdc->chan_addr + reg);
+	writel_relaxed(val, tdc->chan_addr + reg);
 }
 
 static inline u32 tdc_read(struct tegra_dma_channel *tdc, u32 reg)
 {
-	return readl(tdc->chan_addr + reg);
+	return readl_relaxed(tdc->chan_addr + reg);
 }
 
 static inline struct tegra_dma_channel *to_tegra_dma_chan(struct dma_chan *dc)
-- 
2.21.0
