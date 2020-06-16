From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: Add zpos property for cursor planes
Date: Tue, 16 Jun 2020 18:54:35 +0300
Message-ID: <c34c97ab-08de-341e-05e5-77e2651d956f@gmail.com>
References: <20200616121713.2983627-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200616121713.2983627-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

16.06.2020 15:17, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> As of commit 4dc55525b095 ("drm: plane: Verify that no or all planes
> have a zpos property") a warning is emitted if there's a mix of planes
> with and without a zpos property.
> 
> On Tegra, cursor planes are always composited on top of all other
> planes, which is why they never had a zpos property attached to them.
> However, since the composition order is fixed, this is trivial to
> remedy by simply attaching an immutable zpos property to them.
> 
> Changes in v2:
> - hardcode cursor plane zpos to 255 instead of 0 (Ville)
> 
> Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 9 +++++++--
>  drivers/gpu/drm/tegra/hub.c | 2 +-
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 83f31c6e891c..85408eed4685 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
>  
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>  
>  	return &plane->base;
>  }
> @@ -1074,7 +1075,11 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +
> +	if (!cursor)
> +		drm_plane_create_zpos_property(&plane->base, plane->index, 0, 254);
> +	else
> +		drm_plane_create_zpos_immutable_property(&plane->base, 255);

On T20/30 we're are setting the plane's type to CURSOR because we want
to use one overlay plane for the mouse cursor. Nevertheless, it's still
a generic overlay plane that can change its z-position, and thus, it's
wrong to make zpos immutable here.
