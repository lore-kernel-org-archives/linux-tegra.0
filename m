From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 05/14] dmaengine: tegra-apb: Prevent race conditions of
 tasklet vs free list
Date: Tue, 14 Jan 2020 15:43:35 +0000
Message-ID: <1331b7c1-3839-69cb-4de2-16771c652d41@nvidia.com>
References: <20200112173006.29863-1-digetx@gmail.com>
 <20200112173006.29863-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200112173006.29863-6-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/01/2020 17:29, Dmitry Osipenko wrote:
> The interrupt handler puts a half-completed DMA descriptor on a free list
> and then schedules tasklet to process bottom half of the descriptor that
> executes client's callback, this creates possibility to pick up the busy
> descriptor from the free list. Thus let's disallow descriptor's re-use
> until it is fully processed.
> 
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

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
