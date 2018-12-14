From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 4/4] thermal: tegra: add get_trend ops
Date: Fri, 14 Dec 2018 15:19:46 +0100
Message-ID: <20181214141946.GE23379@ulmo>
References: <1544780993-20744-1-git-send-email-wni@nvidia.com>
 <1544780993-20744-5-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="so9zsI5B81VjUb/o"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544780993-20744-5-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, srikars@nvidia.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--so9zsI5B81VjUb/o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 14, 2018 at 05:49:53PM +0800, Wei Ni wrote:
> Add support for get_trend ops that allows soctherm
> sensors to be used with the step-wise governor.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--so9zsI5B81VjUb/o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlwTvAIACgkQ3SOs138+
s6GvehAAj3hJ67iBueGgi+r4pzZlT18hh8Yw6bN1Q7/zyNk5tfSOzXZjcwDwSuOG
ILJKyHg9JXerfl1RDmlu08pcAUoNbP79K231Nv5PMI0fLBxqyRl6J7BfozPAjlNf
8xfT/oJV3P2F+TVeDXg7uwCDfENdiBVYi8e03ist/CZXgwLamTKF6jWwdgShMHJr
m0NAULfQecomOwqXix/fKH/o3xv8BUPzJFGaA1g82L77zIflnifWNIxIu0Wswpmf
2wHjUOkIoWmC8KwSc1gP37O5BNDpMFgvMnRWImcqohH2hgCU5T22Lp+r4LGFWzdL
+0LDoJo0IldnpDf1opoTyRE6ofFOKwOKM3G7uHd0EOfexChZZU2kde34MATMXLFE
a8L7hMNuNZsYawjQsjrd6f0bIbzhk1KRowmKI5nK30pgd0VlTrp4NIVTZ9TIsRLV
9Es20BVQj+OIHfnoaOHc9nclOcNsLRl3yx53FCa4WTUKnbbUpICkOEjnh+anHeOV
aMHBr4m1yfedEl2DCAHdFU5Ot+3DS2bSw95woiisqt1pP2hjXB5Jzh3oggvHcwz5
svuDIrrVrHqldc+qBdvHh4Rd6UnmgaUJenKCuZDvv3boO2CrV53MThqL97do6N4e
TS6xsbFPyHL2FCKSzJQiQKnHWht11VXrnt1GR/R7c6J92BAcS0E=
=mzu0
-----END PGP SIGNATURE-----

--so9zsI5B81VjUb/o--
