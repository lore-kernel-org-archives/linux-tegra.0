From: Liviu Dudau <liviu.dudau@arm.com>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 1 Jul 2016 17:09:23 +0100
Message-ID: <20160701160923.GF8609@e106497-lin.cambridge.arm.com>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
 <20160701144648.GC8609@e106497-lin.cambridge.arm.com>
 <4061641.rLdO1g8OBR@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4061641.rLdO1g8OBR@wuerfel>
Sender: linux-pci-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Tomasz Nowicki <tn@semihalf.com>, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 01, 2016 at 05:44:09PM +0200, Arnd Bergmann wrote:
> On Friday, July 1, 2016 3:46:48 PM CEST Liviu Dudau wrote:
> > On Thu, Jun 30, 2016 at 05:19:30PM +0200, Thierry Reding wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >=20
> > > This patch makes the existing pci_host_bridge structure a proper =
device
> > > that is usable by PCI host drivers in a more standard way. In add=
ition
> > > to the existing pci_scan_bus, pci_scan_root_bus, pci_scan_root_bu=
s_msi,
> > > and pci_create_root_bus interfaces, this unfortunately means havi=
ng to
> > > add yet another interface doing basically the same thing, and add=
 some
> > > extra code in the initial step.
> > >=20
> > > However, this time it's more likely to be extensible enough that =
we
> > > won't have to do another one again in the future, and we should b=
e
> > > able to reduce code much more as a result.
> >=20
> > I am really disapointed by the direction in which the whole pci_hos=
t_bridge
> > structure and associated functions is going. When I started to get =
involved
> > in this mess that is the creation of a root PCI bus I was hoping th=
at we
> > are moving towards one or few functions that create the root bus by=
 using
> > the details provided in the host bridge without having so many vari=
ants for
> > the functionality.
>=20
> That is the plan, we just never made a lot of progress here.
>=20
> > One reason for this holy mess is the duplication of information. Bo=
th root
> > bus and the pci_host_bridge hold pointers to useful information (ms=
i_controller,
> > pci_ops) and coherency should be guaranteed when one or the other g=
ets created.
> > Hence the ridiculous dance being done to find if root bus hasn't al=
ready been
> > created and if not reusing the scrap bus we have created at the top=
 of
> > pci_create_root_bus() to actually set the data, then create the pci=
_host_bridge,
> > oops we need more information, and so on. (apologies for the incohe=
rent style,
> > I'm trying to duplicate the spirit of the probe.c code :) )
>=20
> Agreed.
>=20
> > I think this patchset has the right intention but it is not doing i=
t in
> > the right way. To me, the right way is to separate the whole alloca=
tion
> > of the pci_host_bridge structure from the scanning or the root bus =
(keeping the
> > INIT_LIST_HEAD(&bridge->windows) call inside), not add the sysdata =
pointer
> > *at all* to pci_host_bridge, move the information from pci_bus into=
 pci_host_bridge
> > and make pci_scan_root_bus take a pci_host_bridge pointer once that=
 has been
> > done.
>=20
> Again, this is what I'm doing here, unfortunately we cannot remove th=
e
> sysdata pointer altogether as we still have over a hundred existing P=
CI
> host bridge implementations that all use sysdata.
>=20
> > Think of the code structure as a reflection of how the system is st=
ructured: the
> > PCI-to-host bridge is a structure that holds the information requir=
ed to connect
> > the functionality of the host code (msi_controller, host-to-bus res=
ource windows)
> > to the PCI(e) bus. The root pci_bus should only have PCI(e) bus inf=
ormation if
> > possible.
>=20
> Exactly.
>=20
> > >=20
> > > The main idea is to pull the allocation of 'struct pci_host_bridg=
e' out
> > > of the registration, and let individual host drivers and architec=
ture
> > > code fill the members before calling the registration function.
> >=20
> > That's how we got into the arch/arm mess that we currently have. Th=
e host driver
> > should not drive the instantiation of the pci_host_bridge structure=
 because it
> > will prevent you from having two drivers running at the same time.
>=20
> Can you clarify that? I don't see what prevents two drivers from each
> creating a pci_host_bridge structure and passing it into
> pci_host_bridge_register().

Maybe I'm exagerating a bit, but I always disliked the pci_common_init(=
) function and
the way it is creating a pci_host_bridge while relying on hw_pci hooks =
to get
things ready. I'm pretty sure there are still issues around the fact th=
at a lot of
platform drivers have a subsys_initcall() function that calls pci_commo=
n_init(). I
don't want us to go down that path again.

Don't get me wrong, clearly someone needs to create an instance of pci_=
host_bridge.
What I want people to accept is that in the PCI(e) architecture there i=
s nothing that
stops a piece of HW that used to be the bridge between host and underly=
ing bus into
becoming the bridge between a higher PCI(e) bus and the bus underneath.=
 If the writes
to the configuration registers happens somehow, the Host Bridge doesn't=
 even know if
it is talking to the actual host. Can the driver in that case make sure=
 it did not made
