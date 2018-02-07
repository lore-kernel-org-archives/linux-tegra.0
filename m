From: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: [PATCH] drm/tegra/fb: Delete an error message for a failed memory
 allocation in tegra_fbdev_create()
Date: Wed, 7 Feb 2018 21:23:35 +0100
Message-ID: <0704416a-23f7-3ce3-2bd2-d6a8c106f10d@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Date: Wed, 7 Feb 2018 21:17:17 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
---
 drivers/gpu/drm/tegra/fb.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 001cb77e2f59..e63a0b228751 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -325,10 +325,8 @@ static struct tegra_fbdev *tegra_fbdev_create(struct drm_device *drm)
 	struct tegra_fbdev *fbdev;
 
 	fbdev = kzalloc(sizeof(*fbdev), GFP_KERNEL);
-	if (!fbdev) {
-		dev_err(drm->dev, "failed to allocate DRM fbdev\n");
+	if (!fbdev)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	drm_fb_helper_prepare(drm, &fbdev->base, &tegra_fb_helper_funcs);
 
-- 
2.16.1
