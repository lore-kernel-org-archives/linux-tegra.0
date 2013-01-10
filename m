From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Thu, 10 Jan 2013 08:10:01 +0100
Message-ID: <20130110071001.GD15212@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <201301092119.57067.arnd@arndb.de>
 <20130109215428.GA13648@avionic-0098.adnet.avionic-design.de>
 <201301092210.49452.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jCrbxBqMcLqd4mOl"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201301092210.49452.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jCrbxBqMcLqd4mOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 10:10:49PM +0000, Arnd Bergmann wrote:
> On Wednesday 09 January 2013, Thierry Reding wrote:
> > What happens on Tegra is that we need to map 256 MiB of physical memory
> > to access all the PCIe extended configuration space. However, ioremap()
> > on such a large region fails if not enough vmalloc() space is available.
> >=20
> > This was observed when somebody tested this on CardHu which has a 1 GiB
> > of RAM and therefore remapping the full 256 MiB fails.
>=20
> Hmm, config space accesses are fairly rare and generally not expected
> to be fast, and 256 MB is really a huge waste of virtual address space,
> so I agree that just ioremapping the entire space is not a good
> solution.
>=20
> However, it's not clear that a cache is necessary. Have you measured
> a significant performance benefit of this implementation over just
> iorempping and unmapping a single page for every config space access?

No, I had not actually implemented it that way because I figured I might
just as well implement something generic with the added benefit that
most remapping operations would be cached automatically since the PCI
enumeration algorithms usually access the configuration space of a
single device at a time, so it actually maps to the best case for an LRU
based cache approach.

> Even if we actually want a cache, how about a private implementation
> that just remembers a single page in LRU? I doubt that there are
> more drivers that would benefit from a generalized version that you
> provide.

I can move the code to the Tegra PCIe driver, but there's quite a bit of
code that isn't actually related to the PCI functionality and I'd really
like to avoid cluttering the driver with this implementation. Keeping it
in a more central location will certainly increase the code's visibility
and make it easier for other potential users to find.

Also I just noticed that I hadn't actually added a parameter to the
iomap_cache_create() function to specify the maximum number of pages, so
currently the code only uses a single page anyway. It should be trivial
to change. I guess performance was good enough with a single page that I
didn't have a reason to increase the maximum number of pages.

Thierry

--jCrbxBqMcLqd4mOl
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7mlJAAoJEN0jrNd/PrOho4cQALbzSwxNCIfBwwmk9GtLE5XQ
uqdn6xhQU/mO1BlT6UVa5/4RI84uTfVel0sedtV4BFrJDZJLht9J5TvxmkdzxvXz
ISM0sZbgJ6MMjc3NasG6y0jDcS3qh+zx8zJHmEXE8HN+jud3oXYalSVJSfo80Jsx
QAeK5yicCDkhgHYyZIQhMk8TvI04IhC6/UlejbBWRt14mNeXyq6a0IYVmYTVuMcT
39k2j0VDsaAsnCXOv1cBHkArT7l/VwFZsELcuSmRhKbm4HcX7SotRsUe1J2CKaSo
5HHUCSmkyPCG0fRqn6+g/qAX9QtXxpuieToNxp1po64yJy8ulviTlfD2o9YrBmul
u1ns6gwvqoyKq3QlmKbFutMQKldGxsigQET94S+2fdqOwpx3O58EoFLqGqlV+zlS
4kEvXCs3usAaTxmXQkJbDomcxiW67k4T2BbA6ZJfKZoRokLABdOmBs0wymr9QnjJ
GzzRZqwFyoboJM9t89jn9hfKHnf0gCaZbrCApw4DH2LEceDtec7UeT1+bARDBbVT
07gB797w2zRohZsWW7thGnFzahs7QGEHd3CGDjK9eqOx2pDRKmqryQ5ZH8kVLv6n
UfP0em4az2L/LBw34q7jk/10aNzX6jfAi+2+roxxYQDAYAMF/hmKoudlLsQxsvsV
s2WIjuw1xBKT2TGHtiyh
=5aoQ
-----END PGP SIGNATURE-----

--jCrbxBqMcLqd4mOl--
