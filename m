From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: clock: tegra: Remove pmc clock ids
 from clock dt-bindings
Date: Thu, 28 Nov 2019 13:18:44 +0100
Message-ID: <20191128121844.GA2300319@ulmo>
References: <1574830773-14892-1-git-send-email-skomatineni@nvidia.com>
 <1574830773-14892-7-git-send-email-skomatineni@nvidia.com>
 <22ab4e93-bf94-5c73-b4b9-6cf36d329b97@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <22ab4e93-bf94-5c73-b4b9-6cf36d329b97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, tglx@linutronix.de, robh+dt@kernel.org, mark.rutland@arm.com, allison@lohutok.net, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, horms+renesas@verge.net.au, Jisheng.Zhang@synaptics.com, krzk@kernel.org, arnd@arndb.de, spujar@nvidia.com, josephl@nvidia.com, vidyas@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 05:32:30PM +0300, Dmitry Osipenko wrote:
> 27.11.2019 07:59, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > clk_out_1, clk_out_2, clk_out_3, blink are part of Tegra pmc clocks.
> >=20
> > This patch removes ids for these clocks from Tegra clock dt-bindings.
> >=20
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > ---
> >  include/dt-bindings/clock/tegra114-car.h        | 14 +++++++-------
> >  include/dt-bindings/clock/tegra124-car-common.h | 14 +++++++-------
> >  include/dt-bindings/clock/tegra20-car.h         |  2 +-
> >  include/dt-bindings/clock/tegra210-car.h        | 14 +++++++-------
> >  include/dt-bindings/clock/tegra30-car.h         | 14 +++++++-------
> >  5 files changed, 29 insertions(+), 29 deletions(-)
> >=20
> > diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bind=
ings/clock/tegra114-car.h
> > index bb5c2c999c05..9175cd0571b5 100644
> > --- a/include/dt-bindings/clock/tegra114-car.h
> > +++ b/include/dt-bindings/clock/tegra114-car.h
> > @@ -270,10 +270,10 @@
> >  #define TEGRA114_CLK_AUDIO3 242
> >  #define TEGRA114_CLK_AUDIO4 243
> >  #define TEGRA114_CLK_SPDIF 244
> > -#define TEGRA114_CLK_CLK_OUT_1 245
> > -#define TEGRA114_CLK_CLK_OUT_2 246
> > -#define TEGRA114_CLK_CLK_OUT_3 247
> > -#define TEGRA114_CLK_BLINK 248
> > +/* 245 */
> > +/* 246 */
> > +/* 247 */
> > +/* 248 */
> >  /* 249 */
> >  /* 250 */
> >  /* 251 */
> > @@ -333,9 +333,9 @@
> >  #define TEGRA114_CLK_AUDIO3_MUX 303
> >  #define TEGRA114_CLK_AUDIO4_MUX 304
> >  #define TEGRA114_CLK_SPDIF_MUX 305
> > -#define TEGRA114_CLK_CLK_OUT_1_MUX 306
> > -#define TEGRA114_CLK_CLK_OUT_2_MUX 307
> > -#define TEGRA114_CLK_CLK_OUT_3_MUX 308
> > +/* 306 */
> > +/* 307 */
> > +/* 308 */
> >  #define TEGRA114_CLK_DSIA_MUX 309
> >  #define TEGRA114_CLK_DSIB_MUX 310
> >  #define TEGRA114_CLK_XUSB_SS_DIV2 311
> > diff --git a/include/dt-bindings/clock/tegra124-car-common.h b/include/=
dt-bindings/clock/tegra124-car-common.h
> > index 0c4f5be0a742..90a0c5e7eb5f 100644
> > --- a/include/dt-bindings/clock/tegra124-car-common.h
> > +++ b/include/dt-bindings/clock/tegra124-car-common.h
> > @@ -269,10 +269,10 @@
> >  #define TEGRA124_CLK_AUDIO3 242
> >  #define TEGRA124_CLK_AUDIO4 243
> >  #define TEGRA124_CLK_SPDIF 244
> > -#define TEGRA124_CLK_CLK_OUT_1 245
> > -#define TEGRA124_CLK_CLK_OUT_2 246
> > -#define TEGRA124_CLK_CLK_OUT_3 247
> > -#define TEGRA124_CLK_BLINK 248
> > +/* 245 */
> > +/* 246 */
> > +/* 247 */
> > +/* 248 */
> >  /* 249 */
> >  /* 250 */
> >  /* 251 */
> > @@ -332,9 +332,9 @@
> >  #define TEGRA124_CLK_AUDIO3_MUX 303
> >  #define TEGRA124_CLK_AUDIO4_MUX 304
> >  #define TEGRA124_CLK_SPDIF_MUX 305
> > -#define TEGRA124_CLK_CLK_OUT_1_MUX 306
> > -#define TEGRA124_CLK_CLK_OUT_2_MUX 307
> > -#define TEGRA124_CLK_CLK_OUT_3_MUX 308
> > +/* 306 */
> > +/* 307 */
> > +/* 308 */
> >  /* 309 */
> >  /* 310 */
> >  #define TEGRA124_CLK_SOR0_LVDS 311 /* deprecated */
> > diff --git a/include/dt-bindings/clock/tegra20-car.h b/include/dt-bindi=
ngs/clock/tegra20-car.h
> > index b21a0eb32921..fe541f627965 100644
> > --- a/include/dt-bindings/clock/tegra20-car.h
> > +++ b/include/dt-bindings/clock/tegra20-car.h
> > @@ -131,7 +131,7 @@
> >  #define TEGRA20_CLK_CCLK 108
> >  #define TEGRA20_CLK_HCLK 109
> >  #define TEGRA20_CLK_PCLK 110
> > -#define TEGRA20_CLK_BLINK 111
> > +/* 111 */
> >  #define TEGRA20_CLK_PLL_A 112
> >  #define TEGRA20_CLK_PLL_A_OUT0 113
> >  #define TEGRA20_CLK_PLL_C 114
> > diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bind=
ings/clock/tegra210-car.h
> > index 44f60623f99b..a3d8d3e75728 100644
> > --- a/include/dt-bindings/clock/tegra210-car.h
> > +++ b/include/dt-bindings/clock/tegra210-car.h
> > @@ -304,10 +304,10 @@
> >  #define TEGRA210_CLK_AUDIO3 274
> >  #define TEGRA210_CLK_AUDIO4 275
> >  #define TEGRA210_CLK_SPDIF 276
> > -#define TEGRA210_CLK_CLK_OUT_1 277
> > -#define TEGRA210_CLK_CLK_OUT_2 278
> > -#define TEGRA210_CLK_CLK_OUT_3 279
> > -#define TEGRA210_CLK_BLINK 280
> > +/* 277 */
> > +/* 278 */
> > +/* 279 */
> > +/* 280 */
> >  #define TEGRA210_CLK_SOR0_LVDS 281 /* deprecated */
> >  #define TEGRA210_CLK_SOR0_OUT 281
> >  #define TEGRA210_CLK_SOR1_OUT 282
> > @@ -386,9 +386,9 @@
> >  #define TEGRA210_CLK_AUDIO3_MUX 353
> >  #define TEGRA210_CLK_AUDIO4_MUX 354
> >  #define TEGRA210_CLK_SPDIF_MUX 355
> > -#define TEGRA210_CLK_CLK_OUT_1_MUX 356
> > -#define TEGRA210_CLK_CLK_OUT_2_MUX 357
> > -#define TEGRA210_CLK_CLK_OUT_3_MUX 358
> > +/* 356 */
> > +/* 357 */
> > +/* 358 */
> >  #define TEGRA210_CLK_DSIA_MUX 359
> >  #define TEGRA210_CLK_DSIB_MUX 360
> >  /* 361 */
> > diff --git a/include/dt-bindings/clock/tegra30-car.h b/include/dt-bindi=
ngs/clock/tegra30-car.h
> > index 3c90f1535551..20ef2462d9e1 100644
> > --- a/include/dt-bindings/clock/tegra30-car.h
> > +++ b/include/dt-bindings/clock/tegra30-car.h
> > @@ -230,11 +230,11 @@
> >  #define TEGRA30_CLK_AUDIO3 204
> >  #define TEGRA30_CLK_AUDIO4 205
> >  #define TEGRA30_CLK_SPDIF 206
> > -#define TEGRA30_CLK_CLK_OUT_1 207 /* (extern1) */
> > -#define TEGRA30_CLK_CLK_OUT_2 208 /* (extern2) */
> > -#define TEGRA30_CLK_CLK_OUT_3 209 /* (extern3) */
> > +/* 207 */
> > +/* 208 */
> > +/* 209 */
> >  #define TEGRA30_CLK_SCLK 210
> > -#define TEGRA30_CLK_BLINK 211
> > +/* 211 */
> >  #define TEGRA30_CLK_CCLK_G 212
> >  #define TEGRA30_CLK_CCLK_LP 213
> >  #define TEGRA30_CLK_TWD 214
> > @@ -260,9 +260,9 @@
> >  /* 297 */
> >  /* 298 */
> >  /* 299 */
> > -#define TEGRA30_CLK_CLK_OUT_1_MUX 300
> > -#define TEGRA30_CLK_CLK_OUT_2_MUX 301
> > -#define TEGRA30_CLK_CLK_OUT_3_MUX 302
> > +/* 300 */
> > +/* 301 */
> > +/* 302 */
> >  #define TEGRA30_CLK_AUDIO0_MUX 303
> >  #define TEGRA30_CLK_AUDIO1_MUX 304
> >  #define TEGRA30_CLK_AUDIO2_MUX 305
> >=20
>=20
> This a device-tree ABI breakage and I'm not sure that it's okay to break
> older device-trees (Pixel C Smaug board), maybe some kind of fallback is
> needed.

