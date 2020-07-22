From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/19] PCI: Another round of host clean-ups
Date: Wed, 22 Jul 2020 16:06:19 -0500
Message-ID: <20200722210619.GA1313543@bjorn-Precision-5520>
References: <20200722022514.1283916-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200722022514.1283916-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gustavo Pimentel <gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Hou Zhiqiang <Zhiqiang.Hou-3arQi8VN3Tc@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Karthikeyan Mitran <m.karthikeyan-DTHOJn6Rh8lhmhkoCovsdw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Marek Vasut <marek.vasut+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Murali Karicheri <m-karicheri2-l0cyMroinI0@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Richard Zhu <hongxing.zhu-3arQi8VN3Tc@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer@p>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 21, 2020 at 08:24:55PM -0600, Rob Herring wrote:
> Here's another round PCI host bridge clean-ups. This one aims to
> reduce the amount of duplication in host probe functions by providing
> more default initialization of the pci_host_bridge. With the prior
> clean-ups, it's now possible to alloc and initialize the pci_host_bridge
> struct from DT in one step.
> 
> Patches 2 and 3 drop some pci_host_bridge init. Patches 4-11 clean-up
> handling of root bus number and bus ranges. Patches 12 and 13 are cleanups
> for Cadence driver. Patches 14 and 15 are clean-ups for rCar driver. Patch
> 16 makes missing non-prefetchable region just a warning instead of an
> error in order to work with rcar-gen2. Patch 17 converts rcar-gen2 to not
> use the arm32 specific PCI setup. Patch 18 updates how the DT resource
> parsing is done for all the controller drivers. Any other new controller
> drivers will need updating. Patch 19 moves the default IRQ mapping to
> the bridge init core code.
> 
> This is based on my previous series of clean-ups[1].
> 
> Compile tested only. Any testing would be appreciated as I don't have
> any of this h/w (well, I have a rock960c, but have not gotten PCIe to work
> on it).
> 
> Rob
> 
> [1] https://lore.kernel.org/linux-pci/20200522234832.954484-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org/
> 
> Rob Herring (19):
>   PCI: versatile: Drop flag PCI_ENABLE_PROC_DOMAINS
>   PCI: Set default bridge parent device
>   PCI: Drop unnecessary zeroing of bridge fields
>   PCI: aardvark: Use pci_is_root_bus() to check if bus is root bus
>   PCI: designware: Use pci_is_root_bus() to check if bus is root bus
>   PCI: mobiveil: Use pci_is_root_bus() to check if bus is root bus
>   PCI: xilinx-nwl: Use pci_is_root_bus() to check if bus is root bus
>   PCI: xilinx: Use pci_is_root_bus() to check if bus is root bus
>   PCI: rockchip: Use pci_is_root_bus() to check if bus is root bus
>   PCI: rcar: Use pci_is_root_bus() to check if bus is root bus
>   PCI: Move setting pci_host_bridge.busnr out of host drivers
>   PCI: cadence: Use bridge resources for outbound window setup
>   PCI: cadence: Remove private bus number and range storage
>   PCI: rcar: Use devm_pci_alloc_host_bridge()
>   PCI: rcar: Use struct pci_host_bridge.windows list directly
>   PCI: of: Reduce missing non-prefetchable memory region to a warning
>   PCI: rcar-gen2: Convert to use modern host bridge probe functions
>   PCI: Move DT resource setup into devm_pci_alloc_host_bridge()
>   PCI: Set bridge map_irq and swizzle_irq to default functions
> 
>  .../pci/controller/cadence/pcie-cadence-ep.c  |   6 +-
>  .../controller/cadence/pcie-cadence-host.c    |  65 +++----
>  drivers/pci/controller/cadence/pcie-cadence.c |   9 +-
>  drivers/pci/controller/cadence/pcie-cadence.h |   8 +-
>  drivers/pci/controller/dwc/pci-imx6.c         |   2 +-
>  drivers/pci/controller/dwc/pci-keystone.c     |   4 +-
>  .../pci/controller/dwc/pcie-designware-host.c |  28 +--
>  drivers/pci/controller/dwc/pcie-designware.h  |   2 -
>  .../controller/mobiveil/pcie-mobiveil-host.c  |  21 +--
>  .../pci/controller/mobiveil/pcie-mobiveil.h   |   1 -
>  drivers/pci/controller/pci-aardvark.c         |  25 +--
>  drivers/pci/controller/pci-ftpci100.c         |  10 --
>  drivers/pci/controller/pci-host-common.c      |  17 +-
>  drivers/pci/controller/pci-loongson.c         |   8 -
>  drivers/pci/controller/pci-mvebu.c            |   4 -
>  drivers/pci/controller/pci-rcar-gen2.c        | 162 +++++-------------
>  drivers/pci/controller/pci-tegra.c            |  10 --
>  drivers/pci/controller/pci-v3-semi.c          |  12 --
>  drivers/pci/controller/pci-versatile.c        |  13 +-
>  drivers/pci/controller/pci-xgene.c            |   9 -
>  drivers/pci/controller/pcie-altera.c          |  10 --
>  drivers/pci/controller/pcie-brcmstb.c         |   9 -
>  drivers/pci/controller/pcie-iproc-platform.c  |  10 +-
>  drivers/pci/controller/pcie-iproc.c           |   3 -
>  drivers/pci/controller/pcie-mediatek.c        |  16 --
>  drivers/pci/controller/pcie-rcar-host.c       |  73 +-------
>  drivers/pci/controller/pcie-rockchip-host.c   |  24 +--
>  drivers/pci/controller/pcie-rockchip.h        |   1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c      |  20 +--
>  drivers/pci/controller/pcie-xilinx.c          |  22 +--
>  drivers/pci/of.c                              |  45 +++--
>  drivers/pci/pci.h                             |   8 +
>  drivers/pci/probe.c                           |   7 +
>  include/linux/pci.h                           |  12 --
>  34 files changed, 160 insertions(+), 516 deletions(-)

Beautiful, thanks for doing all this!

Acked-by: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
