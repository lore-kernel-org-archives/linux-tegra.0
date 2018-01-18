From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 3/4] drm: add ARM flush implementations
Date: Thu, 18 Jan 2018 08:42:55 +0100
Message-ID: <CAKMK7uHoAqYsgqOTT4O=NQFvj51M2tKp+c2Sm8t4t01QN9Jkfg@mail.gmail.com>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-3-gurchetansingh@chromium.org> <20180117083105.GG2759@phenom.ffwll.local>
 <CAAfnVBm4Mp8vC4aBmrP2rJeRSBN_AFN5gaZfijg9BCJEBupDzw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAfnVBm4Mp8vC4aBmrP2rJeRSBN_AFN5gaZfijg9BCJEBupDzw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 17, 2018 at 11:46 PM, Gurchetan Singh
<gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> dma api just isn't quite sufficient for implementing fast gpu drivers.
>
>
> Can you elaborate?  IIRC the DMA API has strong synchronization guarantees
> and that can be problematic for GPU drivers.  However, using the DMA API for
> flushing doesn't necessarily mean the driver has to use the rest of the DMA
> API.
>
>> but then it'd need to directly flush cpu caches and bypass the dma api.
>
>
> On ARM, cache flushing seems to vary from chipset to chipset.  For example,
> on ARM32 a typical call-stack for dma_sync_single_for_device looks like:
>
> arm_dma_sync_single_for_device
> __dma_page_cpu_to_dev
> outer_clean_range
> outer_cache.clean_range
>
> There are multiple clean_range implementations out there (i.e,
> aurora_clean_range, l2c210_clean_range, feroceon_l2_clean_range), so that's
> why the DMA API was used in this case.  On ARM64, things are a little
> simpler, but the DMA API seems to go directly to assembly (__dma_map_area)
> after a little indirection.  Why do you think that's inefficient?

I never said it's inefficient. My only gripe is with adding the
pointless struct device * argument to flushing functions which really
don't care (nor should care) about the device. Because what we really
want to call is outer_clean_range here, and that doesn't need a struct
device *. Imo that function (or something similar) needs to be
exported and then used by drm_flush_* functions.

Also note that arm has both flush and invalidate functions, but on x86
those are the same implementation (and we don't have a separate
drm_invalidate_* set of functions). That doesn't look like a too good
idea.

Of course that doesn't solve the problem of who's supposed to call it
and when in the dma-buf sharing situation.
-Daniel

