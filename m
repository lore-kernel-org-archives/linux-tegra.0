From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/3] ahci: tegra: use regulator_bulk_set_supply_names()
Date: Wed, 2 Oct 2019 14:26:23 +0200
Message-ID: <20191002122623.GA3908655@ulmo>
References: <20191001132333.20146-1-brgl@bgdev.pl>
 <20191001132333.20146-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001132333.20146-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 03:23:31PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> Use the new regulator helper instead of a for loop.
>=20
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/ata/ahci_tegra.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2Ul2sACgkQ3SOs138+
s6Ga/w//Yimb8W0dHb5bPycndMDPTCHs3rLOFV/Yl1KXFujPKpcNR8l6VEDs3EQ4
S9SIZ2ZtKarqXztozASGg1i34FRAZ9k9uvnMKDhSGVmHIE+GJ/2yvG19SrdXAhqk
ysfZOdiuO9yX+sBXI2wTuzkhInxByhy9Dmi1bk/4mXL4RT4uaafV5GDhV8VcFRUm
g04drAnwoCkGKk5YfdgLGHgj06EkzdBbh98XrOgRn18juizCSB/cH+yXPUGYDsIA
NQ5YjX8kPigHc0SSblGKCpq6T+sATD1OrveMF0T8Ug5p9BuimxVNoSlSlen+0B06
gbcozBapTVJ0obQkuverozJD+UvTO889JxCHwP5IQK7besM/pN4ZlkYFWRHDXk3n
ezce5wh0VrZ4Z99VkjPimYZRDwJQbN+pQrE6jHlDhSugAhyM+s0f/rW2a9E53ZYf
f3nh2OQtrhMnZtIliNLuI1EDNWRHB2wt2JOSOmn/F7W11nXtjEZTffdQ1hipbpJV
FDho9pflIt5d/zBqzidGsyg7asSYVy2Floc7Dlnd+nLDbH/E+EDKTrVa+W+fdmM0
yuisyQp9Z1lVlSVFn31qS97UYUZkqRHWz/nMHiI4X6J/dMdpwM5kckL98Zft1vEY
HW+sUz4zelVQaZyhjsrRKiidYqcjy69dkO2Gach7iQv7+9ngHHI=
=XBi7
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
