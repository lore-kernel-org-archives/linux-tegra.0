From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] clk: tegra: Use definition for pll_u override bit
Date: Wed, 13 Jan 2016 17:19:31 +0100
Message-ID: <20160113161931.GN2588@ulmo>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
 <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
 <20160113160833.GK2588@ulmo>
 <5696770D.2050007@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oIlomvtVtXAVxSKT"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5696770D.2050007@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--oIlomvtVtXAVxSKT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 13, 2016 at 11:10:53AM -0500, Rhyland Klein wrote:
> On 1/13/2016 11:08 AM, Thierry Reding wrote:
> > * PGP Signed by an unknown key
> >=20
> > On Mon, Dec 21, 2015 at 12:56:32PM +0000, Jon Hunter wrote:
> >> The definition, PLLU_BASE_OVERRIDE, for the pll_u OVERRIDE bit is defi=
ned
> >> but not used and when the OVERRIDE bit is cleared in tegra210_pll_init=
()
> >> the code directly uses the bit number. Therefore, use the definition,
> >> PLLU_BASE_OVERRIDE when clearing the OVERRIDE bit.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >>  drivers/clk/tegra/clk-tegra210.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-=
tegra210.c
> >> index 791215747863..6f043c5e2394 100644
> >> --- a/drivers/clk/tegra/clk-tegra210.c
> >> +++ b/drivers/clk/tegra/clk-tegra210.c
> >> @@ -2520,7 +2520,7 @@ static void __init tegra210_pll_init(void __iome=
m *clk_base,
> >> =20
> >>  	/* PLLU_VCO */
> >>  	val =3D readl(clk_base + pll_u_vco_params.base_reg);
> >> -	val &=3D ~BIT(24); /* disable PLLU_OVERRIDE */
> >> +	val &=3D ~PLLU_BASE_OVERRIDE; /* disable PLLU_OVERRIDE */
> >>  	writel(val, clk_base + pll_u_vco_params.base_reg);
> >> =20
> >>  	clk =3D tegra_clk_register_pllre("pll_u_vco", "pll_ref", clk_base, p=
mc,
> >=20
> > I think the comment is now redundant, given that the code says pretty
> > much the same thing. No need to respin for that, I can remove the
> > comment when I apply the patch. That is, unless anyone feels strongly
> > about keeping the comment.
>=20
> I agree its redundant. If I am going to post a new version to address
> other concerns, I can just roll this in while doing so.

This looks like a good fix, or cleanup, on its own. So no need for
anyone to carry this forward, I can pick it up into a fixes branch
for v4.5.

Thierry

--oIlomvtVtXAVxSKT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlnkTAAoJEN0jrNd/PrOhdPQP/3tbZ8WRhyt++lxPUQUFstPv
5Bunw9r6uolZhuVJPeumghX1aHTs/ImNLOZD2LDNWdD+WqMB8ytkGVqmEA+o8oyG
iqHybJIS4Hle/TYysTIuQ97GwCTeaYISnkQ3iQh5wDPZBh4dUrZMoUVG/7op1epQ
NQikDrMiApsY3ihENRMmexGfIDMUSu2fmRY9FlBi5D12ApZ+md6KWVjouL/sL6xu
INsegE2w/Yo3LnIIp7eBnTFlyrDRM5OiiC3pZDpvvW6g4r8SajN5gy+P3rsAqncV
Pv1t2sz+kT/RwyxWc99DBDbsSENscJXpULXvVAPLKmXmCrK5qdS/oOF4oVwmCRyN
jw991zoVuS0tNY8Z5Nx/jQ1bWoDcXyvTeWDpgnqxLoRLngzroN/g55Fk5HBU5bhz
jAE2uVXWOmWp0cJVWwRn5OfjAvgkOgo4KYQP6qF3CQ7bI4NJfOV/QobSZWEwlOUv
vUP7PAo98nN0/xUsDr0Kg/jCm0OVHyeR+lckaQCE8hXOKgby038RFLPo5FyUtAEu
B8pzMSMQn4bwvvUEfcgGxbykREn90j+jRG0ewvU0jxTg4S1LMWcHe7kZQHQxYHLU
wHRKxFMh6rPLtRBKGXFRH05Dx0Wd2hztPlFIX/wp7JKfLifX5l3OHGKRSQRshY9v
T2y3VRZcIXxc+CW+0RSm
=/bQw
-----END PGP SIGNATURE-----

--oIlomvtVtXAVxSKT--