The Smaug support was never really official. I don't think anybody uses
upstream on it "for real" because there's a very limited set of features
that we do support. My understanding is that there is a community around
Pixel C that runs their own forks with some more features and they have
occasionally upstreamed bits and pieces of that.

So given how far behind we are with Smaug, I don't think breaking ABI
stability is really a problem in this case.

Jon, we used to have a Smaug system in our internal upstream testing,
but that's no longer the case. If we ever were to reinstate that
testing, updating the DTB shouldn't be a problem, right? My recollection
is that updating the DTB was always done hand in hand with the kernel
update.

Thierry

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3fuyEACgkQ3SOs138+
s6Ghgw//bCb6lt837QID9Q1WO7BEgi2+4lnNZfmuP/5OjKBXMtmgG/9fv1nSbT6s
GfJr6XUCbCTZXAiGF/STTPaa/1v+xlSklSVsSD38MXbqMueQqN09wfd/ho6r7FVH
/93BPk34DUtFFTQRSB5a230XwkiI3FS+Dx4j+Etx3jrGhXyVi+wNAmewwRG5aFna
O0XL3c2sghHtRXNwrBZFcqTe+Co27CAQQma5mwdW26SghRfmOkaPJ0FXZqBgAvr4
lCtel65eFWrQ0a2p7ncBh7r83seRmTVlgB3oj3WLgjfD4K9bLEkrfFTXbD+r1RHa
Qr9AQ4Xdd2rRbtRumYWGu9rMJxaJ0VkIVt2Xk6LTb5A2mbJSI3c/XPB0NYVRgr6m
jKdsw08GqidOYCBCD4Qt+IsECH6xas8XMK1j4SCbJyZApREK9srnAiAlpWRbv6Me
c03ulVk3uamy/ioBJeMxGQN3UJ/iM1YLL+XfKwowP3vcY8MYRD1n1dL4CmRUiQt/
4HBZLyPjb1zTJLE5vBEJQY4S3RJ1AdXKUsa6QIn0jotSLgcaZcoQ+gmf0eTuEiKB
CLHle2pcutTQfmhznmblf4Ak8Ic+PIfGQz7UYDU/WE4He6ErDV6bjwpxP1NnF6Vt
c1jYgV9XRZIOherjhHEvOvfG/AojaxjzymLjuFJKR7N2gHy5Fxo=
=6wWI
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
