From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] soc/tegra: refactor soc_is_tegra()
Date: Wed, 21 Nov 2018 16:28:47 +0100
Message-ID: <20181121152847.GB7739@ulmo>
References: <20181121141204.22819-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181121141204.22819-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yangtao Li <tiny.windzz@gmail.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 09:12:04AM -0500, Yangtao Li wrote:
> of_find_node_by_path() acquires a reference to the node returned by
> it and that reference needs to be dropped by its caller.soc_is_tegra()
> doesn't do that, so fix it.Call of_machine_is_compatible() to refactor
> soc_is_tegra() whcih automatically manages the reference count.
>=20
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/soc/tegra/common.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied to for-4.21/soc, thanks.

Thierry

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlv1ea0ACgkQ3SOs138+
s6GJJBAAqLw9PQzOAQwOvTTDIJFN6uCAZ6UBLfOFwDT0jnqGwjh1SWQyfDwHb+EA
3CXMRu/GaPUxnmbpM6ZtQGtk4na5tbbc2Uvd1Hk2Mqb6esabqBj39nIP8F1ruxiN
BeDBlWpOBMs1MWM5aWXH1OenPs+fob7qpiQdmH8xI/cFEXpP+ZpapmRV+iJs84in
MlvGXDR1bB9XK1f6eocdKY9Lbzol6uP6X1TmeboI8PVJSzyanQmhXWJ7bEc+sGAx
MIWBCjXnzUyzSFIh/7HsKKCq8/yjnVW+aaKOn5ZN9kwHWkttj1z/n0y1C/+KEt5L
2SdwhxIEodVwmayv9EBxyy9cor6yE06IhaSTAWi0B9LM4qDDsTTp6FYqMJK5JjbM
Lp+L2hv2S61VTCgOCzlIi0MIBUZde7xvG04pOzcdu/OadXOE9td+TRVSU6FdGzVH
BxH184rEMTS6O53U7/uPi5E37nGNpfPBBcGWQW9hNAhNQfvK5fW/tS9puXhI0cH/
4Q2jaReUxjdtU457zayjzL3Rtl7WI3aTCwelmHeo/TGz+3KPmdVigrLpmkubeZHF
a/4YsUwSyYOBoGHX9MgO2ZiZ62gq1sg3jtog59DePJilx7kCv/YTScWnlsHGNvaQ
xT/XQbyKUEIx5G8sHmWaYAPR/o6qEP9Dxz6P0Woys2dTzC/aVKs=
=pOBX
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
