From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: [PATCH 7/9] drivers: ata: sata_dwc_460ex: use devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 14:35:46 +0200
Message-ID: <1566304548-19972-7-git-send-email-info@metux.net>
References: <1566304548-19972-1-git-send-email-info@metux.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-1-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: axboe@kernel.dk, hdegoede@redhat.com, b.zolnierkie@samsung.com, linus.walleij@linaro.org, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Use the new helper that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/ata/sata_dwc_460ex.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
index 9dcef6a..de248fa 100644
--- a/drivers/ata/sata_dwc_460ex.c
+++ b/drivers/ata/sata_dwc_460ex.c
@@ -237,7 +237,6 @@ static int sata_dwc_dma_init_old(struct platform_device *pdev,
 				 struct sata_dwc_device *hsdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 
 	hsdev->dma = devm_kzalloc(&pdev->dev, sizeof(*hsdev->dma), GFP_KERNEL);
 	if (!hsdev->dma)
@@ -254,8 +253,7 @@ static int sata_dwc_dma_init_old(struct platform_device *pdev,
 	}
 
 	/* Get physical SATA DMA register base address */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	hsdev->dma->regs = devm_ioremap_resource(&pdev->dev, res);
+	hsdev->dma->regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(hsdev->dma->regs))
 		return PTR_ERR(hsdev->dma->regs);
 
-- 
1.9.1
