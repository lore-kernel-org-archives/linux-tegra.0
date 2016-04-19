From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Tue, 19 Apr 2016 16:18:56 +0200
Message-ID: <3969252.smixZttJLQ@wuerfel>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com> <20160419132556.GP2274@localhost> <571639D5.10108@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <571639D5.10108-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 19 April 2016 14:59:49 Jon Hunter wrote:
> On 19/04/16 14:25, Vinod Koul wrote:
> > On Mon, Apr 18, 2016 at 04:06:23PM +0100, Jon Hunter wrote:
> >> On 14/04/16 12:04, Jon Hunter wrote:
> >>> I had a look at this, but actually, I don't think this is going to work.
> >>>
> >>> Looking at dma_request_channel(), it is going to get a DMA channel that
> >>> matches the mask for any DMA controller. In the xlate I already know
> >>> which DMA controller I am and I just want one of the channels. The flow
> >>> here is ...
> >>>
> >>> dma_request_chan()
> >>>   --> of_dma_request_slave_channel()
> >>>     --> xlate()
> >>>       --> dma_get_any_slave_channel()
> >>>
> >>> There are several other DMA drivers that are calling
> >>> dma_get_any_slave_channel() from their xlate function which makes sense
> >>> because they are requesting one of their own channels.
> >>>
> >>> I can understand that you wish to consolidate the APIs for requesting a
> >>> channel, but it seems to me that you still need to have an API that DMA
> >>> controller drivers can call where they can pass their dma_device
> >>> structure to ensure you get a channel for the appropriate DMA controller.
> > 
> > Yes but the idea was that xlate will help you to get the right channel. The
> > whole dmaengine property was supposed to help you with that
> 
> Well it depends on the DMA controller. In the case of tegra the xlate
> helps you extract the slave request ID for a given device. However,
> because any channel can be used with any slave request ID, we don't care
> about the exact channel. So we request any available channel for the DMA
> controller in question and program it with the slave request we got from
> the xlate.

Right. the cleanup was supposed to reduce the number of interfaces
that a slave driver can call and consolidate them as much as possible
into dma_request_chan(), but we still need dma_get_any_slave_channel()
as an interface for the dmaengine masters as you said.

> I have seen some DMA drivers (such as imx-dma) use the filter function
> to match the DMA controller, but it seems daft to use the filter
> function to match the DMA controller when we already know in the xlate
> which DMA controller we are.

The filter functions should ideally all go away after the cleanup
is complete.

	Arnd
