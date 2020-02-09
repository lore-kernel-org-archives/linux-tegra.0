From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v8 19/19] dmaengine: tegra-apb: Improve error message about DMA underflow
Date: Sun,  9 Feb 2020 19:33:56 +0300
Message-ID: <20200209163356.6439-20-digetx@gmail.com>
References: <20200209163356.6439-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200209163356.6439-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Technically it is possible that DMA could be misconfigured in a way that
cyclic DMA transfer is processed slower than it takes to complete the
cycle and in this case the DMA is getting aborted with a not very
informative message about the problem, let's improve it.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 3e0373b89195..1a9b37c102ba 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -566,7 +566,7 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
 	if (!hsgreq->configured) {
 		tegra_dma_stop(tdc);
 		pm_runtime_put(tdc->tdma->dev);
-		dev_err(tdc2dev(tdc), "Error in DMA transfer, aborting DMA\n");
+		dev_err(tdc2dev(tdc), "DMA transfer underflow, aborting DMA\n");
 		tegra_dma_abort_all(tdc);
 		return false;
 	}
-- 
2.24.0
