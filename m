From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 01/12] drm: Add a new mode flag:
 DRM_MODE_FLAG_PREFER_ONE_SHOT
Date: Mon, 11 May 2015 16:34:57 +0000
Message-ID: <1431362096439.71223@nvidia.com>
References: <1431308311-4470-1-git-send-email-markz@nvidia.com>
 <1431308311-4470-2-git-send-email-markz@nvidia.com>,<20150511092743.GO15256@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150511092743.GO15256-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I just want to make things easier. If we adding this in panel's meta data, it will be harder to make crtc gets this, since normally encoder talks with panel and crtc talks with encoder. But yes, adding this in panel's metadata makes more sense so if there is a better way to do that, I'm happy to do the changes.

Mark
________________________________________
From: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> on behalf of Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Sent: Monday, May 11, 2015 5:27 PM
To: Mark Zhang
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Subject: Re: [RFC PATCH 01/12] drm: Add a new mode flag: DRM_MODE_FLAG_PREFER_ONE_SHOT

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
>  #define  DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH      (6<<14)
>  #define  DRM_MODE_FLAG_3D_TOP_AND_BOTTOM     (7<<14)
>  #define  DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF  (8<<14)
> +#define DRM_MODE_FLAG_PREFER_ONE_SHOT                (1<<19)

tbh this doesn't sound like a mode flag, but something which should be
attached to the drm_panel. Especially since all the single-frame modes are
highly sink/link specific. Why was this added here instead of to the
drm_panel metadata?
-Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
