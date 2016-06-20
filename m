From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 04/13] drm/tegra: Add sor-safe clock for DPAUX on
 Tegra210
Date: Mon, 20 Jun 2016 18:33:29 +0200
Message-ID: <20160620163329.GA6175@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-5-git-send-email-jonathanh@nvidia.com>
 <20160617161819.GE27475@ulmo.ba.sec> <5767ACBE.3090008@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1561937231=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5767ACBE.3090008@nvidia.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Stephen Warren <swarren@wwwdotorg.org>, dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--===============1561937231==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 20, 2016 at 09:43:42AM +0100, Jon Hunter wrote:
> On 17/06/16 17:18, Thierry Reding wrote:
> > On Fri, Jun 17, 2016 at 01:03:38PM +0100, Jon Hunter wrote:
> >> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpa=
ux.c
[...]
> >> +	if (of_device_is_compatible(pdev->dev.of_node,
> >> +				    "nvidia,tegra210-dpaux")) {
> >> +		dpaux->clk_sor =3D devm_clk_get(&pdev->dev, "sor-safe");
> >> +		if (IS_ERR(dpaux->clk_sor)) {
> >> +			dev_err(&pdev->dev,
> >> +				"failed to get sor-safe clock: %ld\n",
> >> +				PTR_ERR(dpaux->clk_sor));
> >> +			return PTR_ERR(dpaux->clk_sor);
> >> +		}
> >> +
> >> +		err =3D clk_prepare_enable(dpaux->clk_sor);
> >> +		if (err < 0) {
> >> +			dev_err(&pdev->dev,
> >> +				"failed to enable sor-safe clock: %d\n", err);
> >> +			return err;
> >> +		}
> >> +	}
> >=20
> > Please make this part of a struct tegra_dpaux_soc, so that we don't have
> > to check the compatible string again here. This could look like:
> >=20
> > 	struct tegra_dpaux_soc {
> > 		bool needs_safe_clock;
> > 	};
> >=20
> > 	static const struct tegra_dpaux_soc tegra124_dpaux_soc =3D {
> > 		.needs_safe_clock =3D false,
> > 	};
> >=20
> > 	static const struct tegra_dpaux_soc tegra210_dpaux_soc =3D {
> > 		.needs_safe_clock =3D true,
> > 	};
> >=20
> > 	...
> >=20
> > 	static const struct of_device_id tegra_dpaux_of_match[] =3D {
> > 		{ .compatible =3D "nvidia,tegra210-dpaux", .data =3D &tegra210_dpaux_=
soc },
> > 		{ .compatible =3D "nvidia,tegra124-dpaux", .data =3D &tegra124_dpaux_=
soc },
> > 		{ },
> > 	};
>=20
> OK. I wonder if we should call it 'has_safe_clock' because this clock
> does not exist for tegra124 AFAICT. #bikeshed ;-)

has_safe_clock is fine with me, too.

Thierry

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXaBrWAAoJEN0jrNd/PrOhSfcP/1tybgKZ9kyRDxSdbv8E9s8g
4H9ZvxkZvtzmdDYcOnA21ElSvTie3WCJ5pwqb0qbHTyyzeJQp1LA6fhqm0Aph1WA
S2u6Gbu7IdkYf45mmy1ecPAU238gZ8LiqD1LhFGvPYXrInX+8USnaJIQqhVh9/2z
rrhpO71cHhkvI8DXC3wCH8dzQjcy+jLOEY3RG5XVO3l61MhBHlbpsI2m95CJA5lz
9+sAheigT9ovFbgIdxMxTnC1rOYQGdheeXAceE9uf5Puel2o3dz4Y4aHTx/Gy+ML
uNrxMltNsD7tl4M74xXWGA/KUjuCCFWTrJ5+5USNEdXxqCOr5KkVt49ALytsC4BZ
cKkaM/UznSb22/pjRURAUmPw90CMouAeEhSaK3AxxjW2VTH/Hr7Qa6W138buVw4E
SPs4WY1Pm4PXXBZgRHfr62qZRGG6bnScI1BM2XNa0OrWxGTMAc+MEjdOwmjgDs00
noo9Su1NGK5ronrUxkJqTE2je5+l8nhDNCpqYF6Y1C/fIqlayfiJF0ZvCANCmnP7
LIDBfUo8QY++96uS5VjWy9BqaE7boHqaHOOc6isl37GgYWaqLhsO11reYQbKOlT0
M1g7DLMsuALhCi8AfmCddwfv1Hvrx3BHpNp9K5wCYOHEY5FqufsXFBqwAVBG6OrC
qq9F3v8egab573NulY3D
=yVGW
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--

--===============1561937231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1561937231==--
