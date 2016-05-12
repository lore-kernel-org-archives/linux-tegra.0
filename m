From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Thu, 12 May 2016 11:37:48 +0530
Message-ID: <20160512060748.GZ2274@localhost>
References: <1461940758-25722-1-git-send-email-jonathanh@nvidia.com>
 <1461940758-25722-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1461940758-25722-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 29, 2016 at 03:39:17PM +0100, Jon Hunter wrote:

> +static struct dma_async_tx_descriptor *tegra_adma_prep_slave_sg(
> +	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
> +	enum dma_transfer_direction direction, unsigned long flags,
> +	void *context)
> +{
> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> +
> +	dev_warn(tdc2dev(tdc), "scatter-gather transfers are not supported\n");
> +
> +	return NULL;
> +}

we don't need a place holder, please remove this

> +static int tegra_adma_alloc_chan_resources(struct dma_chan *dc)
> +{
> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> +	int ret;
> +
> +	ret = request_irq(tdc->irq, tegra_adma_isr, 0, dma_chan_name(dc), tdc);
> +	if (ret) {
> +		dev_err(tdc2dev(tdc), "failed to get interrupt for %s\n",
> +			dma_chan_name(dc));
> +		return ret;
> +	}

Okay why are we requesting and freeing up irq while allocating channels..?
Btw since he usage is cyclic the sound core grabs the channel at start and
never releases it

> +	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
> +	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);

You should set only cyclic, btw why do you support only one. Cyclic is
actually a special case for SLAVE, so ideally you should support slave
too...

-- 
~Vinod
