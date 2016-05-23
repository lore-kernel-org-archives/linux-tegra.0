From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V7 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Mon, 23 May 2016 10:03:47 +0100
Message-ID: <5742C773.6080609@nvidia.com>
References: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com>
 <1463755530-20941-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1463755530-20941-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 20/05/16 15:45, Laxman Dewangan wrote:
> The IO pins of Tegra SoCs are grouped for common control of IO
> interface like setting voltage signal levels and power state of
> the interface. The group is generally referred as IO pads. The
> power state and voltage control of IO pins can be done at IO pads
> level.
> 
> Tegra generation SoC supports the power down of IO pads when it
> is not used even in the active state of system. This saves power
> from that IO interface. Also it supports multiple voltage level
> in IO pins for interfacing on some of pads. The IO pad voltage is
> automatically detected till T124, hence SW need not to configure
> this. But from T210, the automatically detection logic has been
> removed, hence SW need to explicitly set the IO pad voltage into
> IO pad configuration registers.
> 
> Add support to set the power states and voltage level of the IO pads
> from client driver. The implementation for the APIs are in generic
> which is applicable for all generation os Tegra SoC.
> 
> IO pads ID and information of bit field for power state and voltage
> level controls are added for Tegra124, Tegra132 and Tegra210. The SOR
> driver is modified to use the new APIs.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks. I will defer to Thierry on how this should be organised for
merging but I am happy with the code. There is one minor typo below, but
otherwise ...

Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


> ---
> Changes from V1:
> This is reworked on earlier path to have separation between IO rails and
> io pads and add power state and voltage control APIs in single call.
> 
> Changes from V2:
> - Remove the tegra_io_rail_power_off/on() apis and change client (sor) driver
> to use the new APIs for IO pad power.
> - Remove the TEGRA_IO_RAIL_ macros.
> 
> Changes from V3:
> - Make all pad_id/io_pad_id to id.
> - tegra_io_pad_ -> tegra_io_pads
> - dpd_bit -> bit, pwr_mask/bit to mask/bit.
> - Rename function to tegra_io_pads_{set,get}_voltage_config
> - Make the io pad tables common for all SoC.
> - Make io_pads enums.
> - Add enums for voltage.
> 
> Changes from V4:
> - IO_PAD->IO_PADS
> - TEGRA_IO_PADS_POWER_SOURCE_ -> TEGRA_IO_PADS_VCONF_
> 
> Changes from V5:
> - Fix comment style to multi-line format.
> - Use -EINVAL instead of -1 to refactor some of function as suggested by Jon.
> 
> Changes from V6:
> - Doc style formatting.
> - io pads id checks.
> - Documenting public functions.
> - Corrected error numbers.
> ---
>  drivers/gpu/drm/tegra/sor.c |   8 +-
>  drivers/soc/tegra/pmc.c     | 280 +++++++++++++++++++++++++++++++++++++++-----
>  include/soc/tegra/pmc.h     | 133 +++++++++++++++------
>  3 files changed, 350 insertions(+), 71 deletions(-)

> +/**
> + * Define the IO_PADS SOC for SOC mask to find out that IO pads supported
> + * or not in given SoC.
> + */

In addition to the typo, I would have made this a normal multi-line comment.

> +#define TEGRA_IO_PADS_T124		0x1
> +#define TEGRA_IO_PADS_T210		0x2
> +#define TEGRA_IO_PADS_T124_T210		(TEGRA_IO_PADS_T124 |	\
> +					TEGRA_IO_PADS_T210)
> +

...

> +/**
> + * tegra_io_pads_power_enablei() - Enable the power to IO pads.

Typo ... s/enablei/enable


> +/*
> + * TEGRA_IO_PAD: The IO pins of Tegra SoCs are grouped for common

TEGRA_IO_PADS

> +/* tegra_io_pads_vconf_voltage: The voltage level of IO rails which source
> + *				the IO pads.
> + */
> +enum tegra_io_pads_vconf_voltage {
> +	TEGRA_IO_PADS_VCONF_1800000UV,
> +	TEGRA_IO_PADS_VCONF_3300000UV,
> +};

Normal multi-line comment.

Cheers
Jon

--
nvpublic
