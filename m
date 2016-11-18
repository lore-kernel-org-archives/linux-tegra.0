From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Fri, 18 Nov 2016 09:36:04 +0000
Message-ID: <e9a081f5-8e93-d3e8-a702-79903e5a6a78@nvidia.com>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117171636.20580-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/11/16 17:16, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The power management controller on Tegra186 has changed in backwards-
> incompatible ways with respect to earlier generations. This implements a
> new driver that supports inversion of the PMU interrupt as well as the
> "recovery", "bootloader" and "forced-recovery" reboot commands.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |  34 +++++
>  drivers/soc/tegra/Makefile                         |   2 +-
>  drivers/soc/tegra/pmc-tegra186.c                   | 169 +++++++++++++++++++++
>  3 files changed, 204 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>  create mode 100644 drivers/soc/tegra/pmc-tegra186.c

...

> diff --git a/drivers/soc/tegra/Makefile b/drivers/soc/tegra/Makefile
> index ae857ff7d53d..9976a0de1927 100644
> --- a/drivers/soc/tegra/Makefile
> +++ b/drivers/soc/tegra/Makefile
> @@ -1,4 +1,4 @@
>  obj-y += fuse/
>  
>  obj-y += common.o
> -obj-y += pmc.o
> +obj-y += pmc.o pmc-tegra186.o

Do we want to enable this driver for all Tegra devices? Was not sure if
this should be dependent on ARM64.

Cheers
Jon

-- 
nvpublic