> On Wed, Jan 17, 2018 at 12:31 AM, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org> wrote:
>>
>> On Tue, Jan 16, 2018 at 04:35:58PM -0800, Gurchetan Singh wrote:
>> > The DMA API can be used to flush scatter gather tables and physical
>> > pages on ARM devices.
>> >
>> > Signed-off-by: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> > ---
>> >  drivers/gpu/drm/drm_cache.c                 | 17 +++++++++++++++++
>> >  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  7 ++-----
>> >  drivers/gpu/drm/tegra/gem.c                 |  6 +-----
>> >  3 files changed, 20 insertions(+), 10 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
>> > index 3d2bb9d71a60..98d6ebb40e96 100644
>> > --- a/drivers/gpu/drm/drm_cache.c
>> > +++ b/drivers/gpu/drm/drm_cache.c
>> > @@ -105,6 +105,18 @@ drm_flush_pages(struct device *dev, struct page
>> > *pages[],
>> >                                  (unsigned long)page_virtual +
>> > PAGE_SIZE);
>> >               kunmap_atomic(page_virtual);
>> >       }
>> > +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
>> > +     unsigned long i;
>> > +     dma_addr_t dma_handle;
>> > +
>> > +     if (!dev)
>> > +             return;
>> > +
>> > +     for (i = 0; i < num_pages; i++) {
>> > +             dma_handle = phys_to_dma(drm->dev,
>> > page_to_phys(pages[i]));
>> > +             dma_sync_single_for_device(dev, dma_handle, PAGE_SIZE,
>> > +                                        DMA_TO_DEVICE);
>>
>> Erm no. These functions here are super-low-level functions used by drivers
>> which know exactly what they're doing. Which is reimplementing half of the
>> dma api behind the dma api's back because the dma api just isn't quite
>> sufficient for implementing fast gpu drivers.
>>
>> If all you end up doing is calling the dma api again, then pls just call
>> it directly.
>>
>> And just to make it clear: I'd be perfectly fine with adding arm support
>> here, but then it'd need to directly flush cpu caches and bypass the dma
>> api. Otherwise this is pointless.
>> -Daniel
>>
>> > +     }
>> >  #else
>> >       pr_err("Architecture has no drm_cache.c support\n");
>> >       WARN_ON_ONCE(1);
>> > @@ -136,6 +148,11 @@ drm_flush_sg(struct device *dev, struct sg_table
>> > *st)
>> >
>> >       if (wbinvd_on_all_cpus())
>> >               pr_err("Timed out waiting for cache flush\n");
>> > +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
>> > +     if (!dev)
>> > +             return;
>> > +
>> > +     dma_sync_sg_for_device(dev, st->sgl, st->nents, DMA_TO_DEVICE);
>> >  #else
>> >       pr_err("Architecture has no drm_cache.c support\n");
>> >       WARN_ON_ONCE(1);
>> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> > b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> > index 8ac7eb25e46d..0157f90b5d10 100644
>> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
>> > @@ -14,6 +14,7 @@
>> >
>> >  #include <drm/drm.h>
>> >  #include <drm/drmP.h>
>> > +#include <drm/drm_cache.h>
>> >  #include <drm/drm_gem.h>
>> >  #include <drm/drm_vma_manager.h>
>> >  #include <linux/iommu.h>
>> > @@ -99,15 +100,11 @@ static int rockchip_gem_get_pages(struct
>> > rockchip_gem_object *rk_obj)
>> >       /*
>> >        * Fake up the SG table so that dma_sync_sg_for_device() can be
>> > used
>> >        * to flush the pages associated with it.
>> > -      *
>> > -      * TODO: Replace this by drm_flush_sg() once it can be implemented
>> > -      * without relying on symbols that are not exported.
>> >        */
>> >       for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
>> >               sg_dma_address(s) = sg_phys(s);
>> >
>> > -     dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl,
>> > rk_obj->sgt->nents,
>> > -                            DMA_TO_DEVICE);
>> > +     drm_flush_sg(drm->dev, rk_obj->sgt);
>> >
>> >       return 0;
>> >
>> > diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
>> > index ab1e53d434e8..9945fd2f6bd6 100644
>> > --- a/drivers/gpu/drm/tegra/gem.c
>> > +++ b/drivers/gpu/drm/tegra/gem.c
>> > @@ -230,15 +230,11 @@ static int tegra_bo_get_pages(struct drm_device
>> > *drm, struct tegra_bo *bo)
>> >       /*
>> >        * Fake up the SG table so that dma_sync_sg_for_device() can be
>> > used
>> >        * to flush the pages associated with it.
>> > -      *
>> > -      * TODO: Replace this by drm_clflash_sg() once it can be
>> > implemented
>> > -      * without relying on symbols that are not exported.
>> >        */
>> >       for_each_sg(bo->sgt->sgl, s, bo->sgt->nents, i)
>> >               sg_dma_address(s) = sg_phys(s);
>> >
>> > -     dma_sync_sg_for_device(drm->dev, bo->sgt->sgl, bo->sgt->nents,
>> > -                            DMA_TO_DEVICE);
>> > +     drm_flush_sg(drm->dev, bo->sgt);
>> >
>> >       return 0;
>> >
>> > --
>> > 2.13.5
>> >
>> > _______________________________________________
>> > dri-devel mailing list
>> > dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>
>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
