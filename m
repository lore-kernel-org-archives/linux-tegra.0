From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Tue, 29 Sep 2015 17:34:28 +0200
Message-ID: <5513519.ARXvF8rdlP@wuerfel>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com> <2496965.bMvvDEqHin@wuerfel> <560A9D9F.2070109@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <560A9D9F.2070109-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 29 September 2015 15:18:07 Jon Hunter wrote:
> On 29/09/15 13:39, Arnd Bergmann wrote:
> > Ok, that makes more sense then. A few questions still:
> > 
> > * Would the admaif in turn provide a #dma-cells and have the real slaves
> >   hooked up to it?
> 
> I don't think that that would be necessary. If you look at the existing
> tegra i2s binding [0], there is a ahub-cif-ids property which maps the
> actual slave to the apbif (equivalent of the adma-if). This ID is used
> to get the appropriate dma channel for this client interface (cif).
> 
> > * How do you model the xbar in this scenario?
> 
> The xbar is common to existing tegra devices and today is configured via
> the ahub-cif-ids property.

I see, so instead of modeling the xbar as part of the DMA engine in DT, you
model it as part of the slave. This probably adds a bit of complexity
and a somewhat nonstandard binding, but it's too late to change that anyway.

> > * How does the adma driver know whether you are using a rx or tx channel
> >   in the above example, should that perhaps be another cell in dma
> >   specifier? It seems that the numbers are all overlapping between rx and
> >   tx (each has 1 through 10).
> 
> The channels can be configured to be either rx or tx and yes the IDs do
> overlap so you have 1-10 for both rx and tx. However, if you are asking
> how do I ensure that only one channel uses a specific hardware request,
> then yes I probably need to add the direction to the specifier to ensure
> only one channel uses a request at any given time.

If each channel is either rx or tx, but the two cannot be used simultaneously,
you can just list each of them only once, like this:

	dmas = <&adma 0>, <&adma 1>, <&adma 2>, ...
	dma-names = "if0", "if1", "if2", ...

Otherwise you end up allocating twice the number of channels that you
really need.

	Arnd
