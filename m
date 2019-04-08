From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 0/6] usb: host: xhci-tegra: Add Tegra186 XUSB support
Date: Mon, 8 Apr 2019 17:02:55 +0200
Message-ID: <20190408150255.GA13288@ulmo>
References: <20190408081739.GB6644@ulmo>
 <Pine.LNX.4.44L0.1904081006330.1440-100000@iolanthe.rowland.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1904081006330.1440-100000@iolanthe.rowland.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jon Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2019 at 10:07:38AM -0400, Alan Stern wrote:
> On Mon, 8 Apr 2019, Thierry Reding wrote:
>=20
> > On Mon, Apr 01, 2019 at 12:40:44PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > Hi,
> > >=20
> > > This series introduces support for XUSB to the Tegra186 SoC. This is
> > > mostly the same as on earlier generations in that it provides an XHCI
> > > compatible interface with a bit of vendor-specific glue. Perhaps the
> > > most notable change is the removal of the IPFS wrapper. Patches for
> > > the UPHY related changes that control the PHYs for the XUSB controller
> > > were merged into v5.1.
> > >=20
> > > This version is a rebase of the series posted here:
> > >=20
> > >     http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D88=
193
> > >=20
> > > There have been no code changes and I collected Reviewed-by and Acked=
-by
> > > tags.
> > >=20
> > > Greg, can you pick up patches 1-3 with Rob's and Mathias' Acked-by,
> > > respectively? I'll pick up patches 4-6 into the Tegra tree.
> >=20
> > Hi Greg,
> >=20
> > would you mind picking up patches 1-3 of this series?
>=20
> FYI: Greg is on vacation for the coming week, with no email access.

Thanks for letting me know, Alan. I'll ping Greg again when he's back.

Thierry

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyrYpwACgkQ3SOs138+
s6EkeA/8C715419f8XxaZRrI3OuZ9lSHxmV5+wcNuR6Acb+qy5nYhDpG4bW97odQ
2VBkvUFPPlSciHcFsJ7qP70gd3mCLU0/1fvbuYwyRXJtak5XaJNWqcvOJJoNs4Iv
dZeOq+VVEiXYqle6ca6dT3j2Ofh81rpVcqWCTx2Olyo+uCUDv7V13kaW803QH6XJ
NMFAwB/ajxAcBEzg19pXDHttA4jJRNiz1ekt8cDi8D4h5lQy2ebRDjRO14VIeXGz
c1dx8gJXQihPc5HLy+bGl6mXNcmfw8tb9CJaD3ssZCIbzSYdYQcWA+vvFUT1Ltq5
IABNXL3HEJk7VWSSyJ66wsIonsdISVbQp9GbjKaRZbDAS25va7gaWMCUKEUQcFBy
sEWPRYJ4QASuRubFP6BZ9FhhNcm0Y0ALRnVIK5oQlTRqU7b/VLx0OalwFgy+zQu9
PG7NawTw8mVdWyAkdx2hUZ2IYgfWMnty53EYjuvsOSoLMZhTzyfaxSZfdi2IANHu
/MEKzKQvafzb+4KsEhPrBZfp1whhWjAZL35Qs17UXqPlEAXoYHaX+RXF/uB6S+Dl
6UrZlO/WXR4Pg/xh0r4AgcEePOgZdYjpg6lCq5DPHONSAnO4o+oyN/qtYAvlnJr8
kUJLDi/1iX6IW0JfOWiX89T1sO+YPx18eX2xMlTz9id0vIhDYF8=
=V6kD
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
