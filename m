From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 05/14] dmaengine: tegra-apb: Prevent race conditions of
 tasklet vs free list
Date: Wed, 29 Jan 2020 11:01:23 +0000
Message-ID: <cd1da99a-e52e-e202-257d-17466132d088@nvidia.com>
References: <20200123230325.3037-1-digetx@gmail.com>
 <20200123230325.3037-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200123230325.3037-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 23/01/2020 23:03, Dmitry Osipenko wrote:
> The interrupt handler puts a half-completed DMA descriptor on a free list
> and then schedules tasklet to process bottom half of the descriptor that
> executes client's callback, this creates possibility to pick up the busy
> descriptor from the free list. Thus let's disallow descriptor's re-use
> until it is fully processed.
> 
> Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 1b8a11804962..aafad50d075e 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -281,7 +281,7 @@ static struct tegra_dma_desc *tegra_dma_desc_get(
>  
>  	/* Do not allocate if desc are waiting for ack */
>  	list_for_each_entry(dma_desc, &tdc->free_dma_desc, node) {
> -		if (async_tx_test_ack(&dma_desc->txd)) {
> +		if (async_tx_test_ack(&dma_desc->txd) && !dma_desc->cb_count) {
>  			list_del(&dma_desc->node);
>  			spin_unlock_irqrestore(&tdc->lock, flags);
>  			dma_desc->txd.flags = 0;
> 

I think we should mark this for stable as well. I would make this the
2nd patch in the series as it is related to #1.

Jon

-- 
nvpublic
