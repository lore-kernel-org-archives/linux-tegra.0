From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 2/2] soc/tegra: fuse: Explicitly request DMA channel
 from APB DMA driver
Date: Fri, 20 Oct 2017 12:00:12 +0100
Message-ID: <b9c4b601-e402-faef-61cc-45a7dfe7f8df@nvidia.com>
References: <cover.1508450681.git.digetx@gmail.com>
 <059ca713c7416aedeb0080ab4b8a49da430a30b9.1508450681.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <059ca713c7416aedeb0080ab4b8a49da430a30b9.1508450681.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/10/17 23:08, Dmitry Osipenko wrote:
> Currently fuse driver requests DMA channel from an arbitrary DMA device,
> it is not a problem since there is only one DMA provider for Tegra20 yet,
> but it may become troublesome if another provider will appear.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/soc/tegra/fuse/fuse-tegra20.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
> index 27e9ac7d3165..49ff017f3ded 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra20.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
> @@ -96,6 +96,13 @@ static u32 tegra20_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
>  	return value;
>  }
>  
> +static bool dma_filter(struct dma_chan *chan, void *filter_param)
> +{
> +	struct device_node *np = chan->device->dev->of_node;
> +
> +	return of_device_is_compatible(np, "nvidia,tegra20-apbdma");
> +}
> +
>  static int tegra20_fuse_probe(struct tegra_fuse *fuse)
>  {
>  	dma_cap_mask_t mask;
> @@ -103,7 +110,7 @@ static int tegra20_fuse_probe(struct tegra_fuse *fuse)
>  	dma_cap_zero(mask);
>  	dma_cap_set(DMA_SLAVE, mask);
>  
> -	fuse->apbdma.chan = dma_request_channel(mask, NULL, NULL);
> +	fuse->apbdma.chan = __dma_request_channel(&mask, dma_filter, NULL);
>  	if (!fuse->apbdma.chan)
>  		return -EPROBE_DEFER;
>  

Thanks!

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thierry, these are ready for queuing.

Cheers
Jon

-- 
nvpublic
