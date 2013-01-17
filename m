From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Thu, 17 Jan 2013 17:05:02 +0100
Message-ID: <20130117160501.GC2186@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130115154038.GA11241@arm.com>
 <20130115211441.GA13139@avionic-0098.adnet.avionic-design.de>
 <201301161400.26587.arnd@arndb.de> <20130116161716.GA10630@arm.com>
 <20130116183101.GA28660@avionic-0098.adnet.avionic-design.de>
 <20130117154236.GA25943@arm.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7082275714256351033=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130117154236.GA25943-5wv7dgnIgG8@public.gmane.org>
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


--===============7082275714256351033==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Content-Disposition: inline


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2013 at 03:42:36PM +0000, Andrew Murray wrote:
> On Wed, Jan 16, 2013 at 06:31:01PM +0000, Thierry Reding wrote:
> > Alright, putting the functions into pci_ops doesn't sound like a very
> > good idea then. Or perhaps it would make sense for hardware where the
> > root complex and the MSI controller are handled by the same driver.
> > Basically it could be done as a shortcut and if those are not filled
> > in, the drivers could still opt to look up an MSI controller from a
> > phandle specified in DT.
> >=20
> > Even another alternative would be to keep the functions within the
> > struct pci_ops and use generic ones if an external MSI controller is
> > used. Just tossing around ideas.
>=20
> I think an ideal solution would be for additional logic in drivers/msi.c
> (e.g. in functions like msi_capability_init) to determine (based on the
> passed in pci_dev) which MSI controller ops to use. I'm not sure the best
> way to implement an association between an MSI controller and PCI busses
> (I believe arch/sparc does something like this - perhaps there will be
> inspiration there).
>=20
> As you've pointed out, most RCs will have their own MSI controllers - so
> it should be easy to register and associate both together.
>=20
> I've submitted my previous work on MSI controller registration, but it
> doesn't quite solve this problem - perhaps it can be a starting point?

We basically have two cases:

  - The PCI host bridge contains registers for MSI support. In that case
    it makes little sense to uncouple the MSI implementation from the
    host bridge driver.

  - An MSI controller exists outside of the PCI host bridge. The PCI
    host bridge would in that case have to lookup an MSI controller (via
    DT phandle or some other method).

In either of those cases, does it make sense to use the MSI support
outside the scope of the PCI infrastructure? That is, would devices
other than PCI devices be able to generate an MSI?

Thierry

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ+CEtAAoJEN0jrNd/PrOhVKwQAJaDTjXx1NQRUhFQU8TpJTW7
ldgQIySDQLUC9qo21QLUyfk7IeNL+av2WtmabqVc3eb1vLAoMH+EU5VRQjpD9XgO
fErTEhZcykifUcqHPDHOXQAMBGz9SRZ4K2644r+6tWO6kt5VtFTNNpeFxPVKzfAK
3y5rtwK9gnqaIHOizl+4rA4cRD8PPkcH1scd8A2WS8BioSuowDx2I/gSWZeNAFJb
oKsUixZa9kUwjJm9HEZRbaDf89PEOfNhu4uDqHXMyqGXeKgKYflcBPwPCusTtYOO
e/nEF1/oJJHqmwR8HLHXV8O74oCVmN++9yuvGjCC0oOAS0EbZdTJffeLwWDJZz7y
+Hmag0ZvGgkSKqdK8Sylf2y2uYzwTnMCWCh0USuI5yhpnZGAUR/8Tj1oqM29RL6q
rkC/1EnPryWU6EzHd/MBdzFCloBVH+x6Aw5LHrJEUv5Laj4gdSp7RmIA8fddo9VF
tuJbpjBGCpC0HFNyquX/dudScG1KOA1KC5fUMrCto4x0Ulr5s3+eVm696UkSdr3S
de0Dxvs97v7H0kbZ4FAUCFAW42wbvO8Cg8xIq6y6fAxe+hHb+UMBvxR28iWudXPT
gXMM0XdVlNfeWCZmzjvaUrLHGnismWw3hqcAiOwCR1Mhj4ctFIP3KQY833dT79og
5tXAg1HPR/mQe/KqPpfo
=Og++
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--

--===============7082275714256351033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============7082275714256351033==--
