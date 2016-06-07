From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 1/8] dmaengine: fsl-edma: Fix clock handling error paths
Date: Tue,  7 Jun 2016 18:38:34 +0100
Message-ID: <1465321121-22238-2-git-send-email-peter.griffin@linaro.org>
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

Currently fsl-edma doesn't clk_disable_unprepare()
its clocks on error conditions. This patch adds a
fsl_disable_clocks helper for this, and also only
disables clocks which were enabled if encountering
an error whilst enabling clocks.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/dma/fsl-edma.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/fsl-edma.c b/drivers/dma/fsl-edma.c
index be2e62b..7208fc9 100644
--- a/drivers/dma/fsl-edma.c
+++ b/drivers/dma/fsl-edma.c
@@ -852,6 +852,14 @@ fsl_edma_irq_init(struct platform_device *pdev, struct fsl_edma_engine *fsl_edma
 	return 0;
 }
 
+static void fsl_disable_clocks(struct fsl_edma_engine *fsl_edma)
+{
+	int i;
+
+	for (i = 0; i < DMAMUX_NR; i++)
+		clk_disable_unprepare(fsl_edma->muxclk[i]);
+}
+
 static int fsl_edma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -897,6 +905,10 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
 		ret = clk_prepare_enable(fsl_edma->muxclk[i]);
 		if (ret) {
+			/* disable only clks which were enabled on error */
+			for (; i >= 0; i--)
+				clk_disable_unprepare(fsl_edma->muxclk[i]);
+
 			dev_err(&pdev->dev, "DMAMUX clk block failed.\n");
 			return ret;
 		}
@@ -952,6 +964,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&fsl_edma->dma_dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't register Freescale eDMA engine.\n");
+		fsl_disable_clocks(fsl_edma);
 		return ret;
 	}
 
@@ -959,6 +972,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Can't register Freescale eDMA of_dma.\n");
 		dma_async_device_unregister(&fsl_edma->dma_dev);
+		fsl_disable_clocks(fsl_edma);
 		return ret;
 	}
 
@@ -972,13 +986,10 @@ static int fsl_edma_remove(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct fsl_edma_engine *fsl_edma = platform_get_drvdata(pdev);
-	int i;
 
 	of_dma_controller_free(np);
 	dma_async_device_unregister(&fsl_edma->dma_dev);
-
-	for (i = 0; i < DMAMUX_NR; i++)
-		clk_disable_unprepare(fsl_edma->muxclk[i]);
+	fsl_disable_clocks(fsl_edma);
 
 	return 0;
 }
-- 
1.9.1
