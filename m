From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v8 11/22] ASoC: tegra: Add fallback implementation for
 audio mclk
Date: Mon, 17 Feb 2020 10:29:33 +0100
Message-ID: <20200217092933.GL1339021@ulmo>
References: <1578986667-16041-1-git-send-email-skomatineni@nvidia.com>
 <1578986667-16041-12-git-send-email-skomatineni@nvidia.com>
 <aef36b46-789a-c44e-4cd1-9d4183435ba9@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vTUhhhdwRI43FzeR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <aef36b46-789a-c44e-4cd1-9d4183435ba9-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--vTUhhhdwRI43FzeR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2020 at 02:56:45AM +0300, Dmitry Osipenko wrote:
> 14.01.2020 10:24, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > mclk is from clk_out_1 which is part of Tegra PMC block and pmc clocks
> > are moved to Tegra PMC driver with pmc as clock provider and using pmc
> > clock ids.
> >=20
> > New device tree uses clk_out_1 from pmc clock provider as audio mclk.
> >=20
> > So, this patch adds implementation for mclk fallback to extern1 when
> > retrieving mclk returns -ENOENT to be backward compatible of new device
> > tree with older kernels.
> >=20
> > Fixes: 110147c8c513 ("ASoC: tegra: always use clk_get() in utility code=
")
> >=20
> > Tested-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Reviewed-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  sound/soc/tegra/tegra_asoc_utils.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra=
_asoc_utils.c
> > index 536a578e9512..74d3ffe7e603 100644
> > --- a/sound/soc/tegra/tegra_asoc_utils.c
> > +++ b/sound/soc/tegra/tegra_asoc_utils.c
> > @@ -191,9 +191,21 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_=
data *data,
> > =20
> >  	data->clk_cdev1 =3D clk_get(dev, "mclk");
> >  	if (IS_ERR(data->clk_cdev1)) {
> > -		dev_err(data->dev, "Can't retrieve clk cdev1\n");
> > -		ret =3D PTR_ERR(data->clk_cdev1);
> > -		goto err_put_pll_a_out0;
> > +		if (PTR_ERR(data->clk_cdev1) !=3D -ENOENT) {
> > +			dev_err(data->dev, "Can't retrieve clk cdev1\n");
> > +			ret =3D PTR_ERR(data->clk_cdev1);
> > +			goto err_put_pll_a_out0;
> > +		}
> > +
> > +		/* Fall back to extern1 */
> > +		data->clk_cdev1 =3D clk_get(dev, "extern1");
> > +		if (IS_ERR(data->clk_cdev1)) {
> > +			dev_err(data->dev, "Can't retrieve clk extern1\n");
> > +			ret =3D PTR_ERR(data->clk_cdev1);
> > +			goto err_put_pll_a_out0;
> > +		}
> > +
> > +		dev_info(data->dev, "Falling back to extern1\n");
> >  	}
> > =20
> >  	ret =3D tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
> >=20
>=20
> I tried to double-check if audio works using the updated DT works with
> this fallback and unfortunately it is not (maybe I actually missed to
> test this case before).. the driver doesn't probe at all because of the
> assigned-clocks presence, which makes clk core to fail finding the MCLK
> and thus assigned-clocks configuration fails, preventing the driver's
> loading.
>=20
> I'm not sure what could be done about it. Perhaps just to give up on the
> compatibility of older kernels with the new DTs, missing audio isn't
> really that critical (perhaps).

Compatibility of older kernels with new DTs isn't really something that
we strive for. The whole point about ABI stability is to avoid requiring
DT updates with new kernels because a DTB may not be in a writable
location. Practically I'm not aware of such a case on Tegra.

However, the kernel is always assumed to be in a writable location, if
for nothing else but to ensure it can be updated to fix security issues.
So if a new DTB is flashed it can be assumed that users will be able to
also flash a new kernel to work with that DTB.

Thierry

--vTUhhhdwRI43FzeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KXP0ACgkQ3SOs138+
s6EMFA/+MsPxtQWJ/LcWb+hOO7yfe0+a6qkf2SlyimYpwg8DtZ3PfqlTa/wKULLa
tgVfjjvAFVXQAqSNnVYMVTGYD+amqH031ija71qBEbsBtnz097DZz9elifGZC3nt
PvT42UC14wd+7W2wJXHC2OhZadDi7tBC/8aXhpTvN4YLn1YZajxbeQWBwhg91LYX
ojC16xdjBsIPIWLU+uhDcSKDN6JJ+YD4h5+OC/LaIer9Pjasm+vZQejGiictgYC9
u0rmBTkFR+HtFzJF2JalhhH/JnrbssA8d+yb1z2In4XAMmq/ybvOzTTrfin1kNYB
5c6xVy5qg23aua/LbK082oFZuWTHPui2wLGdsi+S5Xw8RtKaAaPZ+JWk7gjkG0DF
NlD3k3Sf9xhQUTQ+QmZvHIc0W7Sk+P17exjkuwI0XvCHK661QbwGRG7d94ogTW/A
KaNEw/823asRFAFGVxJkcxl+rUZ1CrC1qvO7XLSoCK1jqnPsKrJ+l3HqSIJvuULQ
pelJz2YvSpdcGcfa3Xwt7pNZfA5S01g9W+KgzM+E4gX83U8MomKF3h4KV5R4JhBd
Z4CycNYWSOzENmsq+CqsOSwbsR0LUb1OoyajE7pik9aUJTxWBZ0Tk+KiMIGf6sMA
RTVb8GORKf/l6LJfrBhKS3YL2hNOXhog11UaPot1KPuooOHo1yw=
=ylAB
-----END PGP SIGNATURE-----

--vTUhhhdwRI43FzeR--
