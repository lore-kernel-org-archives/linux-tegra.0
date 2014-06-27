From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/2] drm/nouveau/bar: add noncached ioremap property
Date: Fri, 27 Jun 2014 19:28:50 +0900
Message-ID: <1403864931-4663-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some BARs (like GK20A's) do not support being ioremapped write-combined.
Add a boolean property to the BAR structure and handle that case in the
Nouveau BO implementation.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/core/include/subdev/bar.h |  3 +++
 drivers/gpu/drm/nouveau/nouveau_bo.c              | 17 ++++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bar.h b/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
index 9faa98e67ad8..9002cbb6432b 100644
--- a/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
+++ b/drivers/gpu/drm/nouveau/core/include/subdev/bar.h
@@ -20,6 +20,9 @@ struct nouveau_bar {
 		    u32 flags, struct nouveau_vma *);
 	void (*unmap)(struct nouveau_bar *, struct nouveau_vma *);
 	void (*flush)(struct nouveau_bar *);
+
+	/* whether the BAR supports to be ioremapped WC or should be uncached */
+	bool iomap_uncached;
 };
 
 static inline struct nouveau_bar *
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index b6dc85c614be..4db886f9f793 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -500,18 +500,25 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 		man->default_caching = TTM_PL_FLAG_CACHED;
 		break;
 	case TTM_PL_VRAM:
+		man->flags = TTM_MEMTYPE_FLAG_FIXED |
+			     TTM_MEMTYPE_FLAG_MAPPABLE;
+		man->available_caching = TTM_PL_FLAG_UNCACHED |
+					 TTM_PL_FLAG_WC;
+		man->default_caching = TTM_PL_FLAG_WC;
+
 		if (nv_device(drm->device)->card_type >= NV_50) {
+			/* Some BARs do not support being ioremapped WC */
+			if (nouveau_bar(drm->device)->iomap_uncached) {
+				man->available_caching = TTM_PL_FLAG_UNCACHED;
+				man->default_caching = TTM_PL_FLAG_UNCACHED;
+			}
+
 			man->func = &nouveau_vram_manager;
 			man->io_reserve_fastpath = false;
 			man->use_io_reserve_lru = true;
 		} else {
 			man->func = &ttm_bo_manager_func;
 		}
-		man->flags = TTM_MEMTYPE_FLAG_FIXED |
-			     TTM_MEMTYPE_FLAG_MAPPABLE;
-		man->available_caching = TTM_PL_FLAG_UNCACHED |
-					 TTM_PL_FLAG_WC;
-		man->default_caching = TTM_PL_FLAG_WC;
 		break;
 	case TTM_PL_TT:
 		if (nv_device(drm->device)->card_type >= NV_50)
-- 
2.0.0
