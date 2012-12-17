From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Mon, 17 Dec 2012 19:08:24 +0800
Message-ID: <50CEFD28.7080601@gmail.com>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de> <1355516086-11116-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355516086-11116-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

If my understanding is right, I think this is a temporary solution.
Because this kind of requirement should be addressed by DVFS subsystem.

Anyway, check the comments below.

On 12/15/2012 04:14 AM, Lucas Stach wrote:
> This allows memory clients to collaboratively control the EMC
> performance.
> Each client may set its performance demands. EMC driver then tries to
> find a DRAM performance level which is able to statisfy all those
> demands.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
>  arch/arm/mach-tegra/tegra2_emc.c       | 84 ++++++++++++++++++++++++=
++++++++--
>  include/memory/tegra_emc_performance.h | 79 ++++++++++++++++++++++++=
++++++++
>  2 Dateien ge=C3=A4ndert, 160 Zeilen hinzugef=C3=BCgt(+), 3 Zeilen en=
tfernt(-)
>  create mode 100644 include/memory/tegra_emc_performance.h
>=20
> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/t=
egra2_emc.c
> index 837c7b9..d2cf7a1 100644
> --- a/arch/arm/mach-tegra/tegra2_emc.c
> +++ b/arch/arm/mach-tegra/tegra2_emc.c
> @@ -15,6 +15,7 @@
>   *
>   */
> =20
> +#include <asm/div64.h>
>  #include <linux/kernel.h>
>  #include <linux/device.h>
>  #include <linux/clk.h>
> @@ -24,6 +25,8 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/tegra_emc.h>
> +#include <linux/types.h>
> +#include <memory/tegra_emc_performance.h>

Why don't you put this file into the directory which "tegra_emc.h"
resides? I think that'll be easy to find and understand.

> =20
>  #include "tegra2_emc.h"
>  #include "fuse.h"
> @@ -35,8 +38,16 @@ static bool emc_enable;
>  #endif
>  module_param(emc_enable, bool, 0644);
> =20
> +struct emc_superclient_constraint {
> +	int bandwidth;
> +	enum tegra_emc_perf_level perf_level;
> +};
> +
> +static struct emc_superclient_constraint constraints[TEGRA_EMC_SC_NU=
M];
> +
>  static struct platform_device *emc_pdev;
>  static void __iomem *emc_regbase;
> +static struct clk *emc_clk;

Instead of using global variables, it's better to save it into a driver
private structure. Although this way is easy to write. :)
I think when we start upstream works on DVFS, an emc driver private
structure is needed so we can do this right now.

> =20
>  static inline void emc_writel(u32 val, unsigned long addr)
>  {
> @@ -176,6 +187,64 @@ int tegra_emc_set_rate(unsigned long rate)
>  	return 0;
>  }
> =20
> +static void tegra_emc_scale_clock(void)
> +{
> +	u64 bandwidth_floor =3D 0;
> +	enum tegra_emc_perf_level highest_level =3D TEGRA_EMC_PL_LOW;
> +	unsigned long clock_rate;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(constraints); i++) {
> +		bandwidth_floor +=3D constraints[i].bandwidth;

Get confused here. Why we add all bandwidth up? We should loop all the
bandwidth requests in "constraints" array, find out the largest one,
compare with emc table then finally write the registers and set the emc
clock, isn't it?

> +		if (constraints[i].perf_level > highest_level)
> +			highest_level =3D constraints[i].perf_level;
> +	}
> +
> +	/*
> +	 * Add some headroom to the bandwidth, we use a conservative 60%
> +	 * DRAM bandwidth efficiency factor
> +	 */
> +	bandwidth_floor *=3D 5;
> +	do_div(bandwidth_floor, 3);
> +
> +	clock_rate =3D bandwidth_floor >> 2; /* 4byte/clock */
> +
> +	/* boost clock according to perf level */
> +	switch (highest_level) {
> +	case TEGRA_EMC_PL_MID:
> +		clock_rate +=3D 300000000;
> +		break;
> +	case TEGRA_EMC_PL_HIGH:
> +		clock_rate +=3D 600000000;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* cap clock_rate at 600MHz, enough to select highest rate table */
> +	clock_rate =3D min(600000000UL, clock_rate);
> +
> +	clk_set_rate(emc_clk, clock_rate);
> +}
> +
> +void tegra_emc_request_bandwidth(enum tegra_emc_superclient client,
> +				 int bandwidth)
> +{
> +	constraints[client].bandwidth =3D bandwidth;
> +
> +	tegra_emc_scale_clock();
> +}
> +EXPORT_SYMBOL_GPL(tegra_emc_request_bandwidth);
> +
> +void tegra_emc_request_perf_level(enum tegra_emc_superclient client,
> +				  enum tegra_emc_perf_level level)
> +{
> +	constraints[client].perf_level =3D level;
> +
> +	tegra_emc_scale_clock();
> +}
> +EXPORT_SYMBOL_GPL(tegra_emc_request_perf_level);
> +
>  #ifdef CONFIG_OF
>  static struct device_node *tegra_emc_ramcode_devnode(struct device_n=
ode *np)
>  {
> @@ -270,19 +339,17 @@ static struct tegra_emc_pdata *tegra_emc_dt_par=
se_pdata(
> =20
>  static struct tegra_emc_pdata __devinit *tegra_emc_fill_pdata(struct=
 platform_device *pdev)
>  {
> -	struct clk *c =3D clk_get_sys(NULL, "emc");
>  	struct tegra_emc_pdata *pdata;
>  	unsigned long khz;
>  	int i;
> =20
>  	WARN_ON(pdev->dev.platform_data);
> -	BUG_ON(IS_ERR_OR_NULL(c));
> =20
>  	pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>  	pdata->tables =3D devm_kzalloc(&pdev->dev, sizeof(*pdata->tables),
>  				     GFP_KERNEL);
> =20
> -	pdata->tables[0].rate =3D clk_get_rate(c) / 2 / 1000;
> +	pdata->tables[0].rate =3D clk_get_rate(emc_clk) / 2 / 1000;
> =20
>  	for (i =3D 0; i < TEGRA_EMC_NUM_REGS; i++)
>  		pdata->tables[0].regs[i] =3D emc_readl(emc_reg_addr[i]);
> @@ -306,6 +373,9 @@ static int __devinit tegra_emc_probe(struct platf=
orm_device *pdev)
>  		return -ENODEV;
>  	}
> =20
> +	emc_clk =3D clk_get_sys(NULL, "emc");
> +	BUG_ON(IS_ERR_OR_NULL(emc_clk));
> +
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res) {
>  		dev_err(&pdev->dev, "missing register base\n");
> @@ -333,6 +403,13 @@ static int __devinit tegra_emc_probe(struct plat=
form_device *pdev)
>  	return 0;
>  }
> =20
> +static int tegra_emc_remove(struct platform_device *pdev)
> +{
> +	clk_put(emc_clk);
> +
> +	return 0;
> +}
> +
>  static struct of_device_id tegra_emc_of_match[] __devinitdata =3D {
>  	{ .compatible =3D "nvidia,tegra20-emc", },
>  	{ },
> @@ -345,6 +422,7 @@ static struct platform_driver tegra_emc_driver =3D=
 {
>  		.of_match_table =3D tegra_emc_of_match,
>  	},
>  	.probe          =3D tegra_emc_probe,
> +	.remove         =3D tegra_emc_remove,
>  };
> =20
>  static int __init tegra_emc_init(void)
> diff --git a/include/memory/tegra_emc_performance.h b/include/memory/=
tegra_emc_performance.h
> new file mode 100644
> index 0000000..6c23099
> --- /dev/null
> +++ b/include/memory/tegra_emc_performance.h
> @@ -0,0 +1,79 @@
> +/*
> + * Copyright (C) 2012 Lucas Stach
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef __TEGRA_EMC_PERFORMANCE_H
> +#define __TEGRA_EMC_PERFORMANCE_H
> +
> +enum tegra_emc_superclient {
> +	TEGRA_EMC_SC_AFI =3D 0,	/* Tegra30 only */
> +	TEGRA_EMC_SC_AVP,
> +	TEGRA_EMC_SC_DC,
> +	TEGRA_EMC_SC_DCB,
> +	TEGRA_EMC_SC_EPP,
> +	TEGRA_EMC_SC_G2,
> +	TEGRA_EMC_SC_HC,
> +	TEGRA_EMC_SC_HDA,	/* Tegra30 only */
> +	TEGRA_EMC_SC_ISP,
> +	TEGRA_EMC_SC_MPCORE,
> +	TEGRA_EMC_SC_MPCORELP,	/* Tegra30 only */
> +	TEGRA_EMC_SC_MPE,
> +	TEGRA_EMC_SC_NV,
> +	TEGRA_EMC_SC_NV2,	/* Tegra30 only */
> +	TEGRA_EMC_SC_PPCS,
> +	TEGRA_EMC_SC_SATA,	/* Tegra30 only */
> +	TEGRA_EMC_SC_VDE,
> +	TEGRA_EMC_SC_VI,
> +
> +	TEGRA_EMC_SC_NUM
> +};
> +
> +enum tegra_emc_perf_level {
> +	TEGRA_EMC_PL_LOW =3D 0,	/* no boost */
> +	TEGRA_EMC_PL_MID,	/* half frequency boost */
> +	TEGRA_EMC_PL_HIGH	/* max frequency boost */
> +};
> +
> +/**
> + * tegra_emc_request_bandwidth - request bandwidth for isochronous c=
lients
> + * @client: the EMC superclient which requests bandwidth
> + * @bandwidth: needed bandwidth in bytes/s
> + *
> + * Use this function to request bandwidth for isochronous clients, w=
hich
> + * need a specific bandwidth to operate properly. EMC will make sure=
 to not
> + * drop below this limit while scaling DRAM frequency.
> + * Superclients have to add up the required bandwidth for their subu=
nits
> + * themselves.
> + */
> +void tegra_emc_request_bandwidth(enum tegra_emc_superclient client,
> +				 int bandwidth);
> +
> +/**
> + * tegra_emc_request_perf_level - request DRAM frequency boost
> + * @client: the EMC superclient which requests boost
> + * @level: the requested boost level
> + *
> + * Use this function to boost DRAM frequency for clients, which don'=
t need a
> + * specific bandwidth but want to scale up DRAM bandwidth to impleme=
nt
> + * race-to-idle.
> + */
> +void tegra_emc_request_perf_level(enum tegra_emc_superclient client,
> +				  enum tegra_emc_perf_level level);
> +
> +/* FIXME: Tegra 30 has no EMC driver yet, stub out performance funct=
ions */
> +#ifndef CONFIG_ARCH_TEGRA_2x_SOC
> +void tegra_emc_request_bandwidth(enum tegra_emc_superclient client,
> +				 int bandwidth)
> +{
> +}
> +void tegra_emc_request_perf_level(enum tegra_emc_superclient client,
> +				  enum tegra_emc_perf_level level)
> +{
> +}
> +#endif /* !CONFIG_ARCH_TEGRA_2x_SOC */
> +
> +#endif /* __TEGRA_EMC_PERFORMANCE_H */
>=20
