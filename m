From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Use definition for pll_u override bit
Date: Wed, 13 Jan 2016 17:08:33 +0100
Message-ID: <20160113160833.GK2588@ulmo>
References: <1450702592-7755-1-git-send-email-jonathanh@nvidia.com>
 <1450702592-7755-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ucgz5Oc/kKURWzXs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450702592-7755-2-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Ucgz5Oc/kKURWzXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2015 at 12:56:32PM +0000, Jon Hunter wrote:
> The definition, PLLU_BASE_OVERRIDE, for the pll_u OVERRIDE bit is defined
> but not used and when the OVERRIDE bit is cleared in tegra210_pll_init()
> the code directly uses the bit number. Therefore, use the definition,
> PLLU_BASE_OVERRIDE when clearing the OVERRIDE bit.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-teg=
ra210.c
> index 791215747863..6f043c5e2394 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -2520,7 +2520,7 @@ static void __init tegra210_pll_init(void __iomem *=
clk_base,
> =20
>  	/* PLLU_VCO */
>  	val =3D readl(clk_base + pll_u_vco_params.base_reg);
> -	val &=3D ~BIT(24); /* disable PLLU_OVERRIDE */
> +	val &=3D ~PLLU_BASE_OVERRIDE; /* disable PLLU_OVERRIDE */
>  	writel(val, clk_base + pll_u_vco_params.base_reg);
> =20
>  	clk =3D tegra_clk_register_pllre("pll_u_vco", "pll_ref", clk_base, pmc,

I think the comment is now redundant, given that the code says pretty
much the same thing. No need to respin for that, I can remove the
comment when I apply the patch. That is, unless anyone feels strongly
about keeping the comment.

Thierry

--Ucgz5Oc/kKURWzXs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWlnaBAAoJEN0jrNd/PrOhYy0P/0QT4i67rYJf6GoSzj8vTvlt
HatbZar3oEa3iy35pmgWhEeWgYTy24hocOer+MXIU81ztpeHYGWBQFj96UuX7l17
8xf9ieAUsWEK4C00zFuYIeFuWJD/h06V811VMMvN3I9+ps/2p6ENzKKvHaVxMp0r
H/YjO+hotf6zl9uzYkclzXkDQaLLrIJizxRoatRbprUB61ZHMBOgVMgqj4EvKUFp
/0bpV3EjBY1X4vwzhjoQ3DOrfm4dF7Y5Z/EbGgvqSUcpJb3L87TVIR91BXcORSs+
xWVrY9/gpj64mfA+Ey2cxK4OOEXu5nj/j5J2R4S4LDwKx4EJPzsrQFE3ubwWr9+h
5EGkkqkAzTDp5fhQC7hp1HMm2uQv/pTVoLXrmePlUuY/jGLf67OA5ST7Z0jAyFqA
MZE2GztpAXiycbVHzyoAKdQpP5u5VUCiFRgfVdcRzAWpF9kcstQJl7B6y/CpsFX5
FjxK3DoFCrUNJpywLPt9lXg6mhaFD61GWq6H4PLFHL9Owmnt92BbkpSVgRgUmPiM
WL3opEZqIGCR+73ddNyMAbpO12mM+yizV8unihFcAyUiek8rt7Yf3257W9LtwCeW
SnMACqg9bxv/TeWo6Moy/5Y4QQP+ytfOICvqMsVglS2fL5zP5pciaWzwLN0oIVCg
IUggScjz/nx1ygfpVOnf
=Adjp
-----END PGP SIGNATURE-----

--Ucgz5Oc/kKURWzXs--
