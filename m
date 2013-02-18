From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 2/7] drm/tegra: Add plane support
Date: Mon, 18 Feb 2013 14:06:56 +0800
Message-ID: <5121C500.3000000@gmail.com>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de> <1360771506-17849-3-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360771506-17849-3-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/14/2013 12:05 AM, Thierry Reding wrote:
> Add support for the B and C planes which support RGB and YUV pixel
> formats and can be used as overlays or hardware cursor. Currently
> only 32-bit RGBA pixel formats are advertised.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
[...]
> +static int tegra_dc_add_planes(struct drm_device *drm, struct tegra_dc *dc)
> +{
> +	unsigned int i;
> +	int err = 0;
> +
> +	for (i = 0; i < 2; i++) {
> +		struct tegra_plane *plane;
> +
> +		plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);

Using "devm_kzalloc" here seems like not a good idea. Everytime plane
disable or crtc disable, we should free "struct tegra_plane" which is
allocated here. But the memory which devm_kzalloc allocates is only
freed when the driver detach. This makes lots of memory can't be
recycled when the plane enable/disable frequently.

> +		if (!plane)
> +			return -ENOMEM;
> +
> +		plane->index = 1 + i;
> +
> +		err = drm_plane_init(drm, &plane->base, 1 << dc->pipe,
> +				     &tegra_plane_funcs, plane_formats,
> +				     ARRAY_SIZE(plane_formats), false);
> +		if (err < 0)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct drm_crtc_funcs tegra_crtc_funcs = {
>  	.set_config = drm_crtc_helper_set_config,
>  	.destroy = drm_crtc_cleanup,
>  };
>  
> -static void tegra_crtc_dpms(struct drm_crtc *crtc, int mode)
> +static void tegra_crtc_disable(struct drm_crtc *crtc)
>  {
> +	struct drm_device *drm = crtc->dev;
> +	struct drm_plane *plane;
> +
> +	list_for_each_entry(plane, &drm->mode_config.plane_list, head) {
> +		if (plane->crtc == crtc) {
> +			tegra_plane_disable(plane);
> +			plane->crtc = NULL;
> +
> +			if (plane->fb) {
> +				drm_framebuffer_unreference(plane->fb);
> +				plane->fb = NULL;
> +			}
> +		}
> +	}

If what I mentioned above(about using devm_kzalloc to allocate "struct
tegra_plane") is correct, we need to free "struct tegra_plane" here.

>  }
>  
>  static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
> @@ -46,10 +144,11 @@ static bool tegra_crtc_mode_fixup(struct drm_crtc *crtc,
>  	return true;
>  }
>
[...]
> 
