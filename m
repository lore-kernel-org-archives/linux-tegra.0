From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] DMA: tegra-apb: Simplify locking for device using global pause
Date: Thu, 6 Aug 2015 14:32:33 +0100
Message-ID: <1438867953-11378-5-git-send-email-jonathanh@nvidia.com>
References: <1438867953-11378-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1438867953-11378-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Sparse reports the following with regard to locking in the
tegra_dma_global_pause() and tegra_dma_global_resume() functions:

drivers/dma/tegra20-apb-dma.c:362:9: warning: context imbalance in
	'tegra_dma_global_pause' - wrong count at exit
drivers/dma/tegra20-apb-dma.c:366:13: warning: context imbalance in
	'tegra_dma_global_resume' - unexpected unlock

The warning is caused because tegra_dma_global_pause() acquires a lock
but does not release it. However, the lock is released by
tegra_dma_global_resume(). These pause/resume functions are called in
pairs and so it does appear to work.

This global pause is used on early tegra devices that do not have an
individual pause for each channel. The lock appears to be used to ensure
that multiple channels do not attempt to assert/de-assert the global pause
at the same time which could cause the DMA controller to be in the wrong
paused state. Rather than locking around the entire code between the pause
and resume, employ a simple counter to keep track of the global pause
requests. By using a counter, it is only necessary to hold the lock when
pausing and unpausing the DMA controller and hence, fixes the sparse
warning.

Please note that for devices that support individual channel pausing, the
DMA controller lock is not held between pausing and unpausing the channel.
Hence, this change will make the devices that use the global pause behave
in the same way, with regard to locking, as those that don't.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 53a8075dcec8..c8f79dcaaee8 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -219,6 +219,13 @@ struct tegra_dma {
 	void __iomem			*base_addr;
 	const struct tegra_dma_chip_data *chip_data;
 
+	/*
+	 * Counter for managing global pausing of the DMA controller.
+	 * Only applicable for devices that don't support individual
+	 * channel pausing.
+	 */
+	u32				global_pause_count;
+
 	/* Some register need to be cache before suspend */
 	u32				reg_gen;
 
@@ -358,16 +365,32 @@ static void tegra_dma_global_pause(struct tegra_dma_channel *tdc,
 	struct tegra_dma *tdma = tdc->tdma;
 
 	spin_lock(&tdma->global_lock);
-	tdma_write(tdma, TEGRA_APBDMA_GENERAL, 0);
-	if (wait_for_burst_complete)
-		udelay(TEGRA_APBDMA_BURST_COMPLETE_TIME);
+
+	if (tdc->tdma->global_pause_count == 0) {
+		tdma_write(tdma, TEGRA_APBDMA_GENERAL, 0);
+		if (wait_for_burst_complete)
+			udelay(TEGRA_APBDMA_BURST_COMPLETE_TIME);
+	}
+
+	tdc->tdma->global_pause_count++;
+
+	spin_unlock(&tdma->global_lock);
 }
 
 static void tegra_dma_global_resume(struct tegra_dma_channel *tdc)
 {
 	struct tegra_dma *tdma = tdc->tdma;
 
-	tdma_write(tdma, TEGRA_APBDMA_GENERAL, TEGRA_APBDMA_GENERAL_ENABLE);
+	spin_lock(&tdma->global_lock);
+
+	if (WARN_ON(tdc->tdma->global_pause_count == 0))
+		goto out;
+
+	if (--tdc->tdma->global_pause_count == 0)
+		tdma_write(tdma, TEGRA_APBDMA_GENERAL,
+			   TEGRA_APBDMA_GENERAL_ENABLE);
+
+out:
 	spin_unlock(&tdma->global_lock);
 }
 
@@ -1407,6 +1430,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
 	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
 
+	tdma->global_pause_count = 0;
 	tdma->dma_dev.dev = &pdev->dev;
 	tdma->dma_dev.device_alloc_chan_resources =
 					tegra_dma_alloc_chan_resources;
-- 
2.1.4
