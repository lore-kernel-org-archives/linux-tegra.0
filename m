From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: Add DT binding for NVIDIA Tegra AHB
 DMA controller
Date: Fri, 6 Oct 2017 14:56:10 +0100
Message-ID: <03810975-7eb0-aa79-964f-dcbcbaf9e4b4@nvidia.com>
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

Typically, we have a list here indicating what the compatible string
should be for the supported devices. So maybe we want something like ...

- compatible : Should contain one of the following:
  - "nvidia,tegra20-ahbdma": for Tegra20
  - "nvidia,tegra30-ahbdma", "nvidia,tegra20-ahbdma": for Tegra30

Please note that even thought the driver may only currently define the
compatible string "nvidia,tegra20-ahbdma", adding
"nvidia,tegra30-ahbdma" in the dts for Tegra30 is good practice if a
bug/difference is found later on.

Cheers
Jon

-- 
nvpublic
