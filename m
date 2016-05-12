From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V6 2/3] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Thu, 12 May 2016 21:33:18 +0530
Message-ID: <20160512160318.GD2274@localhost>
References: <1463063025-28605-1-git-send-email-jonathanh@nvidia.com>
 <1463063025-28605-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1463063025-28605-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 12, 2016 at 03:23:44PM +0100, Jon Hunter wrote:
> Add support for the Tegra210 Audio DMA controller that is used for
> transferring data between system memory and the Audio sub-system.
> The driver only supports cyclic transfers because this is being solely
> used for audio.
> 
> This driver is based upon the work by Dara Ramesh <dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> 
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  diff.txt                    |  10 +
>  drivers/dma/Kconfig         |  14 +
>  drivers/dma/Makefile        |   1 +
>  drivers/dma/tegra210-adma.c | 840 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 865 insertions(+)
>  create mode 100644 diff.txt
>  create mode 100644 drivers/dma/tegra210-adma.c
> 
> diff --git a/diff.txt b/diff.txt
> new file mode 100644
> index 000000000000..0562f35b6e82
> --- /dev/null
> +++ b/diff.txt
> @@ -0,0 +1,10 @@
> + drivers/i2c/i2c-core.c                             |    61 +-
> + drivers/i2c/i2c-mux.c                              |   170 +-
> + drivers/i2c/muxes/i2c-mux-gpio.c                   |    18 +
> + drivers/i2c/muxes/i2c-mux-pinctrl.c                |    38 +
> + drivers/irqchip/irq-gic-common.c                   |    13 +
> + drivers/irqchip/irq-gic-common.h                   |     3 +
> + drivers/irqchip/irq-gic.c                          |    87 +-
> + sound/core/timer.c                                 |     3 +
> + sound/soc/codecs/rt5645.c                          |    10 +-
> + sound/soc/soc-topology.c                           |     2 +

???


> + * ADMA driver for Nvidia's Tegra210 ADMA controller.
> + *
> + * Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.

2016?

-- 
~Vinod
