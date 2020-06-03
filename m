From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Wed, 3 Jun 2020 12:56:00 +0200
Message-ID: <20200603105600.GB3478467@ulmo>
References: <20200319074401.GA4116@Red>
 <20200531193111.GA15331@Red>
 <ff9923ca-1d02-ab5e-c335-83ee2e993061@gmail.com>
 <20200602081958.GA21773@Red>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-ide-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200602081958.GA21773@Red>
Sender: linux-ide-owner@vger.kernel.org
To: LABBE Corentin <clabbe@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, jonathanh@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, sboyd@kernel.org, axboe@kernel.dk, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-ide@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2020 at 10:19:58AM +0200, LABBE Corentin wrote:
> On Mon, Jun 01, 2020 at 05:30:37PM +0300, Dmitry Osipenko wrote:
> > 31.05.2020 22:31, LABBE Corentin =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Thu, Mar 19, 2020 at 08:44:01AM +0100, LABBE Corentin wrote:
> > >> Hello
> > >>
> > >> sata doesnt work on tegra124-jetson-tk1 on next and master and at le=
ast since 5.2 (but 5.1 works).
> > >> [    0.492810] +5V_SATA: supplied by +5V_SYS
> > >> [    0.493230] +12V_SATA: supplied by +VDD_MUX
> > >> [    2.088675] tegra-ahci 70027000.sata: 70027000.sata supply ahci n=
ot found, using dummy regulator
> > >> [    2.097643] tegra-ahci 70027000.sata: 70027000.sata supply phy no=
t found, using dummy regulator
> > >> [    3.314776] tegra-ahci 70027000.sata: 70027000.sata supply ahci n=
ot found, using dummy regulator
> > >> [    3.323658] tegra-ahci 70027000.sata: 70027000.sata supply phy no=
t found, using dummy regulator
> > >> [    5.236964] tegra-ahci 70027000.sata: 70027000.sata supply ahci n=
ot found, using dummy regulator
> > >> [    5.245867] tegra-ahci 70027000.sata: 70027000.sata supply phy no=
t found, using dummy regulator
> > >> [    5.254706] tegra-ahci 70027000.sata: 70027000.sata supply target=
 not found, using dummy regulator
