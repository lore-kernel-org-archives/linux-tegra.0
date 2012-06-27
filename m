From: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/2] dma: tegra: set DMA_CYCLIC capability
Date: Wed, 27 Jun 2012 18:59:08 +0530
Message-ID: <1340803748.1562.244.camel@vkoul-udesk3>
References: <1340365364-16276-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1340365364-16276-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-06-22 at 17:12 +0530, Laxman Dewangan wrote:
> Tegra's APB DMA driver support the cyclic mode of data
> transfer and hence setting the DMA_CYCLIC caps for dma
> channels.
> 
> This is require when generic sound dmaengine pcm driver
> request for dma channel with CYCLIC capability.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 134ea7c..b4bd50c 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1306,6 +1306,8 @@ static int __devinit tegra_dma_probe(struct platform_device *pdev)
>  
>  	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
>  	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
> +
>  	tdma->dma_dev.dev = &pdev->dev;
>  	tdma->dma_dev.device_alloc_chan_resources =
>  					tegra_dma_alloc_chan_resources;
What sort of testing went into this.
I can see that you are marking descriptor complete even for cyclic case,
that is wrong you should fix that as well. See the other drivers for
cyclic handling of descriptors.

-- 
~Vinod
