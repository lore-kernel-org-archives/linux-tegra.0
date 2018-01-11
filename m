From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau: Remove redundant _get
Date: Thu, 11 Jan 2018 22:42:20 +0100
Message-ID: <20180111214221.25919-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The nouveau_fence_get_get_driver_name() function has a redundant _get in
its name. Remove it.

Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 503fa94dc06d..9c8f3a154d55 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -426,7 +426,7 @@ nouveau_fence_new(struct nouveau_channel *chan, bool sysmem,
 	return ret;
 }
 
-static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
+static const char *nouveau_fence_get_driver_name(struct dma_fence *fence)
 {
 	return "nouveau";
 }
@@ -496,7 +496,7 @@ static void nouveau_fence_release(struct dma_fence *f)
 }
 
 static const struct dma_fence_ops nouveau_fence_ops_legacy = {
-	.get_driver_name = nouveau_fence_get_get_driver_name,
+	.get_driver_name = nouveau_fence_get_driver_name,
 	.get_timeline_name = nouveau_fence_get_timeline_name,
 	.enable_signaling = nouveau_fence_no_signaling,
 	.signaled = nouveau_fence_is_signaled,
@@ -523,7 +523,7 @@ static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 }
 
 static const struct dma_fence_ops nouveau_fence_ops_uevent = {
-	.get_driver_name = nouveau_fence_get_get_driver_name,
+	.get_driver_name = nouveau_fence_get_driver_name,
 	.get_timeline_name = nouveau_fence_get_timeline_name,
 	.enable_signaling = nouveau_fence_enable_signaling,
 	.signaled = nouveau_fence_is_signaled,
-- 
2.15.1
