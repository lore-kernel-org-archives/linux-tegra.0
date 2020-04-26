From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] dmaengine: tegra-apb: Ensure that clock is enabled during of DMA synchronization
Date: Sun, 26 Apr 2020 22:08:35 +0300
Message-ID: <20200426190835.21950-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

DMA synchronization hook checks whether interrupt is raised by testing
corresponding bit in a hardware status register, and thus, clock should
be enabled in this case, otherwise CPU may hang if synchronization is
invoked while Runtime PM is in suspended state. This patch resumes the RPM
during of the DMA synchronization process in order to avoid potential
problems. It is a minor clean up of a previous commit, no real problem is
fixed by this patch because currently RPM is always in a resumed state
while DMA is synchronized, although this may change in the future.

Fixes: 6697255f239f ("dmaengine: tegra-apb: Improve DMA synchronization")
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index a42c0b4d14ac..55fc7400f717 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -816,6 +816,13 @@ static bool tegra_dma_eoc_interrupt_deasserted(struct tegra_dma_channel *tdc)
 static void tegra_dma_synchronize(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
+	int err;
+
+	err = pm_runtime_get_sync(tdc->tdma->dev);
+	if (err < 0) {
+		dev_err(tdc2dev(tdc), "Failed to synchronize DMA: %d\n", err);
+		return;
+	}
 
 	/*
 	 * CPU, which handles interrupt, could be busy in
@@ -825,6 +832,8 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
 
 	tasklet_kill(&tdc->tasklet);
+
+	pm_runtime_put(tdc->tdma->dev);
 }
 
 static unsigned int tegra_dma_sg_bytes_xferred(struct tegra_dma_channel *tdc,
-- 
2.26.0
