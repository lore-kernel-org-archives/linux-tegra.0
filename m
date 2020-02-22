From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use pci_parse_request_of_pci_ranges()
Date: Sat, 22 Feb 2020 23:06:18 +0530
Message-ID: <c7392952-929a-5be4-ab06-9cf04810290f@nvidia.com>
References: <20191028225136.22289-1-robh@kernel.org>
 <20200221142051.GB15440@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200221142051.GB15440-LhTu/34fCX3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 2/21/2020 7:50 PM, Lorenzo Pieralisi wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, Oct 28, 2019 at 05:51:36PM -0500, Rob Herring wrote:
>> Convert Tegra PCI host driver to use the common
>> pci_parse_request_of_pci_ranges().
>>
>> This allows removing the DT ranges parsing, PCI resource handling, and
>> private storage of resources from the driver.
>>
>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
>> Cc: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
>> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
>> Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> ---
>> Here's one more conversion to use pci_parse_request_of_pci_ranges. It's
>> dependent on my prior series, specifically this patch[1].
>>
>> Compile tested only.
>>
>> Rob
>>
>> [1] https://patchwork.ozlabs.org/patch/1185555/
>>
>>   drivers/pci/controller/pci-tegra.c | 187 +++++++----------------------
>>   1 file changed, 46 insertions(+), 141 deletions(-)
> 
> Patch still applies, I need testing and ACK from Tegra maintainers
> please.
I tested this patch on Jetson-TX1 with NVMe drive connected to it.
Verified basic enumeration and functionality of the drive.

Tested-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks,
Vidya Sagar

