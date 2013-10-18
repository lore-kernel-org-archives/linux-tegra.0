From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 10/15] clk: tegra: move audio clk to common file
Date: Fri, 18 Oct 2013 16:30:02 -0700
Message-ID: <CAL1qeaGV7hUmFYZ1Gcent2GSL28OkYzp+_Z2UyaAbkrNJ-SvGg@mail.gmail.com>
References: <1382102719-5531-1-git-send-email-pdeschrijver@nvidia.com>
	<1382102719-5531-11-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382102719-5531-11-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

> +#define PLL_BASE_LOCK BIT(27)
> +#define PLL_MISC_LOCK_ENABLE 18

It doesn't look like these are used anywhere.

> +static struct tegra_sync_source_initdata sync_source_clks[] __initdata = {
> +       { .name = "spdif_in_sync", .rate = 24000000, .max_rate = 24000000, .clk_id = tegra_clk_spdif_in_sync},

It's a little weird that we have macros for audio_clks and
audio2x_clks, but not for these.

> +       /* PLLA */
> +       dt_clk = tegra_lookup_dt_id(tegra_clk_pll_a, tegra_clks);
> +       if (dt_clk) {
> +               clk = tegra_clk_register_pll("pll_a", "pll_p_out1", clk_base,
> +                               pmc_base, 0, pll_a_params, NULL);
> +               clk_register_clkdev(clk, "pll_a", NULL);

Won't tegra_register_devclks() take care of this since there's an
entry for this in t114's devclks array?

> +               *dt_clk = clk;
> +       }
> +
> +       /* PLLA_OUT0 */
> +       dt_clk = tegra_lookup_dt_id(tegra_clk_pll_a_out0, tegra_clks);
> +       if (dt_clk) {
> +               clk = tegra_clk_register_divider("pll_a_out0_div", "pll_a",
> +                               clk_base + PLLA_OUT, 0, TEGRA_DIVIDER_ROUND_UP,
> +                               8, 8, 1, NULL);
> +               clk = tegra_clk_register_pll_out("pll_a_out0", "pll_a_out0_div",
> +                               clk_base + PLLA_OUT, 1, 0, CLK_IGNORE_UNUSED |
> +                               CLK_SET_RATE_PARENT, 0, NULL);
> +               clk_register_clkdev(clk, "pll_a_out0", NULL);

Ditto.

Thanks,
Andrew
