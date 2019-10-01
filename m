From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/3] tegra: use regulator_bulk_set_supply_names()
Date: Tue, 1 Oct 2019 15:38:07 +0200
Message-ID: <20191001133807.GB3563296@ulmo>
References: <20191001132333.20146-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rJwd6BRFiFCcLxzm"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191001132333.20146-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-tegra@vger.kernel.org


--rJwd6BRFiFCcLxzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 03:23:30PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>=20
> The regulator_bulk_set_supply_names() helper was merged upstream. Use it
> in a couple tegra drivers.
>=20
> Bartosz Golaszewski (3):
>   ahci: tegra: use regulator_bulk_set_supply_names()
>   phy: tegra: use regulator_bulk_set_supply_names()
>   usb: host: xhci-tegra: use regulator_bulk_set_supply_names()
>=20
>  drivers/ata/ahci_tegra.c      | 6 +++---
>  drivers/phy/tegra/xusb.c      | 6 +++---
>  drivers/usb/host/xhci-tegra.c | 5 +++--
>  3 files changed, 9 insertions(+), 8 deletions(-)

I really don't see the point here. You've got a positive diffstat here,
which means all that churn is without benefit.

Is there some subsequent work based on this that will actually improve
things?

Thierry

--rJwd6BRFiFCcLxzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2TVr8ACgkQ3SOs138+
s6Gmxw//XyHpBaZ6nH9r5G6qR4tc5ltdQB1dqjsetQiQ3GP40BUwO9mtMUUgcfI/
rdgUFAuLtiTH5m5XHYyCmBIWHi38bwTStJ4x0f7zg7IAfabhlRrTDPsaUSJuN+tt
JL5RYKy9LjGIt8B3FusJWBgMMhAhmLf4vTTBqMRaK1vAd7XFqz0LAz+weUs11aZ8
gauUBP2qZ6n+lL5ahAStY/0GC9gos1iNzgsvG6tZD3JyWQe6xwKvrroSq+s/iQUL
V00s28QIe+zsQMl9f47mkJoAY5d55heIehG7oaYWPYsJS83yeHlW7YRi+CseyZwa
o8ZSi3FqILEuO+yjH+h2nD8bpKltfhBwi4VUzn0sFAzz4btFkt1J0JYClKpF+Fwx
msvSehNfgZt0JDJaQ6ACCBEVkcfCXe0pXX8BwLYW83V9gKWnklf97DKvFKmg4HMd
/2JeVHouwG20VkQcjnYBTOpBv+08DKG0D19ZgviHnibUeTTu6mlpbCD2T6DzkLUE
mGInzNLfgLfflCSeOusBazYQGy9DrGNhqGpnREXDY8NwZEUyA1EkHSl6BCOc6RaI
VexLVXa11R0fNZRNJk2H2/MU9H/MWUUC+jRJQ+4X/ScGYtWjkJSe8LJ0KmgA2/5/
gmqCqriJyFLot6c/z1kmNoSo2q2iedr7i4XKaUKrnf28LTQlRxk=
=aSWM
-----END PGP SIGNATURE-----

--rJwd6BRFiFCcLxzm--
