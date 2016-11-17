From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Thu, 17 Nov 2016 17:28:53 +0000
Message-ID: <0068ebe4-09f3-4434-fc38-071cf2d553bc@arm.com>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117171636.20580-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
>

[...]

> diff --git a/drivers/soc/tegra/pmc-tegra186.c b/drivers/soc/tegra/pmc-tegra186.c
> new file mode 100644
> index 000000000000..ee28eddd8e3c
> --- /dev/null
> +++ b/drivers/soc/tegra/pmc-tegra186.c

[...]

> +
> +	/*
> +	 * If available, call the system restart implementation that was
> +	 * registered earlier (typically PSCI).
> +	 */
> +	if (pmc->system_restart) {
> +		pmc->system_restart(reboot_mode, cmd);
> +		return NOTIFY_DONE;
> +	}
> +

IIUC, Tegra186 implements PSCI v1.0 and it always takes above path.
So what other platforms does this driver support ? The name is
pmc-tegra186.c, hence the confusion.

-- 
Regards,
Sudeep
