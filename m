From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v4 2/5] ARM: tegra: Add Avionic Design Tamonten support
Date: Wed, 19 Sep 2012 18:38:04 +0200
Message-ID: <20120919163804.GA19464@avionic-0098.mockup.avionic-design.de>
References: <1347979144-24462-1-git-send-email-thierry.reding@avionic-design.de>
 <1347979144-24462-2-git-send-email-thierry.reding@avionic-design.de>
 <5059EAF2.10706@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5059EAF2.10706-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 19, 2012 at 09:55:30AM -0600, Stephen Warren wrote:
> On 09/18/2012 08:39 AM, Thierry Reding wrote:
> > The Tamonten is an NVIDIA Tegra2 based system-on-module (SOM) that is
> > designed to cover a broad range of applications.
>=20
> > diff --git a/arch/arm/boot/dts/tegra20-tamonten.dtsi b/arch/arm/boot/dt=
s/tegra20-tamonten.dtsi
> ...
> > +		pmic: tps6586x@34 {
> ...
> > +			regulators {
> ...
> > +					regulator-name =3D "vdd_sys";
> ...
> > +					regulator-name =3D "vdd_sm0,vdd_core";
> ...
> > +					regulator-name =3D "vdd_sm1,vdd_cpu";
> ...
> > +					regulator-name =3D "vdd_sm2,vin_ldo*";
> ...
> > +					regulator-name =3D "vdd_ldo0,vddio_pex_clk";
>=20
> etc.
>=20
> I just wanted to confirm that those regulator-name values truly are the
> signal names in the schematic and not something copied blindly from the
> Harmony .dts file without any updates. Same for the voltages.

I believe the schematics were blindly copied from the Harmony reference
design. =3D) But I'll double check.

Thierry

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQWfTsAAoJEN0jrNd/PrOhXZkP/2ZAo9UiWlaaaPSaGRNlpjg6
hQMwcAb5CLcCVGxib/zngGXt0l28ojzaWClPhWcCBbtn4S2dnQ2SfRTO1qJI6GVp
+G3b78wJ47UtXndWiDV3G6q8yQ8XLqHDILQ96ujkcrYcWXepnv6s/L5q2OIZJp1L
bt0i6jQpon53HYB/21gybcB9sHxAiFUA6W1/CINuj4kKkPcY/ppeGBlzZyWG4VpE
f4QUFx/nJKd8iQhNss3KSmvPpD8olZGJP387nX5odfqxZ1PAowXQQ1RrUjhkEeNH
oEj24NPlhSyQR/WuqwASlqlNuK4ckfe01J6Q2oWw8jMYzWfOw3eFl/Jl0h4Bipv5
bB7tUZs0hvmyOvlKAaq1XgoWCnRWDn2UrgkuiWxPRzUICPnoh3PgLQkvXPYvLleE
e++Jj38XL/M5pxm23vN79Vaa2wcUFnUfqjrtLrN5ETrfjpbxocFK2tyGhV0jhrOu
+ANX9BLLjP4uj5gnuYTlWZhzfFBei4lWX6VE81CDnSlI546LUl2d2VZ8+noTElW1
mlkgd9fSc/3S4gGiTUnBEVW8DDg/m+Nyu+48tvfD3nkyWL9SxNXRqyd7xyTDUpDt
htO1hECPvmdBi2xWmaXG7kLAER5yTyqzWg+t6e52eS+QSfplibkyUGMcs9oQ9gqE
gUhc5E7MzyBGwp0ZUQx/
=BhJQ
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
