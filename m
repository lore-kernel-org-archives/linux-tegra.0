From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Tue, 15 Jan 2013 22:14:41 +0100
Message-ID: <20130115211441.GA13139@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130114095706.GA23467@arm.com>
 <20130115120855.GA5637@avionic-0098.adnet.avionic-design.de>
 <201301151244.12767.arnd@arndb.de> <20130115154038.GA11241@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4171163522720820654=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130115154038.GA11241-5wv7dgnIgG8@public.gmane.org>
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
To: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--===============4171163522720820654==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Content-Disposition: inline


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 03:40:38PM +0000, Andrew Murray wrote:
> On Tue, Jan 15, 2013 at 12:44:12PM +0000, Arnd Bergmann wrote:
> > On Tuesday 15 January 2013, Thierry Reding wrote:
> > > I'm not sure I follow you're reasoning here. Is it possible to use MS=
Is
> > > without PCI? If not then I think there's little sense in keeping the
> > > implementations separate.
> >=20
> > Conceptually, you can use MSI for any device, but the Linux interfaces
> > for MSI are tied to PCI. If you use an MSI controller for a non-PCI
> > device, it would probably just appear as a regular interrupt controller.
> >=20
> > > Furthermore, if MSI controller and PCI host bridge are separate entit=
ies
> > > how do you look up the MSI controller given a PCI device?
> >=20
> > The host bridge can contain a pointer ot the MSI controller. You can
> > have multiple host bridges sharing a single MSI controller or you
> > can have separate ones for each host.
>=20
> Yes and I hoped this relationship would be described by a device tree pha=
ndle
> as is done for relating devices to their interrupt-parent (where device t=
rees
> are used). This would provide (arguably unnecessarily) greater flexibilit=
y,
> e.g. if you have two PCI/MSI controller pairs, the MSIs only offer limite=
d MSIs
> and you only use one PCI fabric - you could service different parts of the
> fabric by different MSI controllers (assuming you relate MSI controllers =
to
> part of the fabric and that you'd want to). Perhaps there would be benefi=
ts for
> virtualisation as well?

Is there actually hardware that supports this? I assumed that the MSI
controller would have to be tightly coupled to the PCI host bridge in
order to raise an interrupt when an MSI is received via PCI.

Thierry

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9cbBAAoJEN0jrNd/PrOhtl4P/jFRPjJMBYsIefiaxa04+iqT
3x9QHWpfSoQabBZedImODOBW//x/WY95wzU1svRNSn9KRP57HNoI1dSetfx7dsxv
UWJ5lklcJjfBCgj7m2WyG9V9Oh1YrZYJ006pie/Qi5i4YsVuLwAbXc5HyhwHHBzZ
/Xm3QRPqAyXHY/mWLdqRDMMC0EntcfK6VxiM7vGyhYlFDu/0Vok7leXUXu1KB4/c
yDVHB7miuzYAqX4BhrCk2Qvyt2vB7+EU40ZNOahWOJA0IYY9PcAHN36/WB6JKxFu
6my0R/Hl9XqsLim6e8nEbE6oglNnDgSITjKD+GHrQ7Jk+crhUyLBWbJpRpDVCI3Z
TqKhJgaHB5nOal4aCy3rCWx9Bzg6IT+LN3xGjLtzx3OxwCbDAdDjTO9knF4FEu3h
QlRMcx0Nm/vKmXE8GSeDBvjbDIoz6fAILZoIhDYG7cAcjeshDuUYLa9ZKJDxrsZU
VlVI51jMty+wLcAY9yVL3TYo/pPH96Iw4xNPC7gGSFe/QELh7coynxeEOjGxcC1C
BuuJrVP3iN1ozDsdU4N5sBqJMnn2yiuIHxznScPifa/9TK44OcmDffKUFOOYOXTV
raEZJjmFfCQqQf7FWdQcgK7KEYLB+5rAPhJxw+kdA5D5y8t6IFBTPn1faIf9e2XE
SQaQ+rKu8bPN9+wyPtr3
=JrIc
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--

--===============4171163522720820654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4171163522720820654==--
