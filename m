From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] clk: tegra: convert Tegra114 gate clocks to table
Date: Tue, 03 Sep 2013 12:10:49 -0600
Message-ID: <52262629.8010605@wwwdotorg.org>
References: <1378215105-12145-1-git-send-email-pdeschrijver@nvidia.com> <1378215105-12145-3-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378215105-12145-3-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/03/2013 07:31 AM, Peter De Schrijver wrote:
> This patch converts the Tegra114 gate clock registration to be table driven
> like the periph clocks. The same struct tegra_periph_init_data is used for the
> table, but some fields are unused. This makes the code easier to read and also
> paves the way to share clock data between Tegra SoCs.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

> +static const char *clk_32k[] = {
> +	"clk_32k",
> +};


I think those new arrays of strings are only used ...

> @@ -2114,6 +2023,26 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base)

> +	for (i = 0; i < ARRAY_SIZE(tegra_periph_gate_clk_list); i++) {
> +		int reg_bank;
> +
> +		data = &tegra_periph_gate_clk_list[i];
> +		reg_bank = get_reg_bank(data->periph.gate.clk_num);
> +
> +		if (reg_bank >= 0) {
> +			clk = tegra_clk_register_periph_gate(data->name,
> +					data->parent_names[0],

... here. If so, why make them arrays? Surely they could just be a const
char * inside tegra_periph_gate_clk_list[i]?
