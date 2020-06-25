From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 12/73] ARM: tegra: Drop display controller parent clocks
 on Tegra114
Date: Thu, 25 Jun 2020 09:37:36 +0200
Message-ID: <20200625073736.GA2800220@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-13-thierry.reding@gmail.com>
 <0bc2ec0e-f863-207a-d61b-058503598139@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="17pEHd4RhPHOinZp"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <0bc2ec0e-f863-207a-d61b-058503598139-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--17pEHd4RhPHOinZp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2020 at 07:19:26PM +0300, Dmitry Osipenko wrote:
> 16.06.2020 16:51, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The parent clocks are determined by the output that will be used, not by
> > the display controller that drives the output. Drop the parent clocks
> > from the display controller device tree nodes.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra114.dtsi | 10 ++++------
> >  arch/arm/boot/dts/tegra124.dtsi | 10 ++++------
> >  arch/arm/boot/dts/tegra20.dtsi  | 10 ++++------
> >  arch/arm/boot/dts/tegra30.dtsi  | 10 ++++------
> >  4 files changed, 16 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra1=
14.dtsi
> > index a06b88b01ef3..23df7a5f37d3 100644
> > --- a/arch/arm/boot/dts/tegra114.dtsi
> > +++ b/arch/arm/boot/dts/tegra114.dtsi
> > @@ -59,9 +59,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra114-dc";
> >  			reg =3D <0x54200000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA114_CLK_DISP1>,
> > -				 <&tegra_car TEGRA114_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA114_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -78,9 +77,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra114-dc";
> >  			reg =3D <0x54240000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA114_CLK_DISP2>,
> > -				 <&tegra_car TEGRA114_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA114_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra1=
24.dtsi
> > index 1afed8496c95..2c992e8e3594 100644
> > --- a/arch/arm/boot/dts/tegra124.dtsi
> > +++ b/arch/arm/boot/dts/tegra124.dtsi
> > @@ -105,9 +105,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra124-dc";
> >  			reg =3D <0x0 0x54200000 0x0 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>,
> > -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -120,9 +119,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra124-dc";
> >  			reg =3D <0x0 0x54240000 0x0 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>,
> > -				 <&tegra_car TEGRA124_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20=
=2Edtsi
> > index f0a172c61b26..8b6909839f59 100644
> > --- a/arch/arm/boot/dts/tegra20.dtsi
> > +++ b/arch/arm/boot/dts/tegra20.dtsi
> > @@ -103,9 +103,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra20-dc";
> >  			reg =3D <0x54200000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA20_CLK_DISP1>,
> > -				 <&tegra_car TEGRA20_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA20_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -120,9 +119,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra20-dc";
> >  			reg =3D <0x54240000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA20_CLK_DISP2>,
> > -				 <&tegra_car TEGRA20_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA20_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> > diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
=2Edtsi
> > index 27000f0ba35b..23fedb76e5ae 100644
> > --- a/arch/arm/boot/dts/tegra30.dtsi
> > +++ b/arch/arm/boot/dts/tegra30.dtsi
> > @@ -200,9 +200,8 @@ dc@54200000 {
> >  			compatible =3D "nvidia,tegra30-dc", "nvidia,tegra20-dc";
> >  			reg =3D <0x54200000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA30_CLK_DISP1>,
> > -				 <&tegra_car TEGRA30_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA30_CLK_DISP1>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 27>;
> >  			reset-names =3D "dc";
> > =20
> > @@ -219,9 +218,8 @@ dc@54240000 {
> >  			compatible =3D "nvidia,tegra30-dc";
> >  			reg =3D <0x54240000 0x00040000>;
> >  			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> > -			clocks =3D <&tegra_car TEGRA30_CLK_DISP2>,
> > -				 <&tegra_car TEGRA30_CLK_PLL_P>;
> > -			clock-names =3D "dc", "parent";
> > +			clocks =3D <&tegra_car TEGRA30_CLK_DISP2>;
> > +			clock-names =3D "dc";
> >  			resets =3D <&tegra_car 26>;
> >  			reset-names =3D "dc";
> > =20
> >=20
>=20
> Hello Thierry,
>=20
> Tegra DRM fails to probe after this change using next-20200624 on T20/30
> (T124 also should be broken):
>=20
>  tegra-dc 54200000.dc: failed to get parent clock
>  tegra-dc 54200000.dc: failed to probe RGB output: -2

Indeed. I had completely missed that we used to have this RGB output on
prior chips and therefore do need the parent clock. As of Tegra124 that
RGB output is no longer present, so this isn't needed anymore.

> BTW, the commit's title is misleading since the patch touches all SoCs
> and not only the T114.

Good catch. I've replaced this with the following:

--- >8 ---
commit afd92390fcaa784a6d064f3b07c8d8124e43e5d1
Author: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Thu Jun 11 19:09:36 2020 +0200

    ARM: tegra: Drop display controller parent clocks on Tegra124
   =20
    The parent clocks are determined by the output that will be used, not by
    the display controller that drives the output. On previous generations a
    simple RGB output used to be part of the display controller and hence an
    explicit parent clock needed to be assigned to the display controller to
    drive the RGB output. Starting with Tegra124, that RGB output has been
    dropped and the parent clock can therefore be removed from the display
    controller device tree nodes.
   =20
    Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.d=
tsi
index 1afed8496c95..2c992e8e3594 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -105,9 +105,8 @@ dc@54200000 {
 			compatible =3D "nvidia,tegra124-dc";
 			reg =3D <0x0 0x54200000 0x0 0x00040000>;
 			interrupts =3D <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names =3D "dc", "parent";
+			clocks =3D <&tegra_car TEGRA124_CLK_DISP1>;
+			clock-names =3D "dc";
 			resets =3D <&tegra_car 27>;
 			reset-names =3D "dc";
=20
@@ -120,9 +119,8 @@ dc@54240000 {
 			compatible =3D "nvidia,tegra124-dc";
 			reg =3D <0x0 0x54240000 0x0 0x00040000>;
 			interrupts =3D <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
-			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>,
-				 <&tegra_car TEGRA124_CLK_PLL_P>;
-			clock-names =3D "dc", "parent";
+			clocks =3D <&tegra_car TEGRA124_CLK_DISP2>;
+			clock-names =3D "dc";
 			resets =3D <&tegra_car 26>;
 			reset-names =3D "dc";
--- >8 ---

Thierry

--17pEHd4RhPHOinZp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl70VD0ACgkQ3SOs138+
s6FFzBAAo/d7tW+bWArDQmse5y8uTXq9jzqaVKBHJKPXQcDjXVIZjF9zojwpdOV/
sMp+iYRZH/18OARVC8UT0JjWx2ojDQ/z3HAey001Zxu/icnX1ossvtFJDUG/Bucf
6HFfJYJDlHvnfCvDQPrB7yUTURyVX6fOP1fBE4REKwl0cGuaPwGET4bzgsq8Ooon
E/I/3jpGs/hSacDNy2Y9J1Br3W+Ws6FVQPFH50yqN4nQr+QCQ6/1IrOcbsrR4Run
umDwM0YcokY1HQkHuTExa+tS2mzb1OQxrNIJdvy8Hdny5R2NNeFZgDN0lJV6/zta
zYJAQXEGKKVmDslX9jJV3U5uUphatqi5oMobOUdXSbpYs62kEtkSA2sVDr69uKwi
PChhy1fqeL7qt0aDj6kX6TxiLRZHN5odHFyEvisiONZx/Wqq16Z8NhkzoY/Mnu9P
oysqzR6cP8vNz0Wo/wuT/rwjVoM/e0Vq8G1YrFKavCKd77+85mzgXlOrQJW1spW4
d06TMEXk7Oc98/56PTwDPPOWFS7ywQPNspS7D7N031wIdxQreVb/e9z24M1B7hWP
loSF+CtLv5mI+XikVmSj4Ap1J5HFJXkd9mZwTNFadppnnHCKK6OWJXFEc6rZHuAY
R2tBiT7Ou2JkNtsKDl/1UeokEamJ5EZsSk6cuzMAbYJdHXw/miU=
=oiOs
-----END PGP SIGNATURE-----

--17pEHd4RhPHOinZp--
