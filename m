From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC] drm/nouveau: disable caching for VRAM BOs on ARM
Date: Mon, 26 May 2014 18:58:18 +0900
Message-ID: <CAAVeFuKHc3mexegZjgvRwdVKMwrzXp1nZLF=-kmMMKMsHya0eg@mail.gmail.com>
References: <1400492771-9746-1-git-send-email-acourbot@nvidia.com>
 <1400493433.8467.24.camel@weser.hi.pengutronix.de>
 <5379D7A0.3050509@nvidia.com>
 <1400494582.8467.28.camel@weser.hi.pengutronix.de>
 <CAAVeFuLKTjaZPSxNSK3nEG+XK+mMmPDDq85qMF-EHp3bGwVJYA@mail.gmail.com>
 <1400837055.4921.4.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1400837055.4921.4.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 23, 2014 at 6:24 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
>> The best way to solve this issue would be to not use the BAR at all
>> since the memory behind these objects can be directly accessed by the
>> CPU. As such it would better be mapped using ttm_bo_kmap_ttm()
>> instead. But right now this is clearly not how nouveau_bo.c is written
>> and it does not look like this can easily be done. :/
>
> Yeah, it sounds like we want this shortcut for stolen VRAM
> implementations.

Tried playing a bit with nouveau_bo and the following hack allows a
simple Mesa program to run to completion... once (second time leads to
a kernel panic):

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
b/drivers/gpu/drm/nouveau/nouveau_bo.c
index f00ae18003f1..6317d30a8e1d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -538,7 +538,6 @@ nouveau_bo_init_mem_type(struct ttm_bo_device
*bdev, uint32_t type,
                man->available_caching = TTM_PL_MASK_CACHING;
                man->default_caching = TTM_PL_FLAG_CACHED;
                break;
-       case TTM_PL_VRAM:
                if (nv_device(drm->device)->card_type >= NV_50) {
                        man->func = &nouveau_vram_manager;
                        man->io_reserve_fastpath = false;
@@ -556,6 +555,7 @@ nouveau_bo_init_mem_type(struct ttm_bo_device
*bdev, uint32_t type,
                man->default_caching = TTM_PL_FLAG_WC;
 #endif
                break;
+       case TTM_PL_VRAM:
        case TTM_PL_TT:
                if (nv_device(drm->device)->card_type >= NV_50)
                        man->func = &nouveau_gart_manager;
@@ -1297,6 +1297,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device
*bdev, struct ttm_mem_reg *mem)
                        break;
                /* fallthrough, tiled memory */
        case TTM_PL_VRAM:
+               break;
                mem->bus.offset = mem->start << PAGE_SHIFT;
                mem->bus.base = nv_device_resource_start(nouveau_dev(dev), 1);
                mem->bus.is_iomem = true;


Of course it won't go very far this way, but I wonder if the principle
is not what we would want to do for UMA devices? Not using the vram
manager at all, and strictly rely on TT placements for BOs. We will
need to add extra handling for things like tiled memory. Does that
look like the right direction?
