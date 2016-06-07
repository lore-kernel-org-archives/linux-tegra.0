From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 2/8] dmaengine: fsl-edma: print error code in error messages.
Date: Tue,  7 Jun 2016 18:38:35 +0100
Message-ID: <1465321121-22238-3-git-send-email-peter.griffin@linaro.org>
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

It is useful to print the error code as part of the error
message.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/dma/fsl-edma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/fsl-edma.c b/drivers/dma/fsl-edma.c
index 7208fc9..cc06eea 100644
--- a/drivers/dma/fsl-edma.c
+++ b/drivers/dma/fsl-edma.c
@@ -963,14 +963,16 @@ static int fsl_edma_probe(struct platform_device *pdev)
 
 	ret = dma_async_device_register(&fsl_edma->dma_dev);
 	if (ret) {
-		dev_err(&pdev->dev, "Can't register Freescale eDMA engine.\n");
+		dev_err(&pdev->dev,
+			"Can't register Freescale eDMA engine. (%d)\n", ret);
 		fsl_disable_clocks(fsl_edma);
 		return ret;
 	}
 
 	ret = of_dma_controller_register(np, fsl_edma_xlate, fsl_edma);
 	if (ret) {
-		dev_err(&pdev->dev, "Can't register Freescale eDMA of_dma.\n");
+		dev_err(&pdev->dev,
+			"Can't register Freescale eDMA of_dma. (%d)\n", ret);
 		dma_async_device_unregister(&fsl_edma->dma_dev);
 		fsl_disable_clocks(fsl_edma);
 		return ret;
-- 
1.9.1
