From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 4/8] dmaengine: s3c24xx: Simplify code in
 s3c24xx_dma_tx_status()
Date: Tue,  7 Jun 2016 18:38:37 +0100
Message-ID: <1465321121-22238-5-git-send-email-peter.griffin@linaro.org>
References: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1465321121-22238-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, linus.walleij@linaro.org, dan.j.williams@intel.com, leoli@freescale.com, zw@zh-kernel.org, baohua@kernel.org, maxime.ripard@free-electrons.com, wens@csie.org, ldewangan@nvidia.com, jonathanh@nvidia.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com
Cc: peter.griffin@linaro.org, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, lee.jones@linaro.org, linuxppc-dev@lists.ozlabs.org
List-Id: linux-tegra@vger.kernel.org

Doing so saves a few lines of code in the driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/dma/s3c24xx-dma.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/dma/s3c24xx-dma.c b/drivers/dma/s3c24xx-dma.c
index 17ccdfd..f7d2c7a 100644
--- a/drivers/dma/s3c24xx-dma.c
+++ b/drivers/dma/s3c24xx-dma.c
@@ -768,16 +768,12 @@ static enum dma_status s3c24xx_dma_tx_status(struct dma_chan *chan,
 
 	spin_lock_irqsave(&s3cchan->vc.lock, flags);
 	ret = dma_cookie_status(chan, cookie, txstate);
-	if (ret == DMA_COMPLETE) {
-		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
-		return ret;
-	}
 
 	/*
 	 * There's no point calculating the residue if there's
 	 * no txstate to store the value.
 	 */
-	if (!txstate) {
+	if (ret == DMA_COMPLETE || !txstate) {
 		spin_unlock_irqrestore(&s3cchan->vc.lock, flags);
 		return ret;
 	}
-- 
1.9.1
