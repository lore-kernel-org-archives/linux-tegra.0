From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 4/6] dmaengine: tegra-apb: Only save channel state for those in use
Date: Fri, 13 Nov 2015 16:39:41 +0000
Message-ID: <1447432783-7466-5-git-send-email-jonathanh@nvidia.com>
References: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Currently the tegra-apb DMA driver suspend/resume helpers, save and
restore the registers for all channels regardless of whether they are
in use or not. Change this so that only channels that have been
allocated and configured are saved and restored.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V3 changes:
- Updated comment to be on a single line

 drivers/dma/tegra20-apb-dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 18a561376c63..d4cabd6931e5 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1545,6 +1545,10 @@ static int tegra_dma_pm_suspend(struct device *dev)
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
 
+		/* Only save the state of DMA channels that are in use */
+		if (!tdc->config_init)
+			continue;
+
 		ch_reg->csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
 		ch_reg->ahb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
 		ch_reg->apb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBPTR);
@@ -1579,6 +1583,10 @@ static int tegra_dma_pm_resume(struct device *dev)
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
 
+		/* Only restore the state of DMA channels that are in use */
+		if (!tdc->config_init)
+			continue;
+
 		if (tdma->chip_data->support_separate_wcount_reg)
 			tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
 				  ch_reg->wcount);
-- 
2.1.4
