From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Thu, 28 Jul 2016 15:43:28 -0500
Message-ID: <20160728204328.GA20218@localhost>
References: <20160630151931.29216-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160630151931.29216-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry and Arnd,

Thanks a lot for pushing this forward.  I would like to have gotten
this into the v4.8 merge window, but I didn't get to it soon enough.

On Thu, Jun 30, 2016 at 05:19:30PM +0200, Thierry Reding wrote:
> From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> 
> This patch makes the existing pci_host_bridge structure a proper device
> that is usable by PCI host drivers in a more standard way. In addition
> to the existing pci_scan_bus, pci_scan_root_bus, pci_scan_root_bus_msi,
> and pci_create_root_bus interfaces, this unfortunately means having to
> add yet another interface doing basically the same thing, and add some
> extra code in the initial step.
> 
> However, this time it's more likely to be extensible enough that we
> won't have to do another one again in the future, and we should be
> able to reduce code much more as a result.
> 
> The main idea is to pull the allocation of 'struct pci_host_bridge' out
> of the registration, and let individual host drivers and architecture
> code fill the members before calling the registration function.
> 
> There are a number of things we can do based on this:
> 
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
> 
> As mentioned in a previous email, one open question is whether we want
> to export a function for allocating a pci_host_bridge device in
> combination with the per-device structure or let the driver itself
> call kzalloc.

I agree with Arnd that a pci_host_bridge_alloc() would be nice.  The
pointer to alloc_etherdev() was very useful and probably worth
including in the changelog.  It helps a lot if we can copy the style
of some other subsystem, but my head is buried so deep in PCI that I
don't know what they do.

Looking forward to the next iteration.

Bjorn
