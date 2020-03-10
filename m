From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 10 Mar 2020 20:44:38 +0300
Message-ID: <a5c9e3d6-2b65-ec93-d8f1-7c7680092e53@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310152003.2945170-4-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The EMC clock needs to carefully coordinate with the EMC controller
> programming to make sure external memory can be properly clocked. Do so
> by hooking up the EMC clock with an EMC provider that will specify which
> rates are supported by the EMC and provide a callback to use for setting
> the clock rate at the EMC.
> 
> Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> - major rework and cleanup

...
> +static u8 tegra210_clk_emc_get_parent(struct clk_hw *hw)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	u32 value;
> +	u8 src;
> +
> +	value = readl_relaxed(emc->regs + CLK_SOURCE_EMC);
> +	src = (value >> CLK_SOURCE_EMC_2X_CLK_SRC_SHIFT) &
> +			CLK_SOURCE_EMC_2X_CLK_SRC_MASK;

What about to use a generic FIELD_GET/PREP()?

> +static int tegra210_clk_emc_set_rate(struct clk_hw *hw, unsigned long rate,
> +				     unsigned long parent_rate)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(hw);
> +	struct tegra210_clk_emc_provider *provider = emc->provider;
> +	struct tegra210_clk_emc_config *config;
> +	struct device *dev = provider->dev;
> +	struct clk_hw *old, *new, *parent;
> +	u8 old_idx, new_idx, index;
> +	struct clk *clk;
> +	unsigned int i;
> +	int err;
> +
> +	if (!provider || !provider->configs || provider->num_configs == 0)
> +		return -EINVAL;

Why all these checks are needed? I don't think it ever could fail,
couldn't it?

> +static int emc_table_lookup(struct tegra_emc *emc, unsigned long rate)
> +{
> +	int i;

unsigned int

Same for all other occurrences in the code.
