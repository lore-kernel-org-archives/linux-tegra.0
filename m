From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 09/10] ARM: tegra: harmony: Initialize PCIe from DT
Date: Tue, 12 Jun 2012 07:48:11 +0200
Message-ID: <20120612054811.GB4040@avionic-0098.adnet.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-10-git-send-email-thierry.reding@avionic-design.de>
 <4FD6661A.1060407@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QKdGvSO+nmPlgiQ/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FD6661A.1060407-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--QKdGvSO+nmPlgiQ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 06/11/2012 09:05 AM, Thierry Reding wrote:
> > With the device tree support in place, probe the PCIe controller from
> > the device tree and remove the corresponding workaround in the board
> > file.
>=20
> > diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts/te=
gra-harmony.dts
>=20
> > +	pci_vdd_reg: fixedregulator@0 {
>=20
> I think that'd usually just be "regulator@0".
>=20
> If you need the "@0" part to differentiate between multiple regulators,
> the node needs a reg property too:
>=20
> 	reg =3D <0 0>;
>=20
> although then I wonder about putting the regulator under the root node,
> since the address wouldn't really make sense...

Perhaps we should add a new "regulators" node under the root node to collect
this kind of regulators that don't fit anywhere else. Looking at the code,
something like this should work:

	/ {
		...

		regulators {
			compatible =3D "simple-bus";
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			pci_vdd_reg: regulator@0 {
				reg =3D <0>;
			};
		};
	};

Thierry

--QKdGvSO+nmPlgiQ/
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/W2BsACgkQZ+BJyKLjJp86AgCgsn2q8bEqIs31iBgl+n/BtA6C
Yw4AnRO5T0MrQ5q5xZyWCjnDgfZGsuyb
=JgXL
-----END PGP SIGNATURE-----

--QKdGvSO+nmPlgiQ/--
