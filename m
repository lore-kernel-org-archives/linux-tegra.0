From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 04/13] drm/tegra: Add sor-safe clock for DPAUX on
 Tegra210
Date: Fri, 17 Jun 2016 18:18:19 +0200
Message-ID: <20160617161819.GE27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-5-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0510888029=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1466165027-17917-5-git-send-email-jonathanh@nvidia.com>
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


--===============0510888029==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Content-Disposition: inline


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:38PM +0100, Jon Hunter wrote:
> For Tegra210 the 'sor-safe' clock needs to be enabled when using DPAUX.
> Add support to the DPAUX driver for enabling this clock on Tegra210.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
> index aa3a037fcd3b..d696a7e45935 100644
> --- a/drivers/gpu/drm/tegra/dpaux.c
> +++ b/drivers/gpu/drm/tegra/dpaux.c
> @@ -37,6 +37,7 @@ struct tegra_dpaux {
> =20
>  	struct reset_control *rst;
>  	struct clk *clk_parent;
> +	struct clk *clk_sor;

Can we call this "clk_safe", please? On one hand that mirrors the name
of the clock in the binding and on the other hand it avoids confusion
with the real SOR clock.

>  	struct clk *clk;
> =20
>  	struct regulator *vdd;
> @@ -340,18 +341,37 @@ static int tegra_dpaux_probe(struct platform_device=
 *pdev)
>  		return PTR_ERR(dpaux->rst);
>  	}
> =20
> +	if (of_device_is_compatible(pdev->dev.of_node,
> +				    "nvidia,tegra210-dpaux")) {
> +		dpaux->clk_sor =3D devm_clk_get(&pdev->dev, "sor-safe");
> +		if (IS_ERR(dpaux->clk_sor)) {
> +			dev_err(&pdev->dev,
> +				"failed to get sor-safe clock: %ld\n",
> +				PTR_ERR(dpaux->clk_sor));
> +			return PTR_ERR(dpaux->clk_sor);
> +		}
> +
> +		err =3D clk_prepare_enable(dpaux->clk_sor);
> +		if (err < 0) {
> +			dev_err(&pdev->dev,
> +				"failed to enable sor-safe clock: %d\n", err);
> +			return err;
> +		}
> +	}

Please make this part of a struct tegra_dpaux_soc, so that we don't have
to check the compatible string again here. This could look like:

	struct tegra_dpaux_soc {
		bool needs_safe_clock;
	};

	static const struct tegra_dpaux_soc tegra124_dpaux_soc =3D {
		.needs_safe_clock =3D false,
	};

	static const struct tegra_dpaux_soc tegra210_dpaux_soc =3D {
		.needs_safe_clock =3D true,
	};

	...

	static const struct of_device_id tegra_dpaux_of_match[] =3D {
		{ .compatible =3D "nvidia,tegra210-dpaux", .data =3D &tegra210_dpaux_soc =
},
		{ .compatible =3D "nvidia,tegra124-dpaux", .data =3D &tegra124_dpaux_soc =
},
		{ },
	};

> @@ -434,6 +454,9 @@ disable_parent_clk:
>  assert_reset:
>  	reset_control_assert(dpaux->rst);
>  	clk_disable_unprepare(dpaux->clk);
> +disable_sor_clk:
> +	if (dpaux->clk_sor)
> +		clk_disable_unprepare(dpaux->clk_sor);

You can drop the extra check here, since the common clock framework
ignores NULL or ERR_PTR() pointers.

> =20
>  	return err;
>  }
> @@ -456,6 +479,8 @@ static int tegra_dpaux_remove(struct platform_device =
*pdev)
>  	clk_disable_unprepare(dpaux->clk_parent);
>  	reset_control_assert(dpaux->rst);
>  	clk_disable_unprepare(dpaux->clk);
> +	if (dpaux->clk_sor)
> +		clk_disable_unprepare(dpaux->clk_sor);

Same here.

Thierry

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCLLAAoJEN0jrNd/PrOhLSsQAKHzU68Pos6E0xy7QFWz8Gna
vfuAajRu9Z8TWUvWpNpXeRghZ+WgEnWRB/3jBo7jLzIuhgGfnBy0F0LY6QN4xJYn
1/mjXho0R5QWxktCpaQx8la8JaN7Y/XM2tB9WUOgsnEYuAjAreoRaXxCcBitJsVR
0Nq1OtEUvSvE+sJEvvVuF4UE+bOh7wuK1Hmt4BrCeSMyH51pMgGs0L4BRyUwOxjY
BuZaDSpuvmDxuVJ37adUwFgj0oRcXVeIa6qgvOCDk2NZFymwiEv4xsyGnx89YSN7
t215h2dj9b4Bm94S8PNkHMxIc267OlcGCUSPjrxRyw7Rw6ZfMfqa9aVMFHgkLx7o
TikpwR94tCgwZcc6RNC/SHEOqQDEBHuN6YqIN8hx3p//5wSugndcUeIc0euJvnKR
zrM7PvtWiBq+vS+i4PyS+5AOSsrTFCcBVer6QVFIttQwnPmGrOa38nWVzBBLs4BM
8bjq+S1eo662pqWwOoNsUN2asxtKF7jBCWyN75oe8ZzMS9M1pgV7L/+qIlEMZA/n
HKadAX3xeDA8GEetIbeUuLbUb4yD82fXh8StoAwN7uHVl1ODku1HQ4k5m/wMfAoy
I+0MhAxmGsKHov3H5FiCu70wlbs/cPqIgO8/ABffeoKgrjoJ4pJrqRCpRBApBsHt
3HhEB57yE3igMD1fBUiX
=4fL8
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--

--===============0510888029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0510888029==--
