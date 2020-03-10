From: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
Date: Mon, 09 Mar 2020 18:48:47 -0700
Message-ID: <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200305175138.92075-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2020-03-05 09:51:38)
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> As part of the clock frequency change sequence, a driver may need to
> reparent a clock. In that case, the rate will already have been updated
> and the cached parent rate will no longer be valid, so just skip the
> recalculation.

Can you describe more about what's going on and why this needs to
change? For example, we have 'set_rate_and_parent' for cases where a
driver reparents a clk during a rate change. Is that not sufficient
here?

>=20
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/clk.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index ebfc1e2103cb..49d92f4785a2 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2079,7 +2079,14 @@ static void clk_change_rate(struct clk_core *core)
> =20
>         trace_clk_set_rate_complete(core, core->new_rate);
> =20
> -       core->rate =3D clk_recalc(core, best_parent_rate);
> +       /*
> +        * Some drivers need to change the parent of a clock as part of t=
he
> +        * rate change sequence. In that case, best_parent_rate is no lon=
ger
> +        * valid. However, reparenting already recalculates the rate for =
the
> +        * entire clock subtree, so we can safely skip this here.
> +        */
> +       if (core->parent =3D=3D parent)
> +               core->rate =3D clk_recalc(core, best_parent_rate);
> =20

I wonder if we can undo the recursion and figure out a way to make this
only happen once, when we want it to happen.
