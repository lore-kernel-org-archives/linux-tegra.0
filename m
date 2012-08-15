From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Wed, 15 Aug 2012 14:30:22 +0200
Message-ID: <20120815123022.GA8678@avionic-0098.adnet.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <1343332512-28762-11-git-send-email-thierry.reding@avionic-design.de>
 <20120814201215.GA10542@avionic-0098.mockup.avionic-design.de>
 <CAErSpo6Awbx9-DWM3V02HUg7Xv4tWAhcLO7UKuT_0uXbpZ+nKw@mail.gmail.com>
 <20120815063718.GA15665@avionic-0098.mockup.avionic-design.de>
 <CAErSpo7Y9ADYHwZMjQjDwd7m8jtwgcxsE-NE_K5X_Z+PuV=C4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo7Y9ADYHwZMjQjDwd7m8jtwgcxsE-NE_K5X_Z+PuV=C4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 05:18:04AM -0700, Bjorn Helgaas wrote:
> On Tue, Aug 14, 2012 at 11:37 PM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > On Tue, Aug 14, 2012 at 04:50:26PM -0700, Bjorn Helgaas wrote:
> >> On Tue, Aug 14, 2012 at 1:12 PM, Thierry Reding
> >> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> > On Thu, Jul 26, 2012 at 09:55:12PM +0200, Thierry Reding wrote:
> >> >> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/teg=
ra20.dtsi
> >> >> index a094c97..c886dff 100644
> >> >> --- a/arch/arm/boot/dts/tegra20.dtsi
> >> >> +++ b/arch/arm/boot/dts/tegra20.dtsi
> >> >> @@ -199,6 +199,68 @@
> >> >>               #size-cells =3D <0>;
> >> >>       };
> >> >>
> >> >> +     pcie-controller {
> >> >> +             compatible =3D "nvidia,tegra20-pcie";
> >> >> +             reg =3D <0x80003000 0x00000800   /* PADS registers */
> >> >> +                    0x80003800 0x00000200   /* AFI registers */
> >> >> +                    0x81000000 0x01000000   /* configuration space=
 */
> >> >> +                    0x90000000 0x10000000>; /* extended configurat=
ion space */
> >> >> +             interrupts =3D <0 98 0x04   /* controller interrupt */
> >> >> +                           0 99 0x04>; /* MSI interrupt */
> >> >> +             status =3D "disabled";
> >> >> +
> >> >> +             ranges =3D <0 0 0  0x80000000 0x00001000   /* root po=
rt 0 */
> >> >> +                       0 1 0  0x81000000 0x00800000   /* port 0 co=
nfig space */
> >> >> +                       0 2 0  0x90000000 0x08000000   /* port 0 ex=
t config space */
> >> >> +                       0 3 0  0x82000000 0x00010000   /* port 0 do=
wnstream I/O */
> >> >> +                       0 4 0  0xa0000000 0x08000000   /* port 0 no=
n-prefetchable memory */
> >> >> +                       0 5 0  0xb0000000 0x08000000   /* port 0 pr=
efetchable memory */
> >> >> +
> >> >> +                       1 0 0  0x80001000 0x00001000   /* root port=
 1 */
> >> >> +                       1 1 0  0x81800000 0x00800000   /* port 1 co=
nfig space */
> >> >> +                       1 2 0  0x98000000 0x08000000   /* port 1 ex=
t config space */
> >> >> +                       1 3 0  0x82010000 0x00010000   /* port 1 do=
wnstream I/O */
> >> >> +                       1 4 0  0xa8000000 0x08000000   /* port 1 no=
n-prefetchable memory */
> >> >> +                       1 5 0  0xb8000000 0x08000000>; /* port 1 pr=
efetchable memory */
> >> >
> >> > I've been thinking about this some more. The translations for both t=
he
> >> > regular and extended configuration spaces are configured in the top-
> >> > level PCIe controller. It is therefore wrong how they are passed to =
the
> >> > PCI host bridges via the ranges property.
> >> >
> >> > I remember Mitch saying that it should be passed down to the children
> >> > because it is partitioned among them, but since the layout is compat=
ible
> >> > with ECAM, the partitioning isn't as simple as what's in the tree. In
> >> > fact the partitions will be dependent on the number of devices attac=
hed
> >> > to the host bridges.
> >>
> >> I don't understand this last bit about the number of devices attached
> >> to the host bridges.  Logically, the host bridge has a bus number
> >> aperture that you can know up front, even before you know anything
> >> about what devices are below it.  On x86, for example, the ACPI _CRS
> >> method has something like "[bus 00-7f]" in it, which means that any
> >> buses in that range are below this bridge.  That doesn't tell us
> >> anything about which buses actually have devices on them, of course;
> >> it's just analogous to the secondary and subordinate bus number
> >> registers in a P2P bridge.
> >
> > That's one of the issues I still need to take care of. Currently no bus
> > resource is attached to the individual bridges (nor the PCI controller
> > for that matter), so the PCI core will assign them dynamically.
>=20
> So your PCI controller driver knows how to program the controller bus
> number aperture?  Sometimes people start by assuming that two host
> bridges both have [bus 00-ff] apertures, then they enumerate below the
> first and adjust the bus number apertures based on what they found.
> For example, if they found buses 00-12 behind the first bridge, they
> make the apertures [bus 00-12] for the first bridge and [bus 13-ff]
> for the second.  That might be the case, depending on what firmware
> set up, but it seems like a dubious way to do it, and of course it
> precludes a lot of hot-plug scenarios.

No, that's not what I meant. What happens is that no pre-assigned bus
range is specified for either of the host bridges, so that the range
0x00-0xff will be assigned by default in pci_scan_root_bus(). If I
understand correctly, what needs to be done is partition the bus range
between the two bridges (equally?). That would allow hot-plug scenarios
and be more in line with how other architectures do things.

I don't know if the Tegra PCIe controller supports hot-plug, though, so
maybe that wouldn't even be an issue and dynamic assignment would be
okay.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQK5ZeAAoJEN0jrNd/PrOhG2EQAIMomjd03r5j5SKsTMvVbZJu
ibwOUbwUrJOtIxAjlM2HL5RRzShfRrIYJAUiPWMEWVV8Xkyaz6GzzP9Oym0S8wcM
X4NPDxlRVbfhMRnhK4ubtlks0HcQiGH52DRfzcArP4f9q1OPbDnL+K/eGWeBJ/uw
crPKR/8f7KDvZIuotRTtVC+/KJNrOBfVZkX2EVJBNHWeNjhNPfqFHjSqTsPjLJdS
xyPD8nGeMfvSAJKWjAo9d3NNC3EfbHsBSRfsPscuZH4BGFqFpf8AZfwzxYsR7e9U
aLA8bTzokSGlLcmqhA/Erk4pS+49ZTQQEz5OSgNtJ3IN8DYSvHJwgcTKFTnTptkC
9KCrlZCd4EAT/urVPjG5W0W/R5F0fHyAGqbBO5Sv2tTVAO6jp/xng0DP2J9+A2ei
ZujZICsTo9kCqWnclJ/6x5emMHzTWlCBK8LTmzmICpPexQWUOzslFEjMuGrBHYu7
FG4hsvQpVHrj4Ex4NzsjWVmYaDjpkgT9kpOBGOh5LIgoloWmgpaT8dcjBWwSOtHZ
NTFdS1CxAQ8eLZBpUmlKK8IPtnz2YsCgbDKhxj/27xEaeYbdj+frjk55mc+o7UCA
vEzfeUG8WGcTVKeBoYFFj2WzKAJzDURoxH43PZwDiTV96d9WB3d9SzKwByMO7I1G
yUTIQm8N5Hi/FyqJ/16X
=7Wrw
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
