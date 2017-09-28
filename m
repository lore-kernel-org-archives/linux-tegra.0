From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/5] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Thu, 28 Sep 2017 21:52:38 +0530
Message-ID: <20170928162238.GF30097@localhost>
References: <cover.1506380746.git.digetx@gmail.com>
 <0a45e058baba72124b91c663ce1d908d275f4044.1506380746.git.digetx@gmail.com>
 <20170928092949.GB30097@localhost>
 <b601b829-d87f-99e0-dcf9-ad3f9a7195df@gmail.com>
 <260fa409-0d07-ec9e-9e3b-fb08255026d8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <260fa409-0d07-ec9e-9e3b-fb08255026d8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 28, 2017 at 05:35:59PM +0300, Dmitry Osipenko wrote:
> On 28.09.2017 17:06, Dmitry Osipenko wrote:
> > On 28.09.2017 12:29, Vinod Koul wrote:
> >>> +	default:
> >>> +		return -EINVAL;
> >>> +	}
> >>> +
> >>> +	ahb_seq  = burst << TEGRA_AHBDMA_CHANNEL_AHB_BURST_SHIFT;
> >>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_ADDR_WRAP;
> >>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_INTR_ENB;
> >>> +
> >>> +	writel_relaxed(ahb_seq,
> >>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_SEQ);
> >>> +
> >>> +	writel_relaxed(ahb_addr,
> >>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_PTR);
> >>
> >> oh no, you don't write to HW here. This can be called anytime when you have
> >> txn running! You should save these and use them in prep_ calls.
> >>
> > 
> > BTW, some of the DMA drivers have exactly the same problem. I now see that it is
> > actually documented explicitly in provider.txt, but that's inconsistent across
> > the actual drivers.
> > 
> 
> Also, shouldn't prep_ and dma_slave_config be protected with locking? I don't
> see DMA core doing any locking and seems none of the drivers too.

In prep when you modify the list yes (with vchan I suspect that maybe taken
care), but in general yes driver needs to do that

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
