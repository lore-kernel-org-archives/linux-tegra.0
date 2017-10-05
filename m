From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/5] dt-bindings: Add DT bindings for NVIDIA Tegra AHB
 DMA controller
Date: Thu, 5 Oct 2017 15:33:55 -0500
Message-ID: <20171005203355.5lftjytx5f6rhe2d@rob-hp-laptop>
References: <cover.1506380746.git.digetx@gmail.com>
 <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <604d92036e0936443290e68a2226f935fb348113.1506380746.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 26, 2017 at 02:22:04AM +0300, Dmitry Osipenko wrote:
> Document DT bindings for NVIDIA Tegra AHB DMA controller that presents
> on Tegra20/30 SoC's.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
> new file mode 100644
> index 000000000000..2af9aa76ae11
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
> @@ -0,0 +1,23 @@
> +* NVIDIA Tegra AHB DMA controller
> +
> +Required properties:
> +- compatible:	Must be "nvidia,tegra20-ahbdma"
> +- reg:		Should contain registers base address and length.
> +- interrupts:	Should contain one entry, DMA controller interrupt.
> +- clocks:	Should contain one entry, DMA controller clock.
> +- resets :	Should contain one entry, DMA controller reset.
> +- #dma-cells:	Should be <1>. The cell represents DMA request select value
> +		for the peripheral. For more details consult the Tegra TRM's
> +		documentation, in particular AHB DMA channel control register
> +		REQ_SEL field.
> +
> +Example:
> +
> +ahbdma: ahbdma@60008000  {

Use standard node names. dma-controller in this case.

> +	compatible = "nvidia,tegra20-ahbdma";
> +	reg = <0x60008000 0x2000>;
> +	interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&tegra_car TEGRA20_CLK_AHBDMA>;
> +	resets = <&tegra_car 33>;
> +	#dma-cells = <1>;
> +};
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
