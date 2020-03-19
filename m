From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 2/2] dmaengine: tegra-apb: Improve DMA synchronization
Date: Fri, 20 Mar 2020 00:23:21 +0300
Message-ID: <20200319212321.3297-2-digetx@gmail.com>
References: <20200319212321.3297-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200319212321.3297-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Boot CPU0 always handles DMA interrupts and under some rare circumstances
it could stuck in uninterruptible state for a significant time (like in a
case of KASAN + NFS root). In this case sibling CPU, which waits for DMA
transfer completion, will get a DMA transfer timeout. In order to handle
this rare condition, interrupt status needs to be polled until interrupt
is handled.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v2: Added forgotten wake_up_all() to tegra_dma_terminate_all(), which
    will wake up waiting threads after transfer's abortion.

 drivers/dma/tegra20-apb-dma.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 26f427e02369..733fda4e7e45 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/wait.h>
 
 #include "dmaengine.h"
 
@@ -202,6 +203,8 @@ struct tegra_dma_channel {
 	unsigned int slave_id;
 	struct dma_slave_config dma_sconfig;
 	struct tegra_dma_channel_regs channel_reg;
+
+	struct wait_queue_head wq;
 };
 
 /* tegra_dma: Tegra DMA specific information */
@@ -682,6 +685,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
 		tasklet_schedule(&tdc->tasklet);
+		wake_up_all(&tdc->wq);
 		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
 	}
@@ -783,6 +787,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	tegra_dma_resume(tdc);
 
 	pm_runtime_put(tdc->tdma->dev);
+	wake_up_all(&tdc->wq);
 
 skip_dma_stop:
 	tegra_dma_abort_all(tdc);
@@ -798,10 +803,29 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
 	return 0;
 }
 
+static bool tegra_dma_eoc_interrupt_deasserted(struct tegra_dma_channel *tdc)
+{
+	unsigned long flags;
+	u32 status;
+
+	spin_lock_irqsave(&tdc->lock, flags);
+	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
+	spin_unlock_irqrestore(&tdc->lock, flags);
+
+	return !(status & TEGRA_APBDMA_STATUS_ISE_EOC);
+}
+
 static void tegra_dma_synchronize(struct dma_chan *dc)
 {
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 
+	/*
+	 * CPU, which handles interrupt, could be busy in
+	 * uninterruptible state, in this case sibling CPU
+	 * should wait until interrupt is handled.
+	 */
+	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
+
 	tasklet_kill(&tdc->tasklet);
 }
 
@@ -1495,6 +1519,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
 			     (unsigned long)tdc);
 		spin_lock_init(&tdc->lock);
+		init_waitqueue_head(&tdc->wq);
 
 		INIT_LIST_HEAD(&tdc->pending_sg_req);
 		INIT_LIST_HEAD(&tdc->free_sg_req);
-- 
2.25.1
