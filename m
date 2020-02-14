From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 18/19] dmaengine: tegra-apb: Remove unused function
 argument
Date: Fri, 14 Feb 2020 14:16:06 +0000
Message-ID: <d9a1bd6a-bd26-36ad-7d94-57801a2aa616@nvidia.com>
References: <20200209163356.6439-1-digetx@gmail.com>
 <20200209163356.6439-19-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200209163356.6439-19-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/02/2020 16:33, Dmitry Osipenko wrote:
> Remove unused function argument from handle_continuous_head_request().
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 7b9d59bbd2c1..3e0373b89195 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -553,7 +553,6 @@ static void tegra_dma_abort_all(struct tegra_dma_channel *tdc)
>  }
>  
>  static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
> -					   struct tegra_dma_sg_req *last_sg_req,
>  					   bool to_terminate)
>  {
>  	struct tegra_dma_sg_req *hsgreq;
> @@ -638,7 +637,7 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
>  	if (!list_is_last(&sgreq->node, &tdc->pending_sg_req)) {
>  		list_move_tail(&sgreq->node, &tdc->pending_sg_req);
>  		sgreq->configured = false;
> -		st = handle_continuous_head_request(tdc, sgreq, to_terminate);
> +		st = handle_continuous_head_request(tdc, to_terminate);
>  		if (!st)
>  			dma_desc->dma_status = DMA_ERROR;
>  	}
> 

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks!
Jon

-- 
nvpublic
