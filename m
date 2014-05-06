From: Christopher Freeman <cfreeman@nvidia.com>
Subject: [PATCH v1 2/3] dma: tegra: change interrupt-related log levels
Date: Tue, 6 May 2014 14:22:22 -0700
Message-ID: <1399411343-12222-3-git-send-email-cfreeman@nvidia.com>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, swarren@nvidia.com, vinod.koul@intel.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Christopher Freeman <cfreeman@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Log levels from info -> debug for a couple of interrupt
related prints.  Interrupts may be handled outside of the ISR
when tx_status is called because they need to be handled before
calculating the residual.

Signed-off-by: Christopher Freeman <cfreeman@nvidia.com>
---
 drivers/dma/tegra20-apb-dma.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index cc6b2fd..094e97d 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -675,7 +675,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 	}
 
 	spin_unlock_irqrestore(&tdc->lock, flags);
-	dev_info(tdc2dev(tdc),
+	dev_dbg(tdc2dev(tdc),
 		"Interrupt already served status 0x%08lx\n", status);
 	return IRQ_NONE;
 }
@@ -796,7 +796,7 @@ static int tegra_dma_wcount_in_bytes(struct dma_chan *dc)
 	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
 	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
-		dev_info(tdc2dev(tdc), "%s():handling isr\n", __func__);
+		dev_dbg(tdc2dev(tdc), "%s():handling isr\n", __func__);
 		tdc->isr_handler(tdc, false);
 		tegra_dma_resume(tdc);
 		return 0;
-- 
1.7.9.5
