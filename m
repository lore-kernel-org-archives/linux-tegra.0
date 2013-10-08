From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpu: host1x: check relocs after all gathers are consumed
Date: Tue, 8 Oct 2013 13:57:48 +0300
Message-ID: <5253E52C.5090805@nvidia.com>
References: <1380917913-20482-1-git-send-email-kusmabite@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380917913-20482-1-git-send-email-kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04.10.2013 23:18, Erik Faye-Lund wrote:
> The num_relocs count are passed to the kernel per job, not per gather.
> 
> For multi-gather jobs, we would previously fail if there were relocs in
> other gathers aside from the first one.
> 
> Fix this by simply moving the check until all gathers have been
> consumed.
> 
> Signed-off-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index c4e1050..c9ddff8 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -436,10 +436,6 @@ static int validate(struct host1x_firewall *fw, struct host1x_job_gather *g)
>  		}
>  	}
>  
> -	/* No relocs should remain at this point */
> -	if (fw->num_relocs)
> -		err = -EINVAL;
> -
>  out:
>  	return err;
>  }
> @@ -493,6 +489,10 @@ static inline int copy_gathers(struct host1x_job *job, struct device *dev)
>  		offset += g->words * sizeof(u32);
>  	}
>  
> +	/* No relocs should remain at this point */
> +	if (fw.num_relocs)
> +		return -EINVAL;
> +
>  	return 0;
>  }

Good catch.

Acked-By: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Terje
