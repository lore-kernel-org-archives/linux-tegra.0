From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: tegra-xusb: Fix allocation of pins
Date: Tue, 19 May 2015 16:33:42 +0200
Message-ID: <20150519143340.GE26748@ulmo.nvidia.com>
References: <1432044863-2035-1-git-send-email-jonathanh@nvidia.com>
 <1432044863-2035-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="//IivP0gvsAy3Can"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1432044863-2035-3-git-send-email-jonathanh@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--//IivP0gvsAy3Can
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2015 at 03:14:22PM +0100, Jon Hunter wrote:
[...]

One more thing:

[...]
> diff --git a/drivers/pinctrl/pinctrl-tegra-xusb.c b/drivers/pinctrl/pinct=
rl-tegra-xusb.c
> index 3e8e4a914fb4..c61594066e26 100644
> --- a/drivers/pinctrl/pinctrl-tegra-xusb.c
> +++ b/drivers/pinctrl/pinctrl-tegra-xusb.c
> @@ -125,6 +125,23 @@ static const char *tegra_xusb_padctl_get_group_name(=
struct pinctrl_dev *pinctrl,
>  	return padctl->soc->pins[group].name;
>  }
> =20
> +static int tegra_xusb_padctl_get_group_pins(struct pinctrl_dev *pinctrl,
> +					    unsigned group,
> +					    const unsigned **pins,
> +					    unsigned *num_pins)
> +{
> +	struct tegra_xusb_padctl *padctl =3D pinctrl_dev_get_drvdata(pinctrl);
> +
> +	/*
> +	 * For the tegra-xusb pad controller groups are synonomous
> +	 * with lanes/pins and there is always one lane/pin per group.
> +	 */
> +	*pins =3D &padctl->soc->pins[group].number;

Shouldn't this be the same as pinctrl->desc->pins? In that case, maybe a
better solution would be to make .get_group_pins() mandatory again and
turn this into a pinctrl helper function that can be used by all group-
only pinctrl drivers?

Thierry

--//IivP0gvsAy3Can
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVW0nEAAoJEN0jrNd/PrOhuc4P/0PWIqTxXYpXU5vrzanUzQEj
qPW1GlusDkZwB6CbiLEo0d2J9tljtRoz9jWg7/0b5U8P1IPNzUdn+eOjXvKe6sZg
cXAYt16Hpd04CjoQvJsSNelZpQD6lzQWLAr6hWY5PIsBPgG9eS2QP5qavEjgB1QX
D7oFw9lE4P38PxcXKqO6VR9CfJLcAXgWzF/GMML8hxSrvWMVVUadw3FCQbmUWxrL
Efnq2SlfW96Kl22Fd3uyOqgHC1aDrd0v5JUiqu5y4JAQsoNmtcQ8oNQp1zTz0w9M
ZK2KJueiWvxiWwuZKvxWmNHb/cnGcS+6INKAffnRA1jd2LIjY23pDEaF+Ap+tkZ7
UJVCbhuMz+QybO2aB19k4PXC8kF0v6WqWXZ3l1PxMoXsh2dYCmUiAhNvcS82bIj8
UdY48xo1DFUEegIKvPUSYjT6mwWjNMpQv8BBSbQdlphqITOAHibYfovB9NInE9Z7
+LXskdEZaV3S8blGRjfR6xncR4C02NvjwGgPtTKwHR4A0H2t9UWJNmEDc8WIobar
dg1cWMg+tkEjGNuSg2ae/l38vQ4LFLIx3T+7PKX9c/JeCDwlMeISNevaIt654od9
d4qo7yV6bcHZyha4Dv1FcAk1ZMv560V9Qh0ndYwQUdHjJ3xnAAxAi71GSOOxjqDk
6rD/Yg7MKOnVZwq6kPHO
=gO7a
-----END PGP SIGNATURE-----

--//IivP0gvsAy3Can--
