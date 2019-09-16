From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: switch to using devm_gpiod_get_optional
Date: Mon, 16 Sep 2019 15:59:04 +0200
Message-ID: <20190916135904.GA7488@ulmo>
References: <20190915071323.GA36596@dtor-ws>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190915071323.GA36596@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2019 at 12:13:23AM -0700, Dmitry Torokhov wrote:
> We do not really need to use API that fetches GPIO data from an
> arbitrary device tree node, as we are dealing with device tree node
> assigned to the device structure. We can easily switch to
> devm_gpiod_get_optional() plus gpiod_set_consumer_name() and clean up
> the code.
>=20
> Note this is part of efforts to get rid of [devm_]gpiod_get_from_of_node
> in drivers so that gpiolib can be cleaned up.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

We can't do that. There's a special case in rgb.c that sets
output->of_node to something different than output->dev, so we actually
need to pass the struct device_node * separately.

Thierry

>=20
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index bdcaa4c7168c..b4248125b844 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -121,19 +121,15 @@ int tegra_output_probe(struct tegra_output *output)
>  		of_node_put(ddc);
>  	}
> =20
> -	output->hpd_gpio =3D devm_gpiod_get_from_of_node(output->dev,
> -						       output->of_node,
> -						       "nvidia,hpd-gpio", 0,
> -						       GPIOD_IN,
> -						       "HDMI hotplug detect");
> -	if (IS_ERR(output->hpd_gpio)) {
> -		if (PTR_ERR(output->hpd_gpio) !=3D -ENOENT)
> -			return PTR_ERR(output->hpd_gpio);
> -
> -		output->hpd_gpio =3D NULL;
> -	}
> +	output->hpd_gpio =3D devm_gpiod_get_optional(output->dev,
> +						   "nvidia,hpd", GPIOD_IN);
> +	if (IS_ERR(output->hpd_gpio))
> +		return PTR_ERR(output->hpd_gpio);
> =20
>  	if (output->hpd_gpio) {
> +		gpiod_set_consumer_name(output->hpd_gpio,
> +					"HDMI hotplug detect");
> +
>  		err =3D gpiod_to_irq(output->hpd_gpio);
>  		if (err < 0) {
>  			dev_err(output->dev, "gpiod_to_irq(): %d\n", err);
> --=20
> 2.23.0.237.gc6a4ce50a0-goog
>=20
>=20
> --=20
> Dmitry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1/lScACgkQ3SOs138+
s6GZHg/7BvOAV6GlmzRIMTWPhSZVXASdXGoC7OG5Tj/OolqXcAtfPTXIY2EuWnU8
4WWut1Tu2kEUxYOF220ygFHAYcq534dtEQ7tGb6aT2qo+SCs590ohhj5d0aaNP+p
W4gaGaoWabU6e8H0fGrFRayns+k+EMp4LzwkeAyhgVAXnrWSAU/TgLTuV1BVqJx5
/Cl4qvxRtrC4bXqqVpLTKAeu0uJ1/B/Qx8bqXmtWQO7dFVQvUyTubdhuV+qi3ah4
FkVvjAC1y7ipfeJxAOmh6U+zZE07WU2ig9VTk9rT5C5RQk0y7+VyXmn4jleR7QtC
3/sz688DG286/i0rdcgTTwgDPW4B6GC0jHnK7yX9QXus4GYKMW3Jb44MzpdT8njH
HlQzxuliHLsIHpH0bOhO2KIn/PB9WoTswi0A+5BKMzRlbRRbj+i0JSY0YkshiqIx
V6O6fzEYKGjAWmVBZjQLLotTnxPB+hPNA80w09yw6b4A+kTqyre5nUiMPlrQodB3
4+D33AyTq0J6jVM9vra6PxVL+qoQBDbqPdoZcTC19Hu7vHVQYkM9co3lDu6X8Uzo
NchZUvaY/3s2SK1HvkItxyeOsr0GQDqEo5wRDiayCzqiCcDcBqaYGgMuzag88CRZ
s47dRGofk4wxJOkC0NrwWYcLdZdLWKdECBUOo9FWVJM5Pl842KE=
=2VOz
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--
