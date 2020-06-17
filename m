From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/73] ARM: tegra: Remove simple regulators bus
Date: Wed, 17 Jun 2020 16:22:48 +0200
Message-ID: <20200617142248.GE3536291@ulmo>
References: <20200616135238.3001888-1-thierry.reding@gmail.com>
 <20200616135238.3001888-4-thierry.reding@gmail.com>
 <cf8eb9d4-70d5-400f-ecc8-2139c25563a9@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cPi+lWm09sJ+d57q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cf8eb9d4-70d5-400f-ecc8-2139c25563a9-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cPi+lWm09sJ+d57q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 08:24:11PM +0100, Jon Hunter wrote:
>=20
>=20
> On 16/06/2020 14:51, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The standard way to do this is to list out the regulators at the top
> > level. Adopt the standard way to fix validation.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra114-dalmore.dts    | 129 +++++------
> >  arch/arm/boot/dts/tegra114-roth.dts       | 120 +++++-----
> >  arch/arm/boot/dts/tegra114-tn7.dts        |  65 +++---
> >  arch/arm/boot/dts/tegra124-jetson-tk1.dts | 238 +++++++++----------
> >  arch/arm/boot/dts/tegra124-nyan.dtsi      | 259 ++++++++++-----------
> >  arch/arm/boot/dts/tegra124-venice2.dts    | 265 ++++++++++------------
> >  arch/arm/boot/dts/tegra20-harmony.dts     | 121 +++++-----
> >  arch/arm/boot/dts/tegra20-medcom-wide.dts |  66 +++---
> >  arch/arm/boot/dts/tegra20-paz00.dts       |  38 ++--
> >  arch/arm/boot/dts/tegra20-plutux.dts      |  66 +++---
> >  arch/arm/boot/dts/tegra20-seaboard.dts    | 125 +++++-----
> >  arch/arm/boot/dts/tegra20-tamonten.dtsi   |  39 +---
> >  arch/arm/boot/dts/tegra20-tec.dts         |  66 +++---
> >  arch/arm/boot/dts/tegra20-trimslice.dts   |  85 +++----
> >  arch/arm/boot/dts/tegra20-ventana.dts     |  85 +++----
> >  arch/arm/boot/dts/tegra30-beaver.dts      | 193 ++++++++--------
> >  arch/arm/boot/dts/tegra30-cardhu-a02.dts  | 128 +++++------
> >  arch/arm/boot/dts/tegra30-cardhu-a04.dts  | 149 ++++++------
> >  arch/arm/boot/dts/tegra30-cardhu.dtsi     | 261 ++++++++++-----------
> >  19 files changed, 1130 insertions(+), 1368 deletions(-)
>=20
> ...
>=20
> > diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts=
/tegra124-venice2.dts
> > index 6a7a31c831c5..effdb303c7f7 100644
> > --- a/arch/arm/boot/dts/tegra124-venice2.dts
> > +++ b/arch/arm/boot/dts/tegra124-venice2.dts
> > @@ -1077,164 +1077,145 @@ power {
> > =20
> >  	panel: panel {
> >  		compatible =3D "lg,lp129qe";
> > -
> > +		power-supply =3D <&vdd_3v3_panel>;
> >  		backlight =3D <&backlight>;
> >  		ddc-i2c-bus =3D <&dpaux>;
> >  	};
>=20
> Is this meant to be in this patch?
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dt=
s/tegra20-tamonten.dtsi
> > index 20137fc578b1..95e6bccdb4f6 100644
> > --- a/arch/arm/boot/dts/tegra20-tamonten.dtsi
> > +++ b/arch/arm/boot/dts/tegra20-tamonten.dtsi
> > @@ -495,40 +495,25 @@ usb-phy@c5008000 {
> >  		status =3D "okay";
> >  	};
> > =20
> > -	sdhci@c8000600 {
> > +	mmc@c8000600 {
> >  		cd-gpios =3D <&gpio TEGRA_GPIO(H, 2) GPIO_ACTIVE_LOW>;
> >  		wp-gpios =3D <&gpio TEGRA_GPIO(H, 3) GPIO_ACTIVE_HIGH>;
> >  		bus-width =3D <4>;
> >  		status =3D "okay";
> >  	};
> > =20
> > -	clocks {
> > -		compatible =3D "simple-bus";
> > -		#address-cells =3D <1>;
> > -		#size-cells =3D <0>;
> > -
> > -		clk32k_in: clock@0 {
> > -			compatible =3D "fixed-clock";
> > -			reg =3D <0>;
> > -			#clock-cells =3D <0>;
> > -			clock-frequency =3D <32768>;
> > -		};
> > +	clk32k_in: clock@0 {
> > +		compatible =3D "fixed-clock";
> > +		clock-frequency =3D <32768>;
> > +		#clock-cells =3D <0>;
> >  	};
>=20
> The above appears in to be in the wrong patch.
>=20
> > diff --git a/arch/arm/boot/dts/tegra30-cardhu-a02.dts b/arch/arm/boot/d=
ts/tegra30-cardhu-a02.dts
> > index a02ec5082287..4899e05a0d9c 100644
> > --- a/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> > +++ b/arch/arm/boot/dts/tegra30-cardhu-a02.dts
> > @@ -9,87 +9,75 @@ / {
> >  	model =3D "NVIDIA Tegra30 Cardhu A02 evaluation board";
> >  	compatible =3D "nvidia,cardhu-a02", "nvidia,cardhu", "nvidia,tegra30";
> > =20
> > -	sdhci@78000400 {
> > +	mmc@78000400 {
> >  		status =3D "okay";
> >  		power-gpios =3D <&gpio TEGRA_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
> >  		bus-width =3D <4>;
> >  		keep-power-in-suspend;
> >  	};
>=20
> And here.
>=20
> > diff --git a/arch/arm/boot/dts/tegra30-cardhu-a04.dts b/arch/arm/boot/d=
ts/tegra30-cardhu-a04.dts
> > index 9234988624ec..c1c0ca628af1 100644
> > --- a/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> > +++ b/arch/arm/boot/dts/tegra30-cardhu-a04.dts
> > @@ -11,99 +11,86 @@ / {
> >  	model =3D "NVIDIA Tegra30 Cardhu A04 (A05, A06, A07) evaluation board=
";
> >  	compatible =3D "nvidia,cardhu-a04", "nvidia,cardhu", "nvidia,tegra30";
> > =20
> > -	sdhci@78000400 {
> > +	mmc@78000400 {
> >  		status =3D "okay";
> >  		power-gpios =3D <&gpio TEGRA_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
> >  		bus-width =3D <4>;
> >  		keep-power-in-suspend;
> >  	};
>=20
> And here.

Ugh... indeed. To be honest, I'm surprised there aren't more of these
issues given the amount of rebasing that I needed to get this whole set
sorted out. I'll do some more rebasing to get these into the right
patches.

Thanks,
Thierry

--cPi+lWm09sJ+d57q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7qJzgACgkQ3SOs138+
s6GeIQ/+J2lsBCzJxTfh2vuAnI5VXFYbSlZfzXLgO3Oc4vC7n34qPpCllusLHkQU
iwtJ3JOAC2yVLYdxuohuBY5lo7QW80BkWygEV3AFB/5RlmiV4QR9g2jbHJTFda4H
OurYypb15TO8Za76IoFJBuEVk/48YG3EKzOGA9A4HrpRjgMeQLPgyQPWgCxihiw5
iNQ7BlqNMCoBXjc9SKvOoPNn0My5OKuT0Qy/wqWq5m8J2zUxkbG0kgHnPVixaY1N
C65dsDIz0mdi+hRD+aopCh+Xxx2o3bCwXAbD/IcRI3r75hn1LyZMEYnSAacZF0Le
JXLaMLc8wyBJG5y1oBFASG5BwDM3rDy3Zr2D0f47zNh6T8YTK5wQIZV15rs6J4a0
Cg4WlbaVM0fnnbLXJ0G7Z+IjlUNtdEz5tmP5mrjThcbRGN7hijGXHs3XXyco8W1Y
jBvgm78+Td3YVx8i8Yjdl9KgYlTi61FpVixfuIl2MhmE1x1tnNyNRf+916exFeS5
ffEXw6kKJedkpmwVkwErrMxkOOKpNK0CWfA2EnTb81rc7eD06n9ERL/DUTZXIRxk
7V3L6VV04sMdVLNNVe5G3abGDc0m6TAm8ihsOMPe1aiu5wyizPRskKkJaOmY2ihD
AVa/W16njKpgjpwicQ+NRzpR6Dkl/QPtMOfGhL3L/nsubsdbkMA=
=QN5s
-----END PGP SIGNATURE-----

--cPi+lWm09sJ+d57q--
