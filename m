From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra30: init PLL_C to sane rate
Date: Thu, 21 Apr 2016 20:16:54 +0200
Message-ID: <1461262614.2494.1.camel@lynxeye.de>
References: <1456778767-18413-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456778767-18413-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Montag, den 29.02.2016, 21:46 +0100 schrieb Lucas Stach:
> If the bootloader does not touch PLL_C it will stay in its reset
> state, failing to lock when enabled. This leads to consumers of
> this clock to fail probing. Fix this by always programming the
> PLL with a sane rate, which allows it to lock, at startup.
>=20
Those 2 patches haven't been applied, as far as I can see. Any comments
on them?

> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> =C2=A0drivers/clk/tegra/clk-tegra30.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-
> tegra30.c
> index 0478565..236e2db 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1372,6 +1372,7 @@ static struct tegra_clk_init_table init_table[]
> __initdata =3D {
> =C2=A0	{ TEGRA30_CLK_SBC4, TEGRA30_CLK_PLL_P, 100000000, 0 },
> =C2=A0	{ TEGRA30_CLK_SBC5, TEGRA30_CLK_PLL_P, 100000000, 0 },
> =C2=A0	{ TEGRA30_CLK_SBC6, TEGRA30_CLK_PLL_P, 100000000, 0 },
> +	{ TEGRA30_CLK_PLL_C, TEGRA30_CLK_CLK_MAX, 600000000, 0 },
> =C2=A0	{ TEGRA30_CLK_HOST1X, TEGRA30_CLK_PLL_C, 150000000, 0 },
> =C2=A0	{ TEGRA30_CLK_DISP1, TEGRA30_CLK_PLL_P, 600000000, 0 },
> =C2=A0	{ TEGRA30_CLK_DISP2, TEGRA30_CLK_PLL_P, 600000000, 0 },
