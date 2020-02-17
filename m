From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 19/22] ASoC: tegra: Enable audio mclk during
 tegra_asoc_utils_init
Date: Mon, 17 Feb 2020 10:53:38 +0100
Message-ID: <20200217095338.GC1345979@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-20-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1578986667-16041-20-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2020 at 11:24:24PM -0800, Sowjanya Komatineni wrote:
> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
> through Tegra210 and currently Tegra clock driver keeps the audio
> mclk enabled.
>=20
> With the move of PMC clocks from clock driver into pmc driver,
> audio mclk enable from clock driver is removed and this should be
> taken care by the audio driver.
>=20
> tegra_asoc_utils_init calls tegra_asoc_utils_set_rate and audio mclk
> rate configuration is not needed during init and set_rate is actually
> done during hw_params callback.
>=20
> So, this patch removes tegra_asoc_utils_set_rate call and just leaves
> the audio mclk enabled.
>=20
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  sound/soc/tegra/tegra_asoc_utils.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KYqEACgkQ3SOs138+
s6FYyA//QMQ+t5PYEnti0MIjjEq+6kKbm8Guch7so7GSgu+shvfoWArh7kPMUg4s
0JLo1m9j3csL5Ou3GvATSUG1al0ze3E/gGr2gqD9401YIgyMFeuDYh7pnv0Fd5If
WTv87jqYrxItipKmPAz8OmWgQ+RbFxY2pCBWKew8yRc8q+YZUOoh5cBsL1ZqSz68
dI52Nel1Uiijui0XZx5HK7MnFzLCp7/sHJyqHlr9tpNHHTbb4et/JILVDJH3Du6S
y8HI2QDXzxK2JpbSOtybYc8Uh3cRf0E7ePUredZSGGCjXLhuUY1oY5+i/jcHgEyy
wAAsyQFfdlddoNo7D2VhiXoEyA3zCfelTOm3UjkzsUAH/SmK/zSkVh3kbMsfNF4c
+4rhKUm6iGlPS37m6oJJbxGhiQc343kuyC33bIPU19LLzx3Q6kZDaOebCWtOTtY5
iiK8o/h68lIK2XSdAjbzgS7CJ8FetbLt1/aJTQImXLnR7AHt8b513kIfT6eYA7CQ
JiMLPla4FZPq9di6gxQoh73RYm5+gZ6KbXlZKTsM3UdQC2u2OFBoJULahyPkOfrw
1+L1HPp0hH1etoYCikbo1Iu4A85Bxj9CvPHrXM8u9fuSrv6jx2DdS2KV/2xZG1to
uDi00Rz7U+A5IJri9xonvqHs6qJ/kq0OugOMImxHUwBNcjsfOg8=
=XNuc
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
