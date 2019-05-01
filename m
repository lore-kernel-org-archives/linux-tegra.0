From: Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH] dma: tegra: add accurate reporting of dma state
Date: Wed, 1 May 2019 18:43:27 +0530
Message-ID: <20190501131327.GX3845@vkoul-mobl.Dlink>
References: <20190424162348.23692-1-ben.dooks@codethink.co.uk>
 <71198258-40b8-3f7f-1401-58513bfaaab5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <71198258-40b8-3f7f-1401-58513bfaaab5@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@lists.codethink.co.uk, Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01-05-19, 09:33, Jon Hunter wrote:

> > @@ -1444,12 +1529,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
> >  		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
> >  		BIT(DMA_SLAVE_BUSWIDTH_8_BYTES);
> >  	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
> > -	/*
> > -	 * XXX The hardware appears to support
> > -	 * DMA_RESIDUE_GRANULARITY_BURST-level reporting, but it's
> > -	 * only used by this driver during tegra_dma_terminate_all()
> > -	 */
> > -	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_SEGMENT;
> > +	tdma->dma_dev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
> >  	tdma->dma_dev.device_config = tegra_dma_slave_config;
> >  	tdma->dma_dev.device_terminate_all = tegra_dma_terminate_all;
> >  	tdma->dma_dev.device_tx_status = tegra_dma_tx_status;
> 
> In addition to Dmitry's comments, can you please make sure you run this
> through checkpatch.pl?

And use correct subsystem name !

-- 
~Vinod
