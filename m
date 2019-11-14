From: "kernelci.org bot" <bot@kernelci.org>
Subject: clk/clk-next boot bisection: v5.4-rc1-201-ga228ae437aa5 on
 tegra124-nyan-big
Date: Wed, 13 Nov 2019 20:59:12 -0800 (PST)
Message-ID: <5dccdf20.1c69fb81.418aa.a71c@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tomeu.vizoso@collabora.com, Stephen Boyd <sboyd@kernel.org>, guillaume.tucker@collabora.com, mgalka@collabora.com, Thierry Reding <treding@nvidia.com>, broonie@kernel.org, matthew.hart@linaro.org, khilman@baylibre.com, enric.balletbo@collabora.com
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* This automated bisection report was sent to you on the basis  *
* that you may be involved with the breaking commit it has      *
* found.  No manual investigation has been done to verify it,   *
* and the root cause of the problem may be somewhere else.      *
*                                                               *
* If you do send a fix, please include this trailer:            *
*   Reported-by: "kernelci.org bot" <bot@kernelci.org>          *
*                                                               *
* Hope this helps!                                              *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

clk/clk-next boot bisection: v5.4-rc1-201-ga228ae437aa5 on tegra124-nyan-big

Summary:
  Start:      a228ae437aa5 Merge branch 'clk-unused' into clk-next
  Details:    https://kernelci.org/boot/id/5dcc99e959b514100f138e14
  Plain log:  https://storage.kernelci.org//clk/clk-next/v5.4-rc1-201-ga228=
ae437aa5/arm/tegra_defconfig/gcc-8/lab-collabora/boot-tegra124-nyan-big.txt
  HTML log:   https://storage.kernelci.org//clk/clk-next/v5.4-rc1-201-ga228=
ae437aa5/arm/tegra_defconfig/gcc-8/lab-collabora/boot-tegra124-nyan-big.html
  Result:     25175c806a68 clk: tegra: Reimplement SOR clock on Tegra124

Checks:
  revert:     PASS
  verify:     PASS

Parameters:
  Tree:       clk
  URL:        https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
  Branch:     clk-next
  Target:     tegra124-nyan-big
  CPU arch:   arm
  Lab:        lab-collabora
  Compiler:   gcc-8
  Config:     tegra_defconfig
  Test suite: boot

Breaking commit found:

---------------------------------------------------------------------------=
----
commit 25175c806a6841149abe46168e0af12593141612
Author: Thierry Reding <treding@nvidia.com>
Date:   Thu Jul 25 18:19:00 2019 +0200

    clk: tegra: Reimplement SOR clock on Tegra124
    =

    In order to allow the display driver to deal uniformly with all SOR
    generations, implement the SOR clocks in a way that is compatible with
    Tegra186 and later.
    =

    Acked-by: Stephen Boyd <sboyd@kernel.org>
    Signed-off-by: Thierry Reding <treding@nvidia.com>

diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra=
124.c
index 7d231529c3a5..b3110d5b5a6c 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -1005,20 +1005,24 @@ static struct tegra_devclk devclks[] __initdata =3D=
 {
 	{ .con_id =3D "hda2hdmi", .dt_id =3D TEGRA124_CLK_HDA2HDMI },
 };
 =

-static const char *mux_pllp_pllm_plld_plla_pllc_plld2_clkm[] =3D {
-	"pll_p", "pll_m", "pll_d_out0", "pll_a_out0", "pll_c",
-	"pll_d2_out0", "clk_m"
+static const char * const sor0_parents[] =3D {
+	"pll_p_out0", "pll_m_out0", "pll_d_out0", "pll_a_out0", "pll_c_out0",
+	"pll_d2_out0", "clk_m",
 };
-#define mux_pllp_pllm_plld_plla_pllc_plld2_clkm_idx NULL
 =

-static const char *mux_clkm_plldp_sor0out[] =3D {
-	"clk_m", "pll_dp", "sor0_out",
+static const char * const sor0_out_parents[] =3D {
+	"clk_m", "sor0_pad_clkout",
 };
-#define mux_clkm_plldp_sor0out_idx NULL
 =

 static struct tegra_periph_init_data tegra124_periph[] =3D {
-	MUX8_NOGATE_LOCK("sor0_out", mux_pllp_pllm_plld_plla_pllc_plld2_clkm, CLK=
_SOURCE_SOR0, tegra_clk_sor0_out, &sor0_lock),
-	NODIV("sor0", mux_clkm_plldp_sor0out, CLK_SOURCE_SOR0, 14, 3, 182, 0, teg=
ra_clk_sor0, &sor0_lock),
+	TEGRA_INIT_DATA_TABLE("sor0", NULL, NULL, sor0_parents,
+			      CLK_SOURCE_SOR0, 29, 0x7, 0, 0, 0, 0,
+			      0, 182, 0, tegra_clk_sor0, NULL, 0,
+			      &sor0_lock),
+	TEGRA_INIT_DATA_TABLE("sor0_out", NULL, NULL, sor0_out_parents,
+			      CLK_SOURCE_SOR0, 14, 0x1, 0, 0, 0, 0,
+			      0, 0, TEGRA_PERIPH_NO_GATE, tegra_clk_sor0_out,
+			      NULL, 0, &sor0_lock),
 };
 =

 static struct clk **clks;
---------------------------------------------------------------------------=
----


Git bisection log:

---------------------------------------------------------------------------=
----
git bisect start
# good: [dafbb1e6473788cb3068eaeddc58f9d88e9c7a62] Merge branch 'clk-ti' in=
to clk-next
git bisect good dafbb1e6473788cb3068eaeddc58f9d88e9c7a62
# bad: [a228ae437aa553736058cbbd58d2d0e191635cdc] Merge branch 'clk-unused'=
 into clk-next
git bisect bad a228ae437aa553736058cbbd58d2d0e191635cdc
# bad: [3214be6cb1e487b0f8c3bb2eac9b06df07a07e06] clk: tegra: Share clk and=
 rst register defines with Tegra clock driver
git bisect bad 3214be6cb1e487b0f8c3bb2eac9b06df07a07e06
# bad: [05308d7e7bbc932025f1dafc401c73ce83c6f414] clk: tegra: Reimplement S=
OR clocks on Tegra210
git bisect bad 05308d7e7bbc932025f1dafc401c73ce83c6f414
# good: [d1ee3173a139ed2eb8d87e06216f0426b16084d8] Merge branch 'for-5.5/dt=
-bindings' into for-5.5/clk
git bisect good d1ee3173a139ed2eb8d87e06216f0426b16084d8
# good: [e5f8a107d92db30a7ad7d8d95aee59f5ad76206a] clk: tegra: Move SOR0 im=
plementation to Tegra124
git bisect good e5f8a107d92db30a7ad7d8d95aee59f5ad76206a
# bad: [25175c806a6841149abe46168e0af12593141612] clk: tegra: Reimplement S=
OR clock on Tegra124
git bisect bad 25175c806a6841149abe46168e0af12593141612
# good: [da8d1a3555406275650b366460c6235f1696bf8b] clk: tegra: Rename sor0_=
lvds to sor0_out
git bisect good da8d1a3555406275650b366460c6235f1696bf8b
# first bad commit: [25175c806a6841149abe46168e0af12593141612] clk: tegra: =
Reimplement SOR clock on Tegra124
---------------------------------------------------------------------------=
----
