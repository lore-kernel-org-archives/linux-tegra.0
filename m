From: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 1/2] dmaengine: tegra210-adma: Add pre-check for cyclic callback
Date: Tue,  6 Sep 2016 11:42:01 -0700
Message-ID: <75bbbd9f20e0ead30760f47f0fd2ee9b05d49254.1473186743.git.nicoleotsuka@gmail.com>
References: <cover.1473186743.git.nicoleotsuka@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1473186743.git.nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1473186743.git.nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1473186743.git.nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

ADMA driver will support more than cyclic type of transaction.
So this patch limit the cyclic callback for the cyclic type
only in order to support other types.

Signed-off-by: Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
