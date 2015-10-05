From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V2 1/2] Documentation: DT: Add binding documentation for
 NVIDIA ADMA
Date: Mon, 5 Oct 2015 14:12:15 +0100
Message-ID: <20151005131215.GN19064@leverpostej>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1444047007-30494-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 05, 2015 at 01:10:06PM +0100, Jon Hunter wrote:
> Add device-tree binding documentation for the Tegra210 Audio DMA
> controller.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/tegra210-adma.txt      | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/tegra210-adma.txt b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
> new file mode 100644
> index 000000000000..df0e46868a63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/tegra210-adma.txt
> @@ -0,0 +1,63 @@
> +* NVIDIA Tegra Audio DMA (ADMA) controller
> +
> +Required properties:
> +- compatible: Must be "nvidia,tegra210-adma".
> +- reg: Should contain DMA registers location and length. This should be
> +  a single entry that includes all of the per-channel registers in one
> +  contiguous bank.
> +- interrupt-parent: Phandle to the interrupt parent controller.
> +- interrupts: Should contain all of the per-channel DMA interrupts in
> +  ascending order with respect to the DMA channel index.
> +- clocks: Must contain one entry for the ADMA module clock, "adma_ape".
> +- clock-names: Must contain the entry "adma_ape".
> +- dma-channels: Must be 22. Defines the number of DMA channels supported
> +  by the DMA controller.

If this has to be a fixed value, why is it necessary? Why does the
driver not just know this?

Are there other instances of this IP block where this differs?

> +- dma-rx-requests: Must be 10. Defines the number of receive request
> +  signals supported by the DMA controller.
> +- dma-tx-requests: Must be 10. Defines the number of transmit request
> +  signals supported by the DMA controller.

Likewise for these two?

Mark.

> +- #dma-cells : Must be <2>. The first cell denotes the transmit or
> +  receive request number and should be between 1 and the maximum number
> +  of requests supported (see properties "dma-rx-requests" and
> +  "dma-tx-requests"). This value corresponds to the RX/TX_REQUEST_SELECT
> +  fields in the ADMA_CHn_CTRL register. The second cell denotes whether
> +  the channel is a receive or transmit channel and must be either 2 for
> +  a receive channel and 4 for a transmit channel. These values correspond
> +  to the TRANSFER_DIRECTION field of the ADMA_CHn_CTRL register.
> +
> +
> +Example:
> +
> +adma: adma@702e2000 {
> +	compatible = "nvidia,tegra210-adma";
> +	reg = <0x0 0x702e2000 0x0 0x2000>;
> +	interrupt-parent = <&tegra_agic>;
> +	interrupts = <GIC_SPI INT_ADMA_EOT0 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT1 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT2 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT3 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT4 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT5 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT6 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT7 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT8 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT9 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT10 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT11 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT12 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT13 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT14 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT15 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT16 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT17 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT18 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT19 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT20 IRQ_TYPE_LEVEL_HIGH>,
> +		     <GIC_SPI INT_ADMA_EOT21 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&tegra_car TEGRA210_CLK_ADMA_APE>;
> +	clock-names = "adma_ape";
> +	dma-channels = <22>;
> +	dma-rx-requests = <10>;
> +	dma-tx-requests = <10>;
> +	#dma-cells = <2>;
> +};
> -- 
> 2.1.4
> 
