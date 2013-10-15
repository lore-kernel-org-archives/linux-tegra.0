From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 11/19] clk: tegra: move periph clocks to common file
Date: Tue, 15 Oct 2013 13:19:44 -0600
Message-ID: <525D9550.2030701@wwwdotorg.org>
References: <1381848794-11761-1-git-send-email-pdeschrijver@nvidia.com> <1381848794-11761-12-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381848794-11761-12-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 08:52 AM, Peter De Schrijver wrote:
> Introduce a new file for peripheral clocks common between several Tegra
> SoCs and move Tegra114 to this new infrastructure. Also PLLP and the PLLP_OUT
> clocks will be initialized here.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

> @@ -966,22 +699,22 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
>  	[tegra_clk_pwm] = { .dt_id = TEGRA114_CLK_PWM, .present = true },
>  	[tegra_clk_i2s0] = { .dt_id = TEGRA114_CLK_I2S0, .present = true },
>  	[tegra_clk_i2s2] = { .dt_id = TEGRA114_CLK_I2S2, .present = true },
> -	[tegra_clk_epp] = { .dt_id = TEGRA114_CLK_EPP, .present = true },
> -	[tegra_clk_gr2d] = { .dt_id = TEGRA114_CLK_GR2D, .present = true },
> +	[tegra_clk_epp_8] = { .dt_id = TEGRA114_CLK_EPP, .present = true },
> +	[tegra_clk_gr2d_8] = { .dt_id = TEGRA114_CLK_GR2D, .present = true },
>  	[tegra_clk_usbd] = { .dt_id = TEGRA114_CLK_USBD, .present = true },
>  	[tegra_clk_isp] = { .dt_id = TEGRA114_CLK_ISP, .present = true },
> -	[tegra_clk_gr3d] = { .dt_id = TEGRA114_CLK_GR3D, .present = true },
> +	[tegra_clk_gr3d_8] = { .dt_id = TEGRA114_CLK_GR3D, .present = true },
...

Why the need to edit this table in this patch? Why not just get it right
in the previous patch, where it's first added?

> @@ -2166,9 +1606,10 @@ static void __init tegra114_clock_init(struct device_node *np)
>  
>  	tegra114_fixed_clk_init(clk_base);
>  	tegra114_pll_init(clk_base, pmc_base);
> -	tegra114_periph_clk_init(clk_base);
> +	tegra114_periph_clk_init(clk_base, pmc_base);
>  	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks, &pll_a_params);
>  	tegra114_pmc_clk_init(pmc_base);
> +
>  	tegra114_super_clk_init(clk_base);

That seems like an unrelated whitespace change. There's one in the
previous patch too:

> @@ -502,7 +492,6 @@ static struct tegra_clk_pll_freq_table pll_a_freq_table[] = {
>  	{0, 0, 0, 0, 0, 0},
>  };
>  
> -
>  static struct tegra_clk_pll_params pll_a_params = {
>  	.input_min = 2000000,
>  	.input_max = 31000000,
