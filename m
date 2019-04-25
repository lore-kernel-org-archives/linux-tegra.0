From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 6/6] mfd: max77620: Provide system power-off
 functionality
Date: Thu, 25 Apr 2019 13:22:41 +0200
Message-ID: <20190425112241.GA10218@ulmo>
References: <20190424224900.8018-1-digetx@gmail.com>
 <20190424224900.8018-7-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424224900.8018-7-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, Mallikarjun Kasoju <mkasoju@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 01:49:00AM +0300, Dmitry Osipenko wrote:
> Provide system power-off functionality that allows to turn off machine
> gracefully.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mfd/max77620.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/drivers/mfd/max77620.c b/drivers/mfd/max77620.c
> index 9b0009c29610..e56223bde568 100644
> --- a/drivers/mfd/max77620.c
> +++ b/drivers/mfd/max77620.c
> @@ -37,6 +37,8 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> =20
> +static struct max77620_chip *max77620_scratch;
> +
>  static const struct resource gpio_resources[] =3D {
>  	DEFINE_RES_IRQ(MAX77620_IRQ_TOP_GPIO),
>  };
> @@ -481,6 +483,15 @@ static int max77620_read_es_version(struct max77620_=
chip *chip)
>  	return ret;
>  }
> =20
> +static void max77620_pm_power_off(void)
> +{
> +	struct max77620_chip *chip =3D max77620_scratch;
> +
> +	regmap_update_bits(chip->rmap, MAX77620_REG_ONOFFCNFG1,
> +			   MAX77620_ONOFFCNFG1_SFT_RST,
> +			   MAX77620_ONOFFCNFG1_SFT_RST);
> +}

I think this is only partially correct. See here for a driver that I had
proposed a while back:

	https://github.com/thierryreding/linux/commit/d0eaa77b402f62bd236d76e3edeb=
3ccf296cbe81

Note that that driver is part of a larger series to move away from all
the pm_power_off hackery. There was a fair bit of discussion back when I
proposed the original power off driver for max77620:

	https://lkml.org/lkml/2017/1/12/470

I think I may have a more up-to-date local branch of the system-power
branch from my github repository if you're interested in looking at some
of that code. There wasn't a whole lot of feedback on the patches, but
the feedback I did get was generally positive. However, since it didn't
gain any traction I eventually abandoned that effort. It might be worth
picking it up again, since, as far as I can tell, the situation around
power off and restart hasn't changed in the meantime.

Thierry

> +
>  static int max77620_probe(struct i2c_client *client,
>  			  const struct i2c_device_id *id)
>  {
> @@ -488,6 +499,7 @@ static int max77620_probe(struct i2c_client *client,
>  	struct max77620_chip *chip;
>  	const struct mfd_cell *mfd_cells;
>  	int n_mfd_cells;
> +	bool pm_off;
>  	int ret;
> =20
>  	chip =3D devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
> @@ -554,6 +566,13 @@ static int max77620_probe(struct i2c_client *client,
>  		return ret;
>  	}
> =20
> +	pm_off =3D of_property_read_bool(client->dev.of_node,
> +				       "maxim,system-power-controller");
> +	if (pm_off && !pm_power_off) {
> +		max77620_scratch =3D chip;
> +		pm_power_off =3D max77620_pm_power_off;
> +	}
> +
>  	return 0;
>  }
> =20
> --=20
> 2.21.0
>=20

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzBmH4ACgkQ3SOs138+
s6FW4Q//WwGUmKeVX9G+JztP+onk6z3UHZYwUuKhumFVhdbzSPwmjvhzyU8cG44z
+n+aremYlkCHa+wQbZHe55kBqke9GFOUOWswgfYZIwRYzyMxklrNYHLaCjKnDiRU
0tstURpNyaYhGSKAWez5jAxJgZOBNJsn6VRiu9nc6dj3DlqtXG5azGdDXArwyZhn
7C3suAH9ktZ2wfFM3fZ8sI30of24Bqx4qgf1mRrxhS1dJtipQUwMyVAsFehf54c8
YsyDMbL4b4H4UtcsM+gF6lfyRFfakcMz9D6bzj2jdMfxYYRf/tz94FnQb4x8oMXX
O/FohlW3UyOCxjjXIrIibkC/z6C/0YI1zjwwesNsIg3qz1KaoUjbFvfyfNfk2Xzy
zmtEhwiHxAqxxVlemzYbiqFMtbWA+7FSKMycC3peszvQ4GbDgg3Masd42D4YFBFE
dIDG7qe6rVYCL7+lCYJVIgdO0DuaOkzqEmzZkSeO3iRFhO/24ZzUp6Y9fk3jcCn9
QxJb6L5pkWHRhJvqQEDM4tX6bj8XfYhhd0rY3AfOC4CRQiAz/5n/SRcCy+wYAHGE
HfO89UuNhAz75Md+jQCXUzevDvJcLBn7z/I4QZ4Is4qKcVlSwrRfbSxWmsTwVjz7
IfWA+z3BgnkARPUJZGZ41XhYKa/jVLMudMuc2vI7bbGUsolJuGo=
=2OHv
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
