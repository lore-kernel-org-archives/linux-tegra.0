From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/4] clk: tegra: Enable fuse clock on Tegra124
Date: Fri, 4 Oct 2019 14:18:12 +0200
Message-ID: <20191004121812.GB227112@ulmo>
References: <20191001211346.104400-1-swarren@wwwdotorg.org>
 <20191002110454.GJ3716706@ulmo>
 <6a48d716-2312-4623-f47a-a53ac2ece83c@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3056316276139130121=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6a48d716-2312-4623-f47a-a53ac2ece83c@wwwdotorg.org>
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


--===============3056316276139130121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eAbsdosE1cNLO4uF"
Content-Disposition: inline


--eAbsdosE1cNLO4uF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2019 at 02:59:03PM -0600, Stephen Warren wrote:
> On 10/2/19 5:04 AM, Thierry Reding wrote:
> > On Tue, Oct 01, 2019 at 03:13:43PM -0600, Stephen Warren wrote:
> > > From: Stephen Warren <swarren@nvidia.com>
> > >=20
> > > For a little over a year, U-Boot has configured the flow controller to
> > > perform automatic RAM re-repair on off->on power transitions of the C=
PU
> > > rail1]. This is mandatory for correct operation of Tegra124. However,=
 RAM
> > > re-repair relies on certain clocks, which the kernel must enable and
> > > leave running. The fuse clock is one of those clocks. Enable this clo=
ck
> > > so that LP1 power mode (system suspend) operates correctly.
> > >=20
> > > [1] 3cc7942a4ae5 ARM: tegra: implement RAM repair
> > >=20
> > > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > > ---
> > >   drivers/clk/tegra/clk-tegra124.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk=
-tegra124.c
> > > index 0224fdc4766f..f53f6315c646 100644
> > > --- a/drivers/clk/tegra/clk-tegra124.c
> > > +++ b/drivers/clk/tegra/clk-tegra124.c
> > > @@ -1291,6 +1291,7 @@ static struct tegra_clk_init_table common_init_=
table[] __initdata =3D {
> > >   };
> > >   static struct tegra_clk_init_table tegra124_init_table[] __initdata=
 =3D {
> > > +	{ TEGRA124_CLK_FUSE, -1, 0, 1 },
> >=20
> > I think the correct way to do this these days is to mark the clock as
> > CRITICAL. Not sure if there's an easy way to do that given that the
> > clock init table doesn't allow storing flags.
> >=20
> > Do you have any good ideas on how to achieve this with the critical flag
> > instead of forcing the refcount to 1?
> >=20
> > Perhaps something like the below would work?
> > ...
>=20
> The following works for me; does this seem like a reasonable approach? It
> does set the critical flag for all SoCs, including any that don't require
> RAM re-repair. I'm not sure which do; I know it's more than just Tegra124,
> but I'm not sure how far back/forward the requirement goes.
>=20
> > diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/c=
lk-tegra-periph.c
> > index 1ed85f120a1b..76dd91eebd13 100644
> > --- a/drivers/clk/tegra/clk-tegra-periph.c
> > +++ b/drivers/clk/tegra/clk-tegra-periph.c
> > @@ -785,7 +785,7 @@ static struct tegra_periph_init_data gate_clks[] =
=3D {
> >         GATE("ahbdma", "hclk", 33, 0, tegra_clk_ahbdma, 0),
> >         GATE("apbdma", "pclk", 34, 0, tegra_clk_apbdma, 0),
> >         GATE("kbc", "clk_32k", 36, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_N=
O_RESET, tegra_clk_kbc, 0),
> > -       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, =
0),
> > +       GATE("fuse", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_fuse, =
CLK_IS_CRITICAL),
> >         GATE("fuse_burn", "clk_m", 39, TEGRA_PERIPH_ON_APB, tegra_clk_f=
use_burn, 0),
> >         GATE("kfuse", "clk_m", 40, TEGRA_PERIPH_ON_APB, tegra_clk_kfuse=
, 0),
> >         GATE("apbif", "clk_m", 107, TEGRA_PERIPH_ON_APB, tegra_clk_apbi=
f, 0),

It's probably fine to do this. The patch I proposed would've restricted
the change to just Tegra124. But if we need this on other generations, I
don't think the extra complexity is justified, especially since I can't
imagine that the FUSE clock remaining always on would consume a lot of
extra power.

Thierry

--eAbsdosE1cNLO4uF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2XOIQACgkQ3SOs138+
s6HlwxAAh5ESXhxNQcvDEspLmSsT6O8TIw5aMmfrdeUldnIoOilb5YUh4dp7CixY
/+pOnbUDDYbNaYlViZ65/xqJ5/C0+iDn7Kxs4t/AN5W7HNVeUL6p5ltd/iRNIpF7
eiyePXcChZOmYc98HtSsos+2cOMfQ6vyvpDN90tETJZrPvrxp66osXSy2YaECWqy
SE6DeN4eJof5bnY+t8EiiXK2rfIcuKMNG9axtYuDcNWlvG+tIrNUbcF2GaajESXe
yfxAjlFH2CKfhQ0ju7DIxxkfFhtStvm+1qnW4oUPEzC4LIRRTRBHDFWOmrPnU0UH
DKvVQxWSfanaNNFSCBTsT6J+qpVR0N78MlBgWeM9DCQq4fy0lcrozLQhyuyQHeh2
OyXmhfFSm53UilGeFG84kBgu2QfDlWjFMLg4rndPIqCBlVoowbPu6u62Dolxpfp7
ejH7+jGz3ftckFJblStXDw5AwR7x0Aa8X4xYqzrkbDcVXw7R5Mynn6vWYxGurWRd
M4I2Lozh/HqPHAIkSvHujI7GxLxa5fVez9kUPMjIyWB6eIE7yE2u33NEQ86FFzlr
x0hOLwNhnXhhAZXeKqP6N6wpCTVBX9AVZEGjjRaQKAXIaJWhBbqV5r5PNYGJIPvq
AUqYyl/uWZ1GqdJSoLVS42uhIz7D+CsHVGAZfAm7PDpvMg2ol3Q=
=C3XR
-----END PGP SIGNATURE-----

--eAbsdosE1cNLO4uF--


--===============3056316276139130121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============3056316276139130121==--
