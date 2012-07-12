From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH V2 1/5] i2c: tegra: remove unused member variable
Date: Thu, 12 Jul 2012 11:51:23 +0200
Message-ID: <20120712095123.GA27520@pengutronix.de>
References: <1341920421-23511-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1341920421-23511-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: khali@linux-fr.org, ben-linux@fluff.org, swarren@nvidia.com, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 10, 2012 at 05:10:21PM +0530, Laxman Dewangan wrote:
> Remove unused member variable "iomem" of the
> i2c device structure.
>=20
> This variable becomes unused when converted all allocation
> to devm_* in following change:
>     i2c: tegra: make all resource allocation through devm_*
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Applied to next, thanks.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk/+nhsACgkQD27XaX1/VRvGYgCfel/pQBhHZJ7c6Z5AfLmqNEzO
NWwAnjVIIOa7L4A7VUvxjC8r/lEKRqM/
=W9HW
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
