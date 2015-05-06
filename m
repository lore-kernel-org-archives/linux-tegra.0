From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v4 02/20] clk: tegra: periph: add new periph clks and
 muxes for Tegra210
Date: Wed, 6 May 2015 16:15:25 +0200
Message-ID: <20150506141524.GE22098@ulmo.nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
 <1430757460-9478-3-git-send-email-rklein@nvidia.com>
 <5549F900.2050600@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q8BnQc91gJZX4vDc"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5549F900.2050600@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Lin <jilin@nvidia.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Q8BnQc91gJZX4vDc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2015 at 07:20:32PM +0800, Jim Lin wrote:
> On 05/05/2015 12:37 AM, Rhyland Klein wrote:
[...]
> >diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/cl=
k-tegra-periph.c
[...]
> >@@ -333,6 +497,11 @@ static u32 mux_clkm_48M_pllp_480M_idx[] =3D {
> >  	[0] =3D 0, [1] =3D 2, [2] =3D 4, [3] =3D 6,
> >  };
> >+static const char *mux_clkm_pllre_clk32_480M[] =3D {
> >+	"clk_m", "pll_re_out", "clk_32k", "pll_u_480M"
> >+};
> >+#define mux_clkm_pllre_clk32_480M_idx NULL
> Please help to replace above
>=20
> #define mux_clkm_pllre_clk32_480M_idx NULL
>=20
> with
>=20
> static u32 mux_clkm_pllre_clk32_480M_idx[] =3D {
>=20
>        [0] =3D 0, [1] =3D 1, [2] =3D 2, [3] =3D 3,
> };

Isn't that the default already if you specify NULL as index table?

Thierry

--Q8BnQc91gJZX4vDc
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVSiH8AAoJEN0jrNd/PrOhC08P/1mdEkARvDb4hYmSnpObgZGi
xSn83IONKAvM5GOEIXdN4N43xqtOxKEIuLlsnwCO75VdyM/0eehh2qLgXyGwEDQi
A/vV+qKBdPwEto8uQsUUwHDFzKxFhlUXj+GQiowy9bfLdHwvGtqgdHgN92mN3gKt
gqON4/8wPHb7VgEfSeyGO2haWcN/snspjtfCVAVNgZZ4klxmJmE6/cmuHj158E8y
yNwjfATrQyVfyHOIguFFsp+YK1/1hM1ELsqrsNkXSHOshIR2EIaXfVMM9jTheuYo
uSIslKebKHL0ZvsL91xhnWD+cexoVhsAT86UpKyBzYD5byL7Zfx1v+tpVL8MRGDH
53ACrGu96u3vIx9t7/3ZRQDZJ7YiYFTW9xr9R6apmFTVtImQHXsTUJ+328ylTQBV
8NPySm7yAhC71rcFX9pHFm/Mr85zKbrDrwzatG26utPZO+Y8l7OkNhZHwroIZYpZ
ofLpzYjMO4RFXPLyjLTpYXCJMNdIfpSN0QDXqCtKuqorU8xHoXFCoyC57OE0O5mS
lE6Ro8qyTV3qvRDwfcNKTpWsef0enWtZETW2bEnxjBT/R0Ud1ANNV+Tw3H/vfKX5
WtnsOBszWPMtT9OUiZD9cbtzMSxOA6hszSPzwJppDI00t18PkGrPEgI4jShe95nR
RD0JURq4nHxu9suKl52K
=xh1O
-----END PGP SIGNATURE-----

--Q8BnQc91gJZX4vDc--
