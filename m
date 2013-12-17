From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: add EMC clock driver
Date: Tue, 17 Dec 2013 15:58:02 -0700
Message-ID: <52B0D6FA.2060101@wwwdotorg.org>
References: <1387272400-4689-1-git-send-email-josephl@nvidia.com> <1387272400-4689-3-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387272400-4689-3-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/17/2013 02:26 AM, Joseph Lo wrote:
> Add External Memory Controller (EMC) clock interface for the Tegra CCF
> driver to support EMC scaling.

> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c

> +static long clk_emc_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *prate)
> +{
> +	struct tegra_clk_emc *emc = to_clk_emc(hw);
> +	struct clk *parent_clk = __clk_get_parent(hw->clk);
> +	unsigned long parent_rate = __clk_get_rate(parent_clk);
> +	unsigned long ret;
> +
> +	if (!emc->emc_ops)
> +		return parent_rate;
> +
> +	ret = emc->emc_ops->emc_round_rate(rate);
> +	if (!ret)
> +		return parent_rate;
> +
> +	return ret;
> +}

Rather than implementing this custom "emc_ops" feature, isn't there a
standard clock notifier feature that the EMC driver can use?

Isn't the EMC driver the only thing that will be changing the EMC clock
rate? If so, why not just have the EMC driver perform the appropriate
pre-/post-rate-change actions before/after calling clk_set_rate()?

> +void tegra_register_emc_clk_ops(struct clk *emc_clk,
> +				const struct emc_clk_ops *emc_ops)
> +{
> +	struct clk_hw *hw;
> +	struct tegra_clk_emc *emc;
> +
> +	if (IS_ERR_OR_NULL(emc_clk))
> +		return;

IS_ERROR_OR_NULL() shouldn't be used. "struct clk *" is either IS_ERR()
on error, or it's NULL on error, not both. The body of clk_get() implies
you need to use IS_ERR().
