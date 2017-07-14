From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [Intel-gfx] [PATCH v2 08/12] drm/tegra: Handle
 drm_atomic_helper_swap_state failure
Date: Fri, 14 Jul 2017 17:03:45 +0200
Message-ID: <20170714150345.i2itd4pnggnnywbs@phenom.ffwll.local>
References: <20170711143314.2148-1-maarten.lankhorst@linux.intel.com>
 <20170711143314.2148-9-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170711143314.2148-9-maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 11, 2017 at 04:33:10PM +0200, Maarten Lankhorst wrote:
> drm_atomic_helper_swap_state() will be changed to interruptible waiting
> in the next few commits, so all drivers have to be changed to handling
> failure.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> ---
>  drivers/gpu/drm/tegra/drm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> index ad3d124a972d..3ba659a5940d 100644
> --- a/drivers/gpu/drm/tegra/drm.c
> +++ b/drivers/gpu/drm/tegra/drm.c
> @@ -100,7 +100,12 @@ static int tegra_atomic_commit(struct drm_device *drm,
>  	 * the software side now.
>  	 */
>  
> -	drm_atomic_helper_swap_state(state, true);
> +	err = drm_atomic_helper_swap_state(state, true);
> +	if (err) {
> +		mutex_unlock(&tegra->commit.lock);
> +		drm_atomic_helper_cleanup_planes(drm, state);
> +		return err;
> +	}
>  
>  	drm_atomic_state_get(state);
>  	if (nonblock)
> -- 
> 2.11.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
