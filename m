From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped
 buffer objects
Date: Wed, 5 Feb 2020 20:31:29 +0300
Message-ID: <b3871ad5-39e6-9376-6631-30c1be4bc3dd@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200204135926.1156340-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

04.02.2020 16:59, Thierry Reding пишет:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The DMA direction is only used by the DMA API, so there is no use in
> setting it when a buffer object isn't mapped with the DMA API.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/host1x/job.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
> index 8198a4d42c77..a10643aa89aa 100644
> --- a/drivers/gpu/host1x/job.c
> +++ b/drivers/gpu/host1x/job.c
> @@ -248,6 +248,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  				goto unpin;
>  			}
>  
> +			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
>  			job->unpins[job->num_unpins].dev = host->dev;
>  			phys_addr = sg_dma_address(sgt->sgl);
>  		}
> @@ -255,7 +256,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
>  		job->addr_phys[job->num_unpins] = phys_addr;
>  		job->gather_addr_phys[i] = phys_addr;
>  
> -		job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
>  		job->unpins[job->num_unpins].bo = g->bo;
>  		job->unpins[job->num_unpins].sgt = sgt;
>  		job->num_unpins++;
> 


Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
