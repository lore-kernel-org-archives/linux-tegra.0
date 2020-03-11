From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
Date: Wed, 11 Mar 2020 11:21:15 +0100
Message-ID: <20200311102115.GA494173@ulmo>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
 <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
 <21f65d74-eb09-6735-4338-8c5e865533ad@kapsi.fi>
 <20200310104227.GB2030107@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200310104227.GB2030107@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 11:42:27AM +0100, Thierry Reding wrote:
> On Tue, Mar 10, 2020 at 12:25:01PM +0200, Mikko Perttunen wrote:
> > On 3/10/20 3:48 AM, Stephen Boyd wrote:
> > > Quoting Thierry Reding (2020-03-05 09:51:38)
> > > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > >=20
> > > > As part of the clock frequency change sequence, a driver may need to
> > > > reparent a clock. In that case, the rate will already have been upd=
ated
> > > > and the cached parent rate will no longer be valid, so just skip the
> > > > recalculation.
> > >=20
> > > Can you describe more about what's going on and why this needs to
> > > change? For example, we have 'set_rate_and_parent' for cases where a
> > > driver reparents a clk during a rate change. Is that not sufficient
> > > here?
> > >=20
> >=20
> > I believe this is related to the memory clock change sequence on Tegra,
> > where the EMC clock may have to be reparented multiple times during the=
 rate
> > change sequence.
> >=20
> > If EMC is running off parent A, and the requested new OPP also uses par=
ent
> > A, we have to temporarily switch to a different OPP with parent B so th=
at
> > the rate change sequence can be executed on parent A without affecting =
the
> > system's memory accesses.
>=20
> It's not only that. The mismatch can happen every time that we change
> the operating point because each such change could cause either the
> parent and/or the parent rate to change. The CCF always caches the
> parent rate from before the rate change, assuming that the parent will
> not change.
>=20
> Perhaps a clearer way of saying this is that the parent change is an
> internal part of the rate change. clk_hw_reparent() already allows us to
> notify the CCF of the hierarchical change in the clock tree. But then we
> need to additionally either override the parent rate in the driver, like
> we currently do on Tegra124, or have the core ignore the cached parent
> rate if the parent is no longer what it expects.
>=20
> I should probably have followed up this patch with a corresponding patch
> to the Tegra124 EMC driver that removes the workaround, like below:
>=20
> --- >8 ---
> diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
> index 745f9faa98d8..f29f0a0e48de 100644
> --- a/drivers/clk/tegra/clk-emc.c
> +++ b/drivers/clk/tegra/clk-emc.c
> @@ -92,12 +92,6 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
> =20
>  	tegra =3D container_of(hw, struct tegra_clk_emc, hw);
> =20
> -	/*
> -	 * CCF wrongly assumes that the parent won't change during set_rate,
> -	 * so get the parent rate explicitly.
> -	 */
> -	parent_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));
> -
>  	val =3D readl(tegra->clk_regs + CLK_SOURCE_EMC);
>  	div =3D val & CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_MASK;
> =20
> --- >8 ---
>=20
> But I haven't actually tested that yet because I don't have a Tegra124
> board set up at the moment.

I did test the above change along with the core change on a Jetson TK1
board (which is Tegra124) and unfortunately that doesn't work for all
rate changes. I'll need to dig deeper to see what exactly is going on,
and to see if there's a simple fix for that.

If not it might be better to leave these types of workarounds in the
drivers instead.

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5ou5cACgkQ3SOs138+
s6GEdBAAly/uOW3jrEic+SpyKGbWH+MAebwZ1/4RI0SrLBxyN0THQo1+TqhhIZZ9
2+vHUIJ3EiOKIOb/WeciHAupYoSG8XANFpk3nbeGocLedLpNoXDGopyM7t9fS/Lc
7JzDwA8uTjZsZzPTP3kked8m4yBOoMs9zIfOWDQ31giHaovuaae/ZHTfBpD01N5t
+yUHRECkF4t7BXurC6MLgnS1XPhLN04BTPAbqkrXJjZUOV9ZHf6amZHlrWf/LCJA
RVMKaNLpZ8SoUrOKhkM5HweoYk/HThv5q4sJxOU6q9dSSlvh2EkU5xk0lxVmCazW
C7xeLJ4qVFlrmlJ66LP2fA1ek358cfngycn1gOUZzyW8fsF4TzWkqMullu2uJKKo
a0Y0tGeuSmHjZE3TOxAYGqaKXm5MW5mNy1DnDCqT7FU5evxVKAyW7jB4BQDidc2T
pqC2ol4/5sYB4NYK5xtPhlvGdVd04GnwLvxJfWcNxELj43sdJqkWqSjGlnpPBw0w
I439qiASis1RDZ8xA6799sanG/ftLfGO1Kwmeil29586t/hYixktdRqSPDHO6Xj1
55jvC+q6CV/+q5N1R76plm+fRlOFTXcx5+riqwzZDzQnHq43D57GCUlJgFKLS1Yn
z+BErYFuBJDs3wwOy6KGdPDZ8dBYiY1v5JgDqBDmXnMyNLTpzAY=
=gTn5
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
