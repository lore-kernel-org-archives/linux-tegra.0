From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 3/5] ARM: tegra: Initialize interrupt controller from DT
Date: Thu, 28 Aug 2014 18:10:55 +0200
Message-ID: <3056623.fB9uqpleQ5@wuerfel>
References: <1409239879-12376-1-git-send-email-thierry.reding@gmail.com> <1409239879-12376-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409239879-12376-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 28 August 2014 17:31:17 Thierry Reding wrote:

>  void __init tegra_init_irq(void)
>  {
> -	int i;
> -	void __iomem *distbase;
> +	unsigned int max_ictlrs = ARRAY_SIZE(ictlr_regs), i;
> +	const struct of_device_id *match;
> +	struct device_node *np;
> +	struct resource res;
> +
> +	np = of_find_matching_node_and_match(NULL, ictlr_matches, &match);
> +	if (np) {
> +		const struct tegra_ictlr_soc *soc = match->data;
> +
> +		for (i = 0; i < soc->num_ictlrs; i++) {
> +			if (of_address_to_resource(np, i, &res) < 0)
> +				break;
> +
> +			ictlr_regs[i] = res;
> +		}
> +
> +		WARN(i != soc->num_ictlrs,
> +		     "Found %u interrupt controllers in DT; expected %u.\n",
> +		     i, soc->num_ictlrs);
> +
> +		max_ictlrs = soc->num_ictlrs;
> +		of_node_put(np);
> +	} else {
> +		/*
> +		 * If no matching device node was found, fall back to using
> +		 * the chip ID.
> +		 */
> +
> +		/* Tegra30 and later have five interrupt controllers, ... */
> +		max_ictlrs = ARRAY_SIZE(ictlr_regs);
> +
> +		/* ..., but Tegra20 only has four. */
> +		if (of_machine_is_compatible("nvidia,tegra20"))
> +			max_ictlrs--;
> +	}

How about moving the entire file to drivers/irqchip and using the
IRQCHIP_DECLARE() helper for the DT case?

For the fallback, you can have an entry into that file that just takes
the address and number, which you can call from platform code here.

	Arnd
