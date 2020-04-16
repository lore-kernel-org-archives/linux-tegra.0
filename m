From: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH] drm/tegra: dc: Omit superfluous error message in tegra_dc_probe()
Date: Thu, 16 Apr 2020 22:43:17 +0800
Message-ID: <20200416144317.2036-1-tangbin@cmss.chinamobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In the function tegra_dc_probe(), when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant message
here.

Signed-off-by: Tang Bin <tangbin-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
---
 drivers/gpu/drm/tegra/dc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 7c70fd31a..d26fb16d6 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2566,10 +2566,8 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->regs);
 
 	dc->irq = platform_get_irq(pdev, 0);
-	if (dc->irq < 0) {
-		dev_err(&pdev->dev, "failed to get IRQ\n");
+	if (dc->irq < 0)
 		return -ENXIO;
-	}
 
 	err = tegra_dc_rgb_probe(dc);
 	if (err < 0 && err != -ENODEV) {
-- 
2.20.1.windows.1
