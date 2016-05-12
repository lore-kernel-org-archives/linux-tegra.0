From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V5 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Thu, 12 May 2016 15:48:29 +0530
Message-ID: <20160512101829.GB2274@localhost>
References: <1461940758-25722-1-git-send-email-jonathanh@nvidia.com>
 <1461940758-25722-3-git-send-email-jonathanh@nvidia.com>
 <20160512060748.GZ2274@localhost>
 <5734468F.7010906@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5734468F.7010906-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2016 at 10:02:07AM +0100, Jon Hunter wrote:
> >> +	ret = request_irq(tdc->irq, tegra_adma_isr, 0, dma_chan_name(dc), tdc);
> >> +	if (ret) {
> >> +		dev_err(tdc2dev(tdc), "failed to get interrupt for %s\n",
> >> +			dma_chan_name(dc));
> >> +		return ret;
> >> +	}
> > 
> > Okay why are we requesting and freeing up irq while allocating channels..?
> > Btw since he usage is cyclic the sound core grabs the channel at start and
> > never releases it
> 
> The interrupt controller used by this DMA is a 2nd level interrupt
> controller in a different power-domain. I am currently in the process of
> adding support for this interrupt controller and it requires runtime
> power-management and in discussions with tglx the only way to allow the
> interrupt controller to idle is by releasing the interrupt. Hence, here
> we will acquire and release the interrupts as they are used. Please note
> that probing the DMA controller will be deferred until the interrupt
> controller is present because we still map the interrupt in the probe.

Okay, lets keep it

> >> +	dma_cap_set(DMA_SLAVE, tdma->dma_dev.cap_mask);
> >> +	dma_cap_set(DMA_PRIVATE, tdma->dma_dev.cap_mask);
> >> +	dma_cap_set(DMA_CYCLIC, tdma->dma_dev.cap_mask);
> > 
> > You should set only cyclic, btw why do you support only one. Cyclic is
> > actually a special case for SLAVE, so ideally you should support slave
> > too...
> 
> Only CYCLIC is supported for now because this DMA is only used for
> audio. There is another DMA for Tegra210 (the APB-DMA) which is a more
> general purpose DMA and should be used for all other DMA activity.
> Hence, I am not sure if it is best to keep the PRIVATE flag as I assume
> that means that not anyone can request a channel. We only should use
> this DMA for audio.
> 
> We discussed the setting of the DMA_SLAVE flag before [0] and I need to
> set DMA_SLAVE because I am using dma_get_any_slave_channel() in the
> xlate. May be you forgot? I know you would prefer we don't, but as I
> explained in this case (and as for other DMAs) this is the most
> appropriate API to use. We agreed in that discussion with Arnd Bergmann
> that this is ok.
> 
> I will drop the tegra_adma_prep_slave_sg() function. Please let me know
> if you are ok with the other items given my explanation and I will send
> a V6. I would like to get this merged for v4.7 if possible.

Sure, looks fine to me

-- 
~Vinod
