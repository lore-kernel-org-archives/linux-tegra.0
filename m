From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 5/5] drm: Don't pass clip to
 drm_atomic_helper_check_plane_state()
Date: Tue, 23 Jan 2018 19:06:53 +0100
Message-ID: <1516730813.7564.15.camel@pengutronix.de>
References: <20180123170857.13818-1-ville.syrjala@linux.intel.com>
         <20180123170857.13818-5-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20180123170857.13818-5-ville.syrjala@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Ville Syrjala <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org
Cc: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>, Mali DP Maintainers <malidp@foss.arm.com>, Daniel Vetter <daniel.vetter@intel.com>, Gustavo Padovan <gustavo@padovan.org>, Sean Paul <seanpaul@chromium.org>, CK Hu <ck.hu@mediatek.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob Clark <robdclark@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Maxime Ripard <maxime.ripard@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, Shawn Guo <shawnguo@kernel.or>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2018-01-23 at 19:08 +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Move the plane clip rectangle handling into
> drm_atomic_helper_check_plane_state(). Drivers no longer
> have to worry about such mundane details.
> 
> v2: Convert armada, rcar, and sun4i as well
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Mali DP Maintainers <malidp@foss.arm.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Gustavo Padovan <gustavo@padovan.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Sinclair Yeh <syeh@vmware.com>
> Cc: Thomas Hellstrom <thellstrom@vmware.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Archit Taneja <architt@codeaurora.org>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Russell King <rmk+kernel@armlinux.org.uk>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Archit Taneja <architt@codeaurora.org> #msm
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
[...]
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
[...]
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
[...]

For the imx and mtk changes,
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
