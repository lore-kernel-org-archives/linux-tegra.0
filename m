From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: initialize the TPS65862 PMIC
Date: Tue, 8 Mar 2011 13:15:41 +0000
Message-ID: <20110308131541.GB5892@sirena.org.uk>
References: <cover.1299588456.git.mike@compulab.co.il> <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4ade6d195fff78271085eafb0a99de3be8beb426.1299588456.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 08, 2011 at 02:58:58PM +0200, Mike Rapoport wrote:

> +static struct regulator_consumer_supply tps658621_ldo2_supply[] = {
> +	REGULATOR_SUPPLY("vdd_rtc", NULL),
> +};

I feel sure that some of these could be using a struct device, though
since they're probably all going to be required to be always on I'd
expect it's not useful to have them mapped as supplies at all and the
drivers could just assume they were there.

> +#define REGULATOR_INIT(_id, _minmv, _maxmv)				\
> +	{								\

This should be namespaced, someone might add a generic macro with that
name.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
