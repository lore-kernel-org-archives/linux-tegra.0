From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [patch 2/2] pinctrl: tegra-xusb: testing wrong variable in
 probe()
Date: Thu, 31 Jul 2014 17:36:53 +0200
Message-ID: <20140731153651.GB21098@ulmo.nvidia.com>
References: <20140731152308.GE31539@mwanda>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140731152308.GE31539@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2014 at 06:23:08PM +0300, Dan Carpenter wrote:
> There is a cut and paste bug so we test the wrong variable.  "err" is
> never less than zero at this point.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinct=
rl-tegra-xusb.c
> index 419a047..e641b42 100644
> --- a/drivers/pinctrl/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
> @@ -930,7 +930,8 @@ static int tegra_xusb_padctl_probe(struct platform_de=
vice *pdev)
> =20
>  	padctl->provider =3D devm_of_phy_provider_register(&pdev->dev,
>  							 tegra_xusb_padctl_xlate);
> -	if (err < 0) {
> +	if (IS_ERR(padctl->provider)) {
> +		err =3D PTR_ERR(padctl->provider);
>  		dev_err(&pdev->dev, "failed to register PHYs: %d\n", err);
>  		goto unregister;
>  	}

And another good catch. Thanks Dan.

Acked-by: Thierry Reding <treding@nvidia.com>

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2mKTAAoJEN0jrNd/PrOhes8QAJErJsllQDazZDHti+6ALxEx
v2SntZenDYkvK9uBiuR8JO2y5gP8EyG00oqqVVcLFpmRRY1onS3aHZ7/aX4yVifU
/N2U1OjdMTnxhWQKpc1JoBPamPRXAT0smFifhvJIEEmbyeMtc4SSg6ITCHfVMToH
UeONojLr37jxv73mCd2Ac/X3qFZzofp4Nf8r4LGQWu0pBWAtHJfwdxr6kVB0Lmh6
LSHNqhmbus7mA3ZP/7E7K3YBppNfTCJ8Ermu11THpOtbQP3twabgEbLUJ9Po6eDj
7P0KwHQgTbSb86h5FzPv7kFBVbuvHxriIzlI9vL7yVJHJ8l+dw0ajr6XtbOJaC3a
E/MadFQe1BA6LyrBBUo4Jbpe9kKN0YFB6WNZn3IslbhephsXmOrPIkEjJBb/NSq6
PX0FRidDh+4e6N2jkOubicSWDOuSxOsvwCk2hestMFn+v2QI25DkdXG26NlkJ/Lw
KAi6uNcxqlMlTsv/FIeKvS2X3mph4t1jA3KoONdl0jdqu8stiOVJVvZnfYOgiuTs
tf0gORMQ87+hqkhWQYKjEIsfsdGNctUkKTE7mxMhviyL/usSD0AFPrRiw6r+3oAw
pVMiErLRs/GIHYIJm5PyWF4tB6+UdXOwZHrBd0KXDm9lfunD2iQMjGGw2kd1/POE
icG9bti8Yv6+KWp7deCm
=TAhs
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
