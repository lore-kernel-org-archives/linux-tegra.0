From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] dmaengine: tegra210-adma: Fix runtime PM imbalance on error
Date: Thu, 21 May 2020 16:05:41 +0800
Message-ID: <20200521080541.25229-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/dma/tegra210-adma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index c4ce5dfb149b..8f5e4949d720 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -870,7 +870,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		goto rpm_disable;
+		goto rpm_put;
 
 	ret = tegra_adma_init(tdma);
 	if (ret)
@@ -921,7 +921,6 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&tdma->dma_dev);
 rpm_put:
 	pm_runtime_put_sync(&pdev->dev);
-rpm_disable:
 	pm_runtime_disable(&pdev->dev);
 irq_dispose:
 	while (--i >= 0)
-- 
2.17.1
