From: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 1 Jul 2016 15:46:48 +0100
Message-ID: <20160701144648.GC8609@e106497-lin.cambridge.arm.com>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160630151931.29216-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 30, 2016 at 05:19:30PM +0200, Thierry Reding wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>=20
> This patch makes the existing pci_host_bridge structure a proper devi=
ce
> that is usable by PCI host drivers in a more standard way. In additio=
n
> to the existing pci_scan_bus, pci_scan_root_bus, pci_scan_root_bus_ms=
i,
> and pci_create_root_bus interfaces, this unfortunately means having t=
o
> add yet another interface doing basically the same thing, and add som=
e
> extra code in the initial step.
>=20
> However, this time it's more likely to be extensible enough that we
> won't have to do another one again in the future, and we should be
> able to reduce code much more as a result.

I am really disapointed by the direction in which the whole pci_host_br=
idge
structure and associated functions is going. When I started to get invo=
lved
in this mess that is the creation of a root PCI bus I was hoping that w=
e
are moving towards one or few functions that create the root bus by usi=
ng
the details provided in the host bridge without having so many variants=
 for
the functionality.

One reason for this holy mess is the duplication of information. Both r=
oot
bus and the pci_host_bridge hold pointers to useful information (msi_co=
ntroller,
pci_ops) and coherency should be guaranteed when one or the other gets =
created.
Hence the ridiculous dance being done to find if root bus hasn't alread=
y been
created and if not reusing the scrap bus we have created at the top of
pci_create_root_bus() to actually set the data, then create the pci_hos=
t_bridge,
oops we need more information, and so on. (apologies for the incoherent=
 style,
I'm trying to duplicate the spirit of the probe.c code :) )

I think this patchset has the right intention but it is not doing it in
the right way. To me, the right way is to separate the whole allocation
of the pci_host_bridge structure from the scanning or the root bus (kee=
ping the
INIT_LIST_HEAD(&bridge->windows) call inside), not add the sysdata poin=
ter
*at all* to pci_host_bridge, move the information from pci_bus into pci=
_host_bridge
and make pci_scan_root_bus take a pci_host_bridge pointer once that has=
 been
done.

Think of the code structure as a reflection of how the system is struct=
ured: the
PCI-to-host bridge is a structure that holds the information required t=
o connect
the functionality of the host code (msi_controller, host-to-bus resourc=
e windows)
to the PCI(e) bus. The root pci_bus should only have PCI(e) bus informa=
tion if
possible.

>=20
> The main idea is to pull the allocation of 'struct pci_host_bridge' o=
ut
> of the registration, and let individual host drivers and architecture
> code fill the members before calling the registration function.

That's how we got into the arch/arm mess that we currently have. The ho=
st driver
should not drive the instantiation of the pci_host_bridge structure bec=
ause it
will prevent you from having two drivers running at the same time.

>=20
> There are a number of things we can do based on this:
>=20
> * Use a single memory allocation for the driver-specific structure
>   and the generic PCI host bridge
> * consolidate the contents of driver specific structures by moving
>   them into pci_host_bridge
> * Add a consistent interface for removing a PCI host bridge again
>   when unloading a host driver module
> * Replace the architecture specific __weak pcibios_* functions with
>   callbacks in a pci_host_bridge device
> * Move common boilerplate code from host drivers into the generic
>   function, based on contents of the structure
> * Extend pci_host_bridge with additional members when needed without
>   having to add arguments to pci_scan_*.
> * Move members of struct pci_bus into pci_host_bridge to avoid
>   having lots of identical copies.
>=20
> As mentioned in a previous email, one open question is whether we wan=
t
> to export a function for allocating a pci_host_bridge device in
> combination with the per-device structure or let the driver itself
> call kzalloc.
>=20
> Changes in v2 (Thierry Reding):
> - add a pci_host_bridge_init() helper that drivers can use to perform
>   all the necessary steps to initialize the bridge
> - rename pci_register_host() to pci_host_bridge_register() to reflect
>   the naming used by other functions
> - plug memory leak on registration failure
>=20
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/pci/probe.c | 111 ++++++++++++++++++++++++++++++++----------=
----------
>  include/linux/pci.h |   8 +++-
>  2 files changed, 75 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 77f0bbb05c3f..ba40514acd32 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -521,19 +521,6 @@ static void pci_release_host_bridge_dev(struct d=
evice *dev)
>  	kfree(bridge);
>  }
> =20
> -static struct pci_host_bridge *pci_alloc_host_bridge(struct pci_bus =
*b)
> -{
> -	struct pci_host_bridge *bridge;
> -
> -	bridge =3D kzalloc(sizeof(*bridge), GFP_KERNEL);
> -	if (!bridge)
> -		return NULL;
> -
> -	INIT_LIST_HEAD(&bridge->windows);
> -	bridge->bus =3D b;
> -	return bridge;
> -}
> -

You might have strong arguments for removing this function but they are=
 not properly
explained here and I feel that they should. Specially as ....

