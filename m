From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: fix locking of SET_TILING ioctl
Date: Tue, 17 Nov 2015 11:02:42 +0100
Message-ID: <20151117100241.GN16848@phenom.ffwll.local>
References: <1447312196-11470-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1447312196-11470-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 12, 2015 at 04:09:56PM +0900, Alexandre Courbot wrote:
> drm_gem_object_unreference() now expects obj->dev->struct_mutex to be
> held. Use the newly-introduced drm_gem_object_unreference_unlocked()
> which handles locking for us.

This rule has been really old, I simply made the checking more anal in

commit ef4c6270bf2867e2f8032e9614d1a8cfc6c71663
Author: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Date:   Thu Oct 15 09:36:25 2015 +0200

    drm/gem: Check locking in drm_gem_object_unreference

With the above added this is:

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> 
> If we don't do this drm_gem_object_unreference() will get noisy about
> struct_mutex not being held every time we call the SET_TILING ioctl.
> 
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index cc48334ef164..c0ae89865958 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -683,7 +683,7 @@ static int tegra_gem_set_tiling(struct drm_device *drm, void *data,
>  	bo->tiling.mode = mode;
>  	bo->tiling.value = value;
>  
> -	drm_gem_object_unreference(gem);
> +	drm_gem_object_unreference_unlocked(gem);
>  
>  	return 0;
>  }
> -- 
> 2.6.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
