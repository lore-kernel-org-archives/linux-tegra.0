From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 00/14] Rewrite Tegra PCIe driver
Date: Thu, 10 Jan 2013 07:55:37 +0100
Message-ID: <20130110065537.GC15212@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130109222517.3c590553@skate>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kfjH4zxOES6UT95V"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130109222517.3c590553@skate>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kfjH4zxOES6UT95V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 10:25:17PM +0100, Thomas Petazzoni wrote:
> Dear Thierry Reding,
>=20
> On Wed,  9 Jan 2013 21:43:00 +0100, Thierry Reding wrote:
> > This patch series contains an almost complete rewrite of the Tegra PCIe
> > driver. The code is moved to the drivers/pci/host directory and turned
> > into a proper platform driver, adding MSI and DT support while at it.
> > Other PCI host controller drivers can be added to that directory in an
> > attempt to make it easier to factor out common code.
>=20
> Thanks!
>=20
> I have started basing the Marvell PCIe code on some of your earlier
> versions. But apparently in this final version, you no longer have the
> emulated Host bridge. Why so?

The reason is that with the latest bindings the matching of root ports
to device tree nodes works as-is and nothing else indicates that the
emulated host bridge is actually required to make any of this work. So
in order not to introduce unneeded code I've left it out for now. If
somebody decides that we actually need this host bridge (for standards
compliance or whatnot) it could easily be added back.

However, before the emulated bridge implementation can be merged I think
the PCI ID issue needs to be resolved.

> For the Marvell PCIe code, I've used your emulated Host bridge, and
> added an emulated PCI-to-PCI bridge implementation, in order to get the
> following hierarchy:
>=20
>  + Host Bridge
>    + PCI-to-PCI bridge
>      + PCI Device
>    + PCI-to-PCI bridge
>      + PCI device
>=20
> So, I instantiate one unique emulated Host Bridge, and then one
> emulated PCI-to-PCI Bridge for each PCIe interface that I have.

Oh dear, that's even worse than on Tegra. The Marvell hardware doesn't
even expose the root ports as PCI devices on the bus?

> The nice thing about that is that I can then read the configuration
> space of the PCI-to-PCI bridge to find out how much I/O space and
> memory space is needed for the device connected to this interface, and
> at which address is has been mapped. This greatly helps my "address
> decoding" problem, and removes the ad-hoc virtual space allocator I had
> written.
>=20
> Is there a reason for having given up on this idea? Is there still a
> hope for a different PCIe implementation to use this idea?

I suppose that in your case it really makes sense because you already
need the emulated PCI-to-PCI bridges and therefore adding an emulated
host bridge doesn't add much. As I said, for Tegra everything still
works without, so I didn't see a reason to add needless code.

Thierry

--kfjH4zxOES6UT95V
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7mXpAAoJEN0jrNd/PrOhlVsP/jcXpyH5rON/7kzJSE1glNvK
jFGOLe3BWaBkZyDyQ9XtsJ5xOgci8I0D4iVXJgY5jcJeS+fwNMwwPSXx3HlsM5v9
bka1yhkobFAJRO1wsEC5sCa+FBq6QkbrvC32fUZiNpfC1tq5Rpc0HvkHcKefxaAP
Jw3xuJOgS4B/W9VWahtgtXZUFyRik7w4yGkHJFT/25EtbP1AiqGPxJNc+PVaQgq+
bXqh489xB6phdZT/04IvDijaVleoMJ/DOb1HE4VT6unM/blCkmccM+TpuQQsFPm/
QGvtaSyePTI4ks8f3QIB98MC/2arTYSkeJdgLBhZuEZh93zXW0hn8yT4ZDVGYSNX
kGSIaEwThR3OjwtFti8lucIFjB1akAO5dSf57rU9KbbnH9ahh/pmb1aR7mmTrdNi
XArGZ8SucR2b28gLNZRV4CcmQfg0pA/sfiPLDKAutZy/JHsWgUJ3ZtU3P7mswUSu
blnuyTe1dO9lSt5lLQ3KkOImWta4TO7+EVxzz9lQ4s17aXJsXl0AZAx6xPkEeutU
9qymt/qkiGufU0d40uSMIZHF9k2jx39MrzU5WKbEJF4q0BrywJUt5SxhL8xM5+KZ
hmqbXvWSqk+p/ezzL55oC99EYZKnHuuxRXOYzrMRH7qJA+nSoXVuBamOt7NP5QC+
rNG12Dyn9WobzrH25JQ3
=VwsQ
-----END PGP SIGNATURE-----

--kfjH4zxOES6UT95V--
