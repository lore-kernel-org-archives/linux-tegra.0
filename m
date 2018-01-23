From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/5] drm: Don't pass clip to
 drm_atomic_helper_check_plane_state()
Date: Tue, 23 Jan 2018 17:46:30 +0000
Message-ID: <20180123174630.GJ11908@e110455-lin.cambridge.arm.com>
References: <20180123170857.13818-1-ville.syrjala@linux.intel.com>
 <20180123170857.13818-5-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180123170857.13818-5-ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>, Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>, Thomas Hellstrom <thellstro>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 23, 2018 at 07:08:57PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> 
> Move the plane clip rectangle handling into
> drm_atomic_helper_check_plane_state(). Drivers no longer
> have to worry about such mundane details.
> 
> v2: Convert armada, rcar, and sun4i as well
> 
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Brian Starkey <brian.starkey-5wv7dgnIgG8@public.gmane.org>
> Cc: Mali DP Maintainers <malidp-VeJGdqYn5oNWk0Htik3J/w@public.gmane.org>
> Cc: Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Cc: Gustavo Padovan <gustavo-THi1TnShQwVAfugRpC6u6w@public.gmane.org>
> Cc: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Cc: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Cc: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Cc: "Heiko Stübner" <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: VMware Graphics <linux-graphics-maintainer-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Sinclair Yeh <syeh-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Thomas Hellstrom <thellstrom-pghWNbHTmq7QT0dZR+AlfA@public.gmane.org>
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Suggested-by: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
> Signed-off-by: Ville Syrjälä <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Reviewed-by: Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> #msm
> ---
>  drivers/gpu/drm/arm/hdlcd_crtc.c            |  7 +------
>  drivers/gpu/drm/arm/malidp_planes.c         |  7 +------
>  drivers/gpu/drm/armada/armada_crtc.c        |  8 ++------
>  drivers/gpu/drm/armada/armada_overlay.c     |  8 ++------
>  drivers/gpu/drm/drm_atomic_helper.c         | 12 +++++++-----
>  drivers/gpu/drm/drm_plane_helper.c          | 11 +++--------
>  drivers/gpu/drm/drm_simple_kms_helper.c     |  6 ------
>  drivers/gpu/drm/i915/intel_display.c        | 12 ------------
>  drivers/gpu/drm/imx/ipuv3-plane.c           |  7 +------
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  7 +------
>  drivers/gpu/drm/meson/meson_plane.c         |  7 +------
>  drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c   | 14 ++------------
>  drivers/gpu/drm/nouveau/nv50_display.c      | 12 ------------
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c     |  7 +------
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c |  7 +------
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c      |  7 +------
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c      |  7 +------
>  drivers/gpu/drm/tegra/plane.c               |  7 +------
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c         |  7 +------
>  drivers/gpu/drm/zte/zx_plane.c              | 13 +------------
>  include/drm/drm_atomic_helper.h             |  1 -
>  include/drm/drm_plane_helper.h              |  1 -
>  22 files changed, 28 insertions(+), 147 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
> index 877647ef35a9..cf5cbd63ecdf 100644
> --- a/drivers/gpu/drm/arm/hdlcd_crtc.c
> +++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
> @@ -229,7 +229,6 @@ static const struct drm_crtc_helper_funcs hdlcd_crtc_helper_funcs = {
>  static int hdlcd_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
> -	struct drm_rect clip = { 0 };
>  	struct drm_crtc_state *crtc_state;
>  	u32 src_h = state->src_h >> 16;
>  
> @@ -249,11 +248,7 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	return drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   false, true);
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 2885d69af456..ee32361c87ac 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -141,18 +141,13 @@ static int malidp_se_check_scaling(struct malidp_plane *mp,
>  	struct drm_crtc_state *crtc_state =
>  		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
>  	struct malidp_crtc_state *mc;
> -	struct drm_rect clip = { 0 };
>  	u32 src_w, src_h;
>  	int ret;
>  
>  	if (!crtc_state)
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  0, INT_MAX, true, true);
>  	if (ret)
>  		return ret;

For the HDLCD and Mali DP changes:

Acked-by: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>

Best regards,
Liviu

> diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
> index fdc34ad4ca62..03eeee11dd5b 100644
> --- a/drivers/gpu/drm/armada/armada_crtc.c
> +++ b/drivers/gpu/drm/armada/armada_crtc.c
> @@ -1203,15 +1203,11 @@ static int armada_drm_primary_update(struct drm_plane *plane,
>  	struct drm_crtc_state crtc_state = {
>  		.crtc = crtc,
>  		.enable = crtc->enabled,
> +		.mode = crtc->mode,
>  	};
> -	struct drm_rect clip = {};
>  	int ret;
>  
> -	if (crtc->enabled)
> -		drm_mode_get_hv_timing(&crtc->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(&state, &crtc_state, &clip, 0,
> +	ret = drm_atomic_helper_check_plane_state(&state, &crtc_state, 0,
>  						  INT_MAX, true, false);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
> index 4f2a7a6e0fd3..c391955009d6 100644
> --- a/drivers/gpu/drm/armada/armada_overlay.c
> +++ b/drivers/gpu/drm/armada/armada_overlay.c
> @@ -208,19 +208,15 @@ armada_ovl_plane_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  	struct drm_crtc_state crtc_state = {
>  		.crtc = crtc,
>  		.enable = crtc->enabled,
> +		.mode = crtc->mode,
>  	};
> -	struct drm_rect clip = {};
>  	int ret;
>  
>  	trace_armada_ovl_plane_update(plane, crtc, fb,
>  				 crtc_x, crtc_y, crtc_w, crtc_h,
>  				 src_x, src_y, src_w, src_h);
>  
> -	if (crtc->enabled)
> -		drm_mode_get_hv_timing(&crtc->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(&state, &crtc_state, &clip, 0,
> +	ret = drm_atomic_helper_check_plane_state(&state, &crtc_state, 0,
>  						  INT_MAX, true, false);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index ab4032167094..9fb96f9cc36e 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -699,7 +699,6 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>   * drm_atomic_helper_check_plane_state() - Check plane state for validity
>   * @plane_state: plane state to check
>   * @crtc_state: crtc state to check
> - * @clip: integer clipping coordinates
>   * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
>   * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
>   * @can_position: is it legal to position the plane such that it
> @@ -719,7 +718,6 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>   */
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
> -					const struct drm_rect *clip,
>  					int min_scale,
>  					int max_scale,
>  					bool can_position,
> @@ -729,6 +727,7 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  	struct drm_rect *src = &plane_state->src;
>  	struct drm_rect *dst = &plane_state->dst;
>  	unsigned int rotation = plane_state->rotation;
> +	struct drm_rect clip = {};
>  	int hscale, vscale;
>  
>  	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
> @@ -764,7 +763,10 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  		return -ERANGE;
>  	}
>  
> -	plane_state->visible = drm_rect_clip_scaled(src, dst, clip, hscale, vscale);
> +	if (crtc_state->enable)
> +		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
> +
> +	plane_state->visible = drm_rect_clip_scaled(src, dst, &clip, hscale, vscale);
>  
>  	drm_rect_rotate_inv(src, fb->width << 16, fb->height << 16, rotation);
>  
> @@ -778,10 +780,10 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  		 */
>  		return 0;
>  
> -	if (!can_position && !drm_rect_equals(dst, clip)) {
> +	if (!can_position && !drm_rect_equals(dst, &clip)) {
>  		DRM_DEBUG_KMS("Plane must cover entire CRTC\n");
>  		drm_rect_debug_print("dst: ", dst, false);
> -		drm_rect_debug_print("clip: ", clip, false);
> +		drm_rect_debug_print("clip: ", &clip, false);
>  		return -EINVAL;
>  	}
>  
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index f1be8cd4e387..f88f68161519 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -106,7 +106,6 @@ static int get_connectors_for_crtc(struct drm_crtc *crtc,
>   * @fb: framebuffer to flip onto plane
>   * @src: source coordinates in 16.16 fixed point
>   * @dst: integer destination coordinates
> - * @clip: integer clipping coordinates
>   * @rotation: plane rotation
>   * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
>   * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
> @@ -131,7 +130,6 @@ int drm_plane_helper_check_update(struct drm_plane *plane,
>  				  struct drm_framebuffer *fb,
>  				  struct drm_rect *src,
>  				  struct drm_rect *dst,
> -				  const struct drm_rect *clip,
>  				  unsigned int rotation,
>  				  int min_scale,
>  				  int max_scale,
> @@ -157,11 +155,12 @@ int drm_plane_helper_check_update(struct drm_plane *plane,
>  	struct drm_crtc_state crtc_state = {
>  		.crtc = crtc,
>  		.enable = crtc->enabled,
> +		.mode = crtc->mode,
>  	};
>  	int ret;
>  
>  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> -						  clip, min_scale, max_scale,
> +						  min_scale, max_scale,
>  						  can_position,
>  						  can_update_disabled);
>  	if (ret)
> @@ -239,16 +238,12 @@ int drm_primary_helper_update(struct drm_plane *plane, struct drm_crtc *crtc,
>  		.x2 = crtc_x + crtc_w,
>  		.y2 = crtc_y + crtc_h,
>  	};
> -	const struct drm_rect clip = {
> -		.x2 = crtc->mode.hdisplay,
> -		.y2 = crtc->mode.vdisplay,
> -	};
>  	struct drm_connector **connector_list;
>  	int num_connectors, ret;
>  	bool visible;
>  
>  	ret = drm_plane_helper_check_update(plane, crtc, fb,
> -					    &src, &dest, &clip,
> +					    &src, &dest,
>  					    DRM_MODE_ROTATE_0,
>  					    DRM_PLANE_HELPER_NO_SCALING,
>  					    DRM_PLANE_HELPER_NO_SCALING,
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 9d3f6b70812c..165bc756af96 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -89,7 +89,6 @@ static const struct drm_crtc_funcs drm_simple_kms_crtc_funcs = {
>  static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
>  					struct drm_plane_state *plane_state)
>  {
> -	struct drm_rect clip = { 0 };
>  	struct drm_simple_display_pipe *pipe;
>  	struct drm_crtc_state *crtc_state;
>  	int ret;
> @@ -100,12 +99,7 @@ static int drm_simple_kms_plane_atomic_check(struct drm_plane *plane,
>  	if (!crtc_state->enable)
>  		return 0; /* nothing to check when disabling or disabled */
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
>  	ret = drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> -						  &clip,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  false, true);
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index d585ce4c8732..3933420c6911 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -9309,18 +9309,12 @@ static int intel_check_cursor(struct intel_crtc_state *crtc_state,
>  			      struct intel_plane_state *plane_state)
>  {
>  	const struct drm_framebuffer *fb = plane_state->base.fb;
> -	struct drm_rect clip = {};
>  	int src_x, src_y;
>  	u32 offset;
>  	int ret;
>  
> -	if (crtc_state->base.enable)
> -		drm_mode_get_hv_timing(&crtc_state->base.mode,
> -				       &clip.x2, &clip.y2);
> -
>  	ret = drm_atomic_helper_check_plane_state(&plane_state->base,
>  						  &crtc_state->base,
> -						  &clip,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  true, true);
> @@ -12755,7 +12749,6 @@ intel_check_primary_plane(struct intel_plane *plane,
>  	int min_scale = DRM_PLANE_HELPER_NO_SCALING;
>  	int max_scale = DRM_PLANE_HELPER_NO_SCALING;
>  	bool can_position = false;
> -	struct drm_rect clip = {};
>  	int ret;
>  
>  	if (INTEL_GEN(dev_priv) >= 9) {
> @@ -12767,13 +12760,8 @@ intel_check_primary_plane(struct intel_plane *plane,
>  		can_position = true;
>  	}
>  
> -	if (crtc_state->base.enable)
> -		drm_mode_get_hv_timing(&crtc_state->base.mode,
> -				       &clip.x2, &clip.y2);
> -
>  	ret = drm_atomic_helper_check_plane_state(&state->base,
>  						  &crtc_state->base,
> -						  &clip,
>  						  min_scale, max_scale,
>  						  can_position, true);
>  	if (ret)
> diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
> index 150628293c51..d7e3583e608e 100644
> --- a/drivers/gpu/drm/imx/ipuv3-plane.c
> +++ b/drivers/gpu/drm/imx/ipuv3-plane.c
> @@ -351,7 +351,6 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_framebuffer *old_fb = old_state->fb;
>  	unsigned long eba, ubo, vbo, old_ubo, old_vbo, alpha_eba;
>  	bool can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
> -	struct drm_rect clip = {};
>  	int hsub, vsub;
>  	int ret;
>  
> @@ -367,11 +366,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  can_position, true);
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index b5c6eec9a584..2f4b0ffee598 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -91,7 +91,6 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct drm_framebuffer *fb = state->fb;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = { 0, };
>  
>  	if (!fb)
>  		return 0;
> @@ -108,11 +107,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	return drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   true, true);
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index 3801bee1f9e6..c78a3a59f58c 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -49,7 +49,6 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = { 0, };
>  
>  	if (!state->crtc)
>  		return 0;
> @@ -58,11 +57,7 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	return drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   true, true);
> diff --git a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> index 98d4d7331767..44fc9fe4737a 100644
> --- a/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/mdp/mdp5/mdp5_plane.c
> @@ -286,7 +286,6 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>  	uint32_t max_width, max_height;
>  	bool out_of_bounds = false;
>  	uint32_t caps = 0;
> -	struct drm_rect clip = {};
>  	int min_scale, max_scale;
>  	int ret;
>  
> @@ -323,11 +322,7 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
>  	min_scale = FRAC_16_16(1, 8);
>  	max_scale = FRAC_16_16(8, 1);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  min_scale, max_scale,
>  						  true, true);
>  	if (ret)
> @@ -471,7 +466,6 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
>  {
>  	struct mdp5_plane_state *mdp5_state = to_mdp5_plane_state(state);
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = {};
>  	int min_scale, max_scale;
>  	int ret;
>  
> @@ -502,11 +496,7 @@ static int mdp5_plane_atomic_async_check(struct drm_plane *plane,
>  	min_scale = FRAC_16_16(1, 8);
>  	max_scale = FRAC_16_16(8, 1);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  min_scale, max_scale,
>  						  true, true);
>  	if (ret)
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nouveau/nv50_display.c
> index 5a9a51c735f0..eea94c098237 100644
> --- a/drivers/gpu/drm/nouveau/nv50_display.c
> +++ b/drivers/gpu/drm/nouveau/nv50_display.c
> @@ -1135,15 +1135,9 @@ static int
>  nv50_curs_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>  		  struct nv50_head_atom *asyh)
>  {
> -	struct drm_rect clip = {};
>  	int ret;
>  
> -	if (asyh->state.enable)
> -		drm_mode_get_hv_timing(&asyh->state.mode,
> -				       &clip.x2, &clip.y2);
> -
>  	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
> -						  &clip,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  true, true);
> @@ -1427,18 +1421,12 @@ nv50_base_acquire(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
>  		  struct nv50_head_atom *asyh)
>  {
>  	const struct drm_framebuffer *fb = asyw->state.fb;
> -	struct drm_rect clip = {};
>  	int ret;
>  
>  	if (!fb->format->depth)
>  		return -EINVAL;
>  
> -	if (asyh->state.enable)
> -		drm_mode_get_hv_timing(&asyh->state.mode,
> -				       &clip.x2, &clip.y2);
> -
>  	ret = drm_atomic_helper_check_plane_state(&asyw->state, &asyh->state,
> -						  &clip,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  false, true);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index 5687a94d4cb1..68556bd9dad2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -572,7 +572,6 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct drm_device *dev = plane->dev;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = {};
>  	int ret;
>  
>  	if (!state->crtc) {
> @@ -589,11 +588,7 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  true, true);
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> index cd2c72389629..b95e9d45a435 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -641,7 +641,6 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>  	struct vop_win *vop_win = to_vop_win(plane);
>  	const struct vop_win_data *win = vop_win->data;
>  	int ret;
> -	struct drm_rect clip = {};
>  	int min_scale = win->phy->scl ? FRAC_16_16(1, 8) :
>  					DRM_PLANE_HELPER_NO_SCALING;
>  	int max_scale = win->phy->scl ? FRAC_16_16(8, 1) :
> @@ -654,11 +653,7 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  min_scale, max_scale,
>  						  true, true);
>  	if (ret)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> index 2f0ccd50b54d..9a540330cb79 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
> @@ -211,7 +211,6 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
>  	struct drm_crtc *crtc = state->crtc;
>  	struct drm_crtc_state *crtc_state;
>  	int min_scale, max_scale;
> -	struct drm_rect clip = {};
>  
>  	if (!crtc)
>  		return 0;
> @@ -220,10 +219,6 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
>  	min_scale = DRM_PLANE_HELPER_NO_SCALING;
>  	max_scale = DRM_PLANE_HELPER_NO_SCALING;
>  
> @@ -232,7 +227,7 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
>  		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
>  	}
>  
> -	return drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   min_scale, max_scale,
>  						   true, true);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> index eb3bf2d7291a..5877f8ef5895 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> @@ -239,7 +239,6 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
>  	struct drm_crtc *crtc = state->crtc;
>  	struct drm_crtc_state *crtc_state;
>  	int min_scale, max_scale;
> -	struct drm_rect clip = {};
>  
>  	if (!crtc)
>  		return 0;
> @@ -248,10 +247,6 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
>  	if (WARN_ON(!crtc_state))
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
>  	min_scale = DRM_PLANE_HELPER_NO_SCALING;
>  	max_scale = DRM_PLANE_HELPER_NO_SCALING;
>  
> @@ -260,7 +255,7 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
>  		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
>  	}
>  
> -	return drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	return drm_atomic_helper_check_plane_state(state, crtc_state,
>  						   min_scale, max_scale,
>  						   true, true);
>  }
> diff --git a/drivers/gpu/drm/tegra/plane.c b/drivers/gpu/drm/tegra/plane.c
> index 7267a01e6f08..a056fbf83b53 100644
> --- a/drivers/gpu/drm/tegra/plane.c
> +++ b/drivers/gpu/drm/tegra/plane.c
> @@ -82,7 +82,6 @@ int tegra_plane_state_add(struct tegra_plane *plane,
>  {
>  	struct drm_crtc_state *crtc_state;
>  	struct tegra_dc_state *tegra;
> -	struct drm_rect clip = {};
>  	int err;
>  
>  	/* Propagate errors from allocation or locking failures. */
> @@ -90,12 +89,8 @@ int tegra_plane_state_add(struct tegra_plane *plane,
>  	if (IS_ERR(crtc_state))
>  		return PTR_ERR(crtc_state);
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
>  	/* Check plane state for visibility and calculate clipping bounds */
> -	err = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	err = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  0, INT_MAX, true, true);
>  	if (err < 0)
>  		return err;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 1107d6d03506..34ecc27fc30a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -443,17 +443,12 @@ int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
>  {
>  	struct drm_crtc_state *crtc_state = NULL;
>  	struct drm_framebuffer *new_fb = state->fb;
> -	struct drm_rect clip = {};
>  	int ret;
>  
>  	if (state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
>  
> -	if (crtc_state && crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
> -	ret = drm_atomic_helper_check_plane_state(state, crtc_state, &clip,
> +	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  DRM_PLANE_HELPER_NO_SCALING,
>  						  false, true);
> diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
> index 8e1f34274e24..94545adac50d 100644
> --- a/drivers/gpu/drm/zte/zx_plane.c
> +++ b/drivers/gpu/drm/zte/zx_plane.c
> @@ -55,7 +55,6 @@ static int zx_vl_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_crtc *crtc = plane_state->crtc;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = {};
>  	int min_scale = FRAC_16_16(1, 8);
>  	int max_scale = FRAC_16_16(8, 1);
>  
> @@ -75,12 +74,8 @@ static int zx_vl_plane_atomic_check(struct drm_plane *plane,
>  	if (!plane_state->crtc)
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
>  	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> -						   &clip, min_scale, max_scale,
> +						   min_scale, max_scale,
>  						   true, true);
>  }
>  
> @@ -291,7 +286,6 @@ static int zx_gl_plane_atomic_check(struct drm_plane *plane,
>  	struct drm_framebuffer *fb = plane_state->fb;
>  	struct drm_crtc *crtc = plane_state->crtc;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_rect clip = {};
>  
>  	if (!crtc || !fb)
>  		return 0;
> @@ -309,12 +303,7 @@ static int zx_gl_plane_atomic_check(struct drm_plane *plane,
>  	if (!plane_state->crtc)
>  		return -EINVAL;
>  
> -	if (crtc_state->enable)
> -		drm_mode_get_hv_timing(&crtc_state->mode,
> -				       &clip.x2, &clip.y2);
> -
>  	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
> -						   &clip,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   DRM_PLANE_HELPER_NO_SCALING,
>  						   false, true);
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 4842ee9485ce..26aaba58d6ce 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -40,7 +40,6 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
>  				struct drm_atomic_state *state);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
>  					const struct drm_crtc_state *crtc_state,
> -					const struct drm_rect *clip,
>  					int min_scale,
>  					int max_scale,
>  					bool can_position,
> diff --git a/include/drm/drm_plane_helper.h b/include/drm/drm_plane_helper.h
> index 8aa49c0ecd4d..28d7ce620729 100644
> --- a/include/drm/drm_plane_helper.h
> +++ b/include/drm/drm_plane_helper.h
> @@ -43,7 +43,6 @@ int drm_plane_helper_check_update(struct drm_plane *plane,
>  				  struct drm_framebuffer *fb,
>  				  struct drm_rect *src,
>  				  struct drm_rect *dest,
> -				  const struct drm_rect *clip,
>  				  unsigned int rotation,
>  				  int min_scale,
>  				  int max_scale,
> -- 
> 2.13.6
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
