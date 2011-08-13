From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC PATCH 10/12] arm/tegra: Add device tree support to pinmux
 driver
Date: Sat, 13 Aug 2011 11:43:23 +0100
Message-ID: <20110813104323.GC2643@pulham.picochip.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
 <1313189697-21287-11-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1313189697-21287-11-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Fri, Aug 12, 2011 at 04:54:55PM -0600, Stephen Warren wrote:
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/pinmux.c |  115 ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 115 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/pinmux.c b/arch/arm/mach-tegra/pinmux.c
> index 05fa1a3..33246c2 100644
> --- a/arch/arm/mach-tegra/pinmux.c
> +++ b/arch/arm/mach-tegra/pinmux.c
> @@ -20,6 +20,7 @@
>  #include <linux/errno.h>
>  #include <linux/spinlock.h>
>  #include <linux/io.h>
> +#include <linux/of.h>
>  #include <linux/platform_device.h>
>  
>  #include <mach/iomap.h>
> @@ -147,6 +148,41 @@ static const char *func_name(enum tegra_mux_func func)
>  	return tegra_mux_names[func];
>  }
>  
> +#ifdef CONFIG_OF
> +static int func_enum(const char *name, enum tegra_mux_func *func_out)
> +{
> +	int func;
> +
> +	if (!strcmp(name, "RSVD1")) {
> +		*func_out = TEGRA_MUX_RSVD1;
> +		return 0;
> +	}
> +	if (!strcmp(name, "RSVD2")) {
> +		*func_out = TEGRA_MUX_RSVD2;
> +		return 0;
> +	}
> +	if (!strcmp(name, "RSVD3")) {
> +		*func_out = TEGRA_MUX_RSVD3;
> +		return 0;
> +	}
> +	if (!strcmp(name, "RSVD4")) {
> +		*func_out = TEGRA_MUX_RSVD4;
> +		return 0;
> +	}
> +	if (!strcmp(name, "NONE")) {
> +		*func_out = TEGRA_MUX_NONE;
> +		return 0;
> +	}
> +
> +	for (func = 0; func < TEGRA_MAX_MUX; func++)
> +		if (!strcmp(name, tegra_mux_names[func])) {
> +			*func_out = func;
> +			return 0;
> +		}
> +
> +	return -EINVAL;
> +}
> +#endif
>  
>  static const char *tri_name(unsigned long val)
>  {
> @@ -666,15 +702,94 @@ void tegra_pinmux_config_pullupdown_table(const struct tegra_pingroup_config *co
>  	}
>  }
>  
> +#ifdef CONFIG_OF
> +static void __init tegra_pinmux_probe_dt(struct platform_device *pdev)
> +{
> +	int pg;
> +
> +	for (pg = 0; pg < TEGRA_MAX_PINGROUP; pg++) {
> +		const char *pg_name = pingroup_name(pg);
> +		struct tegra_pingroup_config config;
> +		struct device_node *pg_node;
> +		int ret;
> +		const char *s;
> +
> +		pg_node = of_find_child_node_by_name(pdev->dev.of_node,
> +						     pg_name);
> +		if (pg_node == NULL)
> +			continue;

Rather than iterating over all of the mux names in the pinmux driver and 
searching for a matching DT node, could you not do it the other way 
round?  So do an for_each_child_of_node() on the pinmux node then find 
the matching pingroup keyed by the node name?  This would eliminate 
of_find_child_node_by_name().  You could also catch invalid 
configurations for non-existent pins this way.

Jamie
