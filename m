From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Thu, 10 Jan 2013 21:20:07 +0100
Message-ID: <20130110202007.GA26139@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130109231758.GA27065@obsidianresearch.com>
 <20130110071937.GG15212@avionic-0098.adnet.avionic-design.de>
 <201301100917.19577.arnd@arndb.de>
 <20130110102544.GA5546@avionic-0098.adnet.avionic-design.de>
 <20130110182007.GA28004@obsidianresearch.com>
 <20130110185505.GA22944@avionic-0098.adnet.avionic-design.de>
 <20130110190327.GA23110@avionic-0098.adnet.avionic-design.de>
 <20130110192417.GA18478@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bg08WKrSYDhXBjb5"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130110192417.GA18478-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:24:17PM -0700, Jason Gunthorpe wrote:
> On Thu, Jan 10, 2013 at 08:03:27PM +0100, Thierry Reding wrote:
>=20
> > > > You'd piece a mapping together, each bus requires 16 64k mappings, a
> > > > simple 2d array of busnr*16 of pointers would do the trick. A more
> > > > clever solution would be to allocate contiguous virtual memory and
> > > > split that up..
> =20
> > > Oh, I see. I'm not very familiar with the internals of remapping, so
> > > I'll need to do some more reading. Thanks for the hints.
> >=20
> > I forgot to ask. What's the advantage of having a contiguous virtual
> > memory area and splitting it up versus remapping each chunk separately?
>=20
> Not alot, really, but it saves you from the pointer array and
> associated overhead. IIRC it is fairly easy to do in the kernel.

I've been investigating this a bit, and one problem is that it will
prevent the driver from ever building as a module because the necessary
functions aren't exported and I'm not sure exporting them would be
acceptable. Currently PCI host controller drivers with MSI support can't
be built as modules because the MSI infrastructure requires it, but I
briefly discussed this with Bjorn at some point and it should be easy to
remove that requirement.

> Arnd's version is good too, but you would be restricted to aligned
> powers of two for the bus number range in the DT, which is probably
> not that big a deal either?

Stephen suggested on IRC that we could try to keep a bit of dynamicity
in the allocation scheme if we create the bus mapping when the first
device on the bus is probed and discard the mapping if no devices are
found.

Sounds like a good plan to me. Does anybody see any potential pitfalls?

Thierry

--bg08WKrSYDhXBjb5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7yJ3AAoJEN0jrNd/PrOhEg0QAJPCMtXWjZXnTSmq19nw7FHc
BsHrbTN/Sp1W0Qp2qcLSP5fz6P4YmoTOsBQkzNOsrTgaXKt1CLid50/yMTcx7Gx/
LOEaP1pQEpR/PlD4TB/nbrGGPTesQYZvqkfIec2Cl4S9TfSKB/EabXkPvguYDjf8
8xi2IZMpPpjq52RV2jGeNopoDx1KcGSkSqSugdkO3vHdW3rJktEhGtctlZl3w/ez
y8KevdheBGTeWItLoKK2bfDsFsdsacrlsVI+lfH+9H7s/GpMKeKF3lu0zW9gNn7Y
i9By+Yui6asRjMG7IQtqAHqFsTdgfuxuLzI8C4GS4BdQZfv4GFCfbTrowVkVOhnf
BCDy108ZeKMs+Ji6zgam1RdX9JDnCWmZGhLClNHfZBeHkHY4SPTQrY3Yj+xYmmHZ
FSIYMeEF+aJSlvrSsjNYWGlw20XBZ+fdZ9u0jabVQd8TAfJQImNKeDj4PWqDQgVJ
zViVDkIXR+fz7T8b0KRMmMJFOOeTghyLZiW3oMKrpJ7peSiQ+39TZK+PZXw7nk0v
BUtooEnvOLgCYJ2NGBQH8Kz7X0g3/0T/NwVM8p+S97cnlPYjYKIx6tCJJMfoqThO
qQpucmG+itb3GUqK/JDpevW93iiUyJXbmQ21VsDI2AIMaZebWhFLGI0AS0/w2utv
0/Lj3UwnORhiJ4Yx8Wuj
=iWfk
-----END PGP SIGNATURE-----

--bg08WKrSYDhXBjb5--
