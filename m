From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] drm/tegra: fix return value check
Date: Tue, 29 Oct 2013 00:04:03 +0100
Message-ID: <20131028230402.GA5039@mithrandir>
References: <CAPgLHd_JqYS5DC4tmzgGVEYmJpeM96FAEDvmM3cUUep+1jj7mA@mail.gmail.com>
 <20131028085358.GC10718@ulmo.nvidia.com>
 <526EDC64.5050202@wwwdotorg.org>
 <20131028223832.GA4906@mithrandir>
 <526EE9C8.4080308@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <526EE9C8.4080308-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2013 at 04:48:40PM -0600, Stephen Warren wrote:
> On 10/28/2013 04:38 PM, Thierry Reding wrote:
> > On Mon, Oct 28, 2013 at 03:51:32PM -0600, Stephen Warren wrote:
> >> On 10/28/2013 02:53 AM, Thierry Reding wrote:
> >>> On Mon, Oct 21, 2013 at 11:34:07AM +0800, Wei Yongjun wrote:
> >>>> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> >>>>=20
> >>>> In case of error, the function clk_get_parent() and=20
> >>>> devm_ioremap_resource() returns ERR_PTR() and never returns
> >>>> NULL. The NULL test in the return value check should be
> >>>> replaced with IS_ERR().
> >>>>=20
> >>>> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> >>>> --- drivers/gpu/drm/tegra/dsi.c | 6 +++--- 1 file changed, 3=20
> >>>> insertions(+), 3 deletions(-)
> >>>=20
> >>> I've applied this, but with the first hunk removed, since
> >>> looking at the implementation of clk_get_parent() it can
> >>> actually return NULL. In fact it seems like it will never
> >>> return ERR_PTR().
> >>>=20
> >>> I've also updated the commit message to reflect that.
> >>=20
> >> Hmm. The documentation for clk_get() says:
> >=20
> > The patch didn't check the return value clk_get() but
> > clk_get_parent(). Here's the implementation:
> >=20
> > struct clk *__clk_get_parent(struct clk *clk) { return !clk ? NULL
> > : clk->parent; }
> >=20
> > Note that clk_get_parent() in simply a locked version of the above.
> > That will obviously only return ERR_PTR() if clk->parent happens to
> > be set to one such value, which I don't think will ever happen.
>=20
> Ah. That looks like a bug in __clk_get_parent() then, since !clk
> doesn't sound like  the correct error case for it to be checking.
> Shouldn't it return IS_ERR(clk) ? clk : clk->parent? Either that, or
> clk_get() shouldn't return an error value if the rest of the clock
> code doesn NULL checks.

Yes, that would seem to be more consistent. Then again, one could argue
that if somebody got an invalid (ERR_PTR()) clock from clk_get(), they
shouldn't be calling clk_get_parent() on it in the first place. But the
same would be true for NULL, so...

Looping in Mike.

Thierry

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSbu1iAAoJEN0jrNd/PrOhiMcQAIr3U9ezhhc5weVeGxiapkHF
GUGFl3rvNU2pZZ9TuTdcSkjBvw0A+txady4bmhp+b1jPIlN2loqHZGbmQGzNX652
QypO0mb/efJQIcBb0/qRIpusnor1LjOyLrbjTJva3n4LO19zYmL+BVzanVU536eT
WNUpd77zOeetTNz/mfM8JHqYrv1+ykUx6Uq5PgF42tSsIeaPkox+678mVF02+YgC
O/so3U6BW0QQzEa1vAyTL6z4qbxg5R1liXZjp5roGHDjSXmn+fdV4qKTtc9FDAUl
kGS1KxFTpU8wzlReAuV6cI/esMdbodFnM71IaxNsYAmRoSyyDFjuTEnrno1SSL4f
29Ow535RclQSTpDI2i9ozo5y0ItQn3cGVYwqKKzOXojtKLkGZaJQMrPUdJcA+TeN
BEYAcOjiuPDFIxp7TZGZke0/1dQ1v0Ag+ZXBq7YEtHwpckgkL8LJFlYiAmeoGK3q
3cXTVjXtkV4K/PDG9D9vcD0CC4I4fO+Y2s9C4g/WQLGFGV34mwZyPdE2SiwCYLKJ
/VC7hJ8Dk+lBvSRSIhAYlgxCfHN+ZCmkztHQrciPrBEDQICOsTKChppw48ciKPP0
zC0Nk5pnD+4u/mcTLHebnYw7qseNljGxlS96DW3bIsuRd0Y1XvNbdGly77KBH3PB
UeaY0Yy+20hRuXSDDWTD
=YsCO
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
