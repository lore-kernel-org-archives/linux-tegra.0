From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH] dma: tegra: fix interrupt name issue with apb dma.
Date: Wed, 3 Oct 2012 22:51:53 +0530
Message-ID: <1349284913-22350-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org, djbw@fb.com, vinod.koul@intel.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, stable@kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

When watching the interrupts through /proc/interrupts,
the name of the interrupts are blank or garbage. The
reason is the pointer passed for devname during irq
registration is stack and so it get changed after
dma registration completes.
Allocate the pointer as part of dma channel and pass
this pointer as the devname for irq registration to
avoid change of name.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Resending as mail was not delivered to arm@kernel.org.

 drivers/dma/tegra20-apb-dma.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 24a6512..528c62d 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -169,6 +169,7 @@ typedef void (*dma_isr_handler)(struct tegra_dma_channel *tdc,
 /* tegra_dma_channel: Channel specific information */
 struct tegra_dma_channel {
 	struct dma_chan		dma_chan;
+	char			name[30];
 	bool			config_init;
 	int			id;
 	int			irq;
@@ -1282,7 +1283,6 @@ static int __devinit tegra_dma_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&tdma->dma_dev.channels);
 	for (i = 0; i < cdata->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
-		char irq_name[30];
 
 		tdc->chan_base_offset = TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET +
 					i * TEGRA_APBDMA_CHANNEL_REGISTER_SIZE;
@@ -1294,9 +1294,9 @@ static int __devinit tegra_dma_probe(struct platform_device *pdev)
 			goto err_irq;
 		}
 		tdc->irq = res->start;
-		snprintf(irq_name, sizeof(irq_name), "apbdma.%d", i);
+		snprintf(tdc->name, sizeof(tdc->name), "apbdma.%d", i);
 		ret = devm_request_irq(&pdev->dev, tdc->irq,
-				tegra_dma_isr, 0, irq_name, tdc);
+				tegra_dma_isr, 0, tdc->name, tdc);
 		if (ret) {
 			dev_err(&pdev->dev,
 				"request_irq failed with err %d channel %d\n",
-- 
1.7.1.1