> 
> Thanks,
> Lorenzo
> 
>> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
>> index 673a1725ef38..83d8209a372a 100644
>> --- a/drivers/pci/controller/pci-tegra.c
>> +++ b/drivers/pci/controller/pci-tegra.c
>> @@ -355,16 +355,6 @@ struct tegra_pcie {
>>        int irq;
>>
>>        struct resource cs;
>> -     struct resource io;
>> -     struct resource pio;
>> -     struct resource mem;
>> -     struct resource prefetch;
>> -     struct resource busn;
>> -
>> -     struct {
>> -             resource_size_t mem;
>> -             resource_size_t io;
>> -     } offset;
>>
>>        struct clk *pex_clk;
>>        struct clk *afi_clk;
>> @@ -797,38 +787,6 @@ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_relax_enable);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_relax_enable);
>>   DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_relax_enable);
>>
>> -static int tegra_pcie_request_resources(struct tegra_pcie *pcie)
>> -{
>> -     struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
>> -     struct list_head *windows = &host->windows;
>> -     struct device *dev = pcie->dev;
>> -     int err;
>> -
>> -     pci_add_resource_offset(windows, &pcie->pio, pcie->offset.io);
>> -     pci_add_resource_offset(windows, &pcie->mem, pcie->offset.mem);
>> -     pci_add_resource_offset(windows, &pcie->prefetch, pcie->offset.mem);
>> -     pci_add_resource(windows, &pcie->busn);
>> -
>> -     err = devm_request_pci_bus_resources(dev, windows);
>> -     if (err < 0) {
>> -             pci_free_resource_list(windows);
>> -             return err;
>> -     }
>> -
>> -     pci_remap_iospace(&pcie->pio, pcie->io.start);
>> -
>> -     return 0;
>> -}
>> -
>> -static void tegra_pcie_free_resources(struct tegra_pcie *pcie)
>> -{
>> -     struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
>> -     struct list_head *windows = &host->windows;
>> -
>> -     pci_unmap_iospace(&pcie->pio);
>> -     pci_free_resource_list(windows);
>> -}
>> -
>>   static int tegra_pcie_map_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
>>   {
>>        struct tegra_pcie *pcie = pdev->bus->sysdata;
>> @@ -909,36 +867,49 @@ static irqreturn_t tegra_pcie_isr(int irq, void *arg)
>>    */
>>   static void tegra_pcie_setup_translations(struct tegra_pcie *pcie)
>>   {
>> -     u32 fpci_bar, size, axi_address;
>> +     u32 size;
>> +     struct resource_entry *entry;
>> +     struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
>>
>>        /* Bar 0: type 1 extended configuration space */
>>        size = resource_size(&pcie->cs);
>>        afi_writel(pcie, pcie->cs.start, AFI_AXI_BAR0_START);
>>        afi_writel(pcie, size >> 12, AFI_AXI_BAR0_SZ);
>>
>> -     /* Bar 1: downstream IO bar */
>> -     fpci_bar = 0xfdfc0000;
>> -     size = resource_size(&pcie->io);
>> -     axi_address = pcie->io.start;
>> -     afi_writel(pcie, axi_address, AFI_AXI_BAR1_START);
>> -     afi_writel(pcie, size >> 12, AFI_AXI_BAR1_SZ);
>> -     afi_writel(pcie, fpci_bar, AFI_FPCI_BAR1);
>> -
>> -     /* Bar 2: prefetchable memory BAR */
>> -     fpci_bar = (((pcie->prefetch.start >> 12) & 0x0fffffff) << 4) | 0x1;
>> -     size = resource_size(&pcie->prefetch);
>> -     axi_address = pcie->prefetch.start;
>> -     afi_writel(pcie, axi_address, AFI_AXI_BAR2_START);
>> -     afi_writel(pcie, size >> 12, AFI_AXI_BAR2_SZ);
>> -     afi_writel(pcie, fpci_bar, AFI_FPCI_BAR2);
>> -
>> -     /* Bar 3: non prefetchable memory BAR */
>> -     fpci_bar = (((pcie->mem.start >> 12) & 0x0fffffff) << 4) | 0x1;
>> -     size = resource_size(&pcie->mem);
>> -     axi_address = pcie->mem.start;
>> -     afi_writel(pcie, axi_address, AFI_AXI_BAR3_START);
>> -     afi_writel(pcie, size >> 12, AFI_AXI_BAR3_SZ);
>> -     afi_writel(pcie, fpci_bar, AFI_FPCI_BAR3);
>> +     resource_list_for_each_entry(entry, &bridge->windows) {
>> +             u32 fpci_bar, axi_address;
>> +             struct resource *res = entry->res;
>> +
>> +             size = resource_size(res);
>> +
>> +             switch (resource_type(res)) {
>> +             case IORESOURCE_IO:
>> +                     /* Bar 1: downstream IO bar */
>> +                     fpci_bar = 0xfdfc0000;
>> +                     axi_address = pci_pio_to_address(res->start);
>> +                     afi_writel(pcie, axi_address, AFI_AXI_BAR1_START);
>> +                     afi_writel(pcie, size >> 12, AFI_AXI_BAR1_SZ);
>> +                     afi_writel(pcie, fpci_bar, AFI_FPCI_BAR1);
>> +                     break;
>> +             case IORESOURCE_MEM:
>> +                     fpci_bar = (((res->start >> 12) & 0x0fffffff) << 4) | 0x1;
>> +                     axi_address = res->start;
>> +
>> +                     if (res->flags & IORESOURCE_PREFETCH) {
>> +                             /* Bar 2: prefetchable memory BAR */
>> +                             afi_writel(pcie, axi_address, AFI_AXI_BAR2_START);
>> +                             afi_writel(pcie, size >> 12, AFI_AXI_BAR2_SZ);
>> +                             afi_writel(pcie, fpci_bar, AFI_FPCI_BAR2);
>> +
>> +                     } else {
>> +                             /* Bar 3: non prefetchable memory BAR */
>> +                             afi_writel(pcie, axi_address, AFI_AXI_BAR3_START);
>> +                             afi_writel(pcie, size >> 12, AFI_AXI_BAR3_SZ);
>> +                             afi_writel(pcie, fpci_bar, AFI_FPCI_BAR3);
>> +                     }
>> +                     break;
>> +             }
>> +     }
>>
>>        /* NULL out the remaining BARs as they are not used */
>>        afi_writel(pcie, 0, AFI_AXI_BAR4_START);
>> @@ -2157,76 +2128,10 @@ static int tegra_pcie_parse_dt(struct tegra_pcie *pcie)
>>        struct device *dev = pcie->dev;
>>        struct device_node *np = dev->of_node, *port;
>>        const struct tegra_pcie_soc *soc = pcie->soc;
>> -     struct of_pci_range_parser parser;
>> -     struct of_pci_range range;
>>        u32 lanes = 0, mask = 0;
>>        unsigned int lane = 0;
>> -     struct resource res;
>>        int err;
>>
>> -     if (of_pci_range_parser_init(&parser, np)) {
>> -             dev_err(dev, "missing \"ranges\" property\n");
>> -             return -EINVAL;
>> -     }
>> -
>> -     for_each_of_pci_range(&parser, &range) {
>> -             err = of_pci_range_to_resource(&range, np, &res);
>> -             if (err < 0)
>> -                     return err;
>> -
>> -             switch (res.flags & IORESOURCE_TYPE_BITS) {
>> -             case IORESOURCE_IO:
>> -                     /* Track the bus -> CPU I/O mapping offset. */
>> -                     pcie->offset.io = res.start - range.pci_addr;
>> -
>> -                     memcpy(&pcie->pio, &res, sizeof(res));
>> -                     pcie->pio.name = np->full_name;
>> -
>> -                     /*
>> -                      * The Tegra PCIe host bridge uses this to program the
>> -                      * mapping of the I/O space to the physical address,
>> -                      * so we override the .start and .end fields here that
>> -                      * of_pci_range_to_resource() converted to I/O space.
>> -                      * We also set the IORESOURCE_MEM type to clarify that
>> -                      * the resource is in the physical memory space.
>> -                      */
>> -                     pcie->io.start = range.cpu_addr;
>> -                     pcie->io.end = range.cpu_addr + range.size - 1;
>> -                     pcie->io.flags = IORESOURCE_MEM;
>> -                     pcie->io.name = "I/O";
>> -
>> -                     memcpy(&res, &pcie->io, sizeof(res));
>> -                     break;
>> -
>> -             case IORESOURCE_MEM:
>> -                     /*
>> -                      * Track the bus -> CPU memory mapping offset. This
>> -                      * assumes that the prefetchable and non-prefetchable
>> -                      * regions will be the last of type IORESOURCE_MEM in
>> -                      * the ranges property.
>> -                      * */
>> -                     pcie->offset.mem = res.start - range.pci_addr;
>> -
>> -                     if (res.flags & IORESOURCE_PREFETCH) {
>> -                             memcpy(&pcie->prefetch, &res, sizeof(res));
>> -                             pcie->prefetch.name = "prefetchable";
>> -                     } else {
>> -                             memcpy(&pcie->mem, &res, sizeof(res));
>> -                             pcie->mem.name = "non-prefetchable";
>> -                     }
>> -                     break;
>> -             }
>> -     }
>> -
>> -     err = of_pci_parse_bus_range(np, &pcie->busn);
>> -     if (err < 0) {
>> -             dev_err(dev, "failed to parse ranges property: %d\n", err);
>> -             pcie->busn.name = np->name;
>> -             pcie->busn.start = 0;
>> -             pcie->busn.end = 0xff;
>> -             pcie->busn.flags = IORESOURCE_BUS;
>> -     }
>> -
>>        /* parse root ports */
>>        for_each_child_of_node(np, port) {
>>                struct tegra_pcie_port *rp;
>> @@ -2766,6 +2671,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>>        struct pci_host_bridge *host;
>>        struct tegra_pcie *pcie;
>>        struct pci_bus *child;
>> +     struct resource *bus;
>>        int err;
>>
>>        host = devm_pci_alloc_host_bridge(dev, sizeof(*pcie));
>> @@ -2780,6 +2686,12 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>>        INIT_LIST_HEAD(&pcie->ports);
>>        pcie->dev = dev;
>>
>> +     err = pci_parse_request_of_pci_ranges(dev, &host->windows, NULL, &bus);
>> +     if (err) {
>> +             dev_err(dev, "Getting bridge resources failed\n");
>> +             return err;
>> +     }
>> +
>>        err = tegra_pcie_parse_dt(pcie);
>>        if (err < 0)
>>                return err;
>> @@ -2803,11 +2715,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>>                goto teardown_msi;
>>        }
>>
>> -     err = tegra_pcie_request_resources(pcie);
>> -     if (err)
>> -             goto pm_runtime_put;
>> -
>> -     host->busnr = pcie->busn.start;
>> +     host->busnr = bus->start;
>>        host->dev.parent = &pdev->dev;
>>        host->ops = &tegra_pcie_ops;
>>        host->map_irq = tegra_pcie_map_irq;
>> @@ -2816,7 +2724,7 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>>        err = pci_scan_root_bus_bridge(host);
>>        if (err < 0) {
>>                dev_err(dev, "failed to register host: %d\n", err);
>> -             goto free_resources;
>> +             goto pm_runtime_put;
>>        }
>>
>>        pci_bus_size_bridges(host->bus);
>> @@ -2835,8 +2743,6 @@ static int tegra_pcie_probe(struct platform_device *pdev)
>>
>>        return 0;
>>
>> -free_resources:
>> -     tegra_pcie_free_resources(pcie);
>>   pm_runtime_put:
>>        pm_runtime_put_sync(pcie->dev);
>>        pm_runtime_disable(pcie->dev);
>> @@ -2858,7 +2764,6 @@ static int tegra_pcie_remove(struct platform_device *pdev)
>>
>>        pci_stop_root_bus(host->bus);
>>        pci_remove_root_bus(host->bus);
>> -     tegra_pcie_free_resources(pcie);
>>        pm_runtime_put_sync(pcie->dev);
>>        pm_runtime_disable(pcie->dev);
>>
>> --
>> 2.20.1
>>
