From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 6/8] dmaengine: sun6i-dma: Only calculate residue if state exists.
Date: Tue,  7 Jun 2016 18:38:39 +0100
Message-ID: <1465321121-22238-7-git-send-email-peter.griffin@linaro.org>
References: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, linus.walleij@linaro.org, dan.j.williams@intel.com, leoli@freescale.com, zw@zh-kernel.org, baohua@kernel.org, maxime.ripard@free-electrons.com, wens@csie.org, ldewangan@nvidia.com, jonathanh@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-tegra@vger.kernel.org

There is no point in calculating the residue if state does not
exist to store the value.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/dma/sun6i-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 5065ca4..3835fcd 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -865,7 +865,7 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	size_t bytes = 0;
 
 	ret = dma_cookie_status(chan, cookie, state);
-	if (ret == DMA_COMPLETE)
+	if (ret == DMA_COMPLETE || !state)
 		return ret;
 
 	spin_lock_irqsave(&vchan->vc.lock, flags);
-- 
1.9.1
