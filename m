From: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/1] dma: tegra20-apb-dma: Staticize tegra_dma_prep_dma_cyclic
Date: Fri,  6 Sep 2013 17:16:22 +0530
Message-ID: <1378467982-30327-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

tegra_dma_prep_dma_cyclic is referenced only in this file.
Make it static.

Signed-off-by: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 5d4986e..67a6752 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1018,7 +1018,7 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 	return &dma_desc->txd;
 }
 
-struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
+static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 	struct dma_chan *dc, dma_addr_t buf_addr, size_t buf_len,
 	size_t period_len, enum dma_transfer_direction direction,
 	unsigned long flags, void *context)
-- 
1.7.9.5
