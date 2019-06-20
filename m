From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH] dmaengine: tegra210-adma: remove PM_CLK dependency
Date: Thu, 20 Jun 2019 21:24:19 +0530
Message-ID: <1561046059-15821-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, dan.j.williams@intel.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Tegra ADMA does not use pm-clk interface now and hence the dependency
is removed from Kconfig.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 703275c..ba660e2 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -584,7 +584,7 @@ config TEGRA20_APB_DMA
 
 config TEGRA210_ADMA
 	tristate "NVIDIA Tegra210 ADMA support"
-	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST) && PM_CLK
+	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST)
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	help
-- 
2.7.4
