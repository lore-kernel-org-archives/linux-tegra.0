From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 3/8] dmaengine: coh901318: Only calculate residue if txstate exists.
Date: Tue,  7 Jun 2016 18:38:36 +0100
Message-ID: <1465321121-22238-4-git-send-email-peter.griffin@linaro.org>
References: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, linus.walleij@linaro.org, dan.j.williams@intel.com, leoli@freescale.com, zw@zh-kernel.org, baohua@kernel.org, maxime.ripard@free-electrons.com, wens@csie.org, ldewangan@nvidia.com, jonathanh@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: peter.griffin@linaro.org, lee.jones@linaro.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-tegra@vger.kernel.org

There is no point in calculating the residue if there is no
txstate to store the value.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/dma/coh901318.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/coh901318.c b/drivers/dma/coh901318.c
index c340ca9..c100616 100644
--- a/drivers/dma/coh901318.c
+++ b/drivers/dma/coh901318.c
@@ -2422,7 +2422,7 @@ coh901318_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 	enum dma_status ret;
 
 	ret = dma_cookie_status(chan, cookie, txstate);
-	if (ret == DMA_COMPLETE)
+	if (ret == DMA_COMPLETE || !txstate)
 		return ret;
 
 	dma_set_residue(txstate, coh901318_get_bytes_left(chan));
-- 
1.9.1
