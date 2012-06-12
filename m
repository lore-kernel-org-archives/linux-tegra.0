From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 08/10] ARM: tegra: harmony: Initialize regulators from
 DT
Date: Tue, 12 Jun 2012 08:13:31 +0200
Message-ID: <20120612061330.GD4040@avionic-0098.adnet.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-9-git-send-email-thierry.reding@avionic-design.de>
 <4FD664F8.4030800@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FD664F8.4030800-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 06/11/2012 09:05 AM, Thierry Reding wrote:
> > Device tree support for the TPS6586x PMU used on Harmony has recently
> > been added. This commit adds the required device tree nodes to probe the
> > PMU from the device tree.
>=20
> > diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/te=
gra-harmony.dts
>=20
> > +		tps6586x@34 {
> > +			compatible =3D "ti,tps6586x";
> > +			reg =3D <0x34>;
> > +			interrupts =3D <0 88 0x4>;
> > +
> > +			#gpio-cells =3D <2>;
> > +			gpio-controller;
> > +
> > +			regulators {
>=20
> Per the TPS65911 discussion on regulator bindings, this node should have:
>=20
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
>=20
> > +				sm0 {
>=20
> Each of these nodes should be named regulator@0, regulator@1, etc.
>=20
> Within each of these nodes, you need a matching reg property.
>=20
> 	reg =3D <0>;
>=20
> and something to identify which regulator within the chip this node
> configurations, although I don't think we've reached a final decision on
> the property name.
>=20
> See the the following for details:
>=20
> http://www.spinics.net/lists/linux-tegra/msg05577.html

Okay, I'll monitor that discussion and see what you end up with. I guess I'=
ll
have to update the tps6586x binding when that decision has been reached and
add a patch to this series.

Thierry

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/W3goACgkQZ+BJyKLjJp/HvwCbBUNIsXdbmLGFH7H2zuK4qkzG
dIsAnjD0wUQ+UFgasmRNUJIzYEDVdNRt
=EmeK
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--