assumptions that were tied to a specific SoC implementation?

>=20
> > > -static struct pci_host_bridge *pci_alloc_host_bridge(struct pci_=
bus *b)
> > > -{
> > > -	struct pci_host_bridge *bridge;
> > > -
> > > -	bridge =3D kzalloc(sizeof(*bridge), GFP_KERNEL);
> > > -	if (!bridge)
> > > -		return NULL;
> > > -
> > > -	INIT_LIST_HEAD(&bridge->windows);
> > > -	bridge->bus =3D b;
> > > -	return bridge;
> > > -}
> > > -
> >=20
> > You might have strong arguments for removing this function but they=
 are not properly
> > explained here and I feel that they should. Specially as ....
>=20
> In my initial version, it simply became unnecessary because all calle=
rs
> of pci_host_bridge_register() would have to allocate it anyway, and w=
ith
> the pci_bus assignment gone, it didn't do much at all.
>=20
> > >  static const unsigned char pcix_bus_speed[] =3D {
> > >  	PCI_SPEED_UNKNOWN,		/* 0 */
> > >  	PCI_SPEED_66MHz_PCIX,		/* 1 */
> > > @@ -2117,53 +2104,56 @@ void __weak pcibios_remove_bus(struct pci=
_bus *bus)
> > >  {
> > >  }
> > > =20
> > > -struct pci_bus *pci_create_root_bus(struct device *parent, int b=
us,
> > > -		struct pci_ops *ops, void *sysdata, struct list_head *resource=
s)
> > > +void pci_host_bridge_init(struct pci_host_bridge *bridge)
> > > +{
> > > +	INIT_LIST_HEAD(&bridge->windows);
> > > +}
> > > +EXPORT_SYMBOL_GPL(pci_host_bridge_init);
> >=20
> > I have no idea why it is useful to re-initialise the bridge->window=
s list at any
> > time other than allocation time.
>=20
> That's why I suggested doing this in the allocation function now.

Understood. Thanks for the explanations, I did not manage to keep track=
 of all the old
discussions around PCIe, specially if they were prefixed with ACPI ;)

Best regards,
Liviu

>=20
> > > +int pci_host_bridge_register(struct pci_host_bridge *bridge)
> > >  {
> > >  	int error;
> > > -	struct pci_host_bridge *bridge;
> > >  	struct pci_bus *b, *b2;
> > >  	struct resource_entry *window, *n;
> > > +	LIST_HEAD(resources);
> > >  	struct resource *res;
> > >  	resource_size_t offset;
> > >  	char bus_addr[64];
> > >  	char *fmt;
> > > +	struct device *parent =3D bridge->dev.parent;
> > > =20
> > >  	b =3D pci_alloc_bus(NULL);
> > >  	if (!b)
> > > -		return NULL;
> > > +		return -ENOMEM;
> > > +	bridge->bus =3D b;
> > > =20
> > > -	b->sysdata =3D sysdata;
> > > -	b->ops =3D ops;
> > > -	b->number =3D b->busn_res.start =3D bus;
> > > +	/* temporarily move resources off the list */
> > > +	list_splice_init(&bridge->windows, &resources);
> >=20
> > What are you trying to accomplish here with the moving around of th=
e bridge->windows list
> > elements? This also leaves the bridge->windows list empty afterward=
s, is that intended?
>=20
> I was trying to preserve the existing behavior, this can probably
> be simplified, but as my initial version was completely untested
> I decided not to touch it.
>=20
> Later in the function, the list is filled one entry at a time from
> the local 'resources' list that we traditionally passed as a function
> argument before.
>=20
> Ideally we'd just walk the list instead of doing the
> split/list_del/list_add dance, and this would be a logical
> cleanup on top of this patch.
>=20
> > > @@ -817,6 +821,8 @@ struct pci_bus *pci_scan_bus(int bus, struct =
pci_ops *ops, void *sysdata);
> > >  struct pci_bus *pci_create_root_bus(struct device *parent, int b=
us,
> > >  				    struct pci_ops *ops, void *sysdata,
> > >  				    struct list_head *resources);
> > > +void pci_host_bridge_init(struct pci_host_bridge *bridge);
> > > +int pci_host_bridge_register(struct pci_host_bridge *bridge);
> > >  int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int busm=
ax);
> > >  int pci_bus_update_busn_res_end(struct pci_bus *b, int busmax);
> > >  void pci_bus_release_busn_res(struct pci_bus *b);
> >=20
> > There is too much stuff moving around. I know it is needed and the =
temptation is to get it
> > done as quickly as possible, but it makes the reviewing and the com=
menting on this series hard.
>=20
> This is why I left the list handling you mentioned above unchanged
> in my original patch instead of rewriting it.
>=20
> > Can you split the patch into one that adds the new members
> > into pci_host_bridge, then do the renaming/re-organisation in
> > another patch?
>=20
> That should be possible, I guess Thierry can deal with that when resp=
inning
> the series.
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
