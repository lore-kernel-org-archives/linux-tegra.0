From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
Date: Wed, 2 Oct 2019 13:04:54 +0200
Message-ID: <20191002110454.GJ3716706@ulmo>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0404798811146570980=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191001211346.104400-1-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============0404798811146570980==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rmUrFcWP4LYae1gV"
Content-Disposition: inline


--rmUrFcWP4LYae1gV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 03:13:43PM -0600, Stephen Warren wrote:
> From: Stephen Warren <swarren@nvidia.com>
>=20
> For a little over a year, U-Boot has configured the flow controller to
> perform automatic RAM re-repair on off->on power transitions of the CPU
> rail1]. This is mandatory for correct operation of Tegra124. However, RAM
> re-repair relies on certain clocks, which the kernel must enable and
> leave running. The fuse clock is one of those clocks. Enable this clock
> so that LP1 power mode (system suspend) operates correctly.
>=20
> [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra124.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-teg=
ra124.c
> index 0224fdc4766f..f53f6315c646 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_tabl=
e[] __initdata =3D {
>  };
> =20
>  static struct tegra_clk_init_table tegra124_init_table[] __initdata =3D {
> +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },

I think the correct way to do this these days is to mark the clock as
CRITICAL. Not sure if there's an easy way to do that given that the
clock init table doesn't allow storing flags.

Do you have any good ideas on how to achieve this with the critical flag
instead of forcing the refcount to 1?

Perhaps something like the below would work?

Thierry

--- >8 ---
diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra=
124.c
index 0224fdc4766f..bba12d8308d3 100644
--- a/drivers/clk/tegra/clk-tegra124.c
+++ b/drivers/clk/tegra/clk-tegra124.c
@@ -838,7 +838,7 @@ static struct tegra_clk tegra124_clks[tegra_clk_max] __=
initdata =3D {
 	[tegra_clk_spdif_out] =3D { .dt_id =3D TEGRA124_CLK_SPDIF_OUT, .present =
=3D true },
 	[tegra_clk_vi_9] =3D { .dt_id =3D TEGRA124_CLK_VI, .present =3D true },
 	[tegra_clk_vi_sensor_8] =3D { .dt_id =3D TEGRA124_CLK_VI_SENSOR, .present=
 =3D true },
-	[tegra_clk_fuse] =3D { .dt_id =3D TEGRA124_CLK_FUSE, .present =3D true },
+	[tegra_clk_fuse] =3D { .dt_id =3D TEGRA124_CLK_FUSE, .present =3D false },
 	[tegra_clk_fuse_burn] =3D { .dt_id =3D TEGRA124_CLK_FUSE_BURN, .present =
=3D true },
 	[tegra_clk_clk_32k] =3D { .dt_id =3D TEGRA124_CLK_CLK_32K, .present =3D t=
rue },
 	[tegra_clk_clk_m] =3D { .dt_id =3D TEGRA124_CLK_CLK_M, .present =3D true =
},
@@ -1033,6 +1033,12 @@ static __init void tegra124_periph_clk_init(void __i=
omem *clk_base,
 	clk_register_clkdev(clk, "cml1", NULL);
 	clks[TEGRA124_CLK_CML1] =3D clk;
=20
+	clk =3D tegra_clk_register_periph_gate("fuse", "clk_m",
+					     TEGRA_PERIPH_ON_APB, clk_base,
+					     CLK_IS_CRITICAL, 39,
+					     periph_clk_enb_refcnt);
+	clks[TEGRA124_CLK_FUSE] =3D clk;
+
 	tegra_periph_clk_init(clk_base, pmc_base, tegra124_clks, &pll_p_params);
 }
=20

--rmUrFcWP4LYae1gV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2UhFMACgkQ3SOs138+
s6FlZQ//cKIMvXQriD1VmW+HASRz/xjiUiEIAO7HKSifQ3AGz8Cefz3bltXfJgnl
PMWqX+UpxTMkUYNLqCl5bRwUQruyhnxVmeHDIlairmkEGAhrWvZpqgiQdrAoZzmp
/ruHc2e/hBWNUXEGHia9eeD5zwUNtUmI/XQQAXmoLSTTv38OooQWIp8ff/i3hwLh
921GSaoLo4QQmlzpU+VoUAlvBAbBZzL6a7/2QT6/CDP7g47PJfeD8xoQH+kuGHPn
B6ZWxqMq7CteI7SfdWRpF/frmaCV5bxQQ9w3+bwLxDl+CxXKV2AA/GjYt9In2M0Q
kqrCMM+77y+K4VL5Nz3BA46Z8TUK+5jLmrhYMpA3e5PrxeTEWKb+q+XDa1OnKNPK
mIfFYv97pPeKnBi5nOIy8AemssitWpbHBskVrRG42LjyQ5cknUvrNcCByOgW/6LC
UT1RvXZbukY0X2B0ePTiyMGRh5IVqiuUC6QqvBMP4WncDnKncKKcA1N8In22DaFZ
61uJdMIXMurMkDR3IfR4ZKUvKFHeojGmzBzO5lQyWOua11S1yJcfwoIqhRW4JPEy
nySi33yc0t9Nm6AhXeArW1r1fnrujO2+9aqEaMtiYnnym6kQhs8RfaQ0eke92KAJ
QroNOG0WObaFbkOv0MW7RB1DAxgcPeMrWWRysiEaZ4rYFho+MgE=
=hRxp
-----END PGP SIGNATURE-----

--rmUrFcWP4LYae1gV--


--===============0404798811146570980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0404798811146570980==--
