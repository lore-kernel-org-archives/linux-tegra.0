From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] ARM: tegra: tegra20: Fix mixed tabs-spaces indentation
Date: Wed, 26 Sep 2018 17:08:28 +0200
Message-ID: <20180926150828.GI12980@ulmo>
References: <20180830172153.20653-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fmvA4kSBHQVZhkR6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180830172153.20653-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>
List-Id: linux-tegra@vger.kernel.org


--fmvA4kSBHQVZhkR6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 30, 2018 at 07:21:53PM +0200, Krzysztof Kozlowski wrote:
> Fix indentation and alignment when spaces were used instead of tabs.
> This fixes checkpatch errors like:
>=20
>     ERROR: code indent should use tabs where possible
>     #306: FILE: arch/arm/boot/dts/tegra20-paz00.dts:306:
>     +^I^I         <&tegra_car TEGRA20_CLK_PLL_P_OUT3>;$
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>=20
> ---
>=20
> Changes since v1:
> 1. Add Marcel's ack.
> ---
>  arch/arm/boot/dts/tegra20-colibri.dtsi | 2 +-
>  arch/arm/boot/dts/tegra20-paz00.dts    | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thierry

--fmvA4kSBHQVZhkR6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluroOwACgkQ3SOs138+
s6H7ZRAAs/BNgDpG8YDi1HtViiLhc7rFDXqg0c8zCwStL+3kmp1jLlcaL6w+6ce0
g/+CnvXt+VeNBxgoMGMip4GIDH7usOqKkpzbdl8H2xPzDKIQTX2cwbu+LhP0N6zK
I1D9rdDANwWVwdoGbT0Be7mlSqQQ+wNggCOH0Yq1zr0CrJAu98R97uMHAE2gbtGd
20OkTLhgNHXWjfBoPrO/PYOqu+AiAcDDsqf5LSnPPET+4/pvSWSdXbjvKSvePdh7
jBxDma9trLzUG0Mm9d4AFe9bv0ycYrYMKekyqViHj3uEpoFcFCnH4CR/e0jfBPBR
r5Voo5lZI7knwwLhpRCWGojJAqC8+iqwNutzNYBZaboM+oI75v7iGZYuMls1v2FG
5DpNGnW8kg4qGx8Ri4d5jM75kguZWnYa/Bkl/Y9s8zobxQuUhGfi1pWMYS+P+JDp
19F0QhOZPQEqxP9IhSP7G+Tp4B6cBs4zOzHpN/5o4ebmGwI8GeiSskib/Wd6BaA3
iNQ62JcmIFU+Rz2kltWc8fP54N8J1cp1wkqgPDo6bJQBLQLgW9Hb3AGLsQQvsaGW
ISBgIsMgJFJ7hp9vdl9R4SuqnXYYbsiitnj2TwUH2Ia8hJuH+YBme/49koaU/Msh
Bx5RXTX66Hzd1ZlEfTrEAHWgHgT1W4ysuAS49b61HHJRtKG3SzU=
=gOMv
-----END PGP SIGNATURE-----

--fmvA4kSBHQVZhkR6--
