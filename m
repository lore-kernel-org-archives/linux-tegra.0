From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] dmaengine: of: Allow #dma-cells to be zero
Date: Fri, 25 Sep 2015 17:05:53 +0200
Message-ID: <3225236.fL7a3nR0vD@wuerfel>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com> <1443193000-457-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1443193000-457-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 25 September 2015 15:56:38 Jon Hunter wrote:
> Currently, the #dma-cells property must be 1 or more. However, for some
> DMA controllers, where DMA clients may use any DMA channel and it is not
> necessary to specify any other DMA information in the device-tree DMA
> binding, setting #dma-cells to 0 is desirable. The Tegra210 ADMA
> controller is an example of a DMA controller where neither the DMA
> channel or the hardware request signal need to be encoded in the
> device-tree binding.
> 
> By allowing DMA controllers to set #dma-cells to 0, means that the
> "dma-names" property for these controllers is not needed. Therefore,
> update the of_dma_request_slave_channel() and of_dma_match_channel()
> functions to ignore this property if no name is provided.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Sorry, but this makes no sense. #dma-cells=0 would imply that there
is only one slave per DMA controller, but that is not the case here.
As commented in patch 3, you actually support multiple slaves, you
just use the wrong interface.

	Arnd
