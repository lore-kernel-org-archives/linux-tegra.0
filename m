From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Thu, 10 Jan 2013 08:19:37 +0100
Message-ID: <20130110071937.GG15212@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <201301092119.57067.arnd@arndb.de>
 <20130109215428.GA13648@avionic-0098.adnet.avionic-design.de>
 <201301092210.49452.arnd@arndb.de>
 <50EDF95F.4070209@wwwdotorg.org>
 <20130109231758.GA27065@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2NLGdgz3UMHa/lqP"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130109231758.GA27065-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--2NLGdgz3UMHa/lqP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 04:17:58PM -0700, Jason Gunthorpe wrote:
> On Wed, Jan 09, 2013 at 04:12:31PM -0700, Stephen Warren wrote:
> > On 01/09/2013 03:10 PM, Arnd Bergmann wrote:
> > > On Wednesday 09 January 2013, Thierry Reding wrote:
> > >> What happens on Tegra is that we need to map 256 MiB of physical mem=
ory
> > >> to access all the PCIe extended configuration space. However, iorema=
p()
> > >> on such a large region fails if not enough vmalloc() space is availa=
ble.
> > >>
> > >> This was observed when somebody tested this on CardHu which has a 1 =
GiB
> > >> of RAM and therefore remapping the full 256 MiB fails.
> > ...
> > > Have you checked if the hardware supports an alternative config
> > > space access mechanism that does not depend on a huge address range?
> > > A lot of them provide an index/data register pair somewhere, as the
> > > original PC implementation did.
> >=20
> > That would be nice, but I've talked to the HW engineers, and there's no
> > indication that any alternative mechanism exists.
>=20
> It seems to be convention that extended config space is often only
> accessible through mmio space, that was true on x86 last I checked
> too..
>=20
> You could decrease the size of the mapping to only span the bus
> numbers that are configured for use via DT.

That won't work, unfortunately. The mapping is such that the bus number
is not encoded in the uppermost bits, the extended register number is.
So the only thing that we could do is decrease the size of the extended
register space for *all* devices.

> Are there any concerns about these config registers being accessed
> from a context where a new mapping can't be made? Interrupt? Machine
> Check? PCI-E Advanced Error Reporting?

I haven't checked but I would expect configuration space accesses to not
happen in interrupt context. Usually they are limited to enumeration and
driver probe.

Thierry

--2NLGdgz3UMHa/lqP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7muJAAoJEN0jrNd/PrOh2gIP/02NOmXXylPLiU2mox/a8mL2
2YXDH6MTawsnD/e2IVVzp7v6mCzxF/y1BTBdlVOF12S7qCyfBUR/xW1cx/KoImt4
KP5Sy/16An48VlFOt/qXG+xu3fs7TbkveA4NeRbt9spb1E9fh6ac0a4IKyBPMv5b
vra+hbtPhBBdloN2RIsmyA54dQM8qXuLVuLTWjp97V5+HcJ4SRTsKML2AoPM2ioC
DeT4l+bjH8Ga/K/oCztpy73UqcPNC8v6TGnZPkwvQAW6htH2Jdd7VeV1jp6MIlPi
uEtoLvSrfwab5IcAMYIfbxJAxlv2hixG4ppD1uZ6qPJ66hLGvYvD9XIvR6m1MK50
/QgbK97eM6Pd/1rlWGb+Mg3CQBOiFbmRfHn9ERkgIP+5BFKcAEqCY9xEMj+csiRW
4VeN9DUsp5o8+ZhSOkTXLUiucOyddROvg2T8Dup0MWtRwXmlWSgC5oGXiahBjoZb
wu2vebLe2z8O8nekHZ19BY9U0LGOkeWVfjgGZx5oV4b649LGCGi5lekHaMYP/XhP
8o21HFtbMN2tkE6oMjJOeICRVPKgRJ/St/AzDgBRRZDCcBFqiDee6Dtdhwuh0IHm
WNVQSetWgx8Z3kd7wPAzbZ8GrFuypBZ71vwMG9nfOGkiaDcXqCOJeFWhOl3WC4C5
gasjBRZOjYnX/A4w+V4I
=81U8
-----END PGP SIGNATURE-----

--2NLGdgz3UMHa/lqP--
