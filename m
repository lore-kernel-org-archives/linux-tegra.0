From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 3/6] dmaengine: tegra-apb: Save and restore word count
Date: Fri, 13 Nov 2015 16:39:40 +0000
Message-ID: <1447432783-7466-4-git-send-email-jonathanh@nvidia.com>
References: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447432783-7466-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Newer tegra devices have a separate word count register per channel that
contains the number of words to be transferred. This register is not
saved or restored by the suspend/resume helpers for these newer devices
and so ensure that it is.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 355dbc354818..18a561376c63 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1550,6 +1550,9 @@ static int tegra_dma_pm_suspend(struct device *dev)
 		ch_reg->apb_ptr = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBPTR);
 		ch_reg->ahb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_AHBSEQ);
 		ch_reg->apb_seq = tdc_read(tdc, TEGRA_APBDMA_CHAN_APBSEQ);
+		if (tdma->chip_data->support_separate_wcount_reg)
+			ch_reg->wcount = tdc_read(tdc,
+						  TEGRA_APBDMA_CHAN_WCOUNT);
 	}
 
 	/* Disable clock */
@@ -1576,6 +1579,9 @@ static int tegra_dma_pm_resume(struct device *dev)
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 		struct tegra_dma_channel_regs *ch_reg = &tdc->channel_reg;
 
+		if (tdma->chip_data->support_separate_wcount_reg)
+			tdc_write(tdc, TEGRA_APBDMA_CHAN_WCOUNT,
+				  ch_reg->wcount);
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBSEQ, ch_reg->apb_seq);
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_APBPTR, ch_reg->apb_ptr);
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_AHBSEQ, ch_reg->ahb_seq);
-- 
2.1.4
