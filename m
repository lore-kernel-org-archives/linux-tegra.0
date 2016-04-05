From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 5 Apr 2016 14:36:50 -0700
Message-ID: <20160405213649.GA11586@vkoul-mobl.iind.intel.com>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
 <1458057390-20756-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1458057390-20756-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 15, 2016 at 03:56:29PM +0000, Jon Hunter wrote:

> +static void tegra_adma_request_free(struct tegra_adma_chan *tdc)
> +{
> +	struct tegra_adma *tdma = tdc->tdma;
> +
> +	if (!tdc->sreq_reserved)
> +		return;
> +
> +	switch (tdc->sreq_dir) {
> +	case DMA_MEM_TO_DEV:
> +		clear_bit(tdc->sreq_index, &tdma->tx_requests_reserved);
> +		break;

empty line here woould be nicer

> +	ret = dma_cookie_status(dc, cookie, txstate);
> +	if (ret == DMA_COMPLETE || !txstate)
> +		return ret;
> +
> +	spin_lock_irqsave(&tdc->vc.lock, flags);
> +
> +	vd = vchan_find_desc(&tdc->vc, cookie);
> +	if (vd) {
> +		desc = to_tegra_adma_desc(&vd->tx);
> +		residual = desc->ch_regs.tc;

Here we are filling up residue for desc found in issued list

> +	} else if (tdc->desc && tdc->desc->vd.tx.cookie == cookie) {
> +		residual = tegra_adma_get_residue(tdc);

Well if it is not issued then why we we need to caluclate, its full size of
descriptor

> +	} else {
> +		residual = 0;

why this?

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

Why do we need this placeholder, If you dont support slave_sg dont add this
as capability

> +static const struct tegra_adma_chip_data tegra210_chip_data = {
> +	.nr_channels = 22,
> +};

why should this be hard coded in kernel and not queried from something like
DT? This case seems to be hardware property

> +	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
> +	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);

I think you should not set DMA_SLAVE, do you need caps to be exported. I
think that should be exported for cyclic too, let me know if that was the
issue?

-- 
~Vinod
