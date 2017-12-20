From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/5] drm/tegra: Restore opaque and drop alpha formats
 on Tegra20/30
Date: Wed, 20 Dec 2017 23:01:49 +0300
Message-ID: <3924358d-ae3b-78a4-1227-164435add8d1@gmail.com>
References: <cover.1513783738.git.digetx@gmail.com>
 <0476e28d70b47ec599fb65d1cfa457276629de27.1513783738.git.digetx@gmail.com>
 <20171220180119.GB8780@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220180119.GB8780@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 20.12.2017 21:01, Thierry Reding wrote:
> On Wed, Dec 20, 2017 at 06:46:11PM +0300, Dmitry Osipenko wrote:
>> Commit 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats") broke
>> DRM's MODE_ADDFB IOCTL on Tegra20/30, because IOCTL uses XRGB format if
>> requested FB depth is 24bpp. As a result, Xorg doesn't work anymore with
>> both modesetting and opentegra drivers. On older Tegra's each plane has
>> a blending configuration which should be used to enable / disable alpha
>> blending and right now the blending configs are hardcoded to disabled
>> alpha blending. In order to support alpha formats properly, planes
>> blending configuration must be adjusted, until then the alpha formats
>> are equal to non-alpha.
>>
>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c    | 29 ++++++++++++++++++-----------
>>  drivers/gpu/drm/tegra/dc.h    |  1 +
>>  drivers/gpu/drm/tegra/fb.c    | 13 -------------
>>  drivers/gpu/drm/tegra/hub.c   |  3 ++-
>>  drivers/gpu/drm/tegra/plane.c | 22 +++++++++++++++++-----
>>  drivers/gpu/drm/tegra/plane.h |  2 +-
>>  6 files changed, 39 insertions(+), 31 deletions(-)
> 
> This kept bugging me, so I spent some time looking at the blending
> programming. I came up with the attached patch which seems to work
> for all scenarios and is fairly similar to your patch. It has the
> added benefit that we can keep support for more formats.
> 
> Any comments?
> 
> Thierry
> --- >8 ---
> From 3d2b7d1a9b8239dc6940477d8783461ac60783bc Mon Sep 17 00:00:00 2001
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date: Wed, 20 Dec 2017 09:39:14 +0100
> Subject: [PATCH] drm/tegra: dc: Implement legacy blending
> 
> This implements alpha blending on legacy display controllers (Tegra20,
> Tegra30 and Tegra114). While it's theoretically possible to support the
> zpos property to enable userspace to specify the Z-order of each plane
> individually, this is not currently supported and the same fixed Z-
> order as previously defined is used.

Perhaps one variant of implementing zpos could be by making overlays 'virtual',
so each virtual overlay will be backed by the real HW plane and we could swap
the HW planes of the virtual overlays, emulating zpos.

> Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats") since
> the opaque formats are now supported.
> 
> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c    | 74 ++++++++++++++++++++++++++++++++++---------
>  drivers/gpu/drm/tegra/dc.h    | 13 ++++++++
>  drivers/gpu/drm/tegra/fb.c    | 12 -------
>  drivers/gpu/drm/tegra/plane.c | 41 ++++++++++++++++++++++++
>  drivers/gpu/drm/tegra/plane.h |  3 ++
>  5 files changed, 116 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index bc65c314e00f..07c687d7f615 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -168,32 +168,46 @@ static inline u32 compute_initial_dda(unsigned int in)
>  	return dfixed_frac(inf);
>  }
>  
> -static void tegra_plane_setup_blending_legacy(struct tegra_plane *plane)
> +static void
> +tegra_plane_setup_blending_legacy(struct tegra_plane *plane,
> +				  const struct tegra_dc_window *window)
>  {
> +	u32 foreground = BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255) |
> +			 BLEND_COLOR_KEY_NONE;
> +	u32 background = BLEND_WEIGHT1(0) | BLEND_WEIGHT0(0) |
> +			 BLEND_COLOR_KEY_NONE;
> +	u32 blendnokey = BLEND_WEIGHT1(255) | BLEND_WEIGHT0(255);
> +
> +	/* enable alpha blending if window->alpha */
> +	if (window->alpha) {
> +		background |= BLEND_CONTROL_DEPENDENT;
> +		foreground |= BLEND_CONTROL_ALPHA;
> +	}

