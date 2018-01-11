From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/5] drm/prime: Remove duplicate forward declaration
Date: Thu, 11 Jan 2018 22:44:16 +0100
Message-ID: <20180111214420.26203-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

struct device is forward-declared twice. Remove the second instance.

Reviewed-by: Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 include/drm/drm_prime.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 9cd9e36f77b5..59ccab402e85 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -59,8 +59,6 @@ struct drm_device;
 struct drm_gem_object;
 struct drm_file;
 
-struct device;
-
 struct dma_buf *drm_gem_prime_export(struct drm_device *dev,
 				     struct drm_gem_object *obj,
 				     int flags);
-- 
2.15.1
