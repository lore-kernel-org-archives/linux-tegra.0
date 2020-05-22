From: Dinghao Liu <dinghao.liu@zju.edu.cn>
Subject: [PATCH] [v2] dmaengine: tegra210-adma: Fix runtime PM imbalance on error
Date: Fri, 22 May 2020 19:48:24 +0800
Message-ID: <20200522114824.8554-1-dinghao.liu@zju.edu.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Merge two patches that fix runtime PM imbalance in
      tegra_adma_probe() and tegra_adma_alloc_chan_resources()
      respectively.
---
 drivers/dma/tegra210-adma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index c4ce5dfb149b..2d6e419b6eac 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -658,6 +658,7 @@ static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
 
 	ret = pm_runtime_get_sync(tdc2dev(tdc));
 	if (ret < 0) {
+		pm_runtime_put_sync(tdc2dev(tdc));
 		free_irq(tdc->irq, tdc);
 		return ret;
 	}
@@ -870,7 +871,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0)
-		goto rpm_disable;
+		goto rpm_put;
 
 	ret = tegra_adma_init(tdma);
 	if (ret)
@@ -921,7 +922,6 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&tdma->dma_dev);
 rpm_put:
 	pm_runtime_put_sync(&pdev->dev);
-rpm_disable:
 	pm_runtime_disable(&pdev->dev);
 irq_dispose:
 	while (--i >= 0)
-- 
2.17.1
