From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 7/9] clk: tegra: add clock support for tegra30
Date: Fri, 11 Jan 2013 14:17:25 +0200
Message-ID: <20130111141725.ce3177ad04fc700186dc694d@nvidia.com>
References: <1357890387-23245-1-git-send-email-pgaikwad@nvidia.com>
	<1357890387-23245-8-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357890387-23245-8-git-send-email-pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 11 Jan 2013 08:46:25 +0100
Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> Add tegra30 clock support based on common clock framework.
> 
> Signed-off-by: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
.......
> +static void __init tegra30_pll_init(void)
> +{
> +       struct clk *clk;
> +
> +       /* PLLC */
> +       clk = tegra_clk_pll("pll_c", "pll_ref", clk_base, pmc_base, 0,
> +                           0, &pll_c_params,
> +                           TEGRA_PLL_HAS_CPCON | TEGRA_PLL_USE_LOCK,
> +                           pll_c_freq_table, NULL);
> +       clk_register_clkdev(clk, "pll_c", NULL);
> +       clks[pll_c] = clk;

Just I noticed that there are quite many same itegration of:

	clk_register_clkdev(clk, <ID name>, ?);
	clks[<ID>] = clk;

ID == <ID name>

Can any macro/func do the above at once?
