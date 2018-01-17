From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 3/4] drm: add ARM flush implementations
Date: Wed, 17 Jan 2018 09:31:05 +0100
Message-ID: <20180117083105.GG2759@phenom.ffwll.local>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-3-gurchetansingh@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180117003559.67837-3-gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 16, 2018 at 04:35:58PM -0800, Gurchetan Singh wrote:
> The DMA API can be used to flush scatter gather tables and physical
> pages on ARM devices.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/drm/drm_cache.c                 | 17 +++++++++++++++++
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  7 ++-----
>  drivers/gpu/drm/tegra/gem.c                 |  6 +-----
>  3 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
> index 3d2bb9d71a60..98d6ebb40e96 100644
> --- a/drivers/gpu/drm/drm_cache.c
> +++ b/drivers/gpu/drm/drm_cache.c
> @@ -105,6 +105,18 @@ drm_flush_pages(struct device *dev, struct page *pages[],
>  				   (unsigned long)page_virtual + PAGE_SIZE);
>  		kunmap_atomic(page_virtual);
>  	}
> +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +	unsigned long i;
> +	dma_addr_t dma_handle;
> +
> +	if (!dev)
> +		return;
> +
> +	for (i = 0; i < num_pages; i++) {
> +		dma_handle = phys_to_dma(drm->dev, page_to_phys(pages[i]));
> +		dma_sync_single_for_device(dev, dma_handle, PAGE_SIZE,
> +					   DMA_TO_DEVICE);

Erm no. These functions here are super-low-level functions used by drivers
which know exactly what they're doing. Which is reimplementing half of the
dma api behind the dma api's back because the dma api just isn't quite
sufficient for implementing fast gpu drivers.

If all you end up doing is calling the dma api again, then pls just call
it directly.

And just to make it clear: I'd be perfectly fine with adding arm support
here, but then it'd need to directly flush cpu caches and bypass the dma
api. Otherwise this is pointless.
-Daniel

> +	}
>  #else
>  	pr_err("Architecture has no drm_cache.c support\n");
>  	WARN_ON_ONCE(1);
> @@ -136,6 +148,11 @@ drm_flush_sg(struct device *dev, struct sg_table *st)
>  
>  	if (wbinvd_on_all_cpus())
>  		pr_err("Timed out waiting for cache flush\n");
> +#elif defined(CONFIG_ARM) || defined(CONFIG_ARM64)
> +	if (!dev)
> +		return;
> +
> +	dma_sync_sg_for_device(dev, st->sgl, st->nents, DMA_TO_DEVICE);
>  #else
>  	pr_err("Architecture has no drm_cache.c support\n");
>  	WARN_ON_ONCE(1);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 8ac7eb25e46d..0157f90b5d10 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -14,6 +14,7 @@
>  
>  #include <drm/drm.h>
>  #include <drm/drmP.h>
> +#include <drm/drm_cache.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_vma_manager.h>
>  #include <linux/iommu.h>
> @@ -99,15 +100,11 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
>  	/*
>  	 * Fake up the SG table so that dma_sync_sg_for_device() can be used
>  	 * to flush the pages associated with it.
> -	 *
> -	 * TODO: Replace this by drm_flush_sg() once it can be implemented
> -	 * without relying on symbols that are not exported.
>  	 */
>  	for_each_sg(rk_obj->sgt->sgl, s, rk_obj->sgt->nents, i)
>  		sg_dma_address(s) = sg_phys(s);
>  
> -	dma_sync_sg_for_device(drm->dev, rk_obj->sgt->sgl, rk_obj->sgt->nents,
> -			       DMA_TO_DEVICE);
> +	drm_flush_sg(drm->dev, rk_obj->sgt);
>  
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
> index ab1e53d434e8..9945fd2f6bd6 100644
> --- a/drivers/gpu/drm/tegra/gem.c
> +++ b/drivers/gpu/drm/tegra/gem.c
> @@ -230,15 +230,11 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
>  	/*
>  	 * Fake up the SG table so that dma_sync_sg_for_device() can be used
>  	 * to flush the pages associated with it.
> -	 *
> -	 * TODO: Replace this by drm_clflash_sg() once it can be implemented
> -	 * without relying on symbols that are not exported.
>  	 */
>  	for_each_sg(bo->sgt->sgl, s, bo->sgt->nents, i)
>  		sg_dma_address(s) = sg_phys(s);
>  
> -	dma_sync_sg_for_device(drm->dev, bo->sgt->sgl, bo->sgt->nents,
> -			       DMA_TO_DEVICE);
> +	drm_flush_sg(drm->dev, bo->sgt);
>  
>  	return 0;
>  
> -- 
> 2.13.5
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
