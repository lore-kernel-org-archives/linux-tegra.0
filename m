From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/3] phy: tegra: use regulator_bulk_set_supply_names()
Date: Wed, 2 Oct 2019 14:26:38 +0200
Message-ID: <20191002122638.GB3908655@ulmo>
References: <20191001132333.20146-1-brgl@bgdev.pl>
 <20191001132333.20146-3-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001132333.20146-3-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 03:23:32PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Use the new regulator helper instead of a for loop.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/phy/tegra/xusb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Ul30ACgkQ3SOs138+
s6EF5A//Xcp1n7NvMOoJLxPyJaAbj2+9yDBPk8P8XjrOlNnnJKLR/Pi/ZJ3XHx5F
GUdipz/eE9JwZqsUSbqdBv+77ZeUeSz0SU5B7TNwajOLcInHbbmLqTxbXh+yydC8
COM6x1+GzPZ/V8c2k1NqQUyKx1xfWe4cEWKIa/Nyssw9YoJfRI4RMZ20NQ2tyYcV
fEO97xTcG+1ikivOJiqNdJYgSY4GdM5/6gJdHzLk0lBZEDq6EadVvdu/thMloF8i
mlankGeD5uHIZLZLxw5tnX7TGVJ7kEoIbf8aFdQaFtXVweao8QUGlYaVbFnlPJXT
/z1n+kLrBI8X6jdbUqzWYrcWI6LzrHSh3xRNdqxqjgW8EppuP1qhcVcdS34Q7/SJ
dbSivgaTeeGf88Z5RFMXLPxVYpKGsZ3xIi2QSuz6PZG2pJQmWvRlgSZR+ReH/9xg
YnpBaRCKiAGLpxXTn/ZQNlhca1ZXH90SgPsHEaPSgFB+EencKjbLgvVd3Sq3lNEW
E2xVPeO+0zwkmwm9alfPI1RP2dUvR37cgEaapu4i+htkcQxb3mctjQrkisixMYYH
eozSjWqaoKvSzvahgnEpwgd4e+H0qjQSyJ3yK8fWeO1PBmuPH8sOKUtAMnOtoeXN
Ne0xB7w7DvGhA3+KokaDTdgu4PslLrmmKTQSIKA6BnGhqED6S2k=
=k7Zf
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