> > >> [    5.310270] phy phy-sata.6: phy poweron failed --> -110
> > >> [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI con=
troller: -110
> > >> [    5.323022] tegra-ahci: probe of 70027000.sata failed with error =
-110
> > >> [   35.694269] +5V_SATA: disabling
> > >> [   35.697438] +12V_SATA: disabling
> > >>
> > >> I have bisected this problem:
> > >> git bisect start
> > >> # bad: [22c58fd70ca48a29505922b1563826593b08cc00] Merge tag 'armsoc-=
soc' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
> > >> git bisect bad 22c58fd70ca48a29505922b1563826593b08cc00
> > >> # good: [67e38f578aaebf34fc1278bbe45a78ee8c73dd33] ARM: ep93xx: move=
 pinctrl interfaces into include/linux/soc
> > >> git bisect good 67e38f578aaebf34fc1278bbe45a78ee8c73dd33
> > >> # good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge git://git.k=
ernel.org/pub/scm/linux/kernel/git/davem/net-next
> > >> git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
> > >> # good: [e57ccca1ba33e1d92cc3bbf8b6304a46948844b0] Merge tag 'sound-=
5.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> > >> git bisect good e57ccca1ba33e1d92cc3bbf8b6304a46948844b0
> > >> # bad: [983dfa4b6ee556563f7963348e4e2f97fc8a15b8] Merge tag 'for-lin=
us-5.2-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/rw/uml
> > >> git bisect bad 983dfa4b6ee556563f7963348e4e2f97fc8a15b8
> > >> # good: [8e4ff713ce313dcabbb60e6ede1ffc193e67631f] Merge tag 'rtc-5.=
2' of git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux
> > >> git bisect good 8e4ff713ce313dcabbb60e6ede1ffc193e67631f
> > >> # bad: [b970afcfcabd63cd3832e95db096439c177c3592] Merge tag 'powerpc=
-5.2-1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> > >> git bisect bad b970afcfcabd63cd3832e95db096439c177c3592
> > >> # bad: [601e6bcc4ef02bda2831d5ac8133947b5edf597b] Merge git://git.ke=
rnel.org/pub/scm/linux/kernel/git/davem/net
> > >> git bisect bad 601e6bcc4ef02bda2831d5ac8133947b5edf597b
> > >> # good: [7e9c62bdb41af76974d594da89854a6aba645e58] Merge branches 'c=
lk-sa', 'clk-aspeed', 'clk-samsung', 'clk-ingenic' and 'clk-zynq' into clk-=
next
> > >> git bisect good 7e9c62bdb41af76974d594da89854a6aba645e58
> > >> # bad: [0caf000817353cfc5db22363ecdac63b83d3a3f9] Merge branch 'clk-=
ti' into clk-next
> > >> git bisect bad 0caf000817353cfc5db22363ecdac63b83d3a3f9
> > >> # good: [5816b74581b45cf086a84ab14e13354a65e8e22c] Merge branches 'c=
lk-hisi', 'clk-lochnagar', 'clk-allwinner', 'clk-rockchip' and 'clk-qoriq' =
into clk-next
> > >> git bisect good 5816b74581b45cf086a84ab14e13354a65e8e22c
> > >> # good: [7b4c162e03d47e037f8ee773c3e300eefb599a83] clk: at91: Mark s=
truct clk_range as const
> > >> git bisect good 7b4c162e03d47e037f8ee773c3e300eefb599a83
> > >> # bad: [e71f4d385878671991e200083c7d30eb4ca8e99a] clk: tegra: divide=
r: Mark Memory Controller clock as read-only
> > >> git bisect bad e71f4d385878671991e200083c7d30eb4ca8e99a
> > >> # bad: [924ee3d551c9deb16090230b824988bd37e72aa8] clk: tegra: emc: D=
on't enable EMC clock manually
> > >> git bisect bad 924ee3d551c9deb16090230b824988bd37e72aa8
> > >> # bad: [40db569d6769ffa3864fd1b89616b1a7323568a8] clk: tegra: Fix PL=
LM programming on Tegra124+ when PMC overrides divider
> > >> git bisect bad 40db569d6769ffa3864fd1b89616b1a7323568a8
> > >> # bad: [bff1cef5f23afbe49f5ebd766980dc612f5e9d0a] clk: tegra: Don't =
enable already enabled PLLs
> > >> git bisect bad bff1cef5f23afbe49f5ebd766980dc612f5e9d0a
> > >> # first bad commit: [bff1cef5f23afbe49f5ebd766980dc612f5e9d0a] clk: =
tegra: Don't enable already enabled PLLs
> > >>
> > >=20
> > > Hello
> > >=20
> > > I have digged a bit more and with the following "patch" I have now ac=
cess to sata again
> > > diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> > > index 0b212cf2e794..b4e2020051d5 100644
> > > --- a/drivers/clk/tegra/clk-pll.c
> > > +++ b/drivers/clk/tegra/clk-pll.c
> > > @@ -1602,7 +1603,7 @@ static int clk_plle_tegra114_enable(struct clk_=
hw *hw)
> > >         unsigned long input_rate;
> > > =20
> > >         if (clk_pll_is_enabled(hw))
> > > -               return 0;
> > > +               pr_info("%s %s\n", __func__, clk_hw_get_name(&pll->hw=
));
> > > =20
> > >         input_rate =3D clk_hw_get_rate(clk_hw_get_parent(hw));
> > >=20
> > > This patch lead to a probed ahci, and I can see "clk_plle_tegra114_en=
able pll_e" in messages.
> > >=20
> > > So the bad part of bff1cef5f23afbe49f5ebd766980dc612f5e9d0a is found.
> >=20
> > Hello Labbe,
> >=20
> > Looks like indeed this PLLE change should be reverted. I see that the
> > code disables PLLE before changing its configuration, so apparently the
> > enable-check shouldn't be needed.
> >=20
> > > As additional information, my previous kernel has CONFIG_PHY_TEGRA_XU=
SB=3Dm (since firmware is on rootfs which is on sata)
> > > but with this sata fail the same, having CONFIG_PHY_TEGRA_XUSB=3Dy (a=
nd so xusb firmware in kernel) seems "necessary" for having SATA working.
> >=20
> > Sounds like PLLE needs to be enabled for SATA, but ahci-tegra driver
> > doesn't do that.
> >=20
> > Could you please try this change:
> >=20
> > --- >8 ---
> > diff --git a/drivers/clk/tegra/clk-tegra124.c
> > b/drivers/clk/tegra/clk-tegra124.c
> > index e931319dcc9d..7dbc14652830 100644
> > --- a/drivers/clk/tegra/clk-tegra124.c
> > +++ b/drivers/clk/tegra/clk-tegra124.c
> > @@ -1330,6 +1330,7 @@ static struct tegra_clk_init_table
> > common_init_table[] __initdata =3D {
> >  	{ TEGRA124_CLK_I2S3_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> >  	{ TEGRA124_CLK_I2S4_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> >  	{ TEGRA124_CLK_VIMCLK_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> > +	{ TEGRA124_CLK_PLL_E, TEGRA124_CLK_CLK_MAX, 0, 1 },
> >  	/* must be the last entry */
> >  	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
> >  };
> > --- >8 ---
>=20
> This patch alone does not fix the issue.

Looking at clk_plle_tegra114_enable(), there's a bunch of configuration
going on other than just enabling the PLL_E and it's likely that whoever
set up the PLL_E first (probably some bootloader) didn't have the same
requirements as the kernel has (most notably I can imagine that hardware
control of the XUSB and SATA PLLs remains disabled in the bootloader due
to the different way that they are used.

Peter, do you have any more background on what could be going on here or
who might be initializing the PLL_E (and others) in an incompatible way?
An alternative might be to identify who configures the PLL badly and fix
the culprit. But that's a bit of a strong dependency for my taste,
especially given that currenty versions of the bootloaders are broken.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7Xgb4ACgkQ3SOs138+
s6GsNw//QBMpWb7ziuU1Ega9DHpzDyQunGvlKz/oB65CqrtL5wYJmcHJh4CZWSvw
X6p/1gujT0qY7D9sGUl6Ehw072KbFawkJssccDUyonlJQX550LG5bbtfkuHSAOeY
4fyeHHX5UdpDRB1MjlYrcHC3tfvk/BE8SJK0Isw+KdJRHgAX1gKBeblz6Sr1Yx7u
fIZGUpNkDmJRG8R6N+4tq2miwfJ577A5Z0EuxMI1pZ06rhDwgmT0gJhEFg6dz5w1
RY+ucYK9zStsvtNwiAmIvqVswrzKHwCsft5az7ahEhy5NqvwgDYY/qojYKfdERQG
Qeh36pufyc2A0llpnpKqEt5ioYc6C/5W8tzZwtfs6rQa+igW/QfrKsHTepKV/ttU
kxaa1Eab5Gr9zTd09mFeJord07IsAUI5c3m/Vwjr+4Boz0OOCBGw2o5HbAgGnqGE
52vub+1nA0TTjL9P8TsplWH8pNsE+Teqx9OuV7JAo/pXHSUbNvIDQIz5jhJ6wuHX
+6Dco3WAe6EPpd6ARkXw6qLZDBgmYNIdjd5pqiPqCxyq5lsoY1+C0vaN4WgDkkAe
Te4NQIqj6bjln9hWlPARGjopMWoMj0jUUWhcmopz3TQ8gloLjaNT/n3MHl/bF+qR
SVWI2D2Av8SBn6bJo++uE/RxKgVxoc+5q8IzrAnC9TRa4ZW140A=
=K3X4
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
