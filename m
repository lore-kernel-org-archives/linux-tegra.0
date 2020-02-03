From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1] usb: phy: tegra: Add clarifying comments about the
 shared registers
Date: Mon, 3 Feb 2020 12:28:18 +0100
Message-ID: <20200203112818.GA3506060@ulmo>
References: <20200202224259.29187-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200202224259.29187-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 01:42:59AM +0300, Dmitry Osipenko wrote:
> Tools like Coccinelle may erroneously recommend to use the
> devm_platform_ioremap_resource() API for the registers mapping because
> these tools are not aware about the implementation details of the driver.
> Let's add a clarifying comments to the code, which should help to stop
> future attempts to break the driver.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-=
usb.c
> index 037e8eee737d..6153cc35aba0 100644
> --- a/drivers/usb/phy/phy-tegra-usb.c
> +++ b/drivers/usb/phy/phy-tegra-usb.c
> @@ -969,6 +969,10 @@ static int utmi_phy_probe(struct tegra_usb_phy *tegr=
a_phy,
>  		return  -ENXIO;
>  	}
> =20
> +	/*
> +	 * Note that UTMI pad registers are shared by all PHYs, therefore
> +	 * devm_platform_ioremap_resource() can't be used here.
> +	 */
>  	tegra_phy->pad_regs =3D devm_ioremap(&pdev->dev, res->start,
>  					   resource_size(res));
>  	if (!tegra_phy->pad_regs) {
> @@ -1087,6 +1091,10 @@ static int tegra_usb_phy_probe(struct platform_dev=
ice *pdev)
>  		return  -ENXIO;
>  	}
> =20
> +	/*
> +	 * Note that PHY and USB controller are using shared registers,
> +	 * therefore devm_platform_ioremap_resource() can't be used here.
> +	 */
>  	tegra_phy->regs =3D devm_ioremap(&pdev->dev, res->start,
>  				       resource_size(res));
>  	if (!tegra_phy->regs) {

I'm not sure it's really going to stop *all* attempts. But at least for
people that go through the trouble of reading the comments, yes, this
should do the trick, so:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl44A9AACgkQ3SOs138+
s6E5LA//eA+l0WY720Az8s4VDR4EoNCATb9zoF8BYUaqhMGRF3PGFK2ih0Fblls4
U8foPI8ezcnxqIVwfI8dzfFhGMlAf0lKyJbEmPfBofwLjrprH9jDDcD2aYBEqDtB
Hco1ZZRHmRcSLvzSIZIf5oOfm2aGzqHVjbCbi+eKS4k2LYg3pJbEbZVwV0QYUCkV
bgrxv9+RfTm3umKVXd9pL41j8zhVrvSgE7ta32AilhU7BSSIAQjBD3o/COr2H8w5
rgIPHVlIRgoEEfGUdGc0yk/xHY5uaLy2LX98HZ8O3sI7LdveevDtlUaDowDHU4+k
Y3uZio3jNsUccxRm3lmIB2hpjjJ06J0A1r0Aa6Z/pEpJL3d6Z9U8WoB73SHJGX0t
rNUzt3KC2h4w38sYAUtYm0r2YRc1vcRN6xE+gA74VUn48H2T8Ih3BLSCExaOVwbw
FtAcmq5KYYCHAe2GLITEGqjJ98P5RiG8Irda9N2IRD87HMFUwFFbr5ZRSbDZklpV
WAWCHxf8K6QAjk0HBbSCG1HqMJ0iOVjEXWj48wjJvrLchyrpYnFV9A3TGKTQfUZB
FwVqrua3RIEtzxzstc+z3/6ywa7cg/BOZobL0NiFHqE3s546zymlG7fjqu35xeX+
cWebVl3Pvt/ueJ16bAhtr8ippPBFS9sDlZ9uacJqfBRN7R0d0mM=
=GgDd
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
