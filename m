From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Fri, 25 Sep 2015 17:32:14 +0200
Message-ID: <2742332.nt7s0RkAcY@wuerfel>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com> <6067659.MUznB20YVT@wuerfel> <56056589.9010704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56056589.9010704-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 25 September 2015 16:17:29 Jon Hunter wrote:
> On 25/09/15 16:03, Arnd Bergmann wrote:
> > On Friday 25 September 2015 15:56:40 Jon Hunter wrote:
> >> +       case DMA_MEM_TO_DEV:
> >> +               burst_size = fls(tdc->config.dst_maxburst);
> >> +               ch_regs->config = ADMA_CH_CONFIG_SRC_BUF(num_bufs - 1);
> >> +               ch_regs->ctrl = ADMA_CH_CTRL_XFER_DIR(ADMA_MEM_TO_AHUB) |
> >> +                               ADMA_CH_CTRL_TX_REQ(tdc->config.slave_id);
> >> +               ch_regs->src_addr = buf_addr;
> >> +               break;
> >> +
> >> +       case DMA_DEV_TO_MEM:
> >> +               burst_size = fls(tdc->config.src_maxburst);
> >> +               ch_regs->config = ADMA_CH_CONFIG_TRG_BUF(num_bufs - 1);
> >> +               ch_regs->ctrl = ADMA_CH_CTRL_XFER_DIR(ADMA_AHUB_TO_MEM) |
> >> +                               ADMA_CH_CTRL_RX_REQ(tdc->config.slave_id);
> >> +               ch_regs->trg_addr = buf_addr;
> >> +               break;
> > 
> > Do not use the 'slave_id' field here to identify the slave device, that
> > concept is broken. Instead, put the slave identification into the
> > dma specifier in DT and read it out in your xlate function.
> 
> Why is it broken?

This requires the slave driver to pass a slave id through the
dmaengine_slave_config() interface, but we don't want the driver
to know how it is connected to the dma engine. That information is
not a property of the slave itself but rather of the connection
between the slave and the master, and it belongs into DT, similar
to how we deal with IRQ or GPIO numbers.

> What happens if I don't know the slave-id? In other words, the slave-id
> can be dynamically allocated and associated with a given slave.

How do you identify the slave that the slave-id is associated with?

	Arnd
