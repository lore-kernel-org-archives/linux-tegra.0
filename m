From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 19 Apr 2016 20:43:05 +0530
Message-ID: <20160419151305.GR2274@localhost>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
 <20160419132556.GP2274@localhost>
 <571639D5.10108@nvidia.com>
 <3969252.smixZttJLQ@wuerfel>
 <571646A3.1060400@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <571646A3.1060400-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2016 at 03:54:27PM +0100, Jon Hunter wrote:
> >>>>> I can understand that you wish to consolidate the APIs for requesting a
> >>>>> channel, but it seems to me that you still need to have an API that DMA
> >>>>> controller drivers can call where they can pass their dma_device
> >>>>> structure to ensure you get a channel for the appropriate DMA controller.
> >>>
> >>> Yes but the idea was that xlate will help you to get the right channel. The
> >>> whole dmaengine property was supposed to help you with that
> >>
> >> Well it depends on the DMA controller. In the case of tegra the xlate
> >> helps you extract the slave request ID for a given device. However,
> >> because any channel can be used with any slave request ID, we don't care
> >> about the exact channel. So we request any available channel for the DMA
> >> controller in question and program it with the slave request we got from
> >> the xlate.
> > 
> > Right. the cleanup was supposed to reduce the number of interfaces
> > that a slave driver can call and consolidate them as much as possible
> > into dma_request_chan(), but we still need dma_get_any_slave_channel()
> > as an interface for the dmaengine masters as you said.
> 
> OK, great.
> 
> Vinod, are you ok with this then? Any other items to fix-up?

Okay from me.

-- 
~Vinod
