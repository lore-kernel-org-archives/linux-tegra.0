From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V4 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 19 Apr 2016 14:59:49 +0100
Message-ID: <571639D5.10108@nvidia.com>
References: <1458057390-20756-1-git-send-email-jonathanh@nvidia.com>
 <1458057390-20756-3-git-send-email-jonathanh@nvidia.com>
 <20160405213649.GA11586@vkoul-mobl.iind.intel.com>
 <570BB001.3020202@nvidia.com> <20160412141025.GJ2274@localhost>
 <570D2104.1040607@nvidia.com> <20160413134917.GP2274@localhost>
 <570F7952.2030606@nvidia.com> <5714F7EF.5000605@nvidia.com>
 <20160419132556.GP2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160419132556.GP2274@localhost>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 19/04/16 14:25, Vinod Koul wrote:
> On Mon, Apr 18, 2016 at 04:06:23PM +0100, Jon Hunter wrote:
>> On 14/04/16 12:04, Jon Hunter wrote:

[snip]

>>> I had a look at this, but actually, I don't think this is going to work.
>>>
>>> Looking at dma_request_channel(), it is going to get a DMA channel that
>>> matches the mask for any DMA controller. In the xlate I already know
>>> which DMA controller I am and I just want one of the channels. The flow
>>> here is ...
>>>
>>> dma_request_chan()
>>>   --> of_dma_request_slave_channel()
>>>     --> xlate()
>>>       --> dma_get_any_slave_channel()
>>>
>>> There are several other DMA drivers that are calling
>>> dma_get_any_slave_channel() from their xlate function which makes sense
>>> because they are requesting one of their own channels.
>>>
>>> I can understand that you wish to consolidate the APIs for requesting a
>>> channel, but it seems to me that you still need to have an API that DMA
>>> controller drivers can call where they can pass their dma_device
>>> structure to ensure you get a channel for the appropriate DMA controller.
> 
> Yes but the idea was that xlate will help you to get the right channel. The
> whole dmaengine property was supposed to help you with that

Well it depends on the DMA controller. In the case of tegra the xlate
helps you extract the slave request ID for a given device. However,
because any channel can be used with any slave request ID, we don't care
about the exact channel. So we request any available channel for the DMA
controller in question and program it with the slave request we got from
the xlate.

> Please check the omap code which gets a specfic channel using this

Yes I have already seen this and it does not help here, because OMAP
uses of_dma_simple_xlate() which calls dma_request_channel() and again
this will get a channel from any DMA controller that matches the caps
flags. For tegra we have two DMA controllers and both support CYCLIC
transfers and so I am concerned we would get a channel from the wrong
DMA controller.

I have seen some DMA drivers (such as imx-dma) use the filter function
to match the DMA controller, but it seems daft to use the filter
function to match the DMA controller when we already know in the xlate
which DMA controller we are.

Cheers
Jon
