From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: Re: [PATCH V3 0/2] Add support for Tegra210 ADMA
Date: Fri, 20 May 2016 14:51:14 -0400
Message-ID: <CAP=VYLpnREnW1a6++0qW=1N6EcUpKTTfiCnfbuA3DHktKmf22Q@mail.gmail.com>
References: <1444980919-20331-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444980919-20331-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Oct 16, 2015 at 3:35 AM, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Add support for the Tegra210 Audio DMA (ADMA) controller. This was
> originally distributed as an RFC [0] based upon the existing tegra
> APB-DMA driver. Since then the driver has been significantly
> re-worked to remove a lot of the unused/unnecessary functionality
> that was carried over from the APB-DMA. This version is no longer
> derived from the APB-DMA driver and has been updated to use the
> virt-dma helpers.

Does this driver make sense to support modular use?  I ask because
it inherits the inconsistency of being a bool Kconfig but using some
modular infrastructure from the APB driver.

Sometime ago  when I sent patches to dma/* to "demodularize" other
bools, the general consensus of reviewers/maintainers was that
(to paraphrase) "if it can be modular, it should be modular" -- in
order to keep the multi platform bzImage size as small as can be.

I did a quick test with it tristate, but that fails as follows:

ERROR: "pm_clk_add_clk" [drivers/dma/tegra210-adma.ko] undefined!
ERROR: "pm_clk_create" [drivers/dma/tegra210-adma.ko] undefined!
ERROR: "pm_clk_destroy" [drivers/dma/tegra210-adma.ko] undefined!
ERROR: "pm_clk_suspend" [drivers/dma/tegra210-adma.ko] undefined!
ERROR: "pm_clk_resume" [drivers/dma/tegra210-adma.ko] undefined!

...since drivers/base/power/clock_ops.c does not currently have any of
those fcns as EXPORT_SYMBOL.  Not a show-stopper, but I don't
want to blindly export those fcns if it doesn't make sense.

Thanks,
Paul.
--

>
> V3 changes:
> - Updated DT binding per feedback from Mark and Stephen
> - Fixed up items mentioned by Vinod
>
> V2 changes:
> - Re-worked device-tree binding
>
> [0] https://lkml.org/lkml/2015/8/18/237
>
> Jon Hunter (2):
>   Documentation: DT: Add binding documentation for NVIDIA ADMA
>   dmaengine: tegra-adma: Add support for Tegra210 ADMA
>
>  .../devicetree/bindings/dma/tegra210-adma.txt      |  50 ++
>  drivers/dma/Kconfig                                |  13 +
>  drivers/dma/Makefile                               |   1 +
>  drivers/dma/tegra210-adma.c                        | 909 +++++++++++++++++++++
>  4 files changed, 973 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/tegra210-adma.txt
>  create mode 100644 drivers/dma/tegra210-adma.c
>
> --
> 2.1.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
