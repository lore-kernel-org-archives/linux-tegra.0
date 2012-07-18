From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dma: tegra: enable/disable dma clock
Date: Wed, 18 Jul 2012 14:26:09 +0530
Message-ID: <1342601769-13852-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Enable the DMA clock when registering DMA driver and
disable clock when removing the DMA driver.

The failure was observed on Tegra20 based system by
Stephen Warren. However, it is working fine on tegra30
based system and probably becasue uboot enable the clock
on Tegra30.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Reported-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index d52dbc6..ccfdaf4 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1255,6 +1255,12 @@ static int __devinit tegra_dma_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = clk_prepare_enable(tdma->dma_clk);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "clk_prepare_enable failed: %d\n", ret);
+		goto err_pm_disable;
+	}
+
 	/* Reset DMA controller */
 	tegra_periph_reset_assert(tdma->dma_clk);
 	udelay(2);
@@ -1363,6 +1369,7 @@ static int __devexit tegra_dma_remove(struct platform_device *pdev)
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		tegra_dma_runtime_suspend(&pdev->dev);
 
+	clk_disable_unprepare(tdma->dma_clk);
 	return 0;
 }
 
-- 
1.7.1.1
