From: Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/2] PCI: tegra: apply relaxed ordering fixup only on
 Tegra
Date: Tue, 9 Dec 2014 15:31:17 -0700
Message-ID: <20141209223117.GA6692@google.com>
References: <1415907457-3147-1-git-send-email-l.stach@pengutronix.de>
 <1415907457-3147-2-git-send-email-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1415907457-3147-2-git-send-email-l.stach@pengutronix.de>
Sender: linux-pci-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 13, 2014 at 08:37:36PM +0100, Lucas Stach wrote:
> The fixup to enable relaxed ordering on all PCI devices was
> executed unconditionally if the Tegra PCI host driver was
> built into the kernel. This doesn't play nice with a
> multiplatform kernel executed on other platforms which
> may not need this fixup.
> 
> Make sure to only apply the fixup if the root port is
> a Tegra.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/pci/host/pci-tegra.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> index 3d43874319be..d5a14f22ebb8 100644
> --- a/drivers/pci/host/pci-tegra.c
> +++ b/drivers/pci/host/pci-tegra.c
> @@ -647,10 +647,34 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_fixup_class);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_fixup_class);
>  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_fixup_class);
>  
> +static int tegra_pcie_root_is_tegra(struct pci_dev *dev)
> +{
> +	struct pci_bus *bus = dev->bus;
> +	struct pci_dev *root_bridge;
> +
> +	/* walk up the PCIe hierarchy to the first level below the root bus */
> +	while (bus->parent && bus->parent->self)
> +		bus = bus->parent;
> +
> +	/*
> +	 * If there is no bridge on the bus the passed device is the root
> +	 * bridge itself.
> +	 */
> +	root_bridge = bus->self ? bus->self : dev;
> +	if (root_bridge->vendor == PCI_VENDOR_ID_NVIDIA &&
> +	    (root_bridge->device == 0x0bf0 || root_bridge->device == 0x0bf1 ||
> +	     root_bridge->device == 0x0e1c || root_bridge->device == 0x0e1d ||
> +	     root_bridge->device == 0x0e12 || root_bridge->device == 0x0e13))

This looks like a good fix.  Can you rework it slightly to:

  - Use "root_port" instead of "root_bridge" to match the spec terminology.
    When people say "root bridge," they usually mean a host bridge, which
    is not a PCI device.

  - Is it feasible to factor out the hierarchy traversal into something
    like a separate pcie_root_port(pci_dev *) interface?  I think that
    might be useful other places as well.

Bjorn

> +		return 1;
> +
> +	return 0;
> +}
>  /* Tegra PCIE requires relaxed ordering */
>  static void tegra_pcie_relax_enable(struct pci_dev *dev)
>  {
> -	pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_RELAX_EN);
> +	if (tegra_pcie_root_is_tegra(dev))
> +		pcie_capability_set_word(dev, PCI_EXP_DEVCTL,
> +					 PCI_EXP_DEVCTL_RELAX_EN);
>  }
>  DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, tegra_pcie_relax_enable);
>  
> -- 
> 2.1.1
> 
