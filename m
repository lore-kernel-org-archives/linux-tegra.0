From: Wolfram Sang <wsa@the-dreams.de>
Subject: [RFC 04/42] drivers/dma: don't check resource with devm_ioremap_resource
Date: Fri, 10 May 2013 10:16:49 +0200
Message-ID: <1368173847-5661-5-git-send-email-wsa@the-dreams.de>
References: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368173847-5661-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

devm_ioremap_resource does sanity checks on the given resource. No need to
duplicate this in the driver.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 drivers/dma/tegra20-apb-dma.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index fcee27e..53e1375 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1279,11 +1279,6 @@ static int tegra_dma_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, tdma);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "No mem resource for DMA\n");
-		return -EINVAL;
-	}
-
 	tdma->base_addr = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(tdma->base_addr))
 		return PTR_ERR(tdma->base_addr);
-- 
1.7.10.4
