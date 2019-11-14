From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: clk/clk-next boot bisection: v5.4-rc1-201-ga228ae437aa5 on
 tegra124-nyan-big
Date: Thu, 14 Nov 2019 12:51:24 +0100
Message-ID: <20191114115124.GA5690@aiwendil>
References: <5dccdf20.1c69fb81.418aa.a71c@mx.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8t9RHnE3ZwKMSgU+"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5dccdf20.1c69fb81.418aa.a71c@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "kernelci.org bot" <bot@kernelci.org>
Cc: tomeu.vizoso@collabora.com, Stephen Boyd <sboyd@kernel.org>, guillaume.tucker@collabora.com, mgalka@collabora.com, Thierry Reding <treding@nvidia.com>, broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 08:59:12PM -0800, kernelci.org bot wrote:
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
> * This automated bisection report was sent to you on the basis  *
> * that you may be involved with the breaking commit it has      *
> * found.  No manual investigation has been done to verify it,   *
> * and the root cause of the problem may be somewhere else.      *
> *                                                               *
> * If you do send a fix, please include this trailer:            *
> *   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
> *                                                               *
> * Hope this helps!                                              *
> * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
>=20
> clk/clk-next boot bisection: v5.4-rc1-201-ga228ae437aa5 on tegra124-nyan-=
big
>=20
> Summary:
>   Start:      a228ae437aa5 Merge branch 'clk-unused' into clk-next
>   Details:    https://kernelci.org/boot/id/5dcc99e959b514100f138e14
>   Plain log:  https://storage.kernelci.org//clk/clk-next/v5.4-rc1-201-ga2=
28ae437aa5/arm/tegra_defconfig/gcc-8/lab-collabora/boot-tegra124-nyan-big.t=
xt
>   HTML log:   https://storage.kernelci.org//clk/clk-next/v5.4-rc1-201-ga2=
28ae437aa5/arm/tegra_defconfig/gcc-8/lab-collabora/boot-tegra124-nyan-big.h=
tml
>   Result:     25175c806a68 clk: tegra: Reimplement SOR clock on Tegra124
>=20
> Checks:
>   revert:     PASS
>   verify:     PASS
>=20
> Parameters:
>   Tree:       clk
>   URL:        https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.g=
it
>   Branch:     clk-next
>   Target:     tegra124-nyan-big
>   CPU arch:   arm
>   Lab:        lab-collabora
>   Compiler:   gcc-8
>   Config:     tegra_defconfig
>   Test suite: boot
>=20
> Breaking commit found:
>=20
> -------------------------------------------------------------------------=
------
> commit 25175c806a6841149abe46168e0af12593141612
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Thu Jul 25 18:19:00 2019 +0200
>=20
>     clk: tegra: Reimplement SOR clock on Tegra124
>    =20
>     In order to allow the display driver to deal uniformly with all SOR
>     generations, implement the SOR clocks in a way that is compatible with
>     Tegra186 and later.
>    =20
>     Acked-by: Stephen Boyd <sboyd@kernel.org>
>     Signed-off-by: Thierry Reding <treding@nvidia.com>

This is expected. There are additional patches required to the Tegra DRM
driver and device tree files to restore this. All of those patches are
in linux-next, where Nyan is again functional.

The breakage here is really unfortunate, but ultimately this boils down
to the fact that this clock was wrongly implemented and things only work
by accident currently.

Thierry

> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-teg=
ra124.c
> index 7d231529c3a5..b3110d5b5a6c 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1005,20 +1005,24 @@ static struct tegra_devclk devclks[] __initdata =
=3D {
>  	{ .con_id =3D "hda2hdmi", .dt_id =3D TEGRA124_CLK_HDA2HDMI },
>  };
> =20
> -static const char *mux_pllp_pllm_plld_plla_pllc_plld2_clkm[] =3D {
> -	"pll_p", "pll_m", "pll_d_out0", "pll_a_out0", "pll_c",
> -	"pll_d2_out0", "clk_m"
> +static const char * const sor0_parents[] =3D {
> +	"pll_p_out0", "pll_m_out0", "pll_d_out0", "pll_a_out0", "pll_c_out0",
> +	"pll_d2_out0", "clk_m",
>  };
> -#define mux_pllp_pllm_plld_plla_pllc_plld2_clkm_idx NULL
> =20
> -static const char *mux_clkm_plldp_sor0out[] =3D {
> -	"clk_m", "pll_dp", "sor0_out",
> +static const char * const sor0_out_parents[] =3D {
> +	"clk_m", "sor0_pad_clkout",
>  };
> -#define mux_clkm_plldp_sor0out_idx NULL
> =20
>  static struct tegra_periph_init_data tegra124_periph[] =3D {
> -	MUX8_NOGATE_LOCK("sor0_out", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, C=
LK_SOURCE_SOR0, tegra_clk_sor0_out, &sor0_lock),
> -	NODIV("sor0", mux_clkm_plldp_sor0out, CLK_SOURCE_SOR0, 14, 3, 182, 0, t=
egra_clk_sor0, &sor0_lock),
> +	TEGRA_INIT_DATA_TABLE("sor0", NULL, NULL, sor0_parents,
> +			      CLK_SOURCE_SOR0, 29, 0x7, 0, 0, 0, 0,
> +			      0, 182, 0, tegra_clk_sor0, NULL, 0,
> +			      &sor0_lock),
> +	TEGRA_INIT_DATA_TABLE("sor0_out", NULL, NULL, sor0_out_parents,
> +			      CLK_SOURCE_SOR0, 14, 0x1, 0, 0, 0, 0,
> +			      0, 0, TEGRA_PERIPH_NO_GATE, tegra_clk_sor0_out,
> +			      NULL, 0, &sor0_lock),
>  };
> =20
>  static struct clk **clks;
> -------------------------------------------------------------------------=
------
>=20
>=20
> Git bisection log:
>=20
> -------------------------------------------------------------------------=
------
> git bisect start
> # good: [dafbb1e6473788cb3068eaeddc58f9d88e9c7a62] Merge branch 'clk-ti' =
into clk-next
> git bisect good dafbb1e6473788cb3068eaeddc58f9d88e9c7a62
> # bad: [a228ae437aa553736058cbbd58d2d0e191635cdc] Merge branch 'clk-unuse=
d' into clk-next
> git bisect bad a228ae437aa553736058cbbd58d2d0e191635cdc
> # bad: [3214be6cb1e487b0f8c3bb2eac9b06df07a07e06] clk: tegra: Share clk a=
nd rst register defines with Tegra clock driver
> git bisect bad 3214be6cb1e487b0f8c3bb2eac9b06df07a07e06
> # bad: [05308d7e7bbc932025f1dafc401c73ce83c6f414] clk: tegra: Reimplement=
 SOR clocks on Tegra210
> git bisect bad 05308d7e7bbc932025f1dafc401c73ce83c6f414
> # good: [d1ee3173a139ed2eb8d87e06216f0426b16084d8] Merge branch 'for-5.5/=
dt-bindings' into for-5.5/clk
> git bisect good d1ee3173a139ed2eb8d87e06216f0426b16084d8
> # good: [e5f8a107d92db30a7ad7d8d95aee59f5ad76206a] clk: tegra: Move SOR0 =
implementation to Tegra124
> git bisect good e5f8a107d92db30a7ad7d8d95aee59f5ad76206a
> # bad: [25175c806a6841149abe46168e0af12593141612] clk: tegra: Reimplement=
 SOR clock on Tegra124
> git bisect bad 25175c806a6841149abe46168e0af12593141612
> # good: [da8d1a3555406275650b366460c6235f1696bf8b] clk: tegra: Rename sor=
0_lvds to sor0_out
> git bisect good da8d1a3555406275650b366460c6235f1696bf8b
> # first bad commit: [25175c806a6841149abe46168e0af12593141612] clk: tegra=
: Reimplement SOR clock on Tegra124
> -------------------------------------------------------------------------=
------

--8t9RHnE3ZwKMSgU+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3NP7gACgkQ3SOs138+
s6EMSw//bsAl2YetGdvn4aBmyU2U1dgVrOWQUJwS605tMb7WABoHhSQNXXBTqx7y
8XutLbixwOQ58hNSLt00hDKrea8WrG2HLyF+hmrf/15WVAORDcp6rUC+nZSYuFqo
BXwXDdQ3WEFH2k0xuPsjoPk9fEtYMl85oyuwLbBX34RJVomFOMlrWWtR8R2lm/Q5
6Dfpyn71G/IhNNw4Pb1orMZZiGxv20SCezAp1is++mm8Svoiq7r8QbdkiSw/RZJ4
hwW1UiHkww2QALVjM4WL5Jjcv2LUA9Vw4Hey2v5tgaV0dgJLe8ZvMur1cTvoX3QD
RJ0nnQUvEFbAvx+fmSLrNi9Vit/NfUwT/pam95LYKr+eLdXDeincidChOaHAQ9IN
z/eTKoNDvaptwpIXY77LTDQtUsHRfxvGuQgafnoPzYpQvp1PntXLQN4CGzGtBzfE
AGpp30sHEb5mYVqechr+ylKt4WzcHUY/D5oo5YCf8QpROHBI/R2W8Jr/6gUwr7JO
V4WiD7++/dMOk/m10klGquOlWEQBVtwDTtnJWr+kVGtcD5Vw/UPsyBQYOlARObRc
H3bI2CGIop7KfrC4F8jLpo8dPOZ3MQeQXOQQJI89uVVoDTpBYg+cN24frpvrnCo2
Ieqdx0FZO8tvb2ivWz0Bcadh2p/z8wzhzHNZS1Iu5RALGeEDxTw=
=5XoD
-----END PGP SIGNATURE-----

--8t9RHnE3ZwKMSgU+--
