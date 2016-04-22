From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2] dmaengine: tegra-apb: proper default init of channel
 slave_id
Date: Fri, 22 Apr 2016 14:33:13 +0100
Message-ID: <571A2819.9000507@nvidia.com>
References: <1461329093-20300-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461329093-20300-1-git-send-email-smohammed@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>, ldewangan@nvidia.com, vinod.koul@intel.com, dan.j.williams@intel.com, swarren@wwwdotorg.org, thierry.reding@gmail.com, gnurou@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Shardar,

On 22/04/16 13:44, Shardar Shariff Md wrote:
> Initialize default channel slave_id(req_sel) to invalid id
> (i.e max supported slave id + 1) to avoid overwriting of slave_id
> during tegra_dma_slave_config() with client data if slave_id
> is not initialized through DT
> 
> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
> 
> ---
> - Instead of initializing the slave id to -1 define macros for
>   max slave id and invalid slave id and do the checks accordingly.
> ---
>  drivers/dma/tegra20-apb-dma.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index 3871f29..2957e26 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -114,6 +114,9 @@
>  /* Channel base address offset from APBDMA base address */
>  #define TEGRA_APBDMA_CHANNEL_BASE_ADD_OFFSET	0x1000
>  
> +#define TEGRA_APBDMA_SLAVE_ID_MAX		31

Sorry, thinking about this some more, given that the ID is programmed into
a field in the CSR register could we just define as mask here for the CSR
field ...

#define TEGRA_APBDMA_CSR_REQ_SEL_MASK	0x1f

Note this should be defined with the other CSR register field definitions.

> +#define TEGRA_APBDMA_SLAVE_ID_INVALID		(TEGRA_APBDMA_SLAVE_ID_MAX + 1)
>
>  struct tegra_dma;
>  
>  /*
> @@ -353,7 +356,7 @@ static int tegra_dma_slave_config(struct dma_chan *dc,
>  	}
>  
>  	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
> -	if (!tdc->slave_id)
> +	if (tdc->slave_id == TEGRA_APBDMA_SLAVE_ID_INVALID)
>  		tdc->slave_id = sconfig->slave_id;

I believe I mentioned before that here we should ...

	if (tdc->slave_id != TEGRA_APBDMA_SLAVE_ID_INVALID)
		return -EBUSY;

	memcpy(&tdc->dma_sconfig, sconfig, sizeof(*sconfig));
	tdc->slave_id = sconfig->slave_id;

>  	tdc->config_init = true;
>  	return 0;
> @@ -1236,7 +1239,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
>  	}
>  	pm_runtime_put(tdma->dev);
>  
> -	tdc->slave_id = 0;
> +	tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
>  }
>  
>  static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
> @@ -1253,6 +1256,11 @@ static struct dma_chan *tegra_dma_of_xlate(struct of_phandle_args *dma_spec,
>  	tdc = to_tegra_dma_chan(chan);
>  	tdc->slave_id = dma_spec->args[0];
>  
> +	if (tdc->slave_id > TEGRA_APBDMA_SLAVE_ID_MAX) {
> +		dev_err(tdc2dev(tdc), "Invalid slave id\n");
> +		return NULL;
> +	}
> +
>  	return chan;
>  }
>  
> @@ -1389,6 +1397,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
>  				&tdma->dma_dev.channels);
>  		tdc->tdma = tdma;
>  		tdc->id = i;
> +		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
>  
>  		tasklet_init(&tdc->tasklet, tegra_dma_tasklet,
>  				(unsigned long)tdc);

Otherwise looks good.

Cheers
Jon
