From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 1/2] dmaengine: tegra-apb: Don't save/restore IRQ flags in interrupt handler
Date: Fri, 20 Mar 2020 00:23:20 +0300
Message-ID: <20200319212321.3297-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The interrupt is already disabled while interrupt handler is running, and
thus, there is no need to save/restore the IRQ flags within the spinlock.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---

Changelog:

v2: No change.

 drivers/dma/tegra20-apb-dma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 4e295d121be6..26f427e02369 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -672,10 +672,9 @@ static void tegra_dma_tasklet(unsigned long data)
 static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 {
 	struct tegra_dma_channel *tdc = dev_id;
-	unsigned long flags;
 	u32 status;
 
-	spin_lock_irqsave(&tdc->lock, flags);
+	spin_lock(&tdc->lock);
 
 	trace_tegra_dma_isr(&tdc->dma_chan, irq);
 	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
@@ -683,11 +682,11 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
 		tasklet_schedule(&tdc->tasklet);
-		spin_unlock_irqrestore(&tdc->lock, flags);
+		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
 	}
 
-	spin_unlock_irqrestore(&tdc->lock, flags);
+	spin_unlock(&tdc->lock);
 	dev_info(tdc2dev(tdc), "Interrupt already served status 0x%08x\n",
 		 status);
 
-- 
2.25.1
