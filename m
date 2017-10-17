From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra30: make tegra_clk_pll_params __ro_after_init
Date: Tue, 17 Oct 2017 13:12:49 +0200
Message-ID: <20171017111249.GA32653@ulmo>
References: <1506975128-16514-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1506975128-16514-1-git-send-email-bhumirks@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: julia.lawall@lip6.fr, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@codeaurora.org, jonathanh@nvidia.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, keescook@chromium.org
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 01:42:08AM +0530, Bhumika Goyal wrote:
> These structures are only passed to the functions tegra_clk_register_pll,
> tegra_clk_register_pll{e/u} or tegra_periph_clk_init during the init
> phase. These functions modify the structures only during the init phase
> and after that the structures are never modified. Therefore, make them
> __ro_after_init.
>=20
> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra30.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl5a4ACgkQ3SOs138+
s6Hk/w/+N84Uj4xl9gBsCxlx2RkILST1b4kNGRa/d4TMw/cKnrmjUD06poP2uC7L
4HI07Lj5nzKTniEF87Vtfxa1675PVDRSP5WG0nbYBZlbnsj903lP1dSGzA2u+Gfx
TxaH/7FzVza0xrKU5lVqPULxXTKGWndPhC1CwxVGAAFyH9+fvgFH088Ghem3ci3b
dWISCT2mBtyrEan2Bi3oU5dySLkH/mCy9yVdO/rmPx2tFDSL7BLyKhvlmkgpyXVH
thqFJRnJ2f6uBMgt5HX/pB071nbcDZdS4hjJuVUzp4tnNwNJpZGQL3yZYqNHbysV
9WxNGk5VcwE4Lk/wVpdZcZ6C9MiLgqvyvrR/d7MdsRjWRiLR2R5C9/Js9ft2p0Kk
tqhVwqHz9QLijy3HQGJCqMhr8KmxfGubNmoC8udJek/4MIsCL95sXiNUQEu60sWC
XYlGHu9NLT9lg6JejB9/RrrcttBeZLkQMPR4sEn67RmJXKjDOzX+EjxNRQfDjQfH
V8E2aNfh81syBNAWzxSkTsx1xj+SNOetG3YiIOtCUam/HcOMCdlhfHtc0gDhfgAn
pjuKNyJBhF9jd3y72tZ+y9oEGGodMCtmCxiu78fgIY8O9k9PABKPvfa77v/2V09L
IBZrsdyWwpT7BRumvc8fhx0lB1kmRXmPDM+bJv7enZ+jI0B1ECo=
=C8rt
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
