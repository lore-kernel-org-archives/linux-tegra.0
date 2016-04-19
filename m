From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/3] gpio: tegra: Add support for gpio debounce
Date: Tue, 19 Apr 2016 14:37:54 +0200
Message-ID: <20160419123754.GE8284@ulmo.ba.sec>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
 <1461059020-25373-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u5E4XgoOPWr4PD9E"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1461059020-25373-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--u5E4XgoOPWr4PD9E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 03:13:40PM +0530, Laxman Dewangan wrote:
[...]
> @@ -570,7 +612,14 @@ static struct tegra_gpio_soc_config tegra30_gpio_con=
fig =3D {
>  	.upper_offset =3D 0x80,
>  };
> =20
> +static struct tegra_gpio_soc_config tegra210_gpio_config =3D {
> +	.bank_stride =3D 0x100,
> +	.upper_offset =3D 0x80,
> +	.debounce_supported =3D true,
> +};
> +
>  static const struct of_device_id tegra_gpio_of_match[] =3D {
> +	{ .compatible =3D "nvidia,tegra210-gpio", .data =3D &tegra210_gpio_conf=
ig },
>  	{ .compatible =3D "nvidia,tegra30-gpio", .data =3D &tegra30_gpio_config=
 },
>  	{ .compatible =3D "nvidia,tegra20-gpio", .data =3D &tegra20_gpio_config=
 },
>  	{ },

I think I'd split this hunk off into a separate patch. Oh, and perhaps
follow up with a patch that makes the SoC configuration data const?

Thierry

--u5E4XgoOPWr4PD9E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFiaiAAoJEN0jrNd/PrOh4WIQAK4BLW2/snWcZTA5XhfWWh6+
UTdng/TDkiqOn1WEhRu49+m//04oZoseVKWDPwQJ0qWmuyXRROXdPnAjhz4chqO9
RO6IEZWmHVG8Y8+q1Niy4uIY03ZwinQHgHgeaq9f9NUFZhK4WiN3NfePojSDK8Ds
F9ykmSrpPqDPX6pk09mOvX0V5ucd7gP0hTE3eqaO7Z+vVmj0o/mceV/zM7Y4rZpU
Y56DvZ6WKBfpNCFXkie8jntmxA1AO83WeW4ZLQP1d5uTf/yXvaYJbkmuAm7XTyGq
utU3fJuddRFFMlOtn2iRF9uzF14frHAuwu3ns4zYG5ilAGcfwy6M2t1cndb/qmlN
VUbxEADsmTqzKqy5rsN40Lpgd44P4nSeiADYciUR7WK8C+hNilhOZ5/xy0C0V57c
Pq14+AWXwFya6USj95u5VsiDIVcIEUhoSNNmyAE4nAf9BkaTUZ7zB/sy38dMBoNE
BN28da4XYOiufD7ExtqHIBUGAEpVSsObsiBpbRGcvlX03u9FUsrDNUoa67UQer1T
eAj/gW+wXUcTF/DlOpYdrb9LPegvm8qM+NKu61mm+mFiUMgzG1IC3jENxzI9y0PP
awUEeb/lCbCMgcPsRbDf0xUzOu9aQ6Uibe/a6FKggAuTko0pfpRJtU3BaXAbVxi2
+GMkOmaO6fW8lqwWaKdS
=PRwT
-----END PGP SIGNATURE-----

--u5E4XgoOPWr4PD9E--
