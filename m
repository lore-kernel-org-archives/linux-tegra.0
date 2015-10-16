From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/6] dmaengine: tegra-apb: Only save channel state for those in use
Date: Fri, 16 Oct 2015 09:25:55 +0100
Message-ID: <1444983957-18691-5-git-send-email-jonathanh@nvidia.com>
References: <1444983957-18691-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444983957-18691-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Currently the tegra-apb DMA driver suspend/resume helpers, save and
restore the registers for all channels regardless of whether they are
in use or not. Change this so that only channels that have been
allocated and configured are saved and restored.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 06063d370272..35723703d4b9 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1539,6 +1539,12 @@ static int tegra_dma_pm_suspend(struct device *dev)
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
@@ -1572,6 +1578,12 @@ static int tegra_dma_pm_resume(struct device *dev)
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
