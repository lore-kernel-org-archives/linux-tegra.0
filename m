From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [RFC PATCH 01/12] drm: Add a new mode flag:
 DRM_MODE_FLAG_PREFER_ONE_SHOT
Date: Mon, 11 May 2015 11:27:43 +0200
Message-ID: <20150511092743.GO15256@phenom.ffwll.local>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
 <1431308311-4470-2-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431308311-4470-2-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, May 11, 2015 at 09:38:20AM +0800, Mark Zhang wrote:
> Normally this flag is set by panel driver so that crtc can enable
> the "one-shot" mode(not scan frames continuously).
> 
> Signed-off-by: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/uapi/drm/drm_mode.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index dbeba949462a..5447a338e893 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -72,6 +72,7 @@
>  #define  DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH	(6<<14)
>  #define  DRM_MODE_FLAG_3D_TOP_AND_BOTTOM	(7<<14)
>  #define  DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF	(8<<14)
> +#define DRM_MODE_FLAG_PREFER_ONE_SHOT		(1<<19)

tbh this doesn't sound like a mode flag, but something which should be
attached to the drm_panel. Especially since all the single-frame modes are
highly sink/link specific. Why was this added here instead of to the
drm_panel metadata?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
