From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/9 REPOST] Tegra CLK Fixes
Date: Wed, 13 Jan 2016 15:05:16 +0100
Message-ID: <20160113140516.GD15782@ulmo>
References: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452278714-10751-1-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Jim Lin <jilin@nvidia.com>, Benson Leung <bleung@chromium.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 01:45:05PM -0500, Rhyland Klein wrote:
> This patch set fixes some issues found with the Tegra CLK drivers
> in testing. There are also a few patches which clean up the code
> and fix some naming issues.
>=20
> Resending with correct email address for Mike Turquette.
>=20
> Andrew Bresticker (1):
>   clk: tegra: pll: Fix potential sleeping-while-atomic
>=20
> Mark Kuo (2):
>   clk: tegra: pll: Do not disable PLLE when under HW control
>   clk: tegra: pll: Fix PLLE SS config
>=20
> Rhyland Klein (6):
>   clk: tegra: Fix divider on VI_I2C
>   clk: tegra210: Remove improper flags for lock_enable
>   clk: tegra210: Fix naming of MISC registers
>   clk: tegra: Fix the misnaming of nvenc from msenc
>   clk: tegra210: fix pllx dyn step calculation
>   clk: tegra210: Initialize PLL_D2 to a sane rate
>=20
>  drivers/clk/tegra/clk-pll.c          | 50 +++++++++++++--------
>  drivers/clk/tegra/clk-tegra-periph.c |  4 +-
>  drivers/clk/tegra/clk-tegra210.c     | 87 +++++++++++++++---------------=
------
>  3 files changed, 71 insertions(+), 70 deletions(-)

Rhyland,

This looks like a very nice round of fixups for the clock driver. I've
replied to a couple of individual patches where I thought things could
be improved a little, but they're mostly minor things.

Thierry

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWllmcAAoJEN0jrNd/PrOh/YAP/2k6jUcN+5Of8iCkEfPEfQ57
8A6KY8J1pXX5ch+BvBAlgLGi63NXeqxDU6mCWQeYPpfcZSH8LYh28IY0XHs+h3cf
hRPk1rkvY1XjJqbP7UhQvFUJqTc7oX8rs5O1OWhfXHCAbAtE5YuaYQtWL8ifZEU/
YIiL+rf2HrU3W/Qq1hS3b34mGTCNi/rBRx46FnpTw0LsOZhcNeYr0CtYbXnxdLLl
lAd4R69FFx7K9gv5Qv9VLdJCyTGhQYNGpg9kWv2xyU2P6Qs+pcK0allBKOz/b5qh
sMJk4g13Zg15SJcXfAQRaFC8dvJKFFrkEQlh/LY55Wdx9jgygkjBffRQ1z7srXPw
XIL928JL0FRBuowUBr5CL/6haCMWl//vTpPNpXSLmy4Av1N85vjjMvjnbG6xiFHD
//dTg8ZE3lgHNZvPRFfC5AitILo54iOrHssB1VV1gVipRDOmXTmEfYl4kNBOx0vV
sb4IgXjl8UAU5UVcWtT1TNNSnNfS4xUBlckHpQSzuEKm+AzVDSvESLl4Sq7nXWJg
IS7wwnCUSEcfKcWb6KcOhidlrxVBirRvjYDcIrvVFRrqzc+MrIVycW6xz31/+2xs
sq9/fmn+cKTV1rIPHU8xZiv1LPMALbJWOyRQzIwe6JK73dyGlY0zpiJFh7KC7YmG
5hEC76Dmap2hTFKG8dkB
=JL/M
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
