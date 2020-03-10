From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clk: Do not recalc rate for reparented clocks
Date: Tue, 10 Mar 2020 11:42:27 +0100
Message-ID: <20200310104227.GB2030107@ulmo>
References: <20200305175138.92075-1-thierry.reding@gmail.com>
 <158380492739.149997.15800995149056434664@swboyd.mtv.corp.google.com>
 <21f65d74-eb09-6735-4338-8c5e865533ad@kapsi.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <21f65d74-eb09-6735-4338-8c5e865533ad-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2020 at 12:25:01PM +0200, Mikko Perttunen wrote:
> On 3/10/20 3:48 AM, Stephen Boyd wrote:
> > Quoting Thierry Reding (2020-03-05 09:51:38)
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > As part of the clock frequency change sequence, a driver may need to
> > > reparent a clock. In that case, the rate will already have been updat=
ed
> > > and the cached parent rate will no longer be valid, so just skip the
> > > recalculation.
> >=20
> > Can you describe more about what's going on and why this needs to
> > change? For example, we have 'set_rate_and_parent' for cases where a
> > driver reparents a clk during a rate change. Is that not sufficient
> > here?
> >=20
>=20
> I believe this is related to the memory clock change sequence on Tegra,
> where the EMC clock may have to be reparented multiple times during the r=
ate
> change sequence.
>=20
> If EMC is running off parent A, and the requested new OPP also uses parent
> A, we have to temporarily switch to a different OPP with parent B so that
> the rate change sequence can be executed on parent A without affecting the
> system's memory accesses.

It's not only that. The mismatch can happen every time that we change
the operating point because each such change could cause either the
parent and/or the parent rate to change. The CCF always caches the
parent rate from before the rate change, assuming that the parent will
not change.

Perhaps a clearer way of saying this is that the parent change is an
internal part of the rate change. clk_hw_reparent() already allows us to
notify the CCF of the hierarchical change in the clock tree. But then we
need to additionally either override the parent rate in the driver, like
we currently do on Tegra124, or have the core ignore the cached parent
rate if the parent is no longer what it expects.

I should probably have followed up this patch with a corresponding patch
to the Tegra124 EMC driver that removes the workaround, like below:

--- >8 ---
diff --git a/drivers/clk/tegra/clk-emc.c b/drivers/clk/tegra/clk-emc.c
index 745f9faa98d8..f29f0a0e48de 100644
--- a/drivers/clk/tegra/clk-emc.c
+++ b/drivers/clk/tegra/clk-emc.c
@@ -92,12 +92,6 @@ static unsigned long emc_recalc_rate(struct clk_hw *hw,
=20
 	tegra =3D container_of(hw, struct tegra_clk_emc, hw);
=20
-	/*
-	 * CCF wrongly assumes that the parent won't change during set_rate,
-	 * so get the parent rate explicitly.
-	 */
-	parent_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));
-
 	val =3D readl(tegra->clk_regs + CLK_SOURCE_EMC);
 	div =3D val & CLK_SOURCE_EMC_EMC_2X_CLK_DIVISOR_MASK;
=20
--- >8 ---

But I haven't actually tested that yet because I don't have a Tegra124
board set up at the moment.

I do have a working Tegra210 EMC scaling implementation that I've tested
this with and that has exactly the same issue and this fixes it.

Thierry

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5nbxEACgkQ3SOs138+
s6EEnBAAqpKHWPGJxLEP11s5wL7ZmUnV4Y6/i9O78auyNgCvwlq4CRLQtbKwg8Ti
0t+++1/2pZcftoYX0cOgF28qs5sI3RcmiLTtGXxwheL7Gry4cwF8WJ6nVnUE4su4
F+jmmN87w5g+HtEJQINzUkcyyGrPuMnW2oOrKTnyKUAbIP7linKWyoX3BCpngBii
y0KOvBkJeqTMgjCRJOSSWhtV9OnkCY9VG4YI4yqp4ouag63Ez9PN48h4s23zs6xS
4qRG5zSCnaJz74ob9xCYXQ2xUf3SMZv1LDT0MPvDEBhxW+ivbmlUT+qeu//jSS2k
ea15Isg/pXMVWtCcwjK1RLfbU1pJmokXXLItOeJn52Gs3csySXw+Q/jErMjkYd9m
CLfj6R7PVrxC1wQ33Qez7Al1yffsRv1twZm64HRsU5cbB1vZu7xT8VCQImagTLRT
qKlCEB9zn6c/yYEsL9nsr84RyLCrNUgtqIgVO6+UnorD0w4yGR0Du8R+COe9Pvnb
YhcRfzyQaCljK/+G5IKUbLD33K42wwa9z09azCGPqvXZ1Jxxdb+faxK5xY99SjWp
VHlOhL24Zz0v4s+JFYIZ07ZUpvb1N/i1FiraEwNroZd0MPyy7vXvjnmFp0Vs+Rgy
W3yL8dlmFeYS4U6TJ39GFj5GFkjK1o076l0pa0qwnzNHctDceik=
=i58G
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
