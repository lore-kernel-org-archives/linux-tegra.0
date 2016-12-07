From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 01/10] PCI: Add new method for registering PCI hosts
Date: Wed, 7 Dec 2016 11:58:22 -0600
Message-ID: <20161207175821.GA22129@bhelgaas-glaptop.roam.corp.google.com>
References: <20161125105718.3866-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161125105718.3866-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Nov 25, 2016 at 11:57:09AM +0100, Thierry Reding wrote:
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

I really like this idea.  Can you include pointers to similar
interfaces in other subsystems?  I'm hoping to reuse existing designs
as much as possible, including using similar names.

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

The next patch implements the former, doesn't it?  If this is no
longer an open question, let's update this changelog.

> Changes in v3 (Thierry Reding):
> - swap out pci_host_bridge_init() for pci_alloc_host_bridge() with an
>   extra parameter specifying the size of the driver's private data
> - rename pci_host_bridge_register() to pci_register_host_bridge() for
>   more consistency with existing functions
> - split patches into smaller chunks to make diff more readable
> 
> Changes in v2 (Thierry Reding):
> - add a pci_host_bridge_init() helper that drivers can use to perform
>   all the necessary steps to initialize the bridge
> - rename pci_register_host() to pci_host_bridge_register() to reflect
>   the naming used by other functions
> - plug memory leak on registration failure

You can also omit these v2/v3 change comments from the changelog; it's
useful to have them in a 0/n cover letter or after the "---" line in
an individual patch.  I omit them from the git changelogs because
they're not very useful after the patches get merged.

Bjorn
