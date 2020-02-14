From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v8 19/19] dmaengine: tegra-apb: Improve error message
 about DMA underflow
Date: Fri, 14 Feb 2020 14:16:25 +0000
Message-ID: <f26f9a99-a044-a0ed-d845-5c93628d29d4@nvidia.com>
References: <20200209163356.6439-1-digetx@gmail.com>
 <20200209163356.6439-20-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200209163356.6439-20-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 09/02/2020 16:33, Dmitry Osipenko wrote:
> Technically it is possible that DMA could be misconfigured in a way that
> cyclic DMA transfer is processed slower than it takes to complete the
> cycle and in this case the DMA is getting aborted with a not very
> informative message about the problem, let's improve it.
> 
> Suggested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3e0373b89195..1a9b37c102ba 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -566,7 +566,7 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
>  	if (!hsgreq->configured) {
>  		tegra_dma_stop(tdc);
>  		pm_runtime_put(tdc->tdma->dev);
> -		dev_err(tdc2dev(tdc), "Error in DMA transfer, aborting DMA\n");
> +		dev_err(tdc2dev(tdc), "DMA transfer underflow, aborting DMA\n");
>  		tegra_dma_abort_all(tdc);
>  		return false;
>  	}
> 

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks!
Jon

-- 
nvpublic
