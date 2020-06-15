From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] =?iso-8859-1?Q?drm=2Fte?=
 =?iso-8859-1?Q?gra=3A_plane=3A_Support_180=B0?= rotation
Date: Mon, 15 Jun 2020 19:57:58 +0300
Message-ID: <20200615165758.GR6112@intel.com>
References: <20200614200121.14147-1-digetx@gmail.com>
 <20200614200121.14147-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200614200121.14147-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Derek Basehore <dbasehore-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Jun 14, 2020 at 11:01:21PM +0300, Dmitry Osipenko wrote:
> Combining horizontal and vertical reflections gives us 180 degrees of
> rotation.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index f31bca27cde4..ddd9b88f8fce 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -608,6 +608,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
>  	unsigned int rotation = DRM_MODE_ROTATE_0 |
> +				DRM_MODE_ROTATE_180 |

Leave this out ...

>  				DRM_MODE_REFLECT_X |
>  				DRM_MODE_REFLECT_Y;
>  	struct tegra_bo_tiling *tiling = &plane_state->tiling;
> @@ -659,6 +660,14 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
>  	else
>  		plane_state->reflect_y = false;
>  
> +	if (tegra_fb_is_bottom_up(state->fb))
> +		plane_state->reflect_y = true;
> +
> +	if (rotation & DRM_MODE_ROTATE_180) {
> +		plane_state->reflect_x = !plane_state->reflect_x;
> +		plane_state->reflect_y = !plane_state->reflect_y;
> +	}

... and drm_rotation_simplify() will do this for you.

Though the bottim_up() thing will need a slightly different tweak I
guess.

I'd write this as somehting like:
rotation = state->rotation;
if (bottom_up())
	rotation ^= DRM_MODE_REFLECT_Y;
rotation = drm_rotation_simplify(rotation,
				 DRM_MODE_ROTATE_0 |
				 DRM_MODE_REFLECT_X |
				 DRM_MODE_REFLECT_Y;

Also note my use of XOR for the bottom_up() handling. I suspect
the current code is already broken if you combine bottom_up()
and REFLECT_Y since it just uses an OR instead of an XOR. That's
assuming my hucnh what bottom_up() is supposed to do is correct.


> +
>  	/*
>  	 * Tegra doesn't support different strides for U and V planes so we
>  	 * error out if the user tries to display a framebuffer with such a
> @@ -720,7 +729,7 @@ static void tegra_plane_atomic_update(struct drm_plane *plane,
>  	window.dst.h = drm_rect_height(&plane->state->dst);
>  	window.bits_per_pixel = fb->format->cpp[0] * 8;
>  	window.reflect_x = state->reflect_x;
> -	window.reflect_y = tegra_fb_is_bottom_up(fb) || state->reflect_y;
> +	window.reflect_y = state->reflect_y;
>  
>  	/* copy from state */
>  	window.zpos = plane->state->normalized_zpos;
> @@ -806,6 +815,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
>  						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_ROTATE_180 |
>  						 DRM_MODE_REFLECT_X |
>  						 DRM_MODE_REFLECT_Y);
>  	if (err < 0)
> @@ -1094,6 +1104,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
>  						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_ROTATE_180 |
>  						 DRM_MODE_REFLECT_X |
>  						 DRM_MODE_REFLECT_Y);
>  	if (err < 0)
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
