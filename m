From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: obtaining a regulator from a phandle
Date: Tue, 6 Mar 2012 12:39:47 +0100
Message-ID: <20120306113947.GA22769@avionic-0098.mockup.avionic-design.de>
References: <20120305152157.GA12927@avionic-0098.adnet.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF17BE861C09@HQMAIL01.nvidia.com>
 <20120305165514.GA21298@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120305165514.GA21298-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Monday, March 05, 2012 8:22 AM:
> > > This all works well, except there seems to be no API to obtain a regu=
lator
> > > from the DT phandle.
> >=20
> > regulator_get(pcie_dev, "pex-clk") should work.
>=20
> Ah, I see. That would call regulator_dev_lookup(), which would call
> of_get_regulator() which will lookup the pex-clk-supply property. I
> will give that a shot.

regulator_get(&pdev->dev, "pex-clk") worked as expected.

> > Of course, the PCIe host on Tegra isn't yet a platform device, so would
> > have to be converted.
>=20
> I've already converted that. I was going to send the patch when I've test=
ed
> that this works in a DT setup as well. So far I have only tested it on no=
n-
> DT Harmony.

Adding DT support seems to be more complicated than I anticipated. Starting
=66rom the platform driver that works on non-DT Harmony I added DT support =
to
the tps6586x driver in order to be able to use its regulators from the PCIe
driver (also extended with DT support). That worked great.

However, the PCIe controller needs another (fixed) regulator as VDD supply.
On Harmony (and the hardware that I use) this is GPIO#2 of the PMU (tps6586=
x)
so I added another regulator to the device tree which uses that GPIO and
passed it to the PCIe device node (vdd-supply property).

And this is precisely where things get ugly. Now there is a dependency
problem between the fixed regulator and the PMU which provides the GPIO. Bo=
th
the PMU and the fixed regulator are setup via subsys_initcall(), and the
regulator beats the PMU, resulting in the fixed regulator being unable to g=
et
the GPIO because it hasn't been setup yet. So I remembered Grant's deferred
probing patch from yesterday and thought I'd try it out. This worked great,
and the fixed regulator was properly set up after all other devices had been
probed.

The PCIe driver now also needs deferred probing until the fixed regulator is
present, which also works as expected. But then the problems start. Since n=
ow
we're so far into the boot process that all __init{,data} is gone, therefore
pci_common_init() is no longer present, resulting in an ugly crash.

So the only way I see out of this is patch up everything so that PCI
initialization can actually be done after init memory is freed. This would
have the added benefit that the driver could actually be built as a module.

Does anyone see another (easier) way out of this?

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9V94MACgkQZ+BJyKLjJp9I1wCgijlukkvcMR5z/Dxl8G6Vorgx
nIwAoJAJjWBp4Md3xZ88EdLR44MkCN8C
=c1zn
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
