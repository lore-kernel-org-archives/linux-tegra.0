From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 1 Jul 2016 15:52:44 +0100
Message-ID: <20160701145244.GD8609@e106497-lin.cambridge.arm.com>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
 <5307392.exoejlJp9x@wuerfel>
 <20160701141447.GB8609@e106497-lin.cambridge.arm.com>
 <6212651.41bebQZ9BM@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6212651.41bebQZ9BM@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 01, 2016 at 04:24:50PM +0200, Arnd Bergmann wrote:
> On Friday, July 1, 2016 3:14:47 PM CEST Liviu Dudau wrote:
> >=20
> > I'm confused. Why are we butchering the old pci_alloc_host_bridge()=
 function
> > to then go back and add re-add it in a different form?
>=20
> Good point, we could just keep the existing implementation and make i=
t
> an exported function without the bus argument.
>=20
> > The old pci_alloc_host_bridge() was doing mostly what the above
> > function does minus the bridge->private line. And the &bridge[1] co=
nstruct
> > could very well be pointing to the next struct pci_host_bridge alig=
ned address,
> > which means parts of priv area are ignored.
>=20
> I don't know what you mean with that. Would you rather write this as?
>=20
> 	bridge->private =3D bridge + 1;
>=20
> or leave it out and add a helper function
>=20
> void *pci_host_bridge_private(struct pci_host_bridge *bridge)
> {
> 	return &bridge[1];
> }

none of the above

>=20
> or do you mean we should have extra alignment in there so the
> private pointer has a minimum alignment higher than the
> alignment of struct pci_host_bridge?

but this ^. bridge pointer arithmetic means +1 is not necessarily +size=
of(struct pci_host_bridge)
bytes. AFAIK that can be rounded to the nearest natural alignment for p=
ointers on that
architecture.

>=20
> I'm absolutely fine with any of those suggestions, whichever
> makes the nicest API.

Does anyone need to subclass the pci_host_bridge structure? And is appe=
nding data right
after the structure useful?

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
