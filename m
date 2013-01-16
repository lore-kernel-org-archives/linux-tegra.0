From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Wed, 16 Jan 2013 12:52:25 +0100
Message-ID: <20130116115225.GA15873@avionic-0098.adnet.avionic-design.de>
References: <20130109231758.GA27065@obsidianresearch.com>
 <20130110071937.GG15212@avionic-0098.adnet.avionic-design.de>
 <201301100917.19577.arnd@arndb.de>
 <20130110102544.GA5546@avionic-0098.adnet.avionic-design.de>
 <20130110182007.GA28004@obsidianresearch.com>
 <20130110185505.GA22944@avionic-0098.adnet.avionic-design.de>
 <20130110190327.GA23110@avionic-0098.adnet.avionic-design.de>
 <20130110192417.GA18478@obsidianresearch.com>
 <20130116101822.GA17706@avionic-0098.adnet.avionic-design.de>
 <20130116112556.GR23505@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130116112556.GR23505-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 16, 2013 at 11:25:56AM +0000, Russell King - ARM Linux wrote:
> On Wed, Jan 16, 2013 at 11:18:22AM +0100, Thierry Reding wrote:
> > 		err =3D ioremap_page_range(virt, virt + SZ_64K - 1, phys,
>=20
> Why -1 here?

Right, I forgot that end in these functions always means one byte after
the end. Removing the -1 seems to get past the remapping at least.
Reading the configuration space through the mapping doesn't though. I'll
investigate some more.

Thanks for pointing this out Russell.

Thierry

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9pR5AAoJEN0jrNd/PrOhFAwP/RJbvVzV80bNgHLrp+Cm89Bt
eWkJ0siumvDSyHm2o7GmgNN1AbgR2LlH7a5AVbBZo2HutMEWjMLe7dNNS4LPuhz/
w+GmY9J3qlSjNRrClJrOu2p6vhhIIDYKKTCQTj0YTRT2fCa5RzM5oo2LlPVvLJRW
vgUCDHBlA14NWPBGODjffpgyiH4Cv/jtV95o8rv2kCgce+Hr/VkhUxDtjdXN/WDL
IQs7xwS5lj8ZAPG4ylv/Sp5OLDDpF3nHOrkikEeuBCZZwy89buiHta32JBVeRWo4
Flz7/VGIOuaTdrVGbWqyN2PRsmeRco/c1R1ep0o8IVMykLx9DwzBRnOVpeh8gn7s
0USCfRIRhIEhhV0GQNNbOLoMs55nu0nreBChWqmDfpu16ORDrcWyiB/+eFx/Kwvl
yp+Y35n155CXmpWv5mpG/MxsS4nkJ0yAwpdtVDKykaN1wA14/Q0z0kj2Q4z9Vl+n
LPXgDBnvQe1XQfsu/gIUR5qmhpcPQMFIQ3NskjpqgrNIGWMotZXYhh2vLFiyQCn9
LVggn2ru7EE7erN6d4/HRxRpzYGfr1IDclGpbyHt6zfLlYjVWgE9wJQnji398NGZ
wePCQc2hWTdOGAfkQHiJrqjSFiaMYzfDFFwu/cN/WIK37geQTF5DLr/krdyxHxOx
3HvFjPjAwtgIeScXZXtj
=b3tU
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
