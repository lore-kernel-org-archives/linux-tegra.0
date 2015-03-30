From: Alex Williamson <alex.williamson-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 1/2] PCI: add helper function to find root port for
 device
Date: Mon, 30 Mar 2015 08:33:58 -0600
Message-ID: <1427726038.3643.913.camel@redhat.com>
References: <1427712913-13678-1-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427712913-13678-1-git-send-email-l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 2015-03-30 at 12:55 +0200, Lucas Stach wrote:
> This adds a simple way to get the root port a given device
> is connected to.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> v2: new patch in v2
> v3: rename to pci_find_rootport to fit better with other API
> v4: - rename to make it obvious that this function is PCIe specific
>     - fixes wrong assumption about what is a root bus in the presence
>       virtual buses
> ---
>  drivers/pci/search.c | 20 ++++++++++++++++++++
>  include/linux/pci.h  |  1 +
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/pci/search.c b/drivers/pci/search.c
> index a20ce7d5e2a7..d7c599103ae1 100644
> --- a/drivers/pci/search.c
> +++ b/drivers/pci/search.c
> @@ -384,3 +384,23 @@ int pci_dev_present(const struct pci_device_id *ids)
>  	return 0;
>  }
>  EXPORT_SYMBOL(pci_dev_present);
> +
> +/**
> + * pcie_find_root_port - Returns the root port the given device is connected to.
> + * @dev: PCI device for which the root port should be found.
> + */
> +struct pci_dev *pcie_find_root_port(struct pci_dev *dev)
> +{
> +	struct pci_bus *bus = dev->bus;
> +
> +	/* if this device is located on the root bus, it is a root port */
> +	if (pci_is_root_bus(bus))
> +		return dev;

It could also be a root complex endpoint or a conventional PCI
device/bridge sitting on the host bridge bus.

> +
> +	/* walk up the PCI hierarchy to the first level below the root */
> +	while (bus->parent && bus->parent->parent)
> +		bus = bus->parent;
> +
> +	return bus->self;
> +}
> +EXPORT_SYMBOL(pcie_find_root_port);

IMHO, this makes too many assumptions about the topology that it's
working with for a generic interface.  Your usage may be fairly fixed,
but there are too many cases where it could return something that's not
a root port as a general interface.  Thanks,

Alex

> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 211e9da8a7d7..308c71081034 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -844,6 +844,7 @@ static inline struct pci_dev *pci_get_bus_and_slot(unsigned int bus,
>  }
>  struct pci_dev *pci_get_class(unsigned int class, struct pci_dev *from);
>  int pci_dev_present(const struct pci_device_id *ids);
> +struct pci_dev *pcie_find_root_port(struct pci_dev *dev);
>  
>  int pci_bus_read_config_byte(struct pci_bus *bus, unsigned int devfn,
>  			     int where, u8 *val);
