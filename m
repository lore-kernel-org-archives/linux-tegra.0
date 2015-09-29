From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] dmaengine: tegra-adma: Add support for Tegra210 ADMA
Date: Tue, 29 Sep 2015 15:18:07 +0100
Message-ID: <560A9D9F.2070109@nvidia.com>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
 <2417622.fOrcl680Fe@wuerfel> <560A817E.6010405@nvidia.com>
 <2496965.bMvvDEqHin@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2496965.bMvvDEqHin@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 29/09/15 13:39, Arnd Bergmann wrote:

[snip]

> Ok, that makes more sense then. A few questions still:
> 
> * Would the admaif in turn provide a #dma-cells and have the real slaves
>   hooked up to it?

I don't think that that would be necessary. If you look at the existing
tegra i2s binding [0], there is a ahub-cif-ids property which maps the
actual slave to the apbif (equivalent of the adma-if). This ID is used
to get the appropriate dma channel for this client interface (cif).

> * How do you model the xbar in this scenario?

The xbar is common to existing tegra devices and today is configured via
the ahub-cif-ids property.

> * How does the adma driver know whether you are using a rx or tx channel
>   in the above example, should that perhaps be another cell in dma
>   specifier? It seems that the numbers are all overlapping between rx and
>   tx (each has 1 through 10).

The channels can be configured to be either rx or tx and yes the IDs do
overlap so you have 1-10 for both rx and tx. However, if you are asking
how do I ensure that only one channel uses a specific hardware request,
then yes I probably need to add the direction to the specifier to ensure
only one channel uses a request at any given time.

Cheers
Jon

[0]
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/nvidia,tegra30-i2s.txt
