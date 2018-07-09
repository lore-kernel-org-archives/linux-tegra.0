From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 6/8] clk: tegra20: Turn EMC clock gate into divider
Date: Sun, 08 Jul 2018 17:00:17 -0700
Message-ID: <153109441777.143105.8459253820659446035@swboyd.mtv.corp.google.com>
References: <20180617145539.4758-1-digetx@gmail.com>
 <20180617145539.4758-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180617145539.4758-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Dmitry Osipenko (2018-06-17 07:55:37)
> Kernel should never gate the EMC clock as it causes immediate lockup, so
> removing clk-gate functionality doesn't affect anything. Turning EMC clk
> gate into divider allows to implement glitch-less EMC scaling, avoiding
> reparenting to a backup clock.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Who's supposed to apply this? Me? Thierry? The "To:" line is not
useful when every maintainer is there.

> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index cc857d4d4a86..2bd35418716a 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -799,6 +798,31 @@ static struct tegra_periph_init_data tegra_periph_no=
div_clk_list[] =3D {
>         TEGRA_INIT_DATA_NODIV("disp2",  mux_pllpdc_clkm, CLK_SOURCE_DISP2=
, 30, 2, 26,  0, TEGRA20_CLK_DISP2),
>  };
>  =

> +static void __init tegra20_emc_clk_init(void)
> +{
> +       struct clk *clk;
> +
> +       clk =3D clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
> +                              ARRAY_SIZE(mux_pllmcp_clkm),
> +                              CLK_SET_RATE_NO_REPARENT,
> +                              clk_base + CLK_SOURCE_EMC,
> +                              30, 2, 0, &emc_lock);
> +
> +       clk =3D tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOU=
RCE_EMC,
> +                                   &emc_lock);
> +       clks[TEGRA20_CLK_MC] =3D clk;
> +
> +       /*
> +        * Note that 'emc_mux' source and 'emc' rate shouldn't be changed=
 at
> +        * the same time due to a HW bug, this won't happen because we're
> +        * defining 'emc_mux' and 'emc' as a distinct clocks.

s/ a//
