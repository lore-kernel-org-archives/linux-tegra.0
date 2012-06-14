From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Thu, 14 Jun 2012 10:37:19 +0200
Message-ID: <20120614083719.GC31283@avionic-0098.mockup.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <4FD84133.4060401@firmworks.com>
 <20120613075232.GA6139@avionic-0098.mockup.avionic-design.de>
 <201206132021.09774.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H8ygTp4AXg6deix2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201206132021.09774.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--H8ygTp4AXg6deix2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2012 at 08:21:08PM +0000, Arnd Bergmann wrote:
> On Wednesday 13 June 2012, Thierry Reding wrote:
> >                 pci@80000000 {
> >                         reg =3D <0x80000000 0x00001000>;
> >                         status =3D "disabled";
> >=20
> >                         #address-cells =3D <3>;
> >                         #size-cells =3D <2>;
> >=20
> >                         ranges =3D <0x80400000 0x80400000 0x00008000   =
/* I/O */
> >                                   0x90000000 0x90000000 0x08000000   /*=
 non-prefetchable memory */
> >                                   0xa0000000 0xa0000000 0x08000000>; /*=
 prefetchable memory */
> >=20
> >                         nvidia,ctrl-offset =3D <0x0>;
> >                         nvidia,num-lanes =3D <2>;
> >                 };
> >=20
>=20
> I believe you will need an "interrupt-map" property here, to map the host
> interrupts to the INTA-INTD lines of the attached devices.

Legacy interrupts are something I cannot test at all because I have no
hardware that supports them.

> I'm not sure whether we want to have a device_type=3D"pciex" property her=
e.
> powerpc and sparc seem to use that information, to distinguish a pcie
> bus from pci or cardbus.

That'd be rather useless information given that the Tegra is unlikely to
support either PCI or CardBus at some point.

Thierry

--H8ygTp4AXg6deix2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/Zor8ACgkQZ+BJyKLjJp+9UwCcDLwTTLw84cHnOn37DxC4j8q1
Bh4An2ctjh/D0DqiKZIjol9LwunkqWtt
=X0ge
-----END PGP SIGNATURE-----

--H8ygTp4AXg6deix2--
