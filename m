From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 07/14] clk: tegra: Implement Tegra210 EMC clock
Date: Thu, 9 Apr 2020 21:24:31 +0300
Message-ID: <8dc000fb-8867-cf8f-8204-a9e1e79a4811@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
 <20200409175238.3586487-8-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200409175238.3586487-8-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.04.2020 20:52, Thierry Reding пишет:
...
> +static long tegra210_clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
> +					unsigned long *prate)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	struct tegra210_clk_emc_provider *provider = emc->provider;
> +	unsigned int i;
> +
> +	if (!provider || !provider->configs || provider->num_configs == 0)
> +		return clk_hw_get_rate(hw);

This still looks wrong to me. Nobody should be able to get EMC clock
until provider is registered.

This is troublesome, especially given that you're allowing the EMC
driver to be compiled as a loadable module. For example, this won't work
with the current ACTMON driver because it builds OPP table based on the
clk-rate rounding during the driver's probe, so it won't be able to do
it properly if provider is "temporarily" missing.

... I think that in a longer run we should stop manually building the
ACTMON's OPP table and instead define a proper OPP table (per-HW Speedo
ID, with voltages) in a device-tree. But this is just a vague plans for
the future for now.
