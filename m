From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/14] Fixes for Tegra clocks
Date: Thu, 17 Aug 2017 15:31:46 +0200
Message-ID: <20170817133146.GD6854@ulmo>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2017 at 01:34:01PM +0300, Peter De Schrijver wrote:
> A number of smaller fixes and simplifications for the Tegra clock
> implementation.
>=20
> Alex Frid (7):
>   clk: tegra: Fix T210 effective NDIV calculation
>   clk: tegra: Add TEGRA_PERIPH_ON_APB flag to I2C
>   clk: tegra: Re-factor T210 PLLX registration
>   clk: tegra: Update T210 PLLSS (D2/DP) registration
>   clk: tegra: Fix T210 PLLRE registration
>   clk: tegra: Correct Tegra210 UTMIPLL poweron delay
>   clk: tegra: Fix Tegra210 PLLU initialization
>=20
> Peter De Schrijver (7):
>   clk: tegra: fix SS control on PLL enable/disable
>   clk: tegra: Enable PLL_SS for Tegra210
>   clk: tegra: disable SSC for PLL_D2
>   clk: tegra210: remove non-existing VFIR clock
>   clk: tegra: Init cfg structure in _get_pll_mnp
>   clk: tegra: change post IDDQ release delay to 5us
>   clk: tegra: don't warn for pll_d2 defaults unnecessarily
>=20
>  drivers/clk/tegra/clk-pll.c              | 159 ++++++++-----------------=
------
>  drivers/clk/tegra/clk-tegra-periph.c     |   3 +-
>  drivers/clk/tegra/clk-tegra-super-gen4.c |  11 ++-
>  drivers/clk/tegra/clk-tegra210.c         |  32 ++++---
>  drivers/clk/tegra/clk.h                  |   6 --
>  5 files changed, 67 insertions(+), 144 deletions(-)

The series:

Tested-by: Thierry Reding <treding@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlmVmsIACgkQ3SOs138+
s6Gljg//b4nfJGqb694iH74wfKNHX0s2hm1Iwh1XC1MWcCRFwKMOI6mQEOpvnEy9
C/r/5NoIZhtMoIqaM+/KSHUaBdcH+mNyh9t8OxtEYSUw9IDxtLE7gNTu/JFwhGBV
tuQNwIMxDkTm7vqPv40Cra4GkWk7ktX2JQWXYPFYp9wzJFANZ7W+wvYfPEnkDJfr
yv6/UIuEmBTzasC5AzNFfJ8n4yRcG5is34FvuNq4pch7gt4DWmAr9sKQwnA0eGyg
VE3Y2+iJ67av0Rwww54f9uL54Zw0mCEc1h+NiMn2BA1ThxIcb5pLwH6sJN0eOsyY
LMwKlmQ8yNqmbuFQtfmBmcB+ON5UT6JBUK8wDXUMb/GbN9i2dmaqjoXWO1yyXY5x
5hH7FIvk/Zy/hdQ7Y3YtkpwLQCWYlu/GE7mEEG543g5KiRM+VbTbKJ59FhK1b6fj
EFpH1WomdCxQI1exueL9bJgv1smL7hyDu2pZUD6HCaeSjgyLBiPk8t2xE34lVyNQ
a6RQU34tAxeZa4VCmTFoDaCGhWkmHzOepetDmQRA8wafdX0VZOkt5cEttUo3AHsT
hRLmj6c0QoCqZUcs5sglQ71PEuVenU+85tZ4FMOSAhjRh2EZTqj9QSUccV9Nmkjr
BWmD2SIDbhiiTeUbvjpDejDM8tNfuccP430XApXxWKiGId27R0g=
=3xVS
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--
