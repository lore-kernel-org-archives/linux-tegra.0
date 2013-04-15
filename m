From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 07/12] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Mon, 15 Apr 2013 12:28:12 -0600
Message-ID: <516C46BC.2040707@wwwdotorg.org>
References: <1365000318-28256-1-git-send-email-thierry.reding@avionic-design.de>
 <1365000318-28256-8-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365000318-28256-8-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/03/2013 08:45 AM, Thierry Reding wrote:
> Move the PCIe driver from arch/arm/mach-tegra into the drivers/pci/host
> directory. The motivation is to collect various host controller drivers
> in the same location in order to facilitate refactoring.
> 
> The Tegra PCIe driver has been largely rewritten, both in order to turn
> it into a proper platform driver and to add MSI (based on code by
> Krishna Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>) as well as device tree support.

> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c

> +struct tegra_msi {
> +	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
> +	struct irq_domain *domain;
> +	struct msi_chip chip;

Nit: You could move that to be the first field in the struct, then
to_tegra_msi() would end up being a no-op, which might save a byte or two.

> +static int tegra_pcie_write_conf(struct pci_bus *bus, unsigned int devfn,
> +				 int where, int size, u32 value)
...
> +	if (bus->number == 0) {
> +		unsigned int slot = PCI_SLOT(devfn);
> +		struct tegra_pcie_port *port;
> +
> +		list_for_each_entry(port, &pcie->ports, list) {
> +			if (port->index + 1 == slot) {
> +				addr = port->base + (where & ~3);
> +				break;
> +			}
> +		}
> +	} else {
> +		addr = tegra_pcie_bus_map(pcie, bus->number);
> +		if (!addr) {
> +			dev_err(pcie->dev,
> +				"failed to map cfg. space for bus %u\n",
> +				bus->number);
> +			return PCIBIOS_DEVICE_NOT_FOUND;
> +		}
> +
> +		addr += tegra_pcie_conf_offset(devfn, where);
> +	}

It seems like that chunk of code could be shared between
tegra_pcie_read_conf() and tegra_pcie_write_conf().

Also, tegra_pcie_read_conf() checks again for addr == NULL and returns
if so. read and write should be consistent.

> +static void tegra_pcie_port_free(struct tegra_pcie_port *port)
> +{
> +	struct tegra_pcie *pcie = port->pcie;
> +
> +	devm_iounmap(pcie->dev, port->base);
> +	devm_release_mem_region(pcie->dev, port->regs.start,
> +				resource_size(&port->regs));
> +	list_del(&port->list);
> +	devm_kfree(pcie->dev, port);
> +}

Do ports get allocated and freed separately from the host controller,
such that it's actually worth manually calling the
devm_iounmap/release/free functions?

> +static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
...
> +	/* disable all exceptions */
> +	afi_writel(pcie, 0, AFI_FPCI_ERROR_MASKS);

Is that a good idea?

> +static int tegra_pcie_get_resources(struct tegra_pcie *pcie)

> +	err = devm_request_irq(&pdev->dev, pcie->irq, tegra_pcie_isr,
> +			       IRQF_SHARED, "PCIE", pcie);

devm_request_irq and IRQF_SHARED sounds like a bad combination; what if
the IRQ goes off after this driver's remove() is called, but before the
driver core devm cleanup runs?

> +static irqreturn_t tegra_pcie_msi_irq(int irq, void *data)
...
> +	return IRQ_HANDLED;

Shouldn't this function return IRQ_NONE if no MSI status bits were found
set?

> +static int tegra_pcie_enable_msi(struct tegra_pcie *pcie)

> +	/* setup AFI/FPCI range */
> +	msi->pages = __get_free_pages(GFP_KERNEL, 3);

If tegra_msi_setup_irq() hard-codes the MSI address as msi->pages, then
I expect you can get away with a single page here. Of course, perhaps
tegra_msi_setup_irq() is supposed to give a different address to every
MSI client? Even so, 256 clients * 4 bytes is still less than 1 page.

> +static u32 tegra_pcie_get_xbar_config(struct tegra_pcie *pcie, u32 lanes)
> +{
> +	struct device_node *np = pcie->dev->of_node;
> +
> +	switch (lanes) {
> +	case 0x00000004:
> +		dev_info(pcie->dev, "single-mode configuration\n");
> +		return AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_SINGLE;
> +
> +	case 0x00000202:
> +		dev_info(pcie->dev, "dual-mode configuration\n");
> +		return AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_DUAL;
> +	}
> +
> +	return 0;

Shouldn't that return an error, and dev_err() about it? If not, then I
think using one of the #defines for the default would make the result a
lot more obvious.

> +static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)

> +	pcie->xbar_config = tegra_pcie_get_xbar_config(pcie, lanes);
> +	if (!pcie->xbar_config) {
> +		dev_err(pcie->dev, "invalid lane configuration\n");
> +		return -EINVAL;
> +	}

Oh, but AFI_PCIE_CONFIG_SM2TMS0_XBAR_CONFIG_SINGLE==0, which is valid...

> +static bool tegra_pcie_port_check_link(struct tegra_pcie_port *port)
...
> +			if (value & 0x20000000)
> +				return true;

Can we use a #define for 0x20000000?

> +static int tegra_pcie_enable(struct tegra_pcie *pcie)
> +{
> +	struct tegra_pcie_port *port, *tmp;
> +	struct hw_pci hw;
> +
> +	list_for_each_entry_safe(port, tmp, &pcie->ports, list) {
> +		dev_info(pcie->dev, "probing port %u, using %u lanes\n",
> +			 port->index, port->lanes);
> +
> +		tegra_pcie_port_enable(port);
> +
> +		if (tegra_pcie_port_check_link(port))
> +			continue;
> +
> +		dev_info(pcie->dev, "link %u down, ignoring\n", port->index);
> +
> +		tegra_pcie_port_disable(port);
> +		tegra_pcie_port_free(port);
> +	}

Why is that needed; when would a port get enabled if it was already
enabled, and if it was already enabled, wouldn't you want this function
to be a no-op rather than destroying everything and starting again?

> +static int tegra_pcie_probe(struct platform_device *pdev)
...
> +	pcibios_min_mem = 0;

What does that mean/do? I wonder if that should be set to 0x80000000 by
the Tegra30 patches?
