From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Thu, 16 Aug 2012 09:47:16 +0200
Message-ID: <20120816074716.GB17917@avionic-0098.mockup.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <201208152025.25252.arnd@arndb.de>
 <20120816045539.GA17067@avionic-0098.mockup.avionic-design.de>
 <201208160703.50364.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="neYutvxvOLaeuPCA"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201208160703.50364.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--neYutvxvOLaeuPCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 07:03:50AM +0000, Arnd Bergmann wrote:
> On Thursday 16 August 2012, Thierry Reding wrote:
> > At least for the config space this is incorrect. There's a single region
> > to access the configuration space for all devices below the PCIe
> > controller. So it is shared by both (Tegra20) or all three (Tegra30)
> > root ports.
> >=20
> > I'm not sure about PCI domains. Do you have any good pointers as to
> > where I could read up on them? If they need special hardware support,
> > then I think Tegra doesn't support them either. At least I haven't come
> > across any mention of domains while going through the, admittedly some-
> > what sparse on PCIe, Tegra documentation.
>=20
> I was referring to the same thing here: if you had a separate config
> space for each root port, they would by definition be separate PCI
> domain. So you don't have them.

I see, that makes sense. Thanks for explaining.

Thierry

--neYutvxvOLaeuPCA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLKWEAAoJEN0jrNd/PrOhQsoQAKg1R4z8SJDFPgExlKdQsMqf
cpKOhKyUp5q38Uy5PymdolAZakmZfcxYlFsDfykrBu8Nw4AerLhTZxwcx3Q29b0u
TEvxBYt6NNYzY9H0BJWDUHphpbwcxdKrUP+5Lgp7+/fxStOAIa89RpU2uiAz7P+t
XKLv0vj+4A0hvfu1l94vrjVCDMVtqzM/sc8cW/X6IO290JqMY3Jj23TsWJ5EbRrF
dGuZLL+qQFpqPmwQIUf+L/9qkU6OkxuCQoco5JaRbTtchb406rAT1y7S6vVc03Ny
D/pjR/tRBJWnBs+Ldd8MkFwVk8kOACdrMTYJPjSwPcK4V3/jwAq+mjClUZNHtiEF
Yhqt/adO03YILnuvvQTdReYr10obzOHcg/GRM50HwxC3spKbvjy/z1oiJyvR19K5
nkxw6vkpUob83ahByAIb5v2K3jA74/k2vbL03QhMvYl7Y6xYlbOey8JVu5zrRfQP
l8yG+W8m1NC5/VOIl//b02KkhXp31/r5PKcblxujXrl2dtDHXOP+FQv33zPNQqft
gj+YF2EFVXvQ8VxuH6G+NImX2tYCynbiM14ozzNUYtTUbqGyIci97qEvuUyMpehl
kSFkIg5N1BWNYEf2eD3aP2XUvOk0lLHhlV52EJL39I4A0LdTn9/Fy0Az6kEBYyEG
euUsJVvaWofo0+rxQvDq
=Ew59
-----END PGP SIGNATURE-----

--neYutvxvOLaeuPCA--
