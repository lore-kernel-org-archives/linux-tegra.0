From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH libdrm] drm: Remove create_handle() drm_framebuffer
 "virtual".
Date: Wed, 9 Aug 2017 21:14:48 +0200
Message-ID: <8a7bf59a-0f58-21ba-8b82-78e6ba873065@tronnes.org>
References: <20170808234237.62051-1-djmk@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170808234237.62051-1-djmk-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joe Kniss <djmk-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: alexander.deucher-5C7GfCeVMHo@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, patrik.r.jakobsson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Monk.Liu-5C7GfCeVMHo@public.gmane.org, David1.Zhou-5C7GfCeVMHo@public.gmane.org, tom.stdenis-5C7GfCeVMHo@public.gmane.org, ray.huang-5C7GfCeVMHo@public.gmane.org, Ken.Wang-5C7GfCeVMHo@public.gmane.org, Jerry.Zhang-5C7GfCeVMHo@public.gmane.org, michel.daenzer-5C7GfCeVMHo@public.gmane.org, harry.wentland-5C7GfCeVMHo@public.gmane.org, Andrey.Grodzovsky-5C7GfCeVMHo@public.gmane.org, AlexBin.Xie-5C7GfCeVMHo@public.gmane.orgf
List-Id: linux-tegra@vger.kernel.org


Den 09.08.2017 01.42, skrev Joe Kniss:
> Because all drivers currently use gem objects for framebuffer planes,
> the virtual create_handle() is not required.  This change adds a
> struct drm_gem_object *gems[4] field to drm_framebuffer and removes
> create_handle() function pointer from drm_framebuffer_funcs.  The
> corresponding *_create_handle() function is removed from each driver.
>
> In many cases this change eliminates a struct *_framebuffer object,
> as the only need for the derived struct is the addition of the gem
> object pointer.
>
> TESTED: compiled: allyesconfig ARCH=x86,arm platforms:i915, rockchip
>
> Signed-off-by: Joe Kniss <djmk-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> ---

Hi Joe,

I'm also looking into adding gem objs to drm_framebuffer in this patch:
[PATCH v2 01/22] drm: Add GEM backed framebuffer library
https://lists.freedesktop.org/archives/dri-devel/2017-August/149782.html

[...]

> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
> index ade319d10e70..f5f011b910b1 100644
> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
> @@ -31,14 +31,9 @@
>   
>   #define DEFAULT_FBDEFIO_DELAY_MS 50
>   
> -struct drm_fb_cma {
> -	struct drm_framebuffer		fb;
> -	struct drm_gem_cma_object	*obj[4];
> -};
> -
>   struct drm_fbdev_cma {
>   	struct drm_fb_helper	fb_helper;
> -	struct drm_fb_cma	*fb;
> +	struct drm_framebuffer	*fb;

This fb pointer isn't necessary, since fb_helper already has one.

Noralf.

>   	const struct drm_framebuffer_funcs *fb_funcs;
>   };
>   
> @@ -72,7 +67,6 @@ struct drm_fbdev_cma {
>    *
>    *     static struct drm_framebuffer_funcs driver_fb_funcs = {
>    *         .destroy       = drm_fb_cma_destroy,
> - *         .create_handle = drm_fb_cma_create_handle,
>    *         .dirty         = driver_fb_dirty,
>    *     };
>    *
> @@ -90,67 +84,50 @@ static inline struct drm_fbdev_cma *to_fbdev_cma(struct drm_fb_helper *helper)
>   	return container_of(helper, struct drm_fbdev_cma, fb_helper);
>   }
>   
> -static inline struct drm_fb_cma *to_fb_cma(struct drm_framebuffer *fb)
> -{
> -	return container_of(fb, struct drm_fb_cma, fb);
> -}
> -
>   void drm_fb_cma_destroy(struct drm_framebuffer *fb)
>   {
> -	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
>   	int i;
>   
>   	for (i = 0; i < 4; i++) {
> -		if (fb_cma->obj[i])
> -			drm_gem_object_put_unlocked(&fb_cma->obj[i]->base);
> +		if (fb->gem_objs[i])
> +			drm_gem_object_put_unlocked(fb->gem_objs[i]);
>   	}
>   
>   	drm_framebuffer_cleanup(fb);
> -	kfree(fb_cma);
> +	kfree(fb);
>   }
>   EXPORT_SYMBOL(drm_fb_cma_destroy);
>   
> -int drm_fb_cma_create_handle(struct drm_framebuffer *fb,
> -	struct drm_file *file_priv, unsigned int *handle)
> -{
> -	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
> -
> -	return drm_gem_handle_create(file_priv,
> -			&fb_cma->obj[0]->base, handle);
> -}
> -EXPORT_SYMBOL(drm_fb_cma_create_handle);
> -
>   static struct drm_framebuffer_funcs drm_fb_cma_funcs = {
>   	.destroy	= drm_fb_cma_destroy,
> -	.create_handle	= drm_fb_cma_create_handle,
>   };
>   
> -static struct drm_fb_cma *drm_fb_cma_alloc(struct drm_device *dev,
> +static struct drm_framebuffer *drm_fb_cma_alloc(struct drm_device *dev,
>   	const struct drm_mode_fb_cmd2 *mode_cmd,
>   	struct drm_gem_cma_object **obj,
>   	unsigned int num_planes, const struct drm_framebuffer_funcs *funcs)
>   {
> -	struct drm_fb_cma *fb_cma;
> +	struct drm_framebuffer *fb;
>   	int ret;
>   	int i;
>   
> -	fb_cma = kzalloc(sizeof(*fb_cma), GFP_KERNEL);
> -	if (!fb_cma)
> +	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
> +	if (!fb)
>   		return ERR_PTR(-ENOMEM);
>   
> -	drm_helper_mode_fill_fb_struct(dev, &fb_cma->fb, mode_cmd);
> +	drm_helper_mode_fill_fb_struct(dev, fb, mode_cmd);
>   
>   	for (i = 0; i < num_planes; i++)
> -		fb_cma->obj[i] = obj[i];
> +		fb->gem_objs[i] = &obj[i]->base;
>   
> -	ret = drm_framebuffer_init(dev, &fb_cma->fb, funcs);
> +	ret = drm_framebuffer_init(dev, fb, funcs);
>   	if (ret) {
>   		dev_err(dev->dev, "Failed to initialize framebuffer: %d\n", ret);
> -		kfree(fb_cma);
> +		kfree(fb);
>   		return ERR_PTR(ret);
>   	}
>   
> -	return fb_cma;
> +	return fb;
>   }
>   
>   /**
> @@ -171,7 +148,7 @@ struct drm_framebuffer *drm_fb_cma_create_with_funcs(struct drm_device *dev,
>   	const struct drm_framebuffer_funcs *funcs)
>   {
>   	const struct drm_format_info *info;
> -	struct drm_fb_cma *fb_cma;
> +	struct drm_framebuffer *fb;
>   	struct drm_gem_cma_object *objs[4];
>   	struct drm_gem_object *obj;
>   	int ret;
> @@ -205,13 +182,13 @@ struct drm_framebuffer *drm_fb_cma_create_with_funcs(struct drm_device *dev,
>   		objs[i] = to_drm_gem_cma_obj(obj);
>   	}
>   
> -	fb_cma = drm_fb_cma_alloc(dev, mode_cmd, objs, i, funcs);
> -	if (IS_ERR(fb_cma)) {
> -		ret = PTR_ERR(fb_cma);
> +	fb = drm_fb_cma_alloc(dev, mode_cmd, objs, i, funcs);
> +	if (IS_ERR(fb)) {
> +		ret = PTR_ERR(fb);
>   		goto err_gem_object_put;
>   	}
>   
> -	return &fb_cma->fb;
> +	return fb;
>   
>   err_gem_object_put:
>   	for (i--; i >= 0; i--)
> @@ -250,12 +227,10 @@ EXPORT_SYMBOL_GPL(drm_fb_cma_create);
>   struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
>   						  unsigned int plane)
>   {
> -	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
> -
>   	if (plane >= 4)
>   		return NULL;
>   
> -	return fb_cma->obj[plane];
> +	return to_drm_gem_cma_obj(fb->gem_objs[plane]);
>   }
>   EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_obj);
>   
> @@ -272,13 +247,13 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
>   				   struct drm_plane_state *state,
>   				   unsigned int plane)
>   {
> -	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
> +	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, plane);
>   	dma_addr_t paddr;
>   
> -	if (plane >= 4)
> +	if (!cma_bo)
>   		return 0;
>   
> -	paddr = fb_cma->obj[plane]->paddr + fb->offsets[plane];
> +	paddr = cma_bo->paddr + fb->offsets[plane];
>   	paddr += fb->format->cpp[plane] * (state->src_x >> 16);
>   	paddr += fb->pitches[plane] * (state->src_y >> 16);
>   
> @@ -321,7 +296,6 @@ EXPORT_SYMBOL_GPL(drm_fb_cma_prepare_fb);
>   #ifdef CONFIG_DEBUG_FS
>   static void drm_fb_cma_describe(struct drm_framebuffer *fb, struct seq_file *m)
>   {
> -	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
>   	int i;
>   
>   	seq_printf(m, "fb: %dx%d@%4.4s\n", fb->width, fb->height,
> @@ -330,7 +304,7 @@ static void drm_fb_cma_describe(struct drm_framebuffer *fb, struct seq_file *m)
>   	for (i = 0; i < fb->format->num_planes; i++) {
>   		seq_printf(m, "   %d: offset=%d pitch=%d, obj: ",
>   				i, fb->offsets[i], fb->pitches[i]);
> -		drm_gem_cma_describe(fb_cma->obj[i], m);
> +		drm_gem_cma_describe(drm_fb_cma_get_gem_obj(fb, i), m);
>   	}
>   }
>   
> @@ -472,7 +446,7 @@ drm_fbdev_cma_create(struct drm_fb_helper *helper,
>   		goto err_fb_info_destroy;
>   	}
>   
> -	fb = &fbdev_cma->fb->fb;
> +	fb = fbdev_cma->fb;
>   	helper->fb = fb;
>   
>   	fbi->par = helper;
> @@ -500,7 +474,7 @@ drm_fbdev_cma_create(struct drm_fb_helper *helper,
>   	return 0;
>   
>   err_cma_destroy:
> -	drm_framebuffer_remove(&fbdev_cma->fb->fb);
> +	drm_framebuffer_remove(fbdev_cma->fb);
>   err_fb_info_destroy:
>   	drm_fb_helper_fini(helper);
>   err_gem_free_object:
> @@ -598,7 +572,7 @@ void drm_fbdev_cma_fini(struct drm_fbdev_cma *fbdev_cma)
>   		drm_fbdev_cma_defio_fini(fbdev_cma->fb_helper.fbdev);
>   
>   	if (fbdev_cma->fb)
> -		drm_framebuffer_remove(&fbdev_cma->fb->fb);
> +		drm_framebuffer_remove(fbdev_cma->fb);
>   
>   	drm_fb_helper_fini(&fbdev_cma->fb_helper);
>   	kfree(fbdev_cma);
