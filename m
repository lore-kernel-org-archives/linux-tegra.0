From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 4/4] usb: phy: tegra: Use relaxed versions of
 readl/writel
Date: Thu, 19 Dec 2019 13:55:15 +0100
Message-ID: <20191219125515.GC1440537@ulmo>
References: <20191218175313.16235-1-digetx@gmail.com>
 <20191218175313.16235-5-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191218175313.16235-5-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <Peter.Chen@nxp.com>, Jonathan Hunter <jonathanh@nvidia.com>, Felipe Balbi <balbi@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2019 at 08:53:13PM +0300, Dmitry Osipenko wrote:
> There is nothing to synchronize in regards to memory stores, thus all
> readl/writel occurrences in the code could be replaced with a relaxed
> versions, for consistency.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/phy/phy-tegra-usb.c | 195 ++++++++++++++++----------------
>  1 file changed, 98 insertions(+), 97 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl37czIACgkQ3SOs138+
s6HYyA//d/1tMFLOizTJ5NnTpWkjtiUdrRlwYMNo/u6A/FKCJfC8H45BdEmbGp93
b3W6VSuopFceXr1umc/3Fagd1Y72DRxSyazQcuFIDuoJ6d5MkGLEnpjZghyHzy8H
vIcsZwGWYC8VIS/rCTiE8PFt5cV6vuR16+CU2dACu2p0AtX3NfDuq+FgjzezwAxh
owUrtO5fJuedGYH+AAKG5hgIPB0QzCNtNEBBF56v0qbeRg5dnE/iVQIzKMrAzRYa
MQjEyGVztCB+jKuXTd5tJBXrGOtOLrzt/xHfizoUgO8SBqXCjvuFqhxBUtAFpwEO
KAX10NN1+LZAxim4i79KuaHXUFWWUwn7nJMncSenseT3BeVaMXq7gS2TjPSVA7te
GP85v00Yn32nSCB8Ez2t77ZHkYvbIlPKJmee3xL0KQkVO7UiqJns8o5A1BlFqRoU
4Wu1Rsg4uRiGO4i4XAxxOlZQBTYgcSw14yIIhxjH70/FQFRE99iS3e1gxAafHeCt
B3vKLILj5RQ96FGkDgdJLoZOCm8VVjN8UH6NNwU4OtG6hZptgSbm8DAy+D/qb/uM
kA3Xy6vFqTzkP1tZv3nIDN2Znc5v0xMmr8NdbX2F8fZ9W3NobiEt04KqYFAx+dH1
4phVoIUA0q3Cvr6lK5Pph8VRzrH2B3eUQVT4UGtdtSeZfYdgM4E=
=MWun
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
