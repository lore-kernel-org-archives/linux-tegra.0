From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 15:43:19 +0100
Message-ID: <571A3887.4020704@nvidia.com>
References: <1461334479-27985-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461334479-27985-1-git-send-email-smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 22/04/16 15:14, Shardar Shariff Md wrote:
> Initialize default channel slave_id(req_sel) to invalid id
> (i.e max supported slave id + 1) to avoid overwriting of slave_id
> during tegra_dma_slave_config() with client data if slave_id
> is not initialized through DT
> 
> Signed-off-by: Shardar Shariff Md <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> ---
> Changes from v1:
> - Instead of initializing the slave id to -1 define macros for
>   max slave id and invalid slave id and do the checks accordingly.
> 
> Changes from v2:
> - Check slave id boundary before dma channel is allocated to
>   avoid channel leakage.
> ---
>  drivers/dma/tegra20-apb-dma.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3871f29..f57cee85 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -54,6 +54,7 @@
>  #define TEGRA_APBDMA_CSR_ONCE			BIT(27)
>  #define TEGRA_APBDMA_CSR_FLOW			BIT(21)
>  #define TEGRA_APBDMA_CSR_REQ_SEL_SHIFT		16
> +#define TEGRA_APBDMA_CSR_REQ_SEL_MASK		0x1F
>  #define TEGRA_APBDMA_CSR_WCOUNT_MASK		0xFFFC
>  
>  /* STATUS register */
> @@ -114,6 +115,9 @@
>  /* Channel base address offset from APBDMA base address */
>  #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
>  
> +#define TEGRA_APBDMA_SLAVE_ID_MAX		TEGRA_APBDMA_CSR_REQ_SEL_MASK
> +#define TEGRA_APBDMA_SLAVE_ID_INVALID		(TEGRA_APBDMA_SLAVE_ID_MAX + 1)
> +
>  struct tegra_dma;
>  
>  /*
> @@ -353,7 +357,7 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
>  	}
>  
>  	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> -	if (!tdc->slave_id)
> +	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID)
>  		tdc->slave_id = sconfig->slave_id;

I think we still need to check sconfig->slave_id is less than the MAX here.

>  	tdc->config_init = true;
>  	return 0;
> @@ -1236,7 +1240,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
>  	}
>  	pm_runtime_put(tdma->dev);
>  
> -	tdc->slave_id = 0;
> +	tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
>  }
>  
>  static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
> @@ -1245,13 +1249,20 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
>  	struct tegra_dma *tdma = ofdma->of_dma_data;
>  	struct dma_chan *chan;
>  	struct tegra_dma_channel *tdc;
> +	unsigned int slave_id;

We don't need this definition.

> +
> +	slave_id = dma_spec->args[0];
> +	if (slave_id > TEGRA_APBDMA_SLAVE_ID_MAX) {

Use dma_spec->args[0] here directly.

> +		dev_err(tdma->dev, "Invalid slave id: %d\n", slave_id);

And here.

Cheers
Jon
