From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] drm/nouveau: Pass the proper arguments to nvif_object_map_handle()
Date: Fri, 12 Jan 2018 00:15:28 +0100
Message-ID: <20180111231528.6768-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

This is obviously wrong in the current code. Make sure to record the
correct size of the arguments and pass the actual arguments to the
nvif_object_map_handle() function.

Suggested-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a8a957207f3a..8334b3f4e60b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1494,11 +1494,13 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
 				args.nv50.ro = 0;
 				args.nv50.kind = mem->kind;
 				args.nv50.comp = mem->comp;
+				argc = sizeof(args.nv50);
 				break;
 			case NVIF_CLASS_MEM_GF100:
 				args.gf100.version = 0;
 				args.gf100.ro = 0;
 				args.gf100.kind = mem->kind;
+				argc = sizeof(args.gf100);
 				break;
 			default:
 				WARN_ON(1);
@@ -1506,7 +1508,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_mem_reg *reg)
 			}
 
 			ret = nvif_object_map_handle(&mem->mem.object,
-						     &argc, argc,
+						     &args, argc,
 						     &handle, &length);
 			if (ret != 1) {
 				pr_info("  nvif_object_map_handle(): %d\n", ret);
-- 
2.15.1
