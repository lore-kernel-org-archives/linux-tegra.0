From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7 09/19] dmaengine: tegra-apb: Remove unneeded initialization of tdc->config_init
Date: Mon,  3 Feb 2020 01:28:44 +0300
Message-ID: <20200202222854.18409-10-digetx@gmail.com>
References: <20200202222854.18409-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200202222854.18409-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There is no need to re-initialize the already initialized variables.
The tdc->config_init=false after driver's probe and after channel's
freeing, so there is no need to re-initialize it on the channel's
allocation.

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index b4535b3a07ce..7158bd3145c4 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1284,7 +1284,6 @@ static int tegra_dma_alloc_chan_resources(struct dma_chan *dc)
 	int ret;
 
 	dma_cookie_init(&tdc->dma_chan);
-	tdc->config_init = false;
 
 	ret = pm_runtime_get_sync(tdma->dev);
 	if (ret < 0)
-- 
2.24.0
