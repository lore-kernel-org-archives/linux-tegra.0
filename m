From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 1/4] thermal: tegra: continue if sensor register fails
Date: Thu, 8 Nov 2018 13:48:30 +0100
Message-ID: <20181108124830.GF1340@ulmo>
References: <1541410354-19090-1-git-send-email-wni@nvidia.com>
 <1541410354-19090-2-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CXFpZVxO6m2Ol4tQ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1541410354-19090-2-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: daniel.lezcano@linaro.org, linux-tegra@vger.kernel.org, rui.zhang@intel.com, edubezval@gmail.com, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--CXFpZVxO6m2Ol4tQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 05, 2018 at 05:32:31PM +0800, Wei Ni wrote:
> Don't bail when a sensor fails to register with the
> thermal zone and allow other sensors to register.
> This allows other sensors to register with thermal
> framework even if one sensor fails registration.
>=20
> Signed-off-by: Wei Ni <wni@nvidia.com>
> ---
>  drivers/thermal/tegra/soctherm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--CXFpZVxO6m2Ol4tQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvkMJ4ACgkQ3SOs138+
s6H76Q//Xl61SgcHlWOlZTtGrUdMtSNgfPSxn9NLzx3+40d9/xBxl0n8wTxLFd70
+YBiZQpltYL4Q0riq5NbWTpdCJM9ji6Jevv1Digf22YNb4lh3S0uicAdePry1nZ2
OuTgZZYSRlHY2wRdzUphauVj3M3S4l/A1KKmln1DHIN61zF00Fo1GEBFMrTsdFHb
Ypb9unj+HqTk2qOnoXqN9Gl9VwyBs3BRPiv45VjzkYFyvJi/6+vbHlbb5faM/u4b
bcezKerELV/TiGt41E6eumCSr8y6/mMJH7kpAMNZ7sKORKQih5bBHrDHZkfmkKcf
OaZv/I0UmRkmMehSncB37sP88YhPr8HKGJHV6jXodm9x5wmDdSb2PM2SjQFb7CBR
uCbOVu9cMAFIDVWeHatc4KGyLHNjZzq8ImP2qHFSDchBObsI/0Xg607M48EYryYv
LQrJabHQtrbSpaUr4giIoWAbcbUfQcgc2Gjt31qZ/1f1PLI3/V5IE2EGZgyH1DZE
0u/+kSzQPsLcFPvyTZyESUPwxaln3BYAGW+RsDip1jgunGCBSOIvtV933qhB6bDC
NoG4VWN9X13WAlZWyoyJ4DRP7E/1iiF0kKOjQWsNOpHGjZBn4Y18U8FONDWtyVk/
TVTsUwWcnXVcqOx6ndK6aqh1ba9Zuv/vSeH5dCVG0k+WkwhenW8=
=TVwF
-----END PGP SIGNATURE-----

--CXFpZVxO6m2Ol4tQ--
