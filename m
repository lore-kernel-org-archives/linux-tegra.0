From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC] drm/nouveau: disable caching for VRAM BOs on ARM
Date: Mon, 19 May 2014 18:46:11 +0900
Message-ID: <1400492771-9746-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch is not meant to be merged, but rather to try and understand
why this is needed and what a more suitable solution could be.

Allowing BOs to be write-cached results in the following happening when
trying to run any program on Tegra/GK20A:

Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0036010
...
(nouveau_bo_rd32) from [<c0357d00>] (nouveau_fence_update+0x5c/0x80)
(nouveau_fence_update) from [<c0357d40>] (nouveau_fence_done+0x1c/0x38)
(nouveau_fence_done) from [<c02c3d00>] (ttm_bo_wait+0xec/0x168)
(ttm_bo_wait) from [<c035e334>] (nouveau_gem_ioctl_cpu_prep+0x44/0x100)
(nouveau_gem_ioctl_cpu_prep) from [<c02aaa84>] (drm_ioctl+0x1d8/0x4f4)
(drm_ioctl) from [<c0355394>] (nouveau_drm_ioctl+0x54/0x80)
(nouveau_drm_ioctl) from [<c00ee7b0>] (do_vfs_ioctl+0x3dc/0x5a0)
(do_vfs_ioctl) from [<c00ee9a8>] (SyS_ioctl+0x34/0x5c)
(SyS_ioctl) from [<c000e6e0>] (ret_fast_syscall+0x0/0x30

The offending nouveau_bo_rd32 is done over an IO-mapped BO, e.g. a BO
mapped through the BAR.

Any idea about the origin of this behavior? Does ARM forbid cached
mappings over IO regions?

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 8db54a217232..9cfb8e61f5c4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -552,7 +552,11 @@ nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
 			     TTM_MEMTYPE_FLAG_MAPPABLE;
 		man->available_caching = TTM_PL_FLAG_UNCACHED |
 					 TTM_PL_FLAG_WC;
+#if defined(__arm__)
+		man->default_caching = TTM_PL_FLAG_UNCACHED;
+#else
 		man->default_caching = TTM_PL_FLAG_WC;
+#endif
 		break;
 	case TTM_PL_TT:
 		if (nv_device(drm->device)->card_type >= NV_50)
-- 
1.9.2