I think dependent weight means that window doesn't have alpha transparency. So
we should set the dependent_weight mode for opaque formats and alpha_weight for
formats with alpha channel.

If the above is correct, then I'm suggesting to not expose alpha formats, we
should properly test all combinations of blending of all the windows. In one
case you could apply my patch for now and then me/you/we could work on a proper
legacy blending implementation based on your patch. In the other case I could
take your patch into v4 (cursor patch would have to be rabased in that case) and
we will correct blending sometime later. I don't mind either case, up to you to
decide.

Is there any ready-made testsuite for the DRM planes blending? Or you have made
a test by yourself? In the latter case, could you please share the code so that
I could test it too without burden of writing testcases from scratch?

> +
>  	/*
>  	 * Disable blending and assume Window A is the bottom-most window,
>  	 * Window C is the top-most window and Window B is in the middle.
>  	 */
> -	tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_NOKEY);
> -	tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_1WIN);
> +	tegra_plane_writel(plane, blendnokey, DC_WIN_BLEND_NOKEY);
> +	tegra_plane_writel(plane, foreground, DC_WIN_BLEND_1WIN);
>  
>  	switch (plane->index) {
>  	case 0:
> -		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_X);
> -		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_Y);
> -		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_3WIN_XY);
> +		tegra_plane_writel(plane, background, DC_WIN_BLEND_2WIN_X);
> +		tegra_plane_writel(plane, background, DC_WIN_BLEND_2WIN_Y);
> +		tegra_plane_writel(plane, background, DC_WIN_BLEND_3WIN_XY);
>  		break;
>  
>  	case 1:
> -		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_X);
> -		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_2WIN_Y);
> -		tegra_plane_writel(plane, 0x000000, DC_WIN_BLEND_3WIN_XY);
> +		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_2WIN_X);
> +		tegra_plane_writel(plane, background, DC_WIN_BLEND_2WIN_Y);
> +		tegra_plane_writel(plane, background, DC_WIN_BLEND_3WIN_XY);
>  		break;
>  
>  	case 2:
> -		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_X);
> -		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_2WIN_Y);
> -		tegra_plane_writel(plane, 0xffff00, DC_WIN_BLEND_3WIN_XY);
> +		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_2WIN_X);
> +		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_2WIN_Y);
> +		tegra_plane_writel(plane, foreground, DC_WIN_BLEND_3WIN_XY);
>  		break;
>  	}
>  }
> @@ -359,7 +373,7 @@ static void tegra_dc_setup_window(struct tegra_plane *plane,
>  	if (dc->soc->supports_blending) {
>  		tegra_plane_setup_blending(plane, window);
>  	} else {
> -		tegra_plane_setup_blending_legacy(plane);
> +		tegra_plane_setup_blending_legacy(plane, window);
>  	}
>  }
>  
> @@ -370,6 +384,11 @@ static const u32 tegra20_primary_formats[] = {
>  	DRM_FORMAT_RGBA5551,
>  	DRM_FORMAT_ABGR8888,
>  	DRM_FORMAT_ARGB8888,
> +	/* non-native formats */
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGBX5551,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XRGB8888,
>  };
>  
>  static const u32 tegra114_primary_formats[] = {
> @@ -426,18 +445,37 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
>  	struct tegra_bo_tiling *tiling = &plane_state->tiling;
>  	struct tegra_plane *tegra = to_tegra_plane(plane);
>  	struct tegra_dc *dc = to_tegra_dc(state->crtc);
> +	unsigned int format;
>  	int err;
>  
>  	/* no need for further checks if the plane is being disabled */
>  	if (!state->crtc)
>  		return 0;
>  
> -	err = tegra_plane_format(state->fb->format->format,
> -				 &plane_state->format,
> +	err = tegra_plane_format(state->fb->format->format, &format,
>  				 &plane_state->swap);
>  	if (err < 0)
>  		return err;
>  
> +	/*
> +	 * Tegra20 and Tegra30 are special cases here because they support
> +	 * only variants of specific formats with an alpha component, but not
> +	 * the corresponding opaque formats. However, the opaque formats can
> +	 * be emulated by disabling alpha blending for the plane.
> +	 */
> +	if (tegra_plane_format_is_opaque(format) &&
> +	    !dc->soc->supports_blending) {
> +		err = tegra_plane_format_get_alpha(format, &format);
> +		if (err < 0)
> +			return err;
> +
> +		plane_state->alpha = false;
> +	} else {
> +		plane_state->alpha = true;
> +	}
> +
> +	plane_state->format = format;
> +
>  	err = tegra_fb_get_tiling(state->fb, tiling);
>  	if (err < 0)
>  		return err;
> @@ -514,6 +552,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
>  	window.zpos = plane->state->normalized_zpos;
>  	window.tiling = state->tiling;
>  	window.format = state->format;
> +	window.alpha = state->alpha;
>  	window.swap = state->swap;
>  
>  	for (i = 0; i < fb->format->num_planes; i++) {
> @@ -768,6 +807,11 @@ static const u32 tegra20_overlay_formats[] = {
>  	DRM_FORMAT_RGBA5551,
>  	DRM_FORMAT_ABGR8888,
>  	DRM_FORMAT_ARGB8888,
> +	/* non-native formats */
> +	DRM_FORMAT_XRGB1555,
> +	DRM_FORMAT_RGBX5551,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_XRGB8888,
>  	/* planar formats */
>  	DRM_FORMAT_UYVY,
>  	DRM_FORMAT_YUYV,
> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> index 0c887b53cb10..03b04a7e2814 100644
> --- a/drivers/gpu/drm/tegra/dc.h
> +++ b/drivers/gpu/drm/tegra/dc.h
> @@ -151,6 +151,7 @@ struct tegra_dc_window {
>  
>  	struct tegra_bo_tiling tiling;
>  	u32 format;
> +	bool alpha;
>  	u32 swap;
>  };
>  
> @@ -667,8 +668,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define  SCALER_COEFF_DATA(x) (((x) & 0x3ff) << 0)
>  
>  #define DC_WIN_BLEND_NOKEY			0x70f
> +#define  BLEND_WEIGHT1(x) (((x) & 0xff) << 16)
> +#define  BLEND_WEIGHT0(x) (((x) & 0xff) <<  8)
> +
>  #define DC_WIN_BLEND_1WIN			0x710
> +#define  BLEND_CONTROL_FIX    (0 << 2)
> +#define  BLEND_CONTROL_ALPHA  (1 << 2)
> +#define  BLEND_COLOR_KEY_NONE (0 << 0)
> +#define  BLEND_COLOR_KEY_0    (1 << 0)
> +#define  BLEND_COLOR_KEY_1    (2 << 0)
> +#define  BLEND_COLOR_KEY_BOTH (3 << 0)
> +
>  #define DC_WIN_BLEND_2WIN_X			0x711
> +#define  BLEND_CONTROL_DEPENDENT (2 << 2)
> +
>  #define DC_WIN_BLEND_2WIN_Y			0x712
>  #define DC_WIN_BLEND_3WIN_XY			0x713
>  
> diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
> index 5f6289c4e56a..001cb77e2f59 100644
> --- a/drivers/gpu/drm/tegra/fb.c
> +++ b/drivers/gpu/drm/tegra/fb.c
> @@ -254,18 +254,6 @@ static int tegra_fbdev_probe(struct drm_fb_helper *helper,
>  	cmd.pitches[0] = round_up(sizes->surface_width * bytes_per_pixel,
>  				  tegra->pitch_align);
>  
> -	/*
> -	 * Early generations of Tegra (Tegra20 and Tegra30) do not support any
> -	 * of the X* or *X formats, only their A* or *A equivalents. Force the
> -	 * legacy framebuffer format to include an alpha component so that the
> -	 * framebuffer emulation can be supported on all generations.
> -	 */
> -	if (sizes->surface_bpp == 32 && sizes->surface_depth == 24)
> -		sizes->surface_depth = 32;
> -
> -	if (sizes->surface_bpp == 16 && sizes->surface_depth == 15)
> -		sizes->surface_depth = 16;
> -
>  	cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
>  						     sizes->surface_depth);
>  
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 215051579b3a..dfe991e3d48d 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -51,6 +51,7 @@ tegra_plane_atomic_duplicate_state(struct drm_plane *plane)
>  	__drm_atomic_helper_plane_duplicate_state(plane, &copy->base);
>  	copy->tiling = state->tiling;
>  	copy->format = state->format;
> +	copy->alpha = state->alpha;
>  	copy->swap = state->swap;
>  
>  	return &copy->base;
> @@ -256,6 +257,46 @@ bool tegra_plane_format_is_yuv(unsigned int format, bool *planar)
>  	return false;
>  }
>  
> +/*
> + * This is applicable to Tegra20 and Tegra30 only where the opaque formats can
> + * be emulated using the alpha formats and blending disabled.
> + */
> +bool tegra_plane_format_is_opaque(unsigned int format)
> +{
> +	switch (format) {
> +	case WIN_COLOR_DEPTH_B5G5R5X1:
> +	case WIN_COLOR_DEPTH_X1B5G5R5:
> +	case WIN_COLOR_DEPTH_R8G8B8X8:
> +	case WIN_COLOR_DEPTH_B8G8R8X8:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha)
> +{
> +	switch (opaque) {
> +	case WIN_COLOR_DEPTH_B5G5R5X1:
> +		*alpha = WIN_COLOR_DEPTH_B5G5R5A;
> +		return 0;
> +
> +	case WIN_COLOR_DEPTH_X1B5G5R5:
> +		*alpha = WIN_COLOR_DEPTH_AB5G5R5;
> +		return 0;
> +
> +	case WIN_COLOR_DEPTH_R8G8B8X8:
> +		*alpha = WIN_COLOR_DEPTH_R8G8B8A8;
> +		return 0;
> +
> +	case WIN_COLOR_DEPTH_B8G8R8X8:
> +		*alpha = WIN_COLOR_DEPTH_B8G8R8A8;
> +		return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  void tegra_plane_get(struct tegra_plane *plane)
>  {
>  	mutex_lock(&plane->lock);
> diff --git a/drivers/gpu/drm/tegra/plane.h b/drivers/gpu/drm/tegra/plane.h
> index 429a086ffe88..06d8b0005fe7 100644
> --- a/drivers/gpu/drm/tegra/plane.h
> +++ b/drivers/gpu/drm/tegra/plane.h
> @@ -48,6 +48,7 @@ struct tegra_plane_state {
>  
>  	struct tegra_bo_tiling tiling;
>  	u32 format;
> +	bool alpha;
>  	u32 swap;
>  };
>  
> @@ -69,6 +70,8 @@ int tegra_plane_state_add(struct tegra_plane *plane,
>  
>  int tegra_plane_format(u32 fourcc, u32 *format, u32 *swap);
>  bool tegra_plane_format_is_yuv(unsigned int format, bool *planar);
> +bool tegra_plane_format_is_opaque(unsigned int format);
> +int tegra_plane_format_get_alpha(unsigned int opaque, unsigned int *alpha);
>  
>  void tegra_plane_get(struct tegra_plane *plane);
>  void tegra_plane_put(struct tegra_plane *plane);
> 
