From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] phy: tegra: xusb: Don't warn on probe defer
Date: Mon, 24 Feb 2020 16:12:18 +0100
Message-ID: <20200224151218.GA2570205@ulmo>
References: <20200224143641.5851-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200224143641.5851-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 02:36:41PM +0000, Jon Hunter wrote:
> Deferred probe is an expected return value for tegra_fuse_readl().
> Given that the driver deals with it properly, there's no need to
> output a warning that may potentially confuse users.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Kishon,

I already have a couple of PHY subsystem patches from JC and Nagarjuna
in a branch in the Tegra tree that I need to resolve a dependency. Do
you mind if I pick this up into that branch as well and send it to you
as a pull request later on? Say around v5.6-rc6?

Alternatively you could provide an Acked-by and then I can take them all
through ARM SoC.

Thierry

> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-t=
egra186.c
> index 84c27394c181..12d0f3e30dbc 100644
> --- a/drivers/phy/tegra/xusb-tegra186.c
> +++ b/drivers/phy/tegra/xusb-tegra186.c
> @@ -802,7 +802,9 @@ tegra186_xusb_read_fuse_calibration(struct tegra186_x=
usb_padctl *padctl)
> =20
>  	err =3D tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
>  	if (err) {
> -		dev_err(dev, "failed to read calibration fuse: %d\n", err);
> +		if (err !=3D -EPROBE_DEFER)
> +			dev_err(dev, "failed to read calibration fuse: %d\n",
> +				err);
>  		return err;
>  	}
> =20
> --=20
> 2.17.1
>=20

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5T58wACgkQ3SOs138+
s6HK2A//Uc6bvnvwYC3R0rgqsjQKhZkzdLOEI8/+qvoe9Q0HvINFsEExyjDNqtDl
ySlshrwTbE3yPM7IYt/McEOKPX3sUu2ohxuPkkJDbmrOvy5pMPJXYehR8eZn54No
9609LoVxtyelAMbBwmHG3ghBN1O81zDIzojocrByUcXWhBZ7Mxvi/gtKUh0P9g2K
us8bcsbrlu93D/hoZ/kRsPe4/diOwwk6Zw+HZo8HyvSeVOhcmGmPStFxx5ggl2+h
LPqskdrqs5nYcCmB9tQEOhfMz6UcnpFvITjowOOKKSuEEZhUdLi2n2JSnOEov7qr
xzK6ZaFUB2akiIwbIBlMhBsIi/yqA1Cc40pFVRuUSZ9qHSVAvfQc8zcg8ppIr4dJ
7ZdN5MFIq+KcWnnz6XM5U02Kuor3AzGgSP5scMEo9Z7ucrzymz1ifJfRUvaWYAC9
lhK+9zNCWRr2Obki3PgaJHLnR4/GDh/7Abj/gxHe2aN7fQDRSJHoH7uTf535UMta
FSA/mGfyr67AnqBvDF3bHg/z9FTqWbUNaq/Y0Q1qT5FV+0n1glOBM7qL15QEt6SI
zlpE81h3YapwAQzg9ce3nnnphepgNXMuEcmiXgDmJjfbQzy01JCPUUWHCUrR3xzi
uw/zZmFsD+rU1Aw6G3jbAvDy9L57GjCeSpcvCnNZI2pSzto5pSg=
=e6/4
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
