From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/3] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Fri, 25 Sep 2015 02:16:30 +0100
Message-ID: <20150925011630.GA2569@svinekod>
References: <1443193000-457-1-git-send-email-jonathanh@nvidia.com>
 <1443193000-457-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1443193000-457-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 25, 2015 at 03:56:39PM +0100, Jon Hunter wrote:
> Add device-tree binding documentation for the Tegra210 Audio DMA
> controller.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/tegra210-adma.txt      | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
> new file mode 100644
> index 000000000000..af04b3c5a557
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
> @@ -0,0 +1,47 @@
> +* NVIDIA Tegra Audio DMA controller
> +
> +Required properties:
> +- compatible: Should be "nvidia,<chip>-adma"

Where <chip> can be?

> +- reg: Should contain DMA registers location and length. This should include
> +  all of the per-channel registers.

This is one contiguous bank?

> +- interrupt-parent: Phandle to the interrupt parent controller.
> +- interrupts: Should contain all of the per-channel DMA interrupts.

In which particular order?

> +- clocks: Must contain two entries, one for the power-domain clock and one
> +  for the module clock. See ../clocks/clock-bindings.txt for details.

The example dts and driver rely on clock-names.

Please define the set of clock-names, and define clocks in terms of
clock-names.

> +- dma-channels: Number of DMA channels supported by the controller.
> +- #dma-cells : Must be <0>.

As others have pointed out, this doesn't seem right.

Thanks,
Mark.
