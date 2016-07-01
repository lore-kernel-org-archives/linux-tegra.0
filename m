From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 1 Jul 2016 15:14:47 +0100
Message-ID: <20160701141447.GB8609@e106497-lin.cambridge.arm.com>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
 <5307392.exoejlJp9x@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5307392.exoejlJp9x@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 30, 2016 at 05:37:35PM +0200, Arnd Bergmann wrote:
> On Thursday, June 30, 2016 5:19:30 PM CEST Thierry Reding wrote:
> > From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> >=20
> > This patch makes the existing pci_host_bridge structure a proper de=
vice
> > that is usable by PCI host drivers in a more standard way. In addit=
ion
> > to the existing pci_scan_bus, pci_scan_root_bus, pci_scan_root_bus_=
msi,
> > and pci_create_root_bus interfaces, this unfortunately means having=
 to
> > add yet another interface doing basically the same thing, and add s=
ome
> > extra code in the initial step.
>=20
> Thanks a lot for following up on my patches and getting them to work!
>=20
> > As mentioned in a previous email, one open question is whether we w=
ant
> > to export a function for allocating a pci_host_bridge device in
> > combination with the per-device structure or let the driver itself
> > call kzalloc.
> >=20
> > Changes in v2 (Thierry Reding):
> > - add a pci_host_bridge_init() helper that drivers can use to perfo=
rm
> >   all the necessary steps to initialize the bridge
>=20
> For these two points, the addition of pci_host_bridge_init() to me
> tips the balance in favour of having a separate allocation function
> that also does the initialization, something like
>=20
> struct struct pci_host_bridge *pci_host_bridge_alloc(size_t priv)
> {
> 	struct pci_host_bridge *bridge;
>=20
> 	bridge =3D kzalloc(sizeof(*bridge) + priv, GFP_KERNEL);
> 	if (!bridge)
> 		return NULL;
>=20
> 	INIT_LIST_HEAD(&bridge->windows);
>=20
> 	if (priv)
> 		bridge->private =3D &bridge[1];
>=20
> 	return bridge;
> }

I'm confused. Why are we butchering the old pci_alloc_host_bridge() fun=
ction
to then go back and add re-add it in a different form?

The old pci_alloc_host_bridge() was doing mostly what the above
function does minus the bridge->private line. And the &bridge[1] constr=
uct
could very well be pointing to the next struct pci_host_bridge aligned =
address,
which means parts of priv area are ignored.

Best regards,
Liviu

>=20
> 	Arnd
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
