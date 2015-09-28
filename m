From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Mon, 28 Sep 2015 17:07:46 +0200
Message-ID: <2417622.fOrcl680Fe@wuerfel>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com> <1783348.ocWL5DWVKG@wuerfel> <5609556A.8060908@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5609556A.8060908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday 28 September 2015 15:57:46 Jon Hunter wrote:
> On 25/09/15 16:47, Arnd Bergmann wrote:
> > On Friday 25 September 2015 16:38:55 Jon Hunter wrote:
> >> On 25/09/15 16:17, Jon Hunter wrote:
> >>> On 25/09/15 16:03, Arnd Bergmann wrote:
> >>>> On Friday 25 September 2015 15:56:40 Jon Hunter wrote:
> >>>>> +       case DMA_MEM_TO_DEV:
> >>>>> +               burst_size = fls(tdc->config.dst_maxburst);
> >>>>> +               ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_bufs - 1);
> >>>>> +               ch_regs->ctrl = ADMA_CH_CTRL_XFER_DIR(ADMA_MEM_TO_AHUB) |
> >>>>> +                               ADMA_CH_CTRL_TX_REQ(tdc->config.slave_id);
> >>>>> +               ch_regs->src_addr = buf_addr;
> >>>>> +               break;
> >>>>> +
> >>>>> +       case DMA_DEV_TO_MEM:
> >>>>> +               burst_size = fls(tdc->config.src_maxburst);
> >>>>> +               ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_bufs - 1);
> >>>>> +               ch_regs->ctrl = ADMA_CH_CTRL_XFER_DIR(ADMA_AHUB_TO_MEM) |
> >>>>> +                               ADMA_CH_CTRL_RX_REQ(tdc->config.slave_id);
> >>>>> +               ch_regs->trg_addr = buf_addr;
> >>>>> +               break;
> >>>>
> >>>> Do not use the 'slave_id' field here to identify the slave device, that
> >>>> concept is broken. Instead, put the slave identification into the
> >>>> dma specifier in DT and read it out in your xlate function.
> >>>
> >>> Why is it broken?
> >>>
> >>> What happens if I don't know the slave-id? In other words, the slave-id
> >>> can be dynamically allocated and associated with a given slave.
> >>
> >> I guess thinking about it some more, the driver could assign an id
> >> itself to a given channel and I could avoid using slave_id here. There
> >> are 22 channels and 10 tx and 10 rx requests.
> > 
> > This sounds roughly right. So you could pick the ch_regs->ctrl value
> > when you allocate the tegra_adma_chan structure, and then map it to
> > the slave in the xlate() function.
> 
> Actually, what I mentioned about would not work as it is not the DMA
> that should assign the requests to the channel.
> 
> I think that I have poorly described the hardware and how it works, so
> let me try and explain a bit more.
> 
> From a hardware perspective it looks like the following ...
> 
> memory <-> adma <-> adma-if <-> xbar <-> clients
> 
> where:
> - memory is the system memory
> - adma is the dma controller
> - adma-if is the dma interface to a crossbar
> - xbar is the crossbar
> - clients are various audio interfaces, such as i2s, etc
> 
> The adma-if is essentially a mux with 10 tx and 10 rx ports. Any of the
> 22 adma channels can be mapped to any of the 10 tx or rx ports. The
> request signal used by the adma is determined by which port it is
> configured to use. However, what makes this even more configurable is
> the xbar is also a mux that can route adma-if ports to the various clients.
> 
> So potentially, you could use any adma channel and any port to route
> audio to any of the clients. However, the adma-if needs to know which
> adma channel is mapped to which port and so it probably makes most sense
> for the adma-if binding (not in the mainline yet) so specify a mapping
> even though any mapping could be used.
> 
> 	admaif@0x702d0000 {
> 		dmas = <&adma 1>, <&adma 1>, <&adma 2>, <&adma 2>,
> 		...
> 		dma-names = "rx1", "tx1", "rx2", "tx2",
> 		...
> 	};
> 
> Alternatively, I was thinking that I could set #dma-cells = 0, but what
> I should have done is just have something like ...
> 
> 	admaif@0x702d0000 {
> 		dmas = <&adma>, <&adma>, <&adma>, <&adma>,
> 		...
> 		dma-names = "rx1", "tx1", "rx2", "tx2",
> 		...
> 	};
> 
> In the above case the adma-if driver can just pick whatever channel it
> wants for each of the ports.
> 
> Hope this is clearer.

I think what you are saying here is that the ADMA driver does not talk
to dma slave devices at all, but only talks to the adma-if, which in
turn only talks to the xbar.

That is fine, but the result of that is that there is no point in
using the DMA slave binding for this device, or for the driver to
register itself as a generic slave driver, which it is not.

We should look at this driver in combination with the adma-if and
xbar drivers and then define a binding for the combination of those.

	Arnd
