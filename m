From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] platform: fix probe error path
Date: Fri, 20 Mar 2015 19:41:05 +0900
Message-ID: <1426848066-13700-2-git-send-email-acourbot@nvidia.com>
References: <1426848066-13700-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426848066-13700-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A "return 0" found its way in the middle of the error path of
nouveau_platform_probe(), remove it as it will make the kernel crash if
we try to unload the module afterwards.

While we are at it, also remove the IOMMU domain if it has been created,
as we should.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drm/nouveau/nouveau_platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drm/nouveau/nouveau_platform.c b/drm/nouveau/nouveau_platform.c
index f83aa12ee5c6..775277f1edb0 100644
--- a/drm/nouveau/nouveau_platform.c
+++ b/drm/nouveau/nouveau_platform.c
@@ -209,10 +209,9 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 err_unref:
 	drm_dev_unref(drm);
 
-	return 0;
-
 power_down:
 	nouveau_platform_power_down(gpu);
+	nouveau_platform_remove_iommu(&pdev->dev, gpu);
 
 	return err;
 }
-- 
2.3.3
