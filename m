From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use physical range for I/O mapping
Date: Wed, 26 Nov 2014 21:18:03 +0100
Message-ID: <20141126201758.GA19624@mithrandir>
References: <1417018897-3965-1-git-send-email-thierry.reding@gmail.com>
 <3072281.UjpXkitFjL@wuerfel>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <3072281.UjpXkitFjL@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2014 at 05:55:05PM +0100, Arnd Bergmann wrote:
> On Wednesday 26 November 2014 17:21:37 Thierry Reding wrote:
> > -
> > +       pci_add_resource_offset(&sys->resources, &pcie->pio, sys->io_of=
fset);
> >         pci_add_resource_offset(&sys->resources, &pcie->mem, sys->mem_o=
ffset);
> >         pci_add_resource_offset(&sys->resources, &pcie->prefetch,
> >                                 sys->mem_offset);
> >=20
>=20
> You don't set sys->io_offset anywhere, which is a bug if you have multiple
> instances of the PCI host in one system. In my draft patch, I was setting
> both io_offset and mem_offset for consistency, and while mem_offset would
> in practice be always zero (as discussed on IRC), the io_offset in fact h=
as
> a realistic chance of being nonzero and you should definitely set it.

I was going to do that in a follow-up patch since it isn't needed to fix
this particular regression.

Thierry

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJUdjV2AAoJEN0jrNd/PrOh4HcQAIHxZaSEQrjRSmM6BPUQjOVQ
zqCx1nrm+CLRMoIOewZjPbBPJa59JvXCJm63FSpQJRpNXae4/sxB5ZtbIuXlCYr3
ovpTFxESkZujWkBxuLGDjslJyYBKkCI3P2qBiUcMzgM5zFWa2PTPZrpn4JcsGVsy
ubIoIg3qFUWNHJVX3HJgqryw5D9nFKK4wgcTX23gdZZ8yp4Xh7l7Mp4LoIbC03GT
ooIXqtGFOES7xzdG8LSkpYbAqe+Kw9WrarLkyFug2evVQJX6o8N56vKRrX30uE4w
sZMJYK15mOEiNkjOorO5XJJgLAxw3xxxzf43T48a3LvnThJgj+qxH7vKGO7itZoM
RUEYP6pO5up3HV0AxbO2eiqwiJiWPBnuDgp6LXOQ5DgrJFfnIN5thQQER1DD9hZx
Ib5yixwavvVC4Il1j2Ngql86X2aVhRkV4eqeoO5C+YfPWTj5R6lgysJnqlKsQhGP
+L0SnSLGT4h8G9nIy0y/5uGAmkegk+/zuFnOKOERtVq44Ifggs5VIjVGIGnQ7Bor
U++3HS0bTQ9N90PFQmZ+UEDWLl/i5PxjFyrUheISRs+rhlrXf4wIF2/91mgVNIii
08WovZwPc1G5dZb9R1JkNVj/dI2vyawsbMoJlO30eDIXL0rGyIxAaMYtPysqj4+l
FJTbUphYQmp8yoQj2BE4
=WHKu
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
