From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v7 11/19] dmaengine: tegra-apb: Remove pending_sg_req checking from tdc_start_head_req
Date: Mon,  3 Feb 2020 01:28:46 +0300
Message-ID: <20200202222854.18409-12-digetx@gmail.com>
References: <20200202222854.18409-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200202222854.18409-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

There are only two places in the driver that use tdc_start_head_req()
and both these places check whether pending_sg_req list is empty before
invoking tdc_start_head_req().

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 22b88ccff05d..62d181bd5e62 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -504,9 +504,6 @@ static void tdc_start_head_req(struct tegra_dma_channel *tdc)
 {
 	struct tegra_dma_sg_req *sg_req;
 
-	if (list_empty(&tdc->pending_sg_req))
-		return;
-
 	sg_req = list_first_entry(&tdc->pending_sg_req, typeof(*sg_req), node);
 	tegra_dma_start(tdc, sg_req);
 	sg_req->configured = true;
-- 
2.24.0
