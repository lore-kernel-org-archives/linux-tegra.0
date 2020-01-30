From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 11/16] dmaengine: tegra-apb: Keep clock enabled only
 during of DMA transfer
Date: Thu, 30 Jan 2020 14:09:13 +0000
Message-ID: <2442aee7-2c2a-bacc-7be9-8eed17498928@nvidia.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200130043804.32243-12-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/01/2020 04:37, Dmitry Osipenko wrote:
> It's a bit impractical to enable hardware's clock at the time of DMA
> channel's allocation because most of DMA client drivers allocate DMA
> channel at the time of the driver's probing, and thus, DMA clock is kept
> always-enabled in practice, defeating the whole purpose of runtime PM.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 47 ++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 22b88ccff05d..0ee28d8e3c96 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -436,6 +436,8 @@ static void tegra_dma_stop(struct tegra_dma_channel *tdc)
>  		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
>  	}
>  	tdc->busy = false;
> +
> +	pm_runtime_put(tdc->tdma->dev);
>  }
>  
>  static void tegra_dma_start(struct tegra_dma_channel *tdc,
> @@ -500,18 +502,25 @@ static void tegra_dma_configure_for_next(struct tegra_dma_channel *tdc,
>  	tegra_dma_resume(tdc);
>  }
>  
> -static void tdc_start_head_req(struct tegra_dma_channel *tdc)
> +static bool tdc_start_head_req(struct tegra_dma_channel *tdc)
>  {
>  	struct tegra_dma_sg_req *sg_req;
> +	int err;
>  
>  	if (list_empty(&tdc->pending_sg_req))
> -		return;
> +		return false;
> +
> +	err = pm_runtime_get_sync(tdc->tdma->dev);
> +	if (WARN_ON_ONCE(err < 0))
> +		return false;
>  
>  	sg_req = list_first_entry(&tdc->pending_sg_req, typeof(*sg_req), node);
>  	tegra_dma_start(tdc, sg_req);
>  	sg_req->configured = true;
>  	sg_req->words_xferred = 0;
>  	tdc->busy = true;
> +
> +	return true;
>  }
>  
>  static void tdc_configure_next_head_desc(struct tegra_dma_channel *tdc)
> @@ -615,6 +624,8 @@ static void handle_once_dma_done(struct tegra_dma_channel *tdc,
>  	}
>  	list_add_tail(&sgreq->node, &tdc->free_sg_req);
>  
> +	pm_runtime_put(tdc->tdma->dev);
> +
>  	/* Do not start DMA if it is going to be terminate */
>  	if (to_terminate || list_empty(&tdc->pending_sg_req))
>  		return;
> @@ -730,9 +741,7 @@ static void tegra_dma_issue_pending(struct dma_chan *dc)
>  		dev_err(tdc2dev(tdc), "No DMA request\n");
>  		goto end;
>  	}
> -	if (!tdc->busy) {
> -		tdc_start_head_req(tdc);
> -
> +	if (!tdc->busy && tdc_start_head_req(tdc)) {
>  		/* Continuous single mode: Configure next req */
>  		if (tdc->cyclic) {
>  			/*
> @@ -775,6 +784,13 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
>  	else
>  		wcount = status;
>  
> +	/*
> +	 * tegra_dma_stop() will drop the RPM's usage refcount, but
> +	 * tegra_dma_resume() touches hardware and thus we should keep
> +	 * the DMA clock active while it's needed.
> +	 */
> +	pm_runtime_get(tdc->tdma->dev);
> +

Would it work and make it simpler to just enable in the issue_pending
and disable in the handle_once_dma_done or terminate_all?

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 3a45079d11ec..86bbb45da93d 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -616,9 +616,14 @@ static void handle_once_dma_done(struct
tegra_dma_channel *tdc,
        list_add_tail(&sgreq->node, &tdc->free_sg_req);

        /* Do not start DMA if it is going to be terminate */
-       if (to_terminate || list_empty(&tdc->pending_sg_req))
+       if (to_terminate)
                return;

+       if (list_empty(&tdc->pending_sg_req)) {
+               pm_runtime_put(tdc->tdma->dev);
+               return;
+       }
+
        tdc_start_head_req(tdc);
 }

@@ -729,6 +734,11 @@ static void tegra_dma_issue_pending(struct dma_chan
*dc)
                goto end;
        }
        if (!tdc->busy) {
+               if (pm_runtime_get_sync(tdc->tdma->dev) < 0) {
+                       dev_err(tdc2dev(tdc), "Failed to enable DMA!\n");
+                       goto end;
+               }
+
                tdc_start_head_req(tdc);

                /* Continuous single mode: Configure next req */
@@ -788,6 +798,7 @@ static int tegra_dma_terminate_all(struct dma_chan *dc)
                                get_current_xferred_count(tdc, sgreq,
wcount);
        }
        tegra_dma_resume(tdc);
+       pm_runtime_put(tdc->tdma->dev);

 skip_dma_stop:
        tegra_dma_abort_all(tdc);

-- 
nvpublic
