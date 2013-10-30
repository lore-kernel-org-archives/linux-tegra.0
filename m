From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Wed, 30 Oct 2013 22:00:24 +0100
Message-ID: <20131030210023.GB7686@mithrandir>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
 <1383061872-27899-3-git-send-email-treding@nvidia.com>
 <52701062.30405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52701062.30405-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2013 at 01:45:38PM -0600, Stephen Warren wrote:
> On 10/29/2013 09:51 AM, Thierry Reding wrote:
> > The clock for the PWM controller is slightly different from other
> > peripheral clocks on Tegra30. The clock source mux field start at
> > bit position 28 rather than 30.
>=20
> I think you need to CC this series to Mike Turquette and relevant lists
> for review. While Peter is sending pull requests to Mike for the Tegra
> clock driver, Mike still needs to see the patches before that happens.

I meant for this to be reviewed primarily by Peter and/or Prashant
before sending it to Mike "officially" because I wasn't at all sure if
it was correct, even though it fixed the issue I was seeing on Cardhu.

But Cc'ing Mike probably wouldn't have hurt either, so I'll just add him
=66rom the start next time.

> > diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-te=
gra30.c
>=20
> > @@ -836,7 +837,6 @@ static struct tegra_clk tegra30_clks[tegra_clk_max]=
 __initdata =3D {
> >  	[tegra_clk_extern1] =3D { .dt_id =3D TEGRA30_CLK_EXTERN1, .present =
=3D true },
> >  	[tegra_clk_extern2] =3D { .dt_id =3D TEGRA30_CLK_EXTERN2, .present =
=3D true },
> >  	[tegra_clk_extern3] =3D { .dt_id =3D TEGRA30_CLK_EXTERN3, .present =
=3D true },
> > -	[tegra_clk_pwm] =3D { .dt_id =3D TEGRA30_CLK_PWM, .present =3D true },
>=20
> I think you still need an entry in this table; isn't it used by the
> DT->internal clock ID translation function?

As far as I can tell, this is used by the generic code to determine
which of the generic clocks to register. If TEGRA30_CLK_PWM is kept
within this list, tegra_periph_clk_init() will register the clock a
second time.

> Either way, it seems like this patch might want to add a
> tegra_clk_pwm_tegra30 so that the common C files can still implement
> this clock, just with different parameters?

That's pretty much what this patch does, isn't it? It adds a custom
entry for the PWM clock to the Tegra30-specific tegra_periph_clk_list
and keeps the common one from being registered by dropping the entry
=66rom tegra30_clks.

The same is already done on Tegra20, where the PWM clock is similarly
weird. On Tegra114 and Tegra124 the clock is still weird, but it can be
tweaked into behaving more commonly by lying about the actual position
and size of the mux field.

Thierry

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJScXNnAAoJEN0jrNd/PrOhiQsP/ij5uwxSLrNRB3Cc9iW9m6Rd
Le3B3JUdlpS5ApJxPC/rF/Xt9NvJGmd1k2ILg52oL5SDdQ/9LBo15W5YvDqThhQz
XJxkw/La+thrU9VIkYpkT2d37uF/9uN3Jew4D/jNXDi3ohZ+NqkqAkf1vkuaDxAf
xT/EahRo7V7jRh8hmjngx7ko6cEVIEwLGI/ksM3wn1xYxYC5oydtcm8C19sUU2Bx
TvwDcQPHNemUJWI40+a/dtlKiGN9Hlp89W/ozu0plcdjn0mlAXEu5gof8cocDaO7
ReKwfZMM86rYXYraQOAZnZrcrXFgl1LLRQYJi4X/Og+5HT4SmSV3w5/yLiH7D1BY
qMR/OGNNMpbIdQOoaCm2wks5TRwk9Mc8H6eqBoBS1woSDOe4wGz0NU6K4ztt0wm2
I36sa+AlfIXC91Ix9M4i/gczRlDPgf2nSWGA9pg5NSOl0An0TrylyozsQKA9dK9/
vn8bOlYg7cB+Lqd4MuHhdRM49+gU4f3VD98TVasy8iZ0eCHBF02lVk3JAmcE1pus
ZI7kCOrS2Ns+bVAOyFnrmF4kfWKRbwWhdchciCoXY4cHNOLkqago8lntwn7JZnl7
a1VilceewH8CkxSqvaCoXxD1Wledvlo0jBQ0+99/+22VWMeg65HigcLI0imubq1h
Jte2HZPwNw0JzfubnGYG
=Tr2r
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
