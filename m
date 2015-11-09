From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 4/6] dmaengine: tegra-apb: Only save channel state for those in use
Date: Mon, 9 Nov 2015 13:23:47 +0000
Message-ID: <1447075429-27311-5-git-send-email-jonathanh@nvidia.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Currently the tegra-apb DMA driver suspend/resume helpers, save and
restore the registers for all channels regardless of whether they are
in use or not. Change this so that only channels that have been
allocated and configured are saved and restored.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 94f59c3fcdca..4fc0851069cd 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1544,6 +1544,12 @@ static int tegra_dma_pm_suspend(struct device *dev)
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
 
+		/*
+		 * Only save the state of DMA channels that are in use.
+		 */
+		if (!tdc->config_init)
+			continue;
+
 		ch_reg->csr = tdc_read(tdc, TEGRA_APBDMA_CHAN_CSR);
 		ch_reg->ahb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBPTR);
 		ch_reg->apb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBPTR);
@@ -1577,6 +1583,12 @@ static int tegra_dma_pm_resume(struct device *dev)
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
 
+		/*
+		 * Only restore the state of DMA channels that are in use.
+		 */
+		if (!tdc->config_init)
+			continue;
+
 		if (tdma->chip_data->support_separate_wcount_reg)
 			tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
 				  ch_reg->wcount);
-- 
2.1.4
