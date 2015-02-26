From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] gem: allow user-space to specify an object
 should be coherent
Date: Thu, 26 Feb 2015 09:36:55 +0100
Message-ID: <1424939815.2176.3.camel@lynxeye.de>
References: <1424922292-20688-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424922292-20688-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Donnerstag, den 26.02.2015, 12:44 +0900 schrieb Alexandre Courbot:
> User-space use mappable BOs notably for fences, and expects that a
> value update by the GPU will be immediatly visible through the
> user-space mapping.
> 
> ARM has a property that may prevent this from happening though: memory
> can be mapped multiple times only if the different mappings share the
> same caching properties. However all the lowmem memory is already
> identity-mapped into the kernel with cache enabled, so when user-space
> requests an uncached mapping, we actually get an "undefined caching
> policy" one and this has strange side-effects described on Freedesktop
> bug 86690.
> 
> To prevent this from happening, allow user-space to explicitly specify
> which objects should be coherent, and create such objects with the
> TTM_PL_FLAG_UNCACHED flag. This will make TTM allocate memory using the
> DMA API, which will fix the identify mapping and allow us to safely map
> the objects to user-space uncached.
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ok, this is only needed as userspace is skipping the cpu_prep for the
fence BO reads. As doing this would increase the userspace fence
overhead a lot, this flag seems to be the right thing to do.

Reviewed-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>

> ---
> Patches that take advantage of this in Mesa will follow up shortly. I'd
> to make sure the new flag is ok first before also adding it to libdrm.
> 
>  drm/nouveau/include/uapi/drm/nouveau_drm.h | 1 +
>  drm/nouveau/nouveau_gem.c                  | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drm/nouveau/include/uapi/drm/nouveau_drm.h b/drm/nouveau/include/uapi/drm/nouveau_drm.h
> index 0d7608dc1a34..5507eead5863 100644
> --- a/drm/nouveau/include/uapi/drm/nouveau_drm.h
> +++ b/drm/nouveau/include/uapi/drm/nouveau_drm.h
> @@ -39,6 +39,7 @@
>  #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>  #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)
>  #define NOUVEAU_GEM_DOMAIN_MAPPABLE  (1 << 3)
> +#define NOUVEAU_GEM_DOMAIN_COHERENT  (1 << 4)
>  
>  #define NOUVEAU_GEM_TILE_COMP        0x00030000 /* nv50-only */
>  #define NOUVEAU_GEM_TILE_LAYOUT_MASK 0x0000ff00
> diff --git a/drm/nouveau/nouveau_gem.c b/drm/nouveau/nouveau_gem.c
> index 7c077fced1d1..0e690bf19fc9 100644
> --- a/drm/nouveau/nouveau_gem.c
> +++ b/drm/nouveau/nouveau_gem.c
> @@ -189,6 +189,9 @@ nouveau_gem_new(struct drm_device *dev, int size, int align, uint32_t domain,
>  	if (!flags || domain & NOUVEAU_GEM_DOMAIN_CPU)
>  		flags |= TTM_PL_FLAG_SYSTEM;
>  
> +	if (domain & NOUVEAU_GEM_DOMAIN_COHERENT)
> +		flags |= TTM_PL_FLAG_UNCACHED;
> +
>  	ret = nouveau_bo_new(dev, size, align, flags, tile_mode,
>  			     tile_flags, NULL, NULL, pnvbo);
>  	if (ret)
