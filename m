From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Add zpos property for cursor planes
Date: Wed, 10 Jun 2020 15:10:54 +0300
Message-ID: <20200610121054.GV6112@intel.com>
References: <20200610113059.2164132-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200610113059.2164132-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 10, 2020 at 01:30:59PM +0200, Thierry Reding wrote:
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
> Reported-by: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/dc.c  | 10 ++++++++--
>  drivers/gpu/drm/tegra/hub.c |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 83f31c6e891c..e7a6eb952ece 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -787,7 +787,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +	drm_plane_create_zpos_property(&plane->base, 1 + plane->index, 1, 255);
>  
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> @@ -957,6 +957,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_zpos_immutable_property(&plane->base, 0);

zpos==0 means the plane is at the bottom of the pile. Doesn't seem to
agree what you say in the commit msg.

>  
>  	return &plane->base;
>  }
> @@ -1074,7 +1075,12 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> -	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
> +
> +	if (!cursor)
> +		drm_plane_create_zpos_property(&plane->base, 1 + plane->index,
> +					       1, 255);
> +	else
> +		drm_plane_create_zpos_immutable_property(&plane->base, 0);
>  
>  	err = drm_plane_create_rotation_property(&plane->base,
>  						 DRM_MODE_ROTATE_0,
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index a2ef8f218d4e..697d75bbb9fa 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -590,7 +590,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
>  	}
>  
>  	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
> -	drm_plane_create_zpos_property(p, 0, 0, 255);
> +	drm_plane_create_zpos_property(p, 1 + index, 1, 255);
>  
>  	return p;
>  }
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
