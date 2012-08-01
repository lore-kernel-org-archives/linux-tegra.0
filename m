From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 00/10] ARM: tegra: Add PCIe device tree support
Date: Wed, 1 Aug 2012 08:35:45 +0200
Message-ID: <20120801063545.GA26791@avionic-0098.adnet.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <50180547.9040603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50180547.9040603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2012 at 10:18:15AM -0600, Stephen Warren wrote:
> On 07/26/2012 01:55 PM, Thierry Reding wrote:
> > This patch series adds support for device tree based probing of the PCIe
> > controller found on Tegra SoCs.
>=20
> Thierry,
>=20
> I think one thing that would help here would be to split up this series
> into one per subsystem, and to get all the dependencies merged by the
> respective maintainers. Preferably, each subsystem would export a stable
> branch (perhaps consisting of just these patches) that I can then merge
> into the Tegra tree and use as a basis for the PCIe driver itself.
> Hopefully this approach will get more traction on all the non-Tegra
> changes. Does that sound like a good plan?

I don't understand. The series is already split up into per-subsystem
patches. I just didn't want to post them separately so everybody on Cc
would be able to see the big picture and the reason why the patch was
required.

> Or, I can just take it all through the Tegra tree, but I'll definitely
> need acks on all/most of the non-Tegra patches, since although the
> patches themselves are quite small, I'd like to be sure that maintainers
> are OK with the conceptual changes, like initializing PCI controllers
> later than at present etc.

Taking the patches through the individual trees should be fine. Only so
far other subsystem maintainers haven't commented on this.

As to when the PCI controller is initialized, there really aren't many
options. On Harmony (and TEC, which in this respect, and others, is very
similar) the VDD is supplied by a GPIO of the PMU, so it is currently
necessary to probe it at least after the PMU. And unless we want to
work around these issues using different initcall ordering we need to
rely on deferred probing, which turns out to be done after the init
phase often (always?).

Also I had been toying with making the Tegra PCIe driver work as a
module, but that doesn't work currently with MSI support. However it
might be nice to allow MSI controllers to register at runtime generally,
which wouldn't be all that difficult to do I think. Of course somebody
more knowledgeable may disagree.

Thierry

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQGM5BAAoJEN0jrNd/PrOhMMsP/jXL0GKN5NUE7OdHFwUV/DrX
05Qvq8qUl/K61phGiq8Q1hw6HSZJPBcX5ROaIVwvtu21CDCULnO5XOXAdGx3pP0y
gwzdPF/BL1AWsRFbtwu4wV0PpYeG+x0mNuZ3K04zKJc2qXtcgonNPFBG47cdJw+N
BaeslBXB//3Dh+QBMMvRE+mTnV81YsavdZTxfhonNjziCvwGYU/qbGh1C6cQpoHy
nhvVYnx7y2yDFe3dndDOE5XeeuhFSFzT6E6/eBXWkhKhVSDvf9me8CUuRtnWToXX
3bWwgysu+J5KvggtH4nva3qK4VUdoAW7came4i0+gAwBp+mZM5wewDR5hqTor4EG
AfBF4y30S9+/b4hIrtW17uBqeuEPFaw76rteRA7QIGtbY19suPXAtMrWFeV6HzvT
TDnFO6kRU2pf3CUkDkXGloMd9ZdRZixTyH5X6CzCF29qUj+AUfctuQdkxM/7q/sH
v55Xdts8y0MVV+1WC68NvDZ8u6rqvycbWPlxfCsgAO9t1siGhn14cRwRc82BAl5J
7kiIVM0ea/RrBeSz2WLIInCfjgPXik/VN02Imi98wlyShRT3yobwORqmCfBfNEA2
HIWAycTaMNjSz0McvENffc0YTlSzY+krKiAlEfe3jJk+x0ewWvbXQ8Rf4N52MBaH
z2Uqv+g94+PkJXSasFnU
=lXfK
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
