From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 02/19] clk: tegra: simplify periph clock data
Date: Tue, 15 Oct 2013 12:46:21 -0600
Message-ID: <525D8D7D.10301@wwwdotorg.org>
References: <1381848794-11761-1-git-send-email-pdeschrijver@nvidia.com> <1381848794-11761-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381848794-11761-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 08:52 AM, Peter De Schrijver wrote:
> This patch determines the register bank for clock enable/disable and reset
> based on the clock ID instead of hardcoding it in the tables describing the
> clocks. This results in less data to be maintained in the tables, making the
> code easier to understand. The full benefit of the change will be realized once
> also other clocktypes will be table based.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

>  #define TEGRA_INIT_DATA_MUX(_name, _con_id, _dev_id, _parents, _offset,	\
> -			    _clk_num, _regs, _gate_flags, _clk_id)	\
> +			    _clk_num, _gate_flags, _clk_id)	\
>  	TEGRA_INIT_DATA_TABLE(_name, _con_id, _dev_id, _parents, _offset,\
> -			30, MASK(2), 0, 0, 8, 1, 0, _regs, _clk_num,	\
> -			periph_clk_enb_refcnt, _gate_flags, _clk_id,	\
> -			_parents##_idx, 0)
> +			30, MASK(2), 0, 0, 8, 1, 0, \
> +			_clk_num, periph_clk_enb_refcnt, _gate_flags,\
> +			 _clk_id, _parents##_idx, 0)

Nit (since there are bugs since I know V4 is needed): If you kept
_clk_num on the same line in that macro, the diff would be much more
obvious. I think I said this last time.

>  	for (i = 0; i < ARRAY_SIZE(tegra_periph_clk_list); i++) {
>  		data = &tegra_periph_clk_list[i];
> -		clk = tegra_clk_register_periph(data->name, data->parent_names,
> -				data->num_parents, &data->periph,
> -				clk_base, data->offset, data->flags);
> +
> +		clk = tegra_clk_register_periph(data->name,
> +			data->parent_names, data->num_parents, &data->periph,
> +			clk_base, data->offset, data->flags);
>  		clks[data->clk_id] = clk;
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(tegra_periph_nodiv_clk_list); i++) {
>  		data = &tegra_periph_nodiv_clk_list[i];
> +
>  		clk = tegra_clk_register_periph_nodiv(data->name,

Nit: Seems like an unrelated change, and inconsistent with the other
loop above.

> diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c

> +struct tegra_clk_periph_regs * __init get_reg_bank(int clkid)
> +{
> +	int reg_bank = clkid / 32;
> +
> +	if (reg_bank < periph_banks)
> +		return &periph_regs[reg_bank];
> +	else {
> +		WARN_ON(1);
> +		return NULL;
> +	}
> +}
> +
> +int __init tegra_clk_periph_banks(int num)
> +{
> +	if (num > ARRAY_SIZE(periph_regs))
> +		return -EINVAL;
> +
> +	periph_banks = num;
> +
> +	return 0;
> +}

Shouldn't the condition in tegra_clk_periph_banks() check against
periph_banks rather than ARRAY_SIZE(periph_regs)? I assume the calls to
tegra_clk_periph_banks() from tegra*_clock_init() are intended to ensure
that periph_regs is set up correctly in this file? I wonder if
s/tegra_clk_periph_banks/tegra_clk_validate_periph_bank_count/ isn't
called for?
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
