From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] dmaengine: tegra210-adma: mark PM funtions as __maybe_unused
Date: Tue,  9 Jul 2019 20:56:47 +0200
Message-ID: <20190709185703.3298951-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sameer Pujar <spujar@nvidia.com>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Without the CONFIG_PM_CLK dependency, we can now build this file
in kernels that don't have CONFIG_PM at all, resulting in a harmless
warning from code that was always there since it got merged:

drivers/dma/tegra210-adma.c:747:12: error: 'tegra_adma_runtime_resume' defined but not used [-Werror=unused-function]
 static int tegra_adma_runtime_resume(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/dma/tegra210-adma.c:715:12: error: 'tegra_adma_runtime_suspend' defined but not used [-Werror=unused-function]
 static int tegra_adma_runtime_suspend(struct device *dev)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~

Mark them __maybe_unused to let the compiler silently drop
those two functions.

Fixes: 3145d73e69ba ("dmaengine: tegra210-adma: remove PM_CLK dependency")
Fixes: f46b195799b5 ("dmaengine: tegra-adma: Add support for Tegra210 ADMA")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/tegra210-adma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 2805853e963f..2b4be5557b37 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -712,7 +712,7 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
 	return chan;
 }
 
-static int tegra_adma_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra_adma_runtime_suspend(struct device *dev)
 {
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
 	struct tegra_adma_chan_regs *ch_reg;
@@ -744,7 +744,7 @@ static int tegra_adma_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_adma_runtime_resume(struct device *dev)
+static __maybe_unused int tegra_adma_runtime_resume(struct device *dev)
 {
 	struct tegra_adma *tdma = dev_get_drvdata(dev);
 	struct tegra_adma_chan_regs *ch_reg;
-- 
2.20.0
