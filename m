From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/2] staging: Introduce NVIDIA Tegra20 video decoder
 driver
Date: Tue, 17 Oct 2017 15:13:54 -0500
Message-ID: <20171017201354.efgjrwvakkseyvr7@rob-hp-laptop>
References: <cover.1507752381.git.digetx@gmail.com>
 <3d432aa2617977a2b0a8621a1fc2f36f751133e1.1507752381.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3d432aa2617977a2b0a8621a1fc2f36f751133e1.1507752381.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 11, 2017 at 11:08:11PM +0300, Dmitry Osipenko wrote:
> Video decoder, found on NVIDIA Tegra20 SoC, supports a standard set of
> video formats like H.264 / MPEG-4 / WMV / VC1. Currently driver supports
> decoding of CAVLC H.264 only.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-vde.txt      |   44 +

It's preferred to split bindings to a separate patch. Also, this doesn't 
belong under bindings/arm/, but rather bindings/media/.

>  drivers/staging/Kconfig                            |    2 +
>  drivers/staging/Makefile                           |    1 +
>  drivers/staging/tegra-vde/Kconfig                  |    6 +
>  drivers/staging/tegra-vde/Makefile                 |    1 +
>  drivers/staging/tegra-vde/TODO                     |    5 +
>  drivers/staging/tegra-vde/uapi.h                   |  101 ++
>  drivers/staging/tegra-vde/vde.c                    | 1109 ++++++++++++++++++++
>  8 files changed, 1269 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
>  create mode 100644 drivers/staging/tegra-vde/Kconfig
>  create mode 100644 drivers/staging/tegra-vde/Makefile
>  create mode 100644 drivers/staging/tegra-vde/TODO
>  create mode 100644 drivers/staging/tegra-vde/uapi.h
>  create mode 100644 drivers/staging/tegra-vde/vde.c
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
> new file mode 100644
> index 000000000000..c3f847db8167
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-vde.txt
> @@ -0,0 +1,44 @@
> +NVIDIA Tegra Video Decoder Engine
> +
> +Required properties:
> +- compatible : "nvidia,tegra20-vde"
> +- reg : Must contain 2 register ranges: registers and IRAM region that
> +        VDE uses for its internal needs and for passing some of decoding
> +        parameters.

Is the IRAM shared with other things. If so, use mmio-sram binding and 
define the codec's region.

> +- reg-names : Must include the following entries:
> +  - regs
> +  - iram
> +- interrupts : Must contain an entry for each entry in interrupt-names.
> +- interrupt-names : Must include the following entries:
> +  - ucq-error
> +  - sync-token
> +  - bsev
> +  - bsea
> +  - sxe
> +- clocks : Must contain an entry for each entry in clock-names.
> +  See ../clocks/clock-bindings.txt for details.
> +- clock-names : Must include the following entries:
> +  - vde
> +- resets : Must contain an entry for each entry in reset-names.
> +  See ../reset/reset.txt for details.
> +- reset-names : Must include the following entries:
> +  - vde

-names is pointless when there is only one.

> +
> +Example:
> +
> +vde@6001a000 {

video-codec@...

> +	compatible = "nvidia,tegra20-vde";
> +	reg = <0x6001a000 0x3D00    /* VDE registers */
> +		0x40000400 0x3FC00>; /* IRAM region */

Lower case hex please.

> +	reg-names = "regs", "iram";
> +	interrupts = <GIC_SPI  8 IRQ_TYPE_LEVEL_HIGH>, /* UCQ error interrupt */
> +			<GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>, /* Sync token interrupt */
> +			<GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>, /* BSE-V interrupt */
> +			<GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>, /* BSE-A interrupt */
> +			<GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>; /* SXE interrupt */
> +	interrupt-names = "ucq-error", "sync-token", "bsev", "bsea", "sxe";
> +	clocks = <&tegra_car TEGRA20_CLK_VDE>;
> +	clock-names = "vde";
> +	resets = <&tegra_car 61>;
> +	reset-names = "vde";
> +};