>  static const unsigned char pcix_bus_speed[] =3D {
>  	PCI_SPEED_UNKNOWN,		/* 0 */
>  	PCI_SPEED_66MHz_PCIX,		/* 1 */
> @@ -2117,53 +2104,56 @@ void __weak pcibios_remove_bus(struct pci_bus=
 *bus)
>  {
>  }
> =20
> -struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
> -		struct pci_ops *ops, void *sysdata, struct list_head *resources)
> +void pci_host_bridge_init(struct pci_host_bridge *bridge)
> +{
> +	INIT_LIST_HEAD(&bridge->windows);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_bridge_init);

I have no idea why it is useful to re-initialise the bridge->windows li=
st at any
time other than allocation time.

> +
> +int pci_host_bridge_register(struct pci_host_bridge *bridge)
>  {
>  	int error;
> -	struct pci_host_bridge *bridge;
>  	struct pci_bus *b, *b2;
>  	struct resource_entry *window, *n;
> +	LIST_HEAD(resources);
>  	struct resource *res;
>  	resource_size_t offset;
>  	char bus_addr[64];
>  	char *fmt;
> +	struct device *parent =3D bridge->dev.parent;
> =20
>  	b =3D pci_alloc_bus(NULL);
>  	if (!b)
> -		return NULL;
> +		return -ENOMEM;
> +	bridge->bus =3D b;
> =20
> -	b->sysdata =3D sysdata;
> -	b->ops =3D ops;
> -	b->number =3D b->busn_res.start =3D bus;
> +	/* temporarily move resources off the list */
> +	list_splice_init(&bridge->windows, &resources);

What are you trying to accomplish here with the moving around of the br=
idge->windows list
elements? This also leaves the bridge->windows list empty afterwards, i=
s that intended?

> +	b->sysdata =3D bridge->sysdata;
> +	b->msi =3D bridge->msi;
> +	b->ops =3D bridge->ops;
> +	b->number =3D b->busn_res.start =3D bridge->busnr;
>  #ifdef CONFIG_PCI_DOMAINS_GENERIC
>  	b->domain_nr =3D pci_bus_find_domain_nr(b, parent);
>  #endif
> -	b2 =3D pci_find_bus(pci_domain_nr(b), bus);
> +	b2 =3D pci_find_bus(pci_domain_nr(b), bridge->busnr);
>  	if (b2) {
>  		/* If we already got to this bus through a different bridge, ignor=
e it */
>  		dev_dbg(&b2->dev, "bus already known\n");
> +		error =3D -EEXIST;
>  		goto err_out;
>  	}
> =20
> -	bridge =3D pci_alloc_host_bridge(b);
> -	if (!bridge)
> -		goto err_out;
> -
> -	bridge->dev.parent =3D parent;
> -	bridge->dev.release =3D pci_release_host_bridge_dev;
> -	dev_set_name(&bridge->dev, "pci%04x:%02x", pci_domain_nr(b), bus);
> +	dev_set_name(&bridge->dev, "pci%04x:%02x", pci_domain_nr(b),
> +		     bridge->busnr);
>  	error =3D pcibios_root_bridge_prepare(bridge);
> -	if (error) {
> -		kfree(bridge);
> +	if (error)
>  		goto err_out;
> -	}
> =20
>  	error =3D device_register(&bridge->dev);
> -	if (error) {
> +	if (error)
>  		put_device(&bridge->dev);
> -		goto err_out;
> -	}
> +
>  	b->bridge =3D get_device(&bridge->dev);
>  	device_enable_async_suspend(b->bridge);
>  	pci_set_bus_of_node(b);
> @@ -2174,7 +2164,7 @@ struct pci_bus *pci_create_root_bus(struct devi=
ce *parent, int bus,
> =20
>  	b->dev.class =3D &pcibus_class;
>  	b->dev.parent =3D b->bridge;
> -	dev_set_name(&b->dev, "%04x:%02x", pci_domain_nr(b), bus);
> +	dev_set_name(&b->dev, "%04x:%02x", pci_domain_nr(b), bridge->busnr)=
;
>  	error =3D device_register(&b->dev);
>  	if (error)
>  		goto class_dev_reg_err;
> @@ -2190,12 +2180,12 @@ struct pci_bus *pci_create_root_bus(struct de=
vice *parent, int bus,
>  		printk(KERN_INFO "PCI host bridge to bus %s\n", dev_name(&b->dev))=
;
> =20
>  	/* Add initial resources to the bus */
> -	resource_list_for_each_entry_safe(window, n, resources) {
> +	resource_list_for_each_entry_safe(window, n, &resources) {
>  		list_move_tail(&window->node, &bridge->windows);
>  		res =3D window->res;
>  		offset =3D window->offset;
>  		if (res->flags & IORESOURCE_BUS)
> -			pci_bus_insert_busn_res(b, bus, res->end);
> +			pci_bus_insert_busn_res(b, bridge->busnr, res->end);
>  		else
>  			pci_bus_add_resource(b, res, 0);
>  		if (offset) {
> @@ -2215,16 +2205,16 @@ struct pci_bus *pci_create_root_bus(struct de=
vice *parent, int bus,
>  	list_add_tail(&b->node, &pci_root_buses);
>  	up_write(&pci_bus_sem);
> =20
> -	return b;
> +	return 0;
> =20
>  class_dev_reg_err:
>  	put_device(&bridge->dev);
>  	device_unregister(&bridge->dev);
>  err_out:
>  	kfree(b);
> -	return NULL;
> +	return error;
>  }
> -EXPORT_SYMBOL_GPL(pci_create_root_bus);
> +EXPORT_SYMBOL_GPL(pci_host_bridge_register);
> =20
>  int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int bus_max)
>  {
> @@ -2289,6 +2279,43 @@ void pci_bus_release_busn_res(struct pci_bus *=
b)
>  			res, ret ? "can not be" : "is");
>  }
> =20
> +static struct pci_bus *pci_create_root_bus_msi(struct device *parent=
,
> +		int bus, struct pci_ops *ops, void *sysdata,
> +		struct list_head *resources, struct msi_controller *msi)
> +{
> +	struct pci_host_bridge *bridge;
> +	int ret;
> +
> +	bridge =3D kzalloc(sizeof(*bridge), GFP_KERNEL);
> +	if (!bridge)
> +		return NULL;
> +
> +	pci_host_bridge_init(bridge);
> +	bridge->dev.parent =3D parent;
> +	bridge->dev.release =3D pci_release_host_bridge_dev;
> +	bridge->busnr =3D bus;
> +	bridge->ops =3D ops;
> +	bridge->sysdata =3D sysdata;
> +	bridge->msi =3D msi;
> +	list_splice_init(resources, &bridge->windows);
> +
> +	ret =3D pci_host_bridge_register(bridge);
> +	if (ret) {
> +		kfree(bridge);
> +		return NULL;
> +	}
> +
> +	return bridge->bus;
> +}
> +
> +struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
> +		struct pci_ops *ops, void *sysdata, struct list_head *resources)
> +{
> +	return pci_create_root_bus_msi(parent, bus, ops, sysdata, resources=
,
> +				       NULL);
> +}
> +EXPORT_SYMBOL_GPL(pci_create_root_bus);
> +
>  struct pci_bus *pci_scan_root_bus_msi(struct device *parent, int bus=
,
>  		struct pci_ops *ops, void *sysdata,
>  		struct list_head *resources, struct msi_controller *msi)
> @@ -2304,12 +2331,10 @@ struct pci_bus *pci_scan_root_bus_msi(struct =
device *parent, int bus,
>  			break;
>  		}
> =20
> -	b =3D pci_create_root_bus(parent, bus, ops, sysdata, resources);
> +	b =3D pci_create_root_bus_msi(parent, bus, ops, sysdata, resources,=
 msi);
>  	if (!b)
>  		return NULL;
> =20
> -	b->msi =3D msi;
> -
>  	if (!found) {
>  		dev_info(&b->dev,
>  		 "No busn resource found for root bus, will use [bus %02x-ff]\n",
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 8badb664be00..5bf04e20c1cd 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -405,10 +405,14 @@ static inline int pci_channel_offline(struct pc=
i_dev *pdev)
> =20
>  struct pci_host_bridge {
>  	struct device dev;
> -	struct pci_bus *bus;		/* root bus */
> +	struct pci_ops *ops;
> +	void *sysdata;
> +	int busnr;
> +	struct pci_bus *bus;		/* points to root */
>  	struct list_head windows;	/* resource_entry */
>  	void (*release_fn)(struct pci_host_bridge *);
>  	void *release_data;
> +	struct msi_controller *msi;
>  	unsigned int ignore_reset_delay:1;	/* for entire hierarchy */
>  	/* Resource alignment requirements */
>  	resource_size_t (*align_resource)(struct pci_dev *dev,
> @@ -817,6 +821,8 @@ struct pci_bus *pci_scan_bus(int bus, struct pci_=
ops *ops, void *sysdata);
>  struct pci_bus *pci_create_root_bus(struct device *parent, int bus,
>  				    struct pci_ops *ops, void *sysdata,
>  				    struct list_head *resources);
> +void pci_host_bridge_init(struct pci_host_bridge *bridge);
> +int pci_host_bridge_register(struct pci_host_bridge *bridge);
>  int pci_bus_insert_busn_res(struct pci_bus *b, int bus, int busmax);
>  int pci_bus_update_busn_res_end(struct pci_bus *b, int busmax);
>  void pci_bus_release_busn_res(struct pci_bus *b);
> --=20
> 2.8.3
>=20

There is too much stuff moving around. I know it is needed and the temp=
tation is to get it
done as quickly as possible, but it makes the reviewing and the comment=
ing on this series hard.
Can you split the patch into one that adds the new members into pci_hos=
t_bridge, then do the
renaming/re-organisation in another patch?

Best regards,
Liviu

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF
