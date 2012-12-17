From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: add EMC clock scaling API
Date: Mon, 17 Dec 2012 14:23:29 -0700
Message-ID: <50CF8D51.6020208@wwwdotorg.org>
References: <1355516086-11116-1-git-send-email-dev@lynxeye.de> <1355516086-11116-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355516086-11116-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/14/2012 01:14 PM, Lucas Stach wrote:
> This allows memory clients to collaboratively control the EMC
> performance.
> Each client may set its performance demands. EMC driver then tries to
> find a DRAM performance level which is able to statisfy all those
> demands.

> diff --git a/arch/arm/mach-tegra/tegra2_emc.c b/arch/arm/mach-tegra/tegra2_emc.c

> +struct emc_superclient_constraint {

Why "superclient" not just "client"?

> +static struct emc_superclient_constraint constraints[TEGRA_EMC_SC_NUM];

This way, the EMC driver must know all the possible clients. Wouldn't it
be better to maintain some kind of dynamic list/... so drivers can just
add/remove to/from this list. I'm not familiar with other
perf/constraints APIs already in the kernel, but I /think/ that's how
they tend to work. This would also mean not having to update the EMC
driver for new Tegra SoCs if all that changed was the set of clients
attached to the EMC.

> +static void tegra_emc_scale_clock(void)

> +	clock_rate = bandwidth_floor >> 2; /* 4byte/clock */

That assumes a 32-bit SDRAM interface. I'm sure that won't always be
true. Perhaps we should invent a #define for this so it stands out
slightly more if/when this needs to change later.

> +	switch (highest_level) {
> +	case TEGRA_EMC_PL_MID:
> +		clock_rate += 300000000;
> +		break;
> +	case TEGRA_EMC_PL_HIGH:
> +		clock_rate += 600000000;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	/* cap clock_rate at 600MHz, enough to select highest rate table */
> +	clock_rate = min(600000000UL, clock_rate);

I think we should parameterize the 600MHz max clock rate, and perhaps
even get it from some kind of clk_get_max_rate() API; this 600MHz value
is highly unlikely to be invariant across SoC versions.

> +void tegra_emc_request_bandwidth(enum tegra_emc_superclient client,
> +				 int bandwidth)
> +{
> +	constraints[client].bandwidth = bandwidth;
> +
> +	tegra_emc_scale_clock();

Locking?

> +void tegra_emc_request_perf_level(enum tegra_emc_superclient client,
> +				  enum tegra_emc_perf_level level)
> +{
> +	constraints[client].perf_level = level;
> +
> +	tegra_emc_scale_clock();

Locking?

>  static struct tegra_emc_pdata __devinit *tegra_emc_fill_pdata(struct platform_device *pdev)

> +	emc_clk = clk_get_sys(NULL, "emc");

Is there a devm_clk_get_sys()? That would avoid the need to add
tegra_emc_remove().

Can we use (devm_)clk_get() instead, so we don't have to hard-code clock
names? That will help when clocks are in DT.

> diff --git a/include/memory/tegra_emc_performance.h b/include/memory/tegra_emc_performance.h

tegra_emc.h seems a better/shorter name.

BTW, did you check our downstream Android kernel to see what we already
have for EMC scaling constraints? It might provide some useful
ideas/background.
