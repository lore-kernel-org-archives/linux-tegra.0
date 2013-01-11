From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 01/14] of/pci: Provide support for parsing PCI DT ranges
 property
Date: Fri, 11 Jan 2013 05:02:10 +0100
Message-ID: <20130111040210.GC28094@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-2-git-send-email-thierry.reding@avionic-design.de>
 <50EF5798.6040405@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50EF5798.6040405-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 05:06:48PM -0700, Stephen Warren wrote:
> On 01/09/2013 01:43 PM, Thierry Reding wrote:
> > From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
> >=20
> > DT bindings for PCI host bridges often use the ranges property to descr=
ibe
> > memory and IO ranges - this binding tends to be the same across archite=
ctures
> > yet several parsing implementations exist, e.g. arch/mips/pci/pci.c,
> > arch/powerpc/kernel/pci-common.c, arch/sparc/kernel/pci.c and
> > arch/microblaze/pci/pci-common.c (clone of PPC). Some of these duplicate
> > functionality provided by drivers/of/address.c.
> >=20
> > This patch provides a common iterator-based parser for the ranges prope=
rty, it
> > is hoped this will reduce DT representation differences between archite=
ctures
> > and that architectures will migrate in part to this new parser.
> ...
>=20
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
>=20
> > +const __be32 *of_pci_process_ranges(struct device_node *node,
>=20
> > +	while (from + np <=3D end) {
> > +		u64 cpu_addr, size;
> > +
> > +		cpu_addr =3D of_translate_address(node, from + na);
> > +		size =3D of_read_number(from + na + pna, ns);
> > +		res->flags =3D bus->get_flags(from);
> > +		from +=3D np;
> > +
> > +		if (cpu_addr =3D=3D OF_BAD_ADDR || size =3D=3D 0)
> > +			continue;
>=20
> Hmmm. That seems to just ignore bad entries in the ranges property. Is
> that really the right thing to do? At least printing a diagnostic might
> be a good idea, even if the code does just soldier on in the hope
> everything still works.

That's true. However, erroring out here wouln't be useful either since a
NULL return value is used to mark the end of the iteration and the
caller would have to assume that no more ranges are present. Maybe
that's better than continuing anyway, even if a message is printed.

Alternatively, the of_pci_process_ranges() could be changed to return an
ERR_PTR() encoded errno. This is one case where it makes a lot of sense.
I have a feeling that Grant won't like that very much, though.

Another possibility would be to change away from an iterator-based
approach and return an integer for the number of ranges and negative
error code on failure while returning an allocated array of resources
through an output parameter.

Thierry

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ747CAAoJEN0jrNd/PrOh/bQP/0IiT1xF+Klj+SSKlmrwUhEX
dgfuEscTyb+N1OHfVfvwDxRaRq0z2z+cwHdF/gjehUuwDkWBomvjonoPpauNs4uj
h4Rv3wvx0skXscKOxJgNB6vNbIAnoKgzBlJ13Z20AtxdqkncdTC8ZW/dRHCuW9W8
Cpv33q0Utl706pHpVAw/0KMlq3zrRYQz42cIYeSrMxwzaWlFAexk5HcEwem2/pUW
1/1Y6EhHO3FAS7IhQyLnnjVWlR89Gd9DzvYeCndLnP9lXfQ2FyKm83hKq8QqGpVN
g+54HeYMMGeQn2u4M9c+BJqUt7q8eiRnCMlZN0W02UI/9Vhq+znh6cAGGDruBXzZ
atkaJOxM997lYzBDgZA5u8AjS9O+n35UWNpyDgKoSJ05E7SuSBh/tBJuu1XVRu4z
ueE/HERCWFon2QodEYUk5iNvt+NDM66nrfxXh9BIOd045Al8eXdHQ4dhslLXS8Sz
qHC3dwoNKozfIHWrq4vAat+ERW79s1WgOf/NPLwpugdn56/wGCXJEQdblEDK/6Mj
BtgE7VlX88knrMx0i8CXeMsCJIwyZds4WhZNRJ1ao4F+e+Tjc15zDZb0geq047+j
aCrHplrXuK9iKzWAHFmMuabYjGDyhsAKx8Ii7GACCO9CisJIz+tgT6sJZU6ypajw
65VE+KSnz/gVtV2KSnc+
=eyXO
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
