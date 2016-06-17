From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH 10/13] drm/tegra: Add pinctrl support for DPAUX
Date: Fri, 17 Jun 2016 18:37:52 +0200
Message-ID: <20160617163752.GI27475@ulmo.ba.sec>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <1466165027-17917-11-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MFZs98Tklfu0WsCO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1466165027-17917-11-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: David Airlie <airlied@linux.ie>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Wolfram Sang <wsa@the-dreams.de>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--MFZs98Tklfu0WsCO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2016 at 01:03:44PM +0100, Jon Hunter wrote:
> The DPAUX pins are shared with an internal I2C controller. To allow
> these pins to be muxed to the I2C controller, register a pinctrl device
> for the DPAUX device. Make Tegra DRM support dependent on PINCTRL to
> avoid any compilation issues.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/Kconfig |   1 +
>  drivers/gpu/drm/tegra/dpaux.c | 117 ++++++++++++++++++++++++++++++++++++=
++++--
>  2 files changed, 115 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
> index 63ebb154b9b5..d34937a96f94 100644
> --- a/drivers/gpu/drm/tegra/Kconfig
> +++ b/drivers/gpu/drm/tegra/Kconfig
> @@ -4,6 +4,7 @@ config DRM_TEGRA
>  	depends on COMMON_CLK
>  	depends on DRM
>  	depends on RESET_CONTROLLER
> +	depends on PINCTRL

Could we instead make the code optional? I don't care much about pulling
in the extra dependency (for Tegra we always enable PINCTRL anyway), but
I worry that somebody may end up searching for DRM_TEGRA and not find it
because PINCTRL happens to be disabled in they .config.

> diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
[...]
> @@ -439,6 +537,19 @@ static int tegra_dpaux_probe(struct platform_device =
*pdev)
>  	if (err < 0)
>  		return err;
> =20
> +	dpaux->desc.name =3D dev_name(&pdev->dev);
> +	dpaux->desc.pins =3D tegra_dpaux_pins;
> +	dpaux->desc.npins =3D ARRAY_SIZE(tegra_dpaux_pins);
> +	dpaux->desc.pctlops =3D &tegra_dpaux_pinctrl_ops;
> +	dpaux->desc.pmxops =3D &tegra_dpaux_pinmux_ops;
> +	dpaux->desc.owner =3D THIS_MODULE;
> +
> +	dpaux->pinctrl =3D pinctrl_register(&dpaux->desc, &pdev->dev, dpaux);
> +	if (!dpaux->pinctrl) {
> +		dev_err(&pdev->dev, "failed to register pincontrol\n");
> +		return -ENODEV;
> +	}

Did you mean to use the devm_ variant here? Because I don't see a
pinctrl_unregister() in tegra_dpaux_remove().

Thierry

--MFZs98Tklfu0WsCO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXZCdgAAoJEN0jrNd/PrOhaasP/A0KO002QONK2al+yufvGMRL
GTj5kM0vRaluC32n0lntZyI4IloshtWMpMwk3ZRA0e9KpHfQ0A9IV8teXYFQcb7p
BjnwPyokOIjpy/ooKslsWDx0QgO9itk/l5QAxKrbPl+iIQhZDKXrNqigr8B23LV5
2LP6+fEcduVjJec0d4ezL8zEqns1zh/I13tIUDhKXYlPrTUoNh1zOoJPQthLtt64
d2/EOku1l7acnJOQ5ETOojVHFEjKJetx6FTv7VqPdyIZ1qeKzQ8gA40Sb5YKzJzQ
18uCEpN6sxZ0Vm4PwjvCUzNOdjUKAZu7kk/XhDFQVAnBtqSsqaQPw/ciJ0oTNP4W
1YCKqdtydzSYqyD8n+fgCQKaJ2YycE4v8gHFzPBmQS9Si0pZcY9Hq5Z8H8jGhobR
59cs5+hFM4mYqRG79d/hu57W2DnbUEXJjBxr3FUHcX3STEyPGZRfSUA4goIm5QEt
1N3xQaHaa4XoFBY3egAGHhj9TNPOa7eizs57rjDsCtkAdOPlTQI70pAmmjyi2ulx
6VyvveN9v7mPZmVXHgzOCGo8hzL2GNY/MEzykk0P8QAnwQScLIHLMmHBdC2v6bq9
12mkZf3NWSfft49IPtZX40qgGbKvtOaa8t2NsLf3vKObdo0faCcDJCZ/cCISQmZi
5mUwXj68Rt6UrsV8OQpM
=jaR3
-----END PGP SIGNATURE-----

--MFZs98Tklfu0WsCO--
