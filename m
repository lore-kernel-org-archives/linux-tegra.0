From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] dmaengine: tegra210-adma: Fix unused function warnings
Date: Tue, 9 Jul 2019 16:32:58 +0800
Message-ID: <20190709083258.57112-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ldewangan@nvidia.com, jonathanh@nvidia.com, vkoul@kernel.org, dan.j.williams@intel.com, thierry.reding@gmail.com
Cc: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-tegra@vger.kernel.org

If CONFIG_PM is not set, build warnings:

drivers/dma/tegra210-adma.c:747:12: warning: tegra_adma_runtime_resume defined but not used [-Wunused-function]
 static int tegra_adma_runtime_resume(struct device *dev)
drivers/dma/tegra210-adma.c:715:12: warning: tegra_adma_runtime_suspend defined but not used [-Wunused-function]
 static int tegra_adma_runtime_suspend(struct device *dev)

Mark the two function as __maybe_unused.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/dma/tegra210-adma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 2805853..b33cf6e 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -712,7 +712,7 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 	return chan;
 }
 
-static int tegra_adma_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra_adma_runtime_suspend(struct device *dev)
 {
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
 	struct tegra_adma_chan_regs *ch_reg;
@@ -744,7 +744,7 @@ static int tegra_adma_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_adma_runtime_resume(struct device *dev)
+static int __maybe_unused tegra_adma_runtime_resume(struct device *dev)
 {
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
 	struct tegra_adma_chan_regs *ch_reg;
-- 
2.7.4
