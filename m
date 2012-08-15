From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Wed, 15 Aug 2012 16:57:08 +0200
Message-ID: <20120815145708.GA11331@avionic-0098.mockup.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <1343332512-28762-11-git-send-email-thierry.reding@avionic-design.de>
 <20120814201215.GA10542@avionic-0098.mockup.avionic-design.de>
 <CAErSpo6Awbx9-DWM3V02HUg7Xv4tWAhcLO7UKuT_0uXbpZ+nKw@mail.gmail.com>
 <20120815063718.GA15665@avionic-0098.mockup.avionic-design.de>
 <CAErSpo7Y9ADYHwZMjQjDwd7m8jtwgcxsE-NE_K5X_Z+PuV=C4w@mail.gmail.com>
 <20120815123022.GA8678@avionic-0098.adnet.avionic-design.de>
 <CAErSpo7c4L=Ny=CtZwLB_XWTcN8tVWs_quuE_T+XLEGyhWwHkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9amGYk9869ThD9tj"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAErSpo7c4L=Ny=CtZwLB_XWTcN8tVWs_quuE_T+XLEGyhWwHkg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--9amGYk9869ThD9tj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 07:36:24AM -0700, Bjorn Helgaas wrote:
> On Wed, Aug 15, 2012 at 5:30 AM, Thierry Reding
> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> > On Wed, Aug 15, 2012 at 05:18:04AM -0700, Bjorn Helgaas wrote:
> >> On Tue, Aug 14, 2012 at 11:37 PM, Thierry Reding
> >> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> > On Tue, Aug 14, 2012 at 04:50:26PM -0700, Bjorn Helgaas wrote:
> >> >> On Tue, Aug 14, 2012 at 1:12 PM, Thierry Reding
> >> >> <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> >> >> > On Thu, Jul 26, 2012 at 09:55:12PM +0200, Thierry Reding wrote:
> >> >> >> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/=
tegra20.dtsi
> >> >> >> index a094c97..c886dff 100644
> >> >> >> --- a/arch/arm/boot/dts/tegra20.dtsi
> >> >> >> +++ b/arch/arm/boot/dts/tegra20.dtsi
> >> >> >> @@ -199,6 +199,68 @@
> >> >> >>               #size-cells =3D <0>;
> >> >> >>       };
> >> >> >>
> >> >> >> +     pcie-controller {
> >> >> >> +             compatible =3D "nvidia,tegra20-pcie";
> >> >> >> +             reg =3D <0x80003000 0x00000800   /* PADS registers=
 */
> >> >> >> +                    0x80003800 0x00000200   /* AFI registers */
> >> >> >> +                    0x81000000 0x01000000   /* configuration sp=
ace */
> >> >> >> +                    0x90000000 0x10000000>; /* extended configu=
ration space */
> >> >> >> +             interrupts =3D <0 98 0x04   /* controller interrup=
t */
> >> >> >> +                           0 99 0x04>; /* MSI interrupt */
> >> >> >> +             status =3D "disabled";
> >> >> >> +
> >> >> >> +             ranges =3D <0 0 0  0x80000000 0x00001000   /* root=
 port 0 */
> >> >> >> +                       0 1 0  0x81000000 0x00800000   /* port 0=
 config space */
> >> >> >> +                       0 2 0  0x90000000 0x08000000   /* port 0=
 ext config space */
> >> >> >> +                       0 3 0  0x82000000 0x00010000   /* port 0=
 downstream I/O */
> >> >> >> +                       0 4 0  0xa0000000 0x08000000   /* port 0=
 non-prefetchable memory */
> >> >> >> +                       0 5 0  0xb0000000 0x08000000   /* port 0=
 prefetchable memory */
> >> >> >> +
> >> >> >> +                       1 0 0  0x80001000 0x00001000   /* root p=
ort 1 */
> >> >> >> +                       1 1 0  0x81800000 0x00800000   /* port 1=
 config space */
> >> >> >> +                       1 2 0  0x98000000 0x08000000   /* port 1=
 ext config space */
> >> >> >> +                       1 3 0  0x82010000 0x00010000   /* port 1=
 downstream I/O */
> >> >> >> +                       1 4 0  0xa8000000 0x08000000   /* port 1=
 non-prefetchable memory */
> >> >> >> +                       1 5 0  0xb8000000 0x08000000>; /* port 1=
 prefetchable memory */
> >> >> >
> >> >> > I've been thinking about this some more. The translations for bot=
h the
> >> >> > regular and extended configuration spaces are configured in the t=
op-
> >> >> > level PCIe controller. It is therefore wrong how they are passed =
to the
> >> >> > PCI host bridges via the ranges property.
> >> >> >
> >> >> > I remember Mitch saying that it should be passed down to the chil=
dren
> >> >> > because it is partitioned among them, but since the layout is com=
patible
> >> >> > with ECAM, the partitioning isn't as simple as what's in the tree=
=2E In
> >> >> > fact the partitions will be dependent on the number of devices at=
tached
> >> >> > to the host bridges.
> >> >>
> >> >> I don't understand this last bit about the number of devices attach=
ed
> >> >> to the host bridges.  Logically, the host bridge has a bus number
> >> >> aperture that you can know up front, even before you know anything
> >> >> about what devices are below it.  On x86, for example, the ACPI _CRS
> >> >> method has something like "[bus 00-7f]" in it, which means that any
> >> >> buses in that range are below this bridge.  That doesn't tell us
> >> >> anything about which buses actually have devices on them, of course;
> >> >> it's just analogous to the secondary and subordinate bus number
> >> >> registers in a P2P bridge.
> >> >
> >> > That's one of the issues I still need to take care of. Currently no =
bus
> >> > resource is attached to the individual bridges (nor the PCI controll=
er
> >> > for that matter), so the PCI core will assign them dynamically.
> >>
> >> So your PCI controller driver knows how to program the controller bus
> >> number aperture?  Sometimes people start by assuming that two host
> >> bridges both have [bus 00-ff] apertures, then they enumerate below the
> >> first and adjust the bus number apertures based on what they found.
> >> For example, if they found buses 00-12 behind the first bridge, they
> >> make the apertures [bus 00-12] for the first bridge and [bus 13-ff]
> >> for the second.  That might be the case, depending on what firmware
> >> set up, but it seems like a dubious way to do it, and of course it
> >> precludes a lot of hot-plug scenarios.
> >
> > No, that's not what I meant. What happens is that no pre-assigned bus
> > range is specified for either of the host bridges, so that the range
> > 0x00-0xff will be assigned by default in pci_scan_root_bus().
>=20
> My concern is about making the kernel's idea of the host bridge bus
> number aperture match what the hardware is doing.  I'm pretty sure
> that the default [bus 00-ff] range assigned by pci_scan_root_bus()
> doesn't actually match the hardware in most cases, at least when we
> have multiple host bridges in the same PCI domain.
>=20
> For example, if you don't supply a bus number range,
> pci_scan_root_bus() will assume [bus 00-ff] for both host bridges.
> But if you could put an analyzer on each of the root buses and then
> read bus 0 config space, will you see that config transaction on
> *both* buses?  I doubt it.
>=20
> You have to know at least the bus number of the root bus up front
> before you can even start enumerating it.  The only way to learn that
> is by reading registers in the host bridge or by some external
> mechanism like ACPI or device tree.  That's the beginning of the bus
> number aperture.  The end of the aperture is similar: we can't
> reliably determine it by enumerating devices below the host bridge, so
> we have to know it up front.  You can enumerate starting with the root
> bus number and assigning new subordinate bus numbers as necessary, but
> unless you know the host bridge aperture to begin with, you could
> inadvertently assign a new bus number that actually belongs to a
> different host bridge.

Yes, that was my understanding as well. So currently I haven't seen any
problems with this because I only use one of the two host bridges. But I
suppose I should add code to initialize the bus number aperture properly
either via platform device resources (for the non-DT case) and the
device tree otherwise.

Thierry

--9amGYk9869ThD9tj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQK7jEAAoJEN0jrNd/PrOh47IP+gJYmvRiggoyOG9LuHs/s6zT
L7IpPD3uraAH9YSBEks9l/fedCigt3usXYSDJmQDX2HWYrlugFkdDSQnI0e80XCZ
4d1E703sTex5Sk6ZPM8ColPT0c9UPDREFO+30BYgg/t/MMDkcQf13r+6nZgUexT3
1HauMt2mCS1x2xoqYJbajejCF9peoPTK8gXnpLRIy66YMBpw5yLSsqWNMbIjAPGC
5irebFg7lxGCsAV8A2S8ETRlkPrSfsWhnDVwW1ZJ6TX8d1Vrhd2xJsvMH55rsCTU
lzWz0mG8gOEpnF3hTcucoTRP7UfPh6cjXQXjB3z2XlnQSt0gvGA6lKyxlUdxgSY1
csQRIgI8/n4b1VZIH1DJm2t1rO9UWC9b3TfrAF+2phQnvVUSreykXfHy4WNCKHDj
S/LYZm9upoLOmm8CVEuvtZ2U7gTvVv5zjA96pL7919JhE37pFzylWaBudXxxDKRj
W07FEs26xwkFe4ujVbJ9WRZ+qz7TcimW78TmKNgnBKD7+6B5Sd8yHzUTbkwgSVz+
5sYQ/HNjyGQPOUG+DF+9oBNyJT1cl7FE0tgH2c3K0shfVUVXV7W01Tg/t3EOWuKK
Eng/0vLvn6RGBwdSsL65//RX69f3GZYw2aWP4Hh2mNcYHIRsOQ5skCatN+iSeiSK
CE4JJG+qs5+JAj/9/Qg1
=DLvF
-----END PGP SIGNATURE-----

--9amGYk9869ThD9tj--
