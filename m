From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 12 Apr 2016 19:40:25 +0530
Message-ID: <20160412141025.GJ2274@localhost>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
 <1458057390-20756-3-git-send-email-jonathanh@nvidia.com>
 <20160405213649.GA11586@vkoul-mobl.iind.intel.com>
 <570BB001.3020202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <570BB001.3020202-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 11, 2016 at 03:09:05PM +0100, Jon Hunter wrote:
> 
> On 05/04/16 22:36, Vinod Koul wrote:
> > On Tue, Mar 15, 2016 at 03:56:29PM +0000, Jon Hunter wrote:
> > 
> >> +static void tegra_adma_request_free(struct tegra_adma_chan *tdc)
> >> +{
> >> +	struct tegra_adma *tdma = tdc->tdma;
> >> +
> >> +	if (!tdc->sreq_reserved)
> >> +		return;
> >> +
> >> +	switch (tdc->sreq_dir) {
> >> +	case DMA_MEM_TO_DEV:
> >> +		clear_bit(tdc->sreq_index, &tdma->tx_requests_reserved);
> >> +		break;
> > 
> > empty line here woould be nicer
> 
> OK.
> 
> >> +	ret = dma_cookie_status(dc, cookie, txstate);
> >> +	if (ret == DMA_COMPLETE || !txstate)
> >> +		return ret;
> >> +
> >> +	spin_lock_irqsave(&tdc->vc.lock, flags);
> >> +
> >> +	vd = vchan_find_desc(&tdc->vc, cookie);
> >> +	if (vd) {
> >> +		desc = to_tegra_adma_desc(&vd->tx);
> >> +		residual = desc->ch_regs.tc;
> > 
> > Here we are filling up residue for desc found in issued list
> > 
> >> +	} else if (tdc->desc && tdc->desc->vd.tx.cookie == cookie) {
> >> +		residual = tegra_adma_get_residue(tdc);
> > 
> > Well if it is not issued then why we we need to caluclate, its full size of
> > descriptor
> 
> This is the current/active descriptor which has been removed from the
> issued list and so it needs to be calculated.
> 
> >> +	} else {
> >> +		residual = 0;
> > 
> > why this?
> 
> So either the descriptor is still in the submitted list or it has
> completed but it has not been marked complete yet. In both cases, we
> don't have access to the descriptor and so the residue is marked as 0
> and we return the current status. Please note this is based upon the
> omap dma driver (drivers/dma/omap-dma.c) which does the same. Other dma
> driver do very similar things here as well.

Yes that's right, wanted to esnure people do understand this :)

> 
> >> +static struct dma_async_tx_descriptor *tegra_adma_prep_slave_sg(
> >> +	struct dma_chan *dc, struct scatterlist *sgl, unsigned int sg_len,
> >> +	enum dma_transfer_direction direction, unsigned long flags,
> >> +	void *context)
> >> +{
> >> +	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
> >> +
> >> +	dev_warn(tdc2dev(tdc), "scatter-gather transfers are not supported\n");
> >> +
> >> +	return NULL;
> >> +}
> > 
> > Why do we need this placeholder, If you dont support slave_sg dont add this
> > as capability
> 
> So, AFAICT, dma_async_device_register() does not check to see if
> device_prep_slave_sg() is valid AND none of the functions
> dmaengine_prep_slave_single(), dmaengine_prep_slave_single() and
> dmaengine_prep_rio_sg() check to see if the function pointer is valid
> before calling chan->device->device_prep_slave_sg(). So it seems that we
> always expect this function pointer to be valid.
> 
> So should the inline functions ensure the function pointer is valid
> before attempting to call them? If so I can add a patch for this.
> Otherwise it seems the driver needs a stub. It would be a massive change
> to add a new capability, say SLAVE_SG, and populate this for all
> existing drivers.

No we should check here, it's indeed a miss, not sure why none complained
about this. I was assuming this is due to caps not considering cyclic case,
so I fixed that up.

I will fix these cases too, thanks for reporting

> >> +static const struct tegra_adma_chip_data tegra210_chip_data = {
> >> +	.nr_channels = 22,
> >> +};
> > 
> > why should this be hard coded in kernel and not queried from something like
> > DT? This case seems to be hardware property
> 
> Originally, I did have this in DT, however, the Tegra maintainers prefer
> this and this is consistent with the other Tegra DMA driver (see
> driver/dma/tegra20-apb-dma.c) [0].

But this creates a problem when you have next generation of controller with
different channel count!
How do we solve then?

> 
> >> +	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
> >> +	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
> >> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
> > 
> > I think you should not set DMA_SLAVE, do you need caps to be exported. I
> > think that should be exported for cyclic too, let me know if that was the
> > issue?
> > 
> 
> Why should I not be setting DMA_SLAVE? Should I not be calling
> dma_get_any_slave_channel() in the xlate?
> 
> I think that I do want to set DMA_CYCLIC as well to ensure that we check
> that the device->device_prep_dma_cyclic() function pointer is populated
> when registering the DMA controller.

Only setting DMA_CYCLIC should do, if you see any issues around that please
get back, we cna fix those :)

-- 
~Vinod
