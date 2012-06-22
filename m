From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Fri, 22 Jun 2012 16:02:10 +0200
Message-ID: <20120622140210.GA32097@avionic-0098.mockup.avionic-design.de>
References: <20120613081910.GB6528@avionic-0098.mockup.avionic-design.de>
 <20120622110403.GA15710@avionic-0098.mockup.avionic-design.de>
 <20120622132253.GA30704@avionic-0098.mockup.avionic-design.de>
 <201206221348.39346.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KsGdsel6WgEHnImy"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201206221348.39346.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--KsGdsel6WgEHnImy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2012 at 01:48:39PM +0000, Arnd Bergmann wrote:
> On Friday 22 June 2012, Thierry Reding wrote:
> > > It seems like this isn't working properly. For some reason both the r=
eg
> > > property of pci@0 and pci@1 are translated to the same parent address
> > > 0x80000000. I'll have to investigate where exactly this goes wrong.
> >=20
> > So it turns out that while of_read_number() can actually read any number
> > of cells, only the two least significant are kept because it returns a
> > u64. Since of_bus_default_map() uses of_read_number() the addresses
> > <0 0 0> and <1 0 0> are in fact the same. I'm not sure how best to solve
> > this. I'm not aware of a 128 bit integer type in the kernel, so I guess
> > the better alternative would be to fix of_bus_default_map() to cope with
> > #address-cells > 2 properly.
>=20
> of_translate_address should get it right. Which codes uses of_read_number=
()?
> Can it be converted to use of_translate_address()?

Actually this is from of_translate_address(). The calling sequence looks
like this:

	of_address_to_resource()
	  __of_address_to_resource()
	    of_translate_address()
	      __of_translate_address()
	        of_translate_one()
	          of_bus_default_map()
	            of_read_number()

Thierry

--KsGdsel6WgEHnImy
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP5HrhAAoJEN0jrNd/PrOhpSoP/2dJqBOz5dAHlOYm5bO6JKCn
T8EmkjimgPc9auk4L1+x9g+eZxsRBK3RLrvAEzxREEf6H/aVmFA3mejKkPkYAzrW
bG97ZCwwc7lKtgEpRxvcKpUie0dJ+q4RxGG4jra77NJHa/kiuCMsx7NyLArHnFby
9+TiB1db1G/5D8yigkTac2tugNIyaNozHwgtQpGUTBklhz7q+cwDvCwT5LeAivuS
wdjGuleY2RMAA++gIQV1efdWmRUXxitHz1sciVLv8I7E7LHwnCSD4OWS6rMChfht
tZoKT64kZS+OKWZaxwAXiZSHHaSljA1ihhYnXBNWzD1UWXQUY0F19diphUyKqbu3
Tk1T+ebqco/teh7wm9nRy0w9/BmA2O/UPaoeihTAxYR6vxJQ7RV3dps4NQArKiCW
0xXDenjQ7Cjam+0e+jQOeZ73V3+dgoa2pWOBHYXuZ5AkLk6y2d5vSY5OKRoEHyIY
pOqujRVETTuExSyrZyzNYViykgYYaHVQvLPiodoXvJVdwC4TRS2dUw8N1ObHVRaW
Zh//IAGKjDI7CUvv8GxOHloatKT69jxyxAnBb73lonr2VUNATaWDADims6rdN/8i
8tzPOjU8Q3wSRQ3KgfVxd04BHR1xbUN65QKDvx6rc0WHL4RwJ8rP/nd5Cm3o0iIq
1N1enH8GljdveLxzRzla
=3yXM
-----END PGP SIGNATURE-----

--KsGdsel6WgEHnImy--
