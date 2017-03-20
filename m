From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/7] Tegra210 clock bug fixes
Date: Mon, 20 Mar 2017 13:59:18 +0100
Message-ID: <20170320125918.GC22463@ulmo.ba.sec>
References: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1487846686-6388-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 12:44:37PM +0200, Peter De Schrijver wrote:
> A number of bug fixes for the Tegra210 clock implementation.
>=20
> Changelog:
>=20
> v2: add better description for 'remove non-existing pll_m_out1 clock'
>=20
> Peter De Schrijver (7):
>   clk: tegra: fix pll_a1 iddq register, add pll_a1
>   clk: tegra: fix isp clock modelling
>   clk: tegra: correct afi parent
>   clk: tegra: remove non-existing pll_m_out1 clock
>   clk: tegra: don't warn for PLL defaults unnecessarily
>   clk: tegra: correct tegra210_pll_fixed_mdiv_cfg rate calculation
>   clk: tegra: fix type for m field
>=20
>  drivers/clk/tegra/clk-id.h               |  1 +
>  drivers/clk/tegra/clk-tegra-periph.c     | 13 +++++++++---
>  drivers/clk/tegra/clk-tegra210.c         | 35 ++++++++++++++++++++------=
------
>  drivers/clk/tegra/clk.h                  |  2 +-
>  include/dt-bindings/clock/tegra210-car.h |  4 ++--
>  5 files changed, 36 insertions(+), 19 deletions(-)

Applied to for-4.12/clk, thanks.

Thierry

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP0iQACgkQ3SOs138+
s6FUpw/+NH+zuao/5qctvhWnaUZNZUbfmAzwjL8WXsk/u+IMg5/xepOrnmFHbe5L
68CxBowSPC79r8FB2Bc34mo1iU/F+/vz2mfofOuoN7g05aC4Q9Ki4lRupSie+hpu
Y5i2GV1TEdcMYW2UdMWXKh8R7ptJtryYJW9ZKiuSHV/lOrnKOMRTTQzzPEHX2DBA
CtqQY9Px2Bc+JZbRNB1jOQbqVWwxgmUfJsZmXVyN3JmsfJO1MOcAfccVAPqjwL9W
6Ls7pC2GDDwqv39Qd1gIWSL7HCfAf2RSlFYdUBVjk7vJN25csIeqJZPq0SIDd/B/
jIYL+8zJwumivA1Vs9deGu37WUgGN1MOAe7XDGRmJJG7IOiXxg6idj01S8Uqrp5Q
okorjohXlAyp1DYzNiPO3J5PeootofoOTqb6hLKOzj1i8gETkIb8MSSqG7Y2oQCw
xZB/iKG8lzUGiVUnRlzqH6z36tIu4Bbce5L/lAfOKzAlHeb8zLh1x9xIQNjm/sdh
yf+s0/myROuEwXwzZLoF4tOTX2g5PFWT1xiEqwcttNn5XSQJBMEH5fjIwiaLZtdk
Dx0BsvQC9Vw1g0UiJWP2HpL6DIEBSf/7wB//gwdDIobT+zpiQHembpyac/TZ5iSC
oKmE2AXA6/lpHqvo2uINCjVshuWQKkkmv/z3lkCJg0Ncx3PgNyY=
=LrXj
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
