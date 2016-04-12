From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/7] soc/tegra: pmc: Add interface to get IO rail power
 status
Date: Tue, 12 Apr 2016 19:13:24 +0100
Message-ID: <570D3AC4.2020105@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>
 <1460473007-11535-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460473007-11535-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/04/16 15:56, Laxman Dewangan wrote:
> Add API to get the IO rail power status of the Tegra IO pads.
> This will help client driver to get the current power status
> of IO pads for handling IO pad power.
> 
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/soc/tegra/pmc.c | 16 ++++++++++++++++
>  include/soc/tegra/pmc.h |  6 ++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 762f4fa..0bc8219 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -613,6 +613,22 @@ error:
>  }
>  EXPORT_SYMBOL(tegra_io_rail_power_off);
>  
> +int tegra_io_rail_power_get_status(unsigned int id)
> +{
> +	unsigned long status, value;
> +	unsigned int mask;

These should all be u32 as tegra_pmc_readl() returns a u32.

Hmmm ... I see some of the other tegra_io_rail_xxx() APIs use a unsigned
long here too. We should fix those as well.

> +
> +	if ((id > 63) || (id == 30) || (id == 31))
> +		return -EINVAL;

Seems that this could vary per SoC and so I am wondering if we need a
bitmap for this?

> +
> +	status = (id < 32) ? IO_DPD_STATUS : IO_DPD2_STATUS;
> +	mask = BIT(id % 32);
> +	value = tegra_pmc_readl(status);
> +
> +	return !!(value & mask);

Nit-pick ... do you need this mask variable?

Cheers
Jon
