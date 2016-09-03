From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v2 1/2] dmaengine: tegra210-adma: Add pre-check for cyclic callback
Date: Fri,  2 Sep 2016 17:32:48 -0700
Message-ID: <75bbbd9f20e0ead30760f47f0fd2ee9b05d49254.1472857934.git.nicoleotsuka@gmail.com>
References: <cover.1472857934.git.nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1472857934.git.nicoleotsuka@gmail.com>
In-Reply-To: <cover.1472857934.git.nicoleotsuka@gmail.com>
References: <cover.1472857934.git.nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org

ADMA driver will support more than cyclic type of transaction.
So this patch limits the cyclic callback for the cyclic type
only in order to support other types.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/dma/tegra210-adma.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 09b46f7..5b5d298 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -111,6 +111,7 @@ struct tegra_adma_desc {
 	size_t				buf_len;
 	size_t				period_len;
 	size_t				num_periods;
+	bool				cyclic;
 };
 
 /*
@@ -408,7 +409,8 @@ static irqreturn_t tegra_adma_isr(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	vchan_cyclic_callback(&tdc->desc->vd);
+	if (tdc->desc->cyclic)
+		vchan_cyclic_callback(&tdc->desc->vd);
 
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
 
@@ -557,6 +559,7 @@ static struct dma_async_tx_descriptor *tegra_adma_prep_dma_cyclic(
 	if (!desc)
 		return NULL;
 
+	desc->cyclic = true;
 	desc->buf_len = buf_len;
 	desc->period_len = period_len;
 	desc->num_periods = buf_len / period_len;
-- 
2.1.4
