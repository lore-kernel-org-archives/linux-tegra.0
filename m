From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Thu, 10 Jan 2013 19:57:30 +0100
Message-ID: <20130110185730.GB22944@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <201301100917.19577.arnd@arndb.de>
 <20130110102544.GA5546@avionic-0098.adnet.avionic-design.de>
 <201301101826.56248.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201301101826.56248.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--qcHopEYAB45HaUaB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 06:26:55PM +0000, Arnd Bergmann wrote:
> On Thursday 10 January 2013, Thierry Reding wrote:
> > I don't understand how this would help. The encoding is like this:
> >=20
> >         [27:24] extended register number
> >         [23:16] bus number
> >         [15:11] device number
> >         [10: 8] function number
> >         [ 7: 0] register number
> >=20
> > So it doesn't matter whether I use separate areas per bus or not. As
> > soon as the whole extended configuration space needs to be accessed a
> > whopping 28 bits (256 MiB) are required.
> >=20
> > What you propose would work if only regular configuration space is
> > supported. I'm not sure if that's an option.
>=20
> I mean something like:
>=20
> struct tegra_bus_private {
> 	...
> 	void __iomem *config_space[16];
> };
>=20
>=20
> void tegra_scan_bus(struct pci_bus *bus)
> {
> 	int i;
> 	struct tegra_bus_private *priv =3D bus->dev->private;
>=20
> 	for (i=3D0; i<16; i++)
> 		priv->config_space[i] =3D ioremap(config_space_phys +
> 				 65536 * bus->primary + i * SZ_1M, 65536);
>=20
> 	...
> }

Okay, I see. It's a bit kludgy, but I guess so was the I/O map cache.
It'll take some more time to work this out and test, but I'll give it
a shot.

Thierry

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7w8aAAoJEN0jrNd/PrOhNLUP/AztOrBB2e4h5l0+VeuzpWxz
4AiK84AP6TMOTGGgdgdCvpTWnZS4xLIL10c6QOiRIyT56gqN3aaVBtqQxph1W0mM
2EvmiIGnQ4A9ub8FyF5kVpZvS4n5r8Ostb9trr7V7h1ISCe4WTLSm7+4zqV2lfFh
xK6oOZCYIPf+yW6X2S5HVf/J4Aazci+wFfhdHYEE8jZn6Xi6Vi+PpCkUfiGncioq
H+hIcumFGaJU+VgYWaW/vuy/rgiNrKejA4vBt68pQ8yNFbVWgr0ue5gLZVWKGbX2
Cfok27eOITe3b+VA6SBZhWexafM92UzoB67VMzw9cMFsqRg7Mxc0wEqfrWiuup+8
AG5RWCAaF2QY2lkRbF2die0Tbw0IVqU1tIOYQw4vaG9B8szeti4OFFIl8XYNVe8z
jJpaj4H8992enDY0pDMAL2wfBEeTD+ZqIdfFsbM/h80UPWzr9bZDh5/rfhZ7GIwN
ESbIpQa91OWEmr1hN7TcqfL4p4GMsVSqJHsB9TK1kHBlyOFPwGdm9V6U5lXMtXRj
RVFw6UJ7Tvx0o4m4rXNQ0v9Z12ZDLSyLGwowVrRjXP2kuajr7bDU9I0eXDP1yq5Q
Cnui+x9jJVwf3LfgOMxJgP1VvcrXLM3ORWkAinde9N68fj4eSNDvlctJZNSu41jZ
xwvC4vWvB5CH8bBG2wxw
=obUg
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
