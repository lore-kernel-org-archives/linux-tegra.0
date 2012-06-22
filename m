From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 08/10] ARM: tegra: harmony: Initialize regulators from
 DT
Date: Fri, 22 Jun 2012 08:06:57 +0200
Message-ID: <20120622060657.GA15213@avionic-0098.adnet.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-9-git-send-email-thierry.reding@avionic-design.de>
 <4FE3815C.8030505@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FE3815C.8030505-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 02:17:32PM -0600, Stephen Warren wrote:
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
>=20
> I believe that should be interrupt 86 not 88.

Yes, you're absolutely correct.

Thierry

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP5AuBAAoJEN0jrNd/PrOhqVoQAJErzxQ2EbOzIBdTW1+AX91n
Oe5Y0gkjUBzBCbzqsgurvcXWOv8MxGLrSy3rBA+Zlf9pAiROBXQ4vdymVFLTnbh5
Zuj7aUxDKGeKwYzChBVVHLqc05pn5snEl/rVN/30w+9z3fv0f8OSGn1x9Ppn4vWN
cJUS0SRZ5GQRo7qidgcuKkYeIeenwf1bYZ0fczMO07S8x8BkzD+iVN2fVx49DtWm
Nw3A71ajsBYdZs82C0G1vQomvJJNsi8Sg1IKBAZ9/kn8DC+dbiMZXZaLi2YMFS3X
9Wzd913HDNn9ItJQmOvI2NzHGQkV/4GEk1fTD6BvlpgPBBtqJ80r0c6c0pXnUguD
+7+dGoGRiBgPuGLzFuGKLAsusTqzFRvso3evqZFJxamQRJqXWGO1QuUY3cW0DVWj
NfjwdDmFNg7yiR0dgNcu7BZDegKGp8qyiIRvHxAlu1qRkYVQMBj2K8f5s3zeXxev
DK5FvN7TSVE8opIjnamZrsCw7OUFjZH6PKDRy/wd/ULL4aRfsEWlxZGRaW5Y7nJw
WiNkP5BVQhZqEpqhfBIyKd8GBBOayRLsmrfnK9UP8x/D+z8BiP69ADPPUjP36e4z
S/NZA8hrJs7u54nYu5t3h4DNS4BGAbKWPSUaVKFDiV6pvGguI/7jhyb2FHk+CUAW
6ioOczican+2SbYSk4ch
=S7s2
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
