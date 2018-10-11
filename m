From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 5/5] arm64: dts: tegra210: Add power-domains for xHCI
Date: Thu, 11 Oct 2018 18:51:37 +0200
Message-ID: <20181011165137.GE7393@ulmo>
References: <1538143910-24400-1-git-send-email-jonathanh@nvidia.com>
 <1538143910-24400-6-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6e7ZaeXHKrTJCxdu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1538143910-24400-6-git-send-email-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--6e7ZaeXHKrTJCxdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2018 at 03:11:50PM +0100, Jon Hunter wrote:
> Populate the power-domain properties for the xHCI device for Tegra210.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Again, if somebody wants to pick up the series as a whole:

Acked-by: Thierry Reding <treding@nvidia.com>

Otherwise I'll pick this up when the rest have gone in.

Thierry

--6e7ZaeXHKrTJCxdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu/f5kACgkQ3SOs138+
s6FGrQ/8DB6xrcailVBQ2ScrstfYyLF/r+GdjnB0TzC/eYoyErsFJrUFmZgy1Pa9
QKn6yndbgroYW+DkK3Jd65iedVM3fY8F40qyWVTyR3NCLvIlwnnR7oevJgr4CzCD
NUqbCrPmgNMCnQgiH+Q443go6eapWq5Uf5xUCYq1QOfWsxJ6hWTXp3g3VZkQWN5L
vhBG1USfkVUghja2WeIJ9j4F/LdTj0RYlIEbDEy+gIOlRrD87oRUS2K1AvD+o6py
EvuTqROGf0wPXYuQYW07Q/8LybC/OHRQS5LGYk1LRim0Q+yGun2QcSI3mxWDG74H
2UTFyl2IiXKzTfpy1vYeIPcVAVMKFbP27iUUjUlUYZcDeIXx6tcTRPpKdy+liOH7
/drEasfxvxnnPeq0MwBs1VrPYwDBIPf0rR93zElx2Pjh++mR+9kj69uneo6uO4NX
pJJS58Zq9KTKLLTERV/9r0KBwESe6DCWpzRxge2v11y6iciOlhoT1rjaSm9lKQpT
PqT9HNtsfDuiWh1zmDXDm3AlRGtzODp0kymdQjf+yuxFcumHZCay0cL6vfhs2+d1
VHpMxLtk+mYvydUEKvh8D1w98Q33fY9D2DE6yIWPsBvHrdNcmVxhByiW82Q7av/H
cmkr0ozLe4PppovASA8QTd9OMEUjWJKDqL7tj3igcrGePhJJ5Hs=
=5cGk
-----END PGP SIGNATURE-----

--6e7ZaeXHKrTJCxdu--
