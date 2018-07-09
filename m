From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v8 1/4] ARM: dts: tegra: Remove usage of deprecated
 skeleton.dtsi
Date: Mon, 9 Jul 2018 18:54:05 +0200
Message-ID: <20180709165405.GA26651@ulmo>
References: <20180709160519.23497-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180709160519.23497-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>
List-Id: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 09, 2018 at 06:05:16PM +0200, Krzysztof Kozlowski wrote:
> Remove the usage of skeleton.dtsi because it was deprecated since commit
> 9c0da3cc61f1 ("ARM: dts: explicitly mark skeleton.dtsi as deprecated").
> It also allows later to fix DTC warnings for missing unit name in
> /memory nodes.
>=20
> Compiled DTBs are the same as before this commit.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Stefan Agner <stefan@agner.ch>
>=20
> ---
>=20
> Changes since v7:
> 1. Remove adding of chosen and aliases (suggested by Thierry).
>=20
> Changes since v6:
> 1. Add Stefan's reviewed-by tag.
>=20
> Changes since v5:
> 1. New patch, split with skeleton.dtsi removal (suggested by
> Stefan).
> ---
>  arch/arm/boot/dts/tegra114.dtsi       | 8 ++++++--
>  arch/arm/boot/dts/tegra124.dtsi       | 6 ++++--
>  arch/arm/boot/dts/tegra20.dtsi        | 8 ++++++--
>  arch/arm/boot/dts/tegra30-apalis.dtsi | 4 ++++
>  arch/arm/boot/dts/tegra30.dtsi        | 8 ++++++--
>  5 files changed, 26 insertions(+), 8 deletions(-)

Series applied to for-4.19/arm/dt, thanks.

Thierry

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAltDkysACgkQ3SOs138+
s6HqOA//QmEj+qn0rD3Jw+uLZyLCsVsTFSI9mMUK5jBELy9LS1YNgKskKlYVavtD
8XDhU46rWmGlsE7WcJVKbdTlvYHNGvsvtczZ0D8vdSOhmjgyP9nOr4uI8+sCCyXD
xa4H2sHqn66AJQHNOCcqRiuXL2Bee6V4Qd84J0xnyabeF/cXqUDkBzkU9bryzFNk
SVGhjJaUAaBvk/fazY5ZwkJX3iSyhqXaeMw9deIpMDfV+zdOiC4nBHygQJkwXw6G
ziw2N67k07s6VI/9FX6i78GGX1dfA7iayVcTyv5AFPs5pzkttkndVciIU98Dy2cF
PZu6uC52V7DeAReFCCmJOVjKiqptaSqrSOfcwBHRif7y2Rr4sZJ7g1pY0uvR4WLy
iEleSu38QI2nZu0lUVTDeElki/3fhm6/9/I/DyGaz4am8eMhWIENodSsxbqYL8FE
ZaSxHwjTkNY7LMimEWqN1E0cmRnpOj6tthdEiPLu1uvv3yKfs+BESJ8nF1pJ7zme
o01oYlOe8OSSDkFMzAUFauN9L15pL5xOY9p2M8Qly8pUgdl79SuKDL2LnQ9gEgv7
X9sa5a4WvVfQS1Aet0lmdSaOw2TORVVVmYD9/xAQrnaBHPPK1LdPJjAgmOaoMPxh
EhryoTz7OCY/v2bJF8qicVjoREgNBE6GzVUDYaIQ0B/c3RmdRTA=
=3PJ3
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
