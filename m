From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add DT binding for NVIDIA Tegra AHB
 DMA controller
Date: Fri, 6 Oct 2017 10:10:46 +0100
Message-ID: <542f69a2-5d70-47ae-8c04-2089b50cad30@nvidia.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <ecf2e8248dc7b88e5fd04bebe8071027f538a40d.1507073384.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <ecf2e8248dc7b88e5fd04bebe8071027f538a40d.1507073384.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 04/10/17 00:58, Dmitry Osipenko wrote:
> Document DT binding for the NVIDIA Tegra AHB DMA controller that presents
> on Tegra20/30 SoC's.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  .../bindings/dma/nvidia,tegra20-ahbdma.txt         | 23 +++++++++
>  include/dt-bindings/dma/tegra-ahb-dma.h            | 56 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
>  create mode 100644 include/dt-bindings/dma/tegra-ahb-dma.h
> 
> diff --git a/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
> new file mode 100644
> index 000000000000..9fa393766930
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/nvidia,tegra20-ahbdma.txt
> @@ -0,0 +1,23 @@
> +* NVIDIA Tegra AHB DMA controller
> +
> +Required properties:
> +- compatible:	Must be "nvidia,tegra20-ahbdma"
> +- reg:		Must contain registers base address and length.
> +- interrupts:	Must contain one entry, DMA controller interrupt.
> +- clocks:	Must contain one entry, DMA controller clock.
> +- resets :	Must contain one entry, DMA controller reset.
> +- #dma-cells:	Must be <1>. The cell represents DMA request select value
> +		for the peripheral. For more details consult the Tegra TRM
> +		documentation, in particular REQ_SEL field of the AHB DMA
> +		channel control register.
> +
> +Example:
> +
> +ahbdma: ahbdma@60008000  {
> +	compatible = "nvidia,tegra20-ahbdma";
> +	reg = <0x60008000 0x2000>;
> +	interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&tegra_car TEGRA20_CLK_AHBDMA>;
> +	resets = <&tegra_car 33>;
> +	#dma-cells = <1>;
> +};
> diff --git a/include/dt-bindings/dma/tegra-ahb-dma.h b/include/dt-bindings/dma/tegra-ahb-dma.h
> new file mode 100644
> index 000000000000..7eb4fb86e0d2
> --- /dev/null
> +++ b/include/dt-bindings/dma/tegra-ahb-dma.h
> @@ -0,0 +1,56 @@
> +/*
> + * Copyright 2017 Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __DT_BINDINGS_TEGRA_AHBDMA_H
> +#define __DT_BINDINGS_TEGRA_AHBDMA_H
> +
> +#define TEGRA_AHBDMA_TRIG_HRQ2_XRQ_C	2
> +#define TEGRA_AHBDMA_TRIG_HRQ2_XRQ_D	3
> +#define TEGRA_AHBDMA_TRIG_HRQ4_N_A	4
> +#define TEGRA_AHBDMA_TRIG_HRQ5_N_A	5
> +#define TEGRA_AHBDMA_TRIG_HRQ6_TMR1	6
> +#define TEGRA_AHBDMA_TRIG_HRQ7_TMR2	7
> +#define TEGRA_AHBDMA_TRIG_AHB_DMA_0	8
> +#define TEGRA_AHBDMA_TRIG_AHB_DMA_1	9
> +#define TEGRA_AHBDMA_TRIG_AHB_DMA_2	10
> +#define TEGRA_AHBDMA_TRIG_AHB_DMA_3	11
> +#define TEGRA_AHBDMA_TRIG_SMP_28	12
> +#define TEGRA_AHBDMA_TRIG_SMP_29	13
> +#define TEGRA_AHBDMA_TRIG_SMP_30	14
> +#define TEGRA_AHBDMA_TRIG_SMP_31	15
> +
> +#define TEGRA_AHBDMA_TRIG_N_A		16

I don't think that we should bother including the above for now seeing
as #dma-cells must be 1. These may never be used.

Cheers
Jon

-- 
nvpublic
