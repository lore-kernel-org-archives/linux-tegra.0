From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v3 1/6] make RAM device optional
Date: Wed, 18 Feb 2015 09:01:45 +1000
Message-ID: <CACAvsv5mNb3bPzbkVoSCvXKtX195w3c8OX=543V5JHnM=hsN+w@mail.gmail.com>
References: <1424159284-19920-1-git-send-email-acourbot@nvidia.com>
	<1424159284-19920-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424159284-19920-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 17, 2015 at 5:47 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Having a RAM device does not make sense for chips like GK20A which have
> no dedicated video memory. The dummy RAM device that we used so far
> works as a temporary band-aid, but in the long-term it is desirable for
> the driver to be able to work without any kind of VRAM.
>
> This patch adds a few conditionals in places where a RAM device was
> assumed to be present and allows some more objects to be allocated from
> the TT domain, allowing Nouveau to handle GPUs for which
> pfb->ram == NULL.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nouveau_display.c         |  8 +++++++-
>  drm/nouveau/nouveau_ttm.c             |  3 +++
>  drm/nouveau/nv84_fence.c              | 14 +++++++++++---
>  drm/nouveau/nvkm/engine/device/base.c |  9 ++++++---
>  drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
>  drm/nouveau/nvkm/subdev/fb/base.c     | 26 ++++++++++++++++++--------
>  drm/nouveau/nvkm/subdev/ltc/gf100.c   | 10 +++++++++-
>  7 files changed, 55 insertions(+), 17 deletions(-)
>
> diff --git a/drm/nouveau/nouveau_display.c b/drm/nouveau/nouveau_display.c
> index 860b0e2d4181..68ee0af22eea 100644
> --- a/drm/nouveau/nouveau_display.c
> +++ b/drm/nouveau/nouveau_display.c
> @@ -869,13 +869,19 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
>                             struct drm_mode_create_dumb *args)
>  {
>         struct nouveau_bo *bo;
> +       uint32_t domain;
>         int ret;
>
>         args->pitch = roundup(args->width * (args->bpp / 8), 256);
>         args->size = args->pitch * args->height;
>         args->size = roundup(args->size, PAGE_SIZE);
>
> -       ret = nouveau_gem_new(dev, args->size, 0, NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, &bo);
> +       if (nvxx_fb(&nouveau_drm(dev)->device)->ram)
For these checks in the drm, it's probably better to use
nouveau_drm(dev)->device.info.ram_size.

> +               domain = NOUVEAU_GEM_DOMAIN_VRAM;
> +       else
> +               domain = NOUVEAU_GEM_DOMAIN_GART;
> +
> +       ret = nouveau_gem_new(dev, args->size, 0, domain, 0, 0, &bo);
>         if (ret)
>                 return ret;
>
> diff --git a/drm/nouveau/nouveau_ttm.c b/drm/nouveau/nouveau_ttm.c
> index 273e50110ec3..a3c2e9b4d937 100644
> --- a/drm/nouveau/nouveau_ttm.c
> +++ b/drm/nouveau/nouveau_ttm.c
> @@ -85,6 +85,9 @@ nouveau_vram_manager_new(struct ttm_mem_type_manager *man,
>         if (nvbo->tile_flags & NOUVEAU_GEM_TILE_NONCONTIG)
>                 size_nc = 1 << nvbo->page_shift;
>
> +       if (!pfb->ram)
> +               return -ENOMEM;
> +
>         ret = pfb->ram->get(pfb, mem->num_pages << PAGE_SHIFT,
>                            mem->page_alignment << PAGE_SHIFT, size_nc,
>                            (nvbo->tile_flags >> 8) & 0x3ff, &node);
> diff --git a/drm/nouveau/nv84_fence.c b/drm/nouveau/nv84_fence.c
> index bf429cabbaa8..b981f85de888 100644
> --- a/drm/nouveau/nv84_fence.c
> +++ b/drm/nouveau/nv84_fence.c
> @@ -215,6 +215,7 @@ nv84_fence_create(struct nouveau_drm *drm)
>  {
>         struct nvkm_fifo *pfifo = nvxx_fifo(&drm->device);
>         struct nv84_fence_priv *priv;
> +       u32 domain;
>         int ret;
>
>         priv = drm->fence = kzalloc(sizeof(*priv), GFP_KERNEL);
> @@ -231,10 +232,17 @@ nv84_fence_create(struct nouveau_drm *drm)
>         priv->base.context_base = fence_context_alloc(priv->base.contexts);
>         priv->base.uevent = true;
>
> -       ret = nouveau_bo_new(drm->dev, 16 * priv->base.contexts, 0,
> -                            TTM_PL_FLAG_VRAM, 0, 0, NULL, NULL, &priv->bo);
> +       domain = nvxx_fb(&drm->device)->ram ?
> +                        TTM_PL_FLAG_VRAM :
> +                        /*
> +                         * fences created in TT must be coherent or we will
> +                         * wait on old CPU cache values!
> +                         */
> +                        TTM_PL_FLAG_TT | TTM_PL_FLAG_UNCACHED;
> +       ret = nouveau_bo_new(drm->dev, 16 * priv->base.contexts, 0, domain, 0,
> +                            0, NULL, NULL, &priv->bo);
>         if (ret == 0) {
> -               ret = nouveau_bo_pin(priv->bo, TTM_PL_FLAG_VRAM, false);
> +               ret = nouveau_bo_pin(priv->bo, domain, false);
>                 if (ret == 0) {
>                         ret = nouveau_bo_map(priv->bo);
>                         if (ret)
> diff --git a/drm/nouveau/nvkm/engine/device/base.c b/drm/nouveau/nvkm/engine/device/base.c
> index 6efa8f38ff54..48f8537e83ac 100644
> --- a/drm/nouveau/nvkm/engine/device/base.c
> +++ b/drm/nouveau/nvkm/engine/device/base.c
> @@ -139,9 +139,12 @@ nvkm_devobj_info(struct nvkm_object *object, void *data, u32 size)
>
>         args->v0.chipset  = device->chipset;
>         args->v0.revision = device->chiprev;
> -       if (pfb)  args->v0.ram_size = args->v0.ram_user = pfb->ram->size;
> -       else      args->v0.ram_size = args->v0.ram_user = 0;
> -       if (imem) args->v0.ram_user = args->v0.ram_user - imem->reserved;
> +       if (pfb  && pfb->ram)
> +               args->v0.ram_size = args->v0.ram_user = pfb->ram->size;
> +       else
> +               args->v0.ram_size = args->v0.ram_user = 0;
> +       if (imem)
> +               args->v0.ram_user = args->v0.ram_user - imem->reserved;
>         return 0;
>  }
>
> diff --git a/drm/nouveau/nvkm/subdev/clk/base.c b/drm/nouveau/nvkm/subdev/clk/base.c
> index b24a9cc04b73..39a83d82e0cd 100644
> --- a/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -184,7 +184,7 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
>         nv_debug(clk, "setting performance state %d\n", pstatei);
>         clk->pstate = pstatei;
>
> -       if (pfb->ram->calc) {
> +       if (pfb->ram && pfb->ram->calc) {
>                 int khz = pstate->base.domain[nv_clk_src_mem];
>                 do {
>                         ret = pfb->ram->calc(pfb, khz);
> diff --git a/drm/nouveau/nvkm/subdev/fb/base.c b/drm/nouveau/nvkm/subdev/fb/base.c
> index 16589fa613cd..61fde43dab71 100644
> --- a/drm/nouveau/nvkm/subdev/fb/base.c
> +++ b/drm/nouveau/nvkm/subdev/fb/base.c
> @@ -55,9 +55,11 @@ _nvkm_fb_fini(struct nvkm_object *object, bool suspend)
>         struct nvkm_fb *pfb = (void *)object;
>         int ret;
>
> -       ret = nv_ofuncs(pfb->ram)->fini(nv_object(pfb->ram), suspend);
> -       if (ret && suspend)
> -               return ret;
> +       if (pfb->ram) {
> +               ret = nv_ofuncs(pfb->ram)->fini(nv_object(pfb->ram), suspend);
> +               if (ret && suspend)
> +                       return ret;
> +       }
>
>         return nvkm_subdev_fini(&pfb->base, suspend);
>  }
> @@ -72,9 +74,11 @@ _nvkm_fb_init(struct nvkm_object *object)
>         if (ret)
>                 return ret;
>
> -       ret = nv_ofuncs(pfb->ram)->init(nv_object(pfb->ram));
> -       if (ret)
> -               return ret;
> +       if (pfb->ram) {
> +               ret = nv_ofuncs(pfb->ram)->init(nv_object(pfb->ram));
> +               if (ret)
> +                       return ret;
> +       }
>
>         for (i = 0; i < pfb->tile.regions; i++)
>                 pfb->tile.prog(pfb, i, &pfb->tile.region[i]);
> @@ -91,9 +95,12 @@ _nvkm_fb_dtor(struct nvkm_object *object)
>         for (i = 0; i < pfb->tile.regions; i++)
>                 pfb->tile.fini(pfb, i, &pfb->tile.region[i]);
>         nvkm_mm_fini(&pfb->tags);
> -       nvkm_mm_fini(&pfb->vram);
>
> -       nvkm_object_ref(NULL, (struct nvkm_object **)&pfb->ram);
> +       if (pfb->ram) {
> +               nvkm_mm_fini(&pfb->vram);
> +               nvkm_object_ref(NULL, (struct nvkm_object **)&pfb->ram);
> +       }
> +
>         nvkm_subdev_destroy(&pfb->base);
>  }
>
> @@ -127,6 +134,9 @@ nvkm_fb_create_(struct nvkm_object *parent, struct nvkm_object *engine,
>
>         pfb->memtype_valid = impl->memtype;
>
> +       if (!impl->ram)
> +               return 0;
> +
>         ret = nvkm_object_ctor(nv_object(pfb), NULL, impl->ram, NULL, 0, &ram);
>         if (ret) {
>                 nv_fatal(pfb, "error detecting memory configuration!!\n");
> diff --git a/drm/nouveau/nvkm/subdev/ltc/gf100.c b/drm/nouveau/nvkm/subdev/ltc/gf100.c
> index 8e7cc6200d60..7fb5ea0314cb 100644
> --- a/drm/nouveau/nvkm/subdev/ltc/gf100.c
> +++ b/drm/nouveau/nvkm/subdev/ltc/gf100.c
> @@ -136,7 +136,8 @@ gf100_ltc_dtor(struct nvkm_object *object)
>         struct nvkm_ltc_priv *priv = (void *)object;
>
>         nvkm_mm_fini(&priv->tags);
> -       nvkm_mm_free(&pfb->vram, &priv->tag_ram);
> +       if (pfb->ram)
> +               nvkm_mm_free(&pfb->vram, &priv->tag_ram);
>
>         nvkm_ltc_destroy(priv);
>  }
> @@ -149,6 +150,12 @@ gf100_ltc_init_tag_ram(struct nvkm_fb *pfb, struct nvkm_ltc_priv *priv)
>         u32 tag_size, tag_margin, tag_align;
>         int ret;
>
> +       /* No VRAM, no tags for now. */
> +       if (!pfb->ram) {
> +               priv->num_tags = 0;
> +               goto mm_init;
> +       }
> +
>         /* tags for 1/4 of VRAM should be enough (8192/4 per GiB of VRAM) */
>         priv->num_tags = (pfb->ram->size >> 17) / 4;
>         if (priv->num_tags > (1 << 17))
> @@ -183,6 +190,7 @@ gf100_ltc_init_tag_ram(struct nvkm_fb *pfb, struct nvkm_ltc_priv *priv)
>                 priv->tag_base = tag_base;
>         }
>
> +mm_init:
>         ret = nvkm_mm_init(&priv->tags, 0, priv->num_tags, 1);
>         return ret;
>  }
> --
> 2.3.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
