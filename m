From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Thu, 14 Jun 2012 13:58:02 +0200
Message-ID: <20120614115802.GA22211@avionic-0098.mockup.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <201206141025.09325.arnd@arndb.de>
 <20120614103127.GA15904@avionic-0098.mockup.avionic-design.de>
 <201206141106.49142.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201206141106.49142.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 14, 2012 at 11:06:48AM +0000, Arnd Bergmann wrote:
> On Thursday 14 June 2012, Thierry Reding wrote:
> > On Thu, Jun 14, 2012 at 10:25:09AM +0000, Arnd Bergmann wrote:
> > > On Thursday 14 June 2012, Thierry Reding wrote:
> > > > >=20
> > > > > I believe you will need an "interrupt-map" property here, to map =
the host
> > > > > interrupts to the INTA-INTD lines of the attached devices.
> > > >
> > > > Legacy interrupts are something I cannot test at all because I have=
 no
> > > > hardware that supports them.
> > >=20
> > > Hmm, I thought all PCIe hardware has to support them when you do not
> > > enable MSI. What hardware do you have then?
> >=20
> > The TEC (Tamonten Evaluation Carrier) has an FPGA which is connected to=
 one
> > of the Tegra PCIe ports and it only supports MSIs.
>=20
> Ah, I see. FPGA based devices often have incomplete PCI support so that
> explains why you can't test it. The board also appears to have a
> PCIe mini port though, so anything that you could plug in there should
> also support LSI interrupts.

Yes, I haven't gotten my hands on a suitable module yet, but I'll try. I'm
not very familiar with legacy interrupts, though, and I'll have to read up
on the interrupt map bindings.

> > > > > I'm not sure whether we want to have a device_type=3D"pciex" prop=
erty here.
> > > > > powerpc and sparc seem to use that information, to distinguish a =
pcie
> > > > > bus from pci or cardbus.
> > > >=20
> > > > That'd be rather useless information given that the Tegra is unlike=
ly to
> > > > support either PCI or CardBus at some point.
> > >=20
> > > But the generic code does not know that.
> >=20
> > True. Still there's not much generic code on ARM, so maybe it'd be bett=
er to
> > add it along with the corresponding code?
>=20
> I hope we can make the PCI host probing architecture independent one day,
> instead of each architecture implementing their own. I'd say better put
> that property in there so we don't have to change it in case the future
> generic code will need it. It is part of the binding at
> http://www.openfirmware.org/1275/bindings/pci/pci-express.txt after all.

There seems to be quite a lot in the PCI core already. Unfortunately every
architecture seems to do things differently, so unification is probably goi=
ng
to be quite difficult.

> Note that we should generally not make /code/ be written with the
> anticipation of a future extension, but anything that concerns interfaces
> to code outside of the kernel (firmware or user space) is best written
> in a conservative way to allow later changes.

Okay, I'll add the property.

Thierry

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/Z0coACgkQZ+BJyKLjJp+6tQCghQ7yYNSKcSJ/x168DKtz4diw
smUAoKPRMvXLIpeQy9ohfNgOYvIbWKH3
=cH2h
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
