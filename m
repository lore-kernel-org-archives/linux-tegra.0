From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/6] Add missing Tegra210 clocks
Date: Mon, 20 Mar 2017 14:08:25 +0100
Message-ID: <20170320130825.GD22463@ulmo.ba.sec>
References: <1488292648-16876-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NklN7DEeGtkPCoo3"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1488292648-16876-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rhyland Klein <rklein@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--NklN7DEeGtkPCoo3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2017 at 04:37:16PM +0200, Peter De Schrijver wrote:
> This series adds a number of clocks which were missing from the Tegra210
> clock definition. It applies on top of the 'Tegra210 clock bug fixes' ser=
ies
> posted earlier.
>=20
> Change log:
>=20
> v3: fixed compiler warnings
>=20
> v2: fixed a few useless lines moving around
>=20
>=20
> Peter De Schrijver (6):
>   clk: tegra: add cec clock
>   clk: tegra: define Tegra210 DMIC sync clocks
>   clk: tegra: fix constness for periph clks
>   clk: tegra: define Tegra210 DMIC clocks
>   clk: tegra: add super clk mux/div
>   clk: tegra: add aclk
>=20
>  drivers/clk/tegra/clk-id.h                      | 10 +++
>  drivers/clk/tegra/clk-periph.c                  |  4 +-
>  drivers/clk/tegra/clk-super.c                   | 87 +++++++++++++++++++=
++++--
>  drivers/clk/tegra/clk-tegra-audio.c             | 85 +++++++++++++++++--=
-----
>  drivers/clk/tegra/clk-tegra-periph.c            | 22 +++++++
>  drivers/clk/tegra/clk-tegra114.c                |  1 +
>  drivers/clk/tegra/clk-tegra124.c                |  1 +
>  drivers/clk/tegra/clk-tegra210.c                | 20 ++++++
>  drivers/clk/tegra/clk-tegra30.c                 |  1 +
>  drivers/clk/tegra/clk.h                         | 11 +++-
>  include/dt-bindings/clock/tegra114-car.h        |  2 +-
>  include/dt-bindings/clock/tegra124-car-common.h |  2 +-
>  include/dt-bindings/clock/tegra210-car.h        | 13 +++-
>  include/dt-bindings/clock/tegra30-car.h         |  2 +-
>  14 files changed, 223 insertions(+), 38 deletions(-)

Applied to for-4.12/clk, thanks.

Thierry

--NklN7DEeGtkPCoo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP1EgACgkQ3SOs138+
s6ExFRAArpqwGFG07p0hyU3po5I7Sz0oqb+K/+8tre8JvW8JyK/5XQljU5sulvdf
lkhDSXNFzr9tprBixr2LZ0E7+4nPhHPn0EhQ6LH+6imAygqxpIgjwFxA+OqIOmEd
u8wvF4Unc9UXdKkN20JpJ3Rr1iX33YWMFukhWumyYI5WNl/LugNgeeeNaAiTDyZB
clu6D8DVrDd7au8D1rwfrAQFt/5SFVfAQLP+MJDQxVI8rKFT8dPnafvpgRGVBtip
AfUNYBRG7ubrp9V9bOlgwWjpHVtgQDGg8Fh7snLvGMavVFYUYQz7SV4F38MajOIf
WXqbyQpXzGHNPeBqsvJT3oHO+f0o5fY3RP1kUUKnhxA1EvX7YVv+2qRX0paZ7dgA
skyZ4tKWD0iVqx3ZsiiAk7WjU0TzZmpGyCVT3rF9huhjyGO8wIbWbM5QDbanmUB/
rvX+6fjDzyycgOvm65MVq7SteC0P9EfiInpu5TvCQfUcKLYDUZACpq3JT++QKKpW
MXGUVfKTSZLNLlqBtyUvMgrUfWggqbNOMTsz8wP260j7TR/6Alyvu3hKRPVakN7I
FM1RrJCBidgEQS2uU4me5qz4PgFFMn3pukME8bo1HB+/+g7RX64BH/Q0XhIQo6D9
Ri3+3oPs8s4ucbdZR2DJPDI4oZXsGY9Px7gcc8Yx6bPsJPiEtdE=
=UWQr
-----END PGP SIGNATURE-----

--NklN7DEeGtkPCoo3--
