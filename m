From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v5 12/15] clk: tegra: move PMC, fixed clocks to common files
Date: Fri, 18 Oct 2013 17:01:05 -0700
Message-ID: <CAL1qeaHkibgGV07CQZTmBK1pJUYt5CGTBv_jADaNtvy4bS6SDw@mail.gmail.com>
References: <1382102719-5531-1-git-send-email-pdeschrijver@nvidia.com>
	<1382102719-5531-13-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382102719-5531-13-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

> +       val = readl_relaxed(clk_base + OSC_CTRL);
> +       osc_idx = val >> OSC_CTRL_OSC_FREQ_SHIFT;
> +
> +       if (osc_idx < num)
> +               *osc_freq = input_freqs[osc_idx];

else *osc_freq = 0?

> +       clk = clk_register_fixed_factor(NULL, "pll_ref", "clk_m",
> +                                       CLK_SET_RATE_PARENT, 1, pll_ref_div);

It seems silly to have CLK_SET_RATE_PARENT on a clock that can't have
its rate changed.

> +       /* clk_32k */
> +       dt_clk = tegra_lookup_dt_id(tegra_clk_clk_32k, tegra_clks);
> +       if (dt_clk) {
> +               clk = clk_register_fixed_rate(NULL, "clk_32k", NULL,
> +                                       CLK_IS_ROOT, 32768);
> +               clk_register_clkdev(clk, "clk_32k", NULL);

Like with the audio clocks, I think this will be done tegra_register_devclks().

> +               *dt_clk = clk;
> +       }
> +
> +       /* clk_m_div2 */
> +       dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div2, tegra_clks);
> +       if (dt_clk) {
> +               clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
> +                                       CLK_SET_RATE_PARENT, 1, 2);
> +               clk_register_clkdev(clk, "clk_m_div2", NULL);

Ditto.

> +               *dt_clk = clk;
> +       }
> +
> +       /* clk_m_div4 */
> +       dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div4, tegra_clks);
> +       if (dt_clk) {
> +               clk = clk_register_fixed_factor(NULL, "clk_m_div4", "clk_m",
> +                                       CLK_SET_RATE_PARENT, 1, 4);
> +               clk_register_clkdev(clk, "clk_m_div4", NULL);

Ditto.

> +               clk = clk_register_gate(NULL, data->gate_name, data->mux_name,
> +                                       0, pmc_base + PMC_CLK_OUT_CNTRL,
> +                                       data->gate_shift, 0, &clk_out_lock);
> +               *dt_clk = clk;
> +               clk_register_clkdev(clk, data->dev_name, data->gate_name);

Ditto.

> +       }
> +
> +       /* blink */
> +       clk = clk_register_gate(NULL, "blink_override", "clk_32k", 0,
> +                               pmc_base + PMC_DPD_PADS_ORIDE,
> +                               PMC_DPD_PADS_ORIDE_BLINK_ENB, 0, NULL);
> +
> +       dt_clk = tegra_lookup_dt_id(tegra_clk_blink, tegra_clks);
> +       if (!dt_clk)
> +               return;
> +

In tegra*_pmc_clk_init, there's a write to PMC_BLINK_TIMER here.
Why'd that disappear?

> +       clk = clk_register_gate(NULL, "blink", "blink_override", 0,
> +                               pmc_base + PMC_CTRL,
> +                               PMC_CTRL_BLINK_ENB, 0, NULL);
> +       clk_register_clkdev(clk, "blink", NULL);

Same comment about the other register_clkdev calls above.

> +       *dt_clk = clk;
> +}

Thanks,
Andrew
