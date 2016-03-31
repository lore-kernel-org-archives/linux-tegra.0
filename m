From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Thu, 31 Mar 2016 09:34:45 +0100
Message-ID: <56FCE125.70809@nvidia.com>
References: <1459405611-12470-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459405611-12470-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 31/03/16 07:26, Shardar Shariff Md wrote:
> Initialize default channel slave_id(req_sel) to -1 to avoid
> overwriting of slave_id with client data as zero is the
> valid slave_id(request_select).
> 
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3871f29..35a0df0 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -204,7 +204,7 @@ struct tegra_dma_channel {
>  	struct tasklet_struct	tasklet;
>  
>  	/* Channel-slave specific configuration */
> -	unsigned int slave_id;
> +	int slave_id;

Thanks for the fix. Looking at this a bit more I would prefer that we
keep this a unsigned int and instead of using a negative value. My
reasoning for that is if we make this a signed type, then technically we
should check it is neither less than 0 or greater than the max slave_id
supported. So that said, I think that we should ...

1. In tegra_dma_of_xlate() check to see if the slave_id is greater than
   the maximum slave_id allowed. We should define a
   TEGRA_APBDMA_SLAVE_ID_MAX which we should use in tegra_dma_of_xlate()
   to ensure that the slave_id is valid.
2. Define a TEGRA_APBDMA_SLAVE_ID_INVALID (TEGRA_APBDMA_SLAVEID_MAX +
   1) and set the slave_id to this value in
   tegra_dma_free_chan_resources() and probe(). Then we can simply
   check if the slave_id is equal to this.

This way we can ensure that slave_id is between 0 and the max value
supported and not need to worry about negative values.

>  	struct dma_slave_config dma_sconfig;
>  	struct tegra_dma_channel_regs	channel_reg;
>  };
> @@ -353,7 +353,7 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
>  	}
>  
>  	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> -	if (!tdc->slave_id)
> +	if (tdc->slave_id == -1)
>  		tdc->slave_id = sconfig->slave_id;

Hmmm ... I know that this is how it is today, but is this not an error
condition? In other words, if the slave_id is NOT equal to -1, then
should we return an error? It seems that we could silently ignore the
new slave_id and if it has been already set which seems bad.

>  	tdc->config_init = true;
>  	return 0;
> @@ -1236,7 +1236,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
>  	}
>  	pm_runtime_put(tdma->dev);
>  
> -	tdc->slave_id = 0;
> +	tdc->slave_id = -1;
>  }
>  
>  static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
> @@ -1389,6 +1389,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  				&tdma->dma_dev.channels);
>  		tdc->tdma = tdma;
>  		tdc->id = i;
> +		tdc->slave_id = -1;
>  
>  		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
>  				(unsigned long)tdc);
> 

Cheers
Jon
