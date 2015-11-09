From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 6/6] dmaengine: tegra-apb: Free interrupts before killing tasklets
Date: Mon, 9 Nov 2015 13:23:49 +0000
Message-ID: <1447075429-27311-7-git-send-email-jonathanh@nvidia.com>
References: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447075429-27311-1-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On probe failure or driver removal, before killing any tasklets, ensure
that the channel interrupt is freed to ensure that another channel
interrupt cannot occur and schedule the tasklet again.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V2 changes:
- Updated patch to use free_irq instead of disable_irq

 drivers/dma/tegra20-apb-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 004edcdb2d2e..d3892a106c1e 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1396,8 +1396,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		}
 		tdc->irq = res->start;
 		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
-		ret = devm_request_irq(&pdev->dev, tdc->irq,
-				tegra_dma_isr, 0, tdc->name, tdc);
+		ret = request_irq(tdc->irq, tegra_dma_isr, 0, tdc->name, tdc);
 		if (ret) {
 			dev_err(&pdev->dev,
 				"request_irq failed with err %d channel %d\n",
@@ -1478,6 +1477,8 @@ err_unregister_dma_dev:
 err_irq:
 	while (--i >= 0) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
+
+		free_irq(tdc->irq, tdc);
 		tasklet_kill(&tdc->tasklet);
 	}
 
@@ -1497,6 +1498,7 @@ static int tegra_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < tdma->chip_data->nr_channels; ++i) {
 		tdc = &tdma->channels[i];
+		free_irq(tdc->irq, tdc);
 		tasklet_kill(&tdc->tasklet);
 	}
 
-- 
2.1.4
