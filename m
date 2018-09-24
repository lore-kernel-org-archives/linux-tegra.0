From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] clk: tegra: Fix an infinite loop when clock rate is zero
Date: Mon, 24 Sep 2018 13:40:03 +0200
Message-ID: <20180924114003.GS21032@ulmo>
References: <20180921220037.16862-1-decatf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jo46wx5DSA4a/gWG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180921220037.16862-1-decatf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ryang <decatf@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--jo46wx5DSA4a/gWG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2018 at 06:00:37PM -0400, ryang wrote:
> Calling clk_set_rate or clk_round_rate will lock up the kernel when the
> rate is zero. This avoids the infinite loop and uses a slightly more
> optimized p divider calculation.
>=20
> Signed-off-by: ryang <decatf@gmail.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--jo46wx5DSA4a/gWG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluozRMACgkQ3SOs138+
s6FyUQ/+OUhFV4i9eXn8U9G/iqxDUf2Ipyhw3J5GM2xJ/e0BiinsHS5swaf5CBPI
s9k9ytlegplNxKOd0ZaARdw88f1k/d2nMYYDtSstaZWU6H0GFFCpJL8tnX49Og9w
mJYjw21oHmikNGjTwqbvmwv2DFcSPL+w4dx+t4ataXrZCsDElA2YT4N6RqSeMJ4f
uHPQHrCnC622rKRCWsS2iZbgHLIiWygrdn3kh97GtNmhQyYWfuUV7YToCPt4aQmx
yg9r7XS9FqrtVCp9LmuPgfIzQ+gBNB8gRrcmmnhn+L36GRSjbPtD2qfkcjTavM/g
LKNl0UB4gcO6AOe5RtVpFoix8wa4/KvM/lt5LyeDsQFizV3z8P0Cv6zEsGwITPJI
lRUoHZlHAz8h30OnR+cGnNKuFe+zoPYxAOHyB+nT0o7VcYSeXTLC4yhP/COZmkUc
SxBpxp5P0AfkUxT6RBFxeedAPft9BsnCrgJD4zMHaDYnVPxoBZlrTW7dxhoEoyQ5
8R/186CDt6vnUlHcrhjSl6ZElmbvYPF4YsZzzm6y1ePowwU1TpfUxC0iUTPNECtF
/GzHykooirqJ7Szlb2XrGU9yz6Plep5utMaLRneMsaJ79AfsO/kV8Yhxi8+/uHkY
+stR+cJjSuW5wIP2Yco9eAaAcuoyFUr7Ccijih5iiAPzZdIM/uk=
=k52X
-----END PGP SIGNATURE-----

--jo46wx5DSA4a/gWG--
