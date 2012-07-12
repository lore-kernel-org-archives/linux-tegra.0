From: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 4/5] i2c: tegra: Use struct dev_pm_ops for power
 management
Date: Thu, 12 Jul 2012 11:53:52 +0200
Message-ID: <20120712095352.GD27520@pengutronix.de>
References: <1341919244-23327-1-git-send-email-ldewangan@nvidia.com>
 <1341919244-23327-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1341919244-23327-5-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 04:50:43PM +0530, Laxman Dewangan wrote:
> Make the tegra i2c driver define its PM callbacks through
> struct dev_pm_ops objects rather than by using legacy PM hooks
> in struct platform_driver.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/i2c/busses/i2c-tegra.c |   19 +++++++++++++------
>  1 files changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index 0792674..5f0572d 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -713,8 +713,9 @@ static int __devexit tegra_i2c_remove(struct platform=
_device *pdev)
>  }
> =20
>  #ifdef CONFIG_PM
> -static int tegra_i2c_suspend(struct platform_device *pdev, pm_message_t =
state)
> +static int tegra_i2c_suspend(struct device *dev)
>  {
> +	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct tegra_i2c_dev *i2c_dev =3D platform_get_drvdata(pdev);

I like Rafael's patch better because of dev_get_drvdata. I'll pick his
and add your 5/5 on top of that.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/+nrAACgkQD27XaX1/VRvh8ACgtn+mpmpRyQgxTYZpWsiSnxgf
2eIAn04dCK7wANS9nESK9YwJsQMmOrFs
=tDuW
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
