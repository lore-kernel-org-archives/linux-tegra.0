From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] mfd: tps6586x: add version detection
Date: Mon, 2 Dec 2013 10:17:29 +0100
Message-ID: <20131202091728.GE17834@ulmo.nvidia.com>
References: <cover.1385913227.git.stefan@agner.ch>
 <2d5282f031a16d2ff227694daaabc977440fbd2e.1385913228.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zjcmjzIkjQU2rmur"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2d5282f031a16d2ff227694daaabc977440fbd2e.1385913228.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kai.poggensee-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--zjcmjzIkjQU2rmur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2013 at 04:59:13PM +0100, Stefan Agner wrote:
> Use the VERSIONCRC to determine the exact device version. According to
> the datasheet this register can be used as device identifier. The
> identification is needed since some tps6586x regulators use a different
> voltage table.
>=20
> Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> ---
>  drivers/mfd/tps6586x.c       | 47 +++++++++++++++++++++++++++++++++++++-=
------
>  include/linux/mfd/tps6586x.h |  7 +++++++
>  2 files changed, 47 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
> index ee61fd7..8fc5a68 100644
> --- a/drivers/mfd/tps6586x.c
> +++ b/drivers/mfd/tps6586x.c
> @@ -124,6 +124,7 @@ struct tps6586x {
>  	struct device		*dev;
>  	struct i2c_client	*client;
>  	struct regmap		*regmap;
> +	int			version;
> =20
>  	int			irq;
>  	struct irq_chip		irq_chip;
> @@ -208,6 +209,14 @@ int tps6586x_irq_get_virq(struct device *dev, int ir=
q)
>  }
>  EXPORT_SYMBOL_GPL(tps6586x_irq_get_virq);
> =20
> +int tps6586x_get_version(struct device *dev)
> +{
> +	struct tps6586x *tps6586x =3D dev_get_drvdata(dev);
> +
> +	return tps6586x->version;
> +}
> +EXPORT_SYMBOL_GPL(tps6586x_get_version);
> +
>  static int __remove_subdev(struct device *dev, void *unused)
>  {
>  	platform_device_unregister(to_platform_device(dev));
> @@ -472,6 +481,31 @@ static void tps6586x_power_off(void)
>  	tps6586x_set_bits(tps6586x_dev, TPS6586X_SUPPLYENE, SLEEP_MODE_BIT);
>  }
> =20
> +static void tps6586x_print_version(struct i2c_client *client, int versio=
n)
> +{
> +	const char *name;
> +
> +	switch (version) {
> +	case TPS658621A:
> +		name =3D "TPS658621A";
> +		break;
> +	case TPS658621CD:
> +		name =3D "TPS658621C/D";
> +		break;
> +	case TPS658623:
> +		name =3D "TPS658623";
> +		break;
> +	case TPS658643:
> +		name =3D "TPS658643";
> +		break;
> +	default:
> +		name =3D "TPS6586X";
> +		break;
> +	}
> +
> +	dev_info(&client->dev, "Found %s, VERSIONCRC is %02x\n", name, version);
> +}
> +
>  static int tps6586x_i2c_probe(struct i2c_client *client,
>  					const struct i2c_device_id *id)
>  {
> @@ -487,19 +521,18 @@ static int tps6586x_i2c_probe(struct i2c_client *cl=
ient,
>  		return -ENOTSUPP;
>  	}
> =20
> +	tps6586x =3D devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERNEL);
> +	if (!tps6586x)
> +		return -ENOMEM;
> +

This hunk is being needlessly moved around....

>  	ret =3D i2c_smbus_read_byte_data(client, TPS6586X_VERSIONCRC);
>  	if (ret < 0) {
>  		dev_err(&client->dev, "Chip ID read failed: %d\n", ret);
>  		return -EIO;
>  	}
> =20
> -	dev_info(&client->dev, "VERSIONCRC is %02x\n", ret);
> -
> -	tps6586x =3D devm_kzalloc(&client->dev, sizeof(*tps6586x), GFP_KERNEL);
> -	if (tps6586x =3D=3D NULL) {
> -		dev_err(&client->dev, "memory for tps6586x alloc failed\n");
> -		return -ENOMEM;
> -	}
> +	tps6586x->version =3D ret;
> +	tps6586x_print_version(client, tps6586x->version);

=2E.. none of this new code overwrites "ret", so you could just keep the
previous order of operations. It probably doesn't matter all that much,
but deferring allocation until we're sure that the chip actually exists
is a minor optimization. Also not moving that hunk around makes the
patch simpler.

Thierry

--zjcmjzIkjQU2rmur
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnFAoAAoJEN0jrNd/PrOhvzwP/1RImSaO0fYmmsT3HBBpLilE
9gkimXZ2X1/DX0gTBY9AuAfMqWx3lP5EiY/YZ8O3ywjKO+YKh+fiUXicps4hMtpI
EHJB99SRHZrhKvxO8f/XcKt15INqsEzylXSzq2uFvkJyxYxJkYLlvtTmMhnAOF3C
yfOujVL1BIpyQSieCrHiyEbvMbH+MqVlX2a1MmYp28gS5V9/r2LM4d4ifgCZld64
pHpyoUP9yXLYuUImf5Kb0raUr9/tgVjV1SJ+XRgjtfPl+too+Oxr6sl4t74VjG5x
GawVhy86CdHwarOYKyNtFYonMX3+CneAEDZZqk4X0HPEZtUARBbP1r7THHvZSQ/d
U72OhJiJOCd/zw212F4WlEECH1GjPC+qNoask2kX5oGC2pvt8c0l97hnvwF1ZD/w
EXRk1bFhh74zgdOVLU2RyvC6aK8yWkkrBIVbb5D9H1uAs07ir+z2QuW2KI4zVO98
g4lARwHByMlUqIenXElW807oDeg6KQqbal9hOsuutRfQteVIxObJGI7YGnheRTGC
qgoUTjHjjwq4O1pmNEvFdGQaTIKcH+FNsaAAnvmWQX12ig3d+Q9OpaEl7cbqDWj7
Gu9N34mg/bxP7Sgesnf6yCGWQBN3t7GojE+boJasmRfzvq9VkYfXa6Hk7WohbdgT
HA3kekAdhEe52t7NAJTB
=ih0y
-----END PGP SIGNATURE-----

--zjcmjzIkjQU2rmur--
