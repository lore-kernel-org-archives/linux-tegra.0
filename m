From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 4/4] drm/vgem: flush page during page fault
Date: Wed, 17 Jan 2018 09:39:28 +0100
Message-ID: <20180117083928.GH2759@phenom.ffwll.local>
References: <20180117003559.67837-1-gurchetansingh@chromium.org>
 <20180117003559.67837-4-gurchetansingh@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180117003559.67837-4-gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 16, 2018 at 04:35:59PM -0800, Gurchetan Singh wrote:
> This is required to use buffers allocated by vgem on AMD and ARM devices.
> We're experiencing a case where eviction of the cache races with userspace
> writes. To fix this, flush the cache after retrieving a page.
> 
> Signed-off-by: Gurchetan Singh <gurchetansingh-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 35bfdfb746a7..fb263969f02d 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -112,6 +112,7 @@ static int vgem_gem_fault(struct vm_fault *vmf)
>  				break;
>  		}
>  
> +		drm_flush_pages(obj->base.dev->dev, &page, 1);

Uh ... what exactly are you doing?

Asking because the entire "who's responsible for coherency" story is
entirely undefined still when doing buffer sharing :-/ What is clear is
that currently vgem entirely ignores this (there's not
begin/end_cpu_access callback), mostly because the shared dma-buf support
in drm_prime.c also entirely ignores this. And doing a one-time only
flushing in your fault handler is definitely not going to fix this (at
least not if you do anything else than one-shot uploads).
-Daniel

>  	}
>  	return ret;
>  }
> -- 
> 2.13.5
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
