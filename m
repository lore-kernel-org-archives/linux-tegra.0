From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 00/10] ARM: tegra: Add PCIe device tree support
Date: Tue, 14 Aug 2012 21:58:34 +0200
Message-ID: <20120814195834.GA10431@avionic-0098.mockup.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <50201E1D.5060200@wwwdotorg.org>
 <20120813174003.GA2527@avionic-0098.mockup.avionic-design.de>
 <50294BCA.1070807@wwwdotorg.org>
 <CAErSpo7og1XgOSv_mFCQ=hP7pq0j3gXWh2QFL2wBJjz7kcAq=g@mail.gmail.com>
 <502AA96B.2050709@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5221672487267184901=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502AA96B.2050709-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============5221672487267184901==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 14, 2012 at 01:39:23PM -0600, Stephen Warren wrote:
> On 08/13/2012 05:18 PM, Bjorn Helgaas wrote:
> > On Mon, Aug 13, 2012 at 11:47 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org=
> wrote:
> ...
> >> whereas for a device tree boot:
> >>
> >> (same):
> >>> [    2.112217] pci 0000:01:00.0: reg 10: [io  0x0000-0x00ff]
> >>> [    2.117635] pci 0000:01:00.0: reg 18: [mem 0x00000000-0x00000fff 6=
4bit pref]
> >>> [    2.124690] pci 0000:01:00.0: reg 20: [mem 0x00000000-0x00003fff 6=
4bit pref]
> >>> [    2.131731] pci 0000:01:00.0: reg 30: [mem 0x00000000-0x0001ffff p=
ref]
> >> ... (request region happens early)
> >>> [    2.179838] r8169 0000:01:00.0: BAR 0: requesting [io  0x0000-0x00=
ff]
> >>> [    2.193312] r8169 0000:01:00.0: BAR 2: requesting [mem 0x00000000-=
0x00000fff 64bit pref]
> >>> [    2.201397] r8169 0000:01:00.0: BAR 2: can't reserve [mem 0x000000=
00-0x00000fff 64bit pref]
> >>> [    2.209742] r8169 0000:01:00.0: (unregistered net_device): could n=
ot request regions
> >> ... (same, just happens too late)
> >>> [    2.236818] pci 0000:01:00.0: BAR 6: assigned [mem 0xa0000000-0xa0=
01ffff pref]
> >>> [    2.244027] pci 0000:01:00.0: BAR 4: assigned [mem 0xa0020000-0xa0=
023fff 64bit pref]
> >>> [    2.251794] pci 0000:01:00.0: BAR 2: assigned [mem 0xa0024000-0xa0=
024fff 64bit pref]
> >>> [    2.259542] pci 0000:01:00.0: BAR 0: assigned [io  0x1000-0x10ff]
> >>
> >> I suspect this is all still related to the PCI devices themselves being
> >> probed much earlier in the overall PCI initialization sequence when the
> >> PCI controller is probed later in the boot sequence, whereas PCI device
> >> probe is deferred until the overall PCI initialization sequence is
> >> complete if the PCI controller is probed very early in the boot sequen=
ce.
> >=20
> > I don't know what to apply your patches to (they don't apply cleanly
> > to v3.6-rc2), so I can't see exactly what you're doing.  But it looks
> > like you might be calling pci_bus_add_devices() before
> > pci_bus_assign_resource(), which isn't going to work.
>=20
> Yes, that's exactly what is happening.
>=20
> PCIe initialization starts in arch/arm/mach-tegra/pci.e
> tegra_pcie_init() which calls arch/arm/kernel/bios32.c
> pci_common_init(). That function first calls pcibios_init_hw() (in the
> same file, more about this later) and then loops over PCI buses, calling
> amongst other things pci_bus_assign_resources() then pci_bus_add_devices(=
).
>=20
> The problem is that ARM's pcibios_init_hw() calls pci_scan_root_bus()
> (or a host-driver-specific function which that also calls
> pci_scan_root_bus() in Tegra's case) which in turn calls
> pci_bus_add_devices() right at the end, before control has returned to
> pci_common_init() and hence before pci_bus_assign_resources() has been
> called.
>=20
> If I modify pci_scan_root_bus() and remove the call to
> pci_bus_add_devices(), everything works as expected.
>=20
> So, I guess the question is: Should ARM's pcibios_init_hw() not be
> calling pci_scan_root_bus(), or at least presumably the ARM PCI code
> needs to do things in a slightly different order?

Maybe pci_scan_root_bus() should be calling pci_bus_assign_resources()?
Or a new function could be added which also assigns the resources.

Thierry

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQKq3qAAoJEN0jrNd/PrOhP2cP/05Hri/fpgsloAYwBoPS1Bby
DzQI/WIjMSs2KbjJj5SnpS0o98CVQH31gjcENzPMBwHLG34UDfr1DyjNi0VHElTJ
OYt1y11lomN7uXpgH6ixP29YAT5ANXNPqYaqEf4qG046pWOFgFKOd6RF6gwZ0DZT
UvODa7314xtuEA9TuTRXD7rVK98cyh3ZiOiAtPSZu9KeT4Rz2uLX45D8lm+Na0zB
kJcqH+hbB/D2h2tCWkHPT7aDz4klTFiwvCaheZ+LSIIeUBl3sOlDeWCBK9/AOpwr
TEoNhVL0HskzeOJEZYK4vDKiGtOJyUYBY6HzyzD5z/5HA8mQcSpiDKUGl34lGXOQ
2HmuHRM4k3/6gZCmN4w/uCIl/iteiqvasapGuMQXFVivIuMF66ZhFox5HDeci7CS
EtRGVhPOxUSrgKJw2TzRnBfAoB/fytlig868B5dQvkQ0EEyR4dARBftrwhH2t5vH
l+xC4PBZFVWGG7qDYyb7nqfC54ZYrpEXcnsOsaeDISUsK/uDnAmASo+3nWrGEH9W
LelY+U3B0T0da7rwETY3neTRRIr0O0YqSJYtrKQnq1IxMK1UNDoqHnZmfXIORs5C
RnH/qQ0cC6FDEeVqNH0TOZVQ3gpz47n+GovrCQGVEsiaX+OTPi9WwbsVccB3p7kL
0GcjxSEIg1GcxMNF4mGi
=IpwQ
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

--===============5221672487267184901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============5221672487267184901==--
