From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V5 03/16] PCI: Export pcie_bus_config symbol
Date: Fri, 10 May 2019 11:46:23 -0500
Message-ID: <20190510164623.GI235064@google.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-4-vidyas@nvidia.com>
 <20190503110732.GC32400@ulmo>
 <80616ff5-d7a5-84a4-a71b-569e340d128c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <80616ff5-d7a5-84a4-a71b-569e340d128c@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Jonathan Hunter <jonathanh@nvidia.com>, "kishon@ti.com" <kishon@ti.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>, Mikko Perttunen <mperttunen@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel@list
List-Id: linux-tegra@vger.kernel.org

Hi Vidya,

On Fri, May 10, 2019 at 11:51:24AM +0530, Vidya Sagar wrote:
> > -----Original Message-----
> > From: linux-pci-owner@vger.kernel.org <linux-pci-owner@vger.kernel.org> On
> > Behalf Of Thierry Reding
> > Sent: Friday, May 3, 2019 4:38 PM
> > To: Vidya Sagar <vidyas@nvidia.com>
> > On Wed, Apr 24, 2019 at 10:49:51AM +0530, Vidya Sagar wrote:
> > > Export pcie_bus_config to enable host controller drivers setting it to
> > > a specific configuration be able to build as loadable modules
> > >
> > > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>

> > It doesn't look to me like this is something that host controller drivers are
> > supposed to change. This is set via the pci kernel command- line parameter,
> > meaning it's a way of tuning the system configuration.
> > Drivers should not be allowed to override this after the fact.
> > 
> > Why do we need to set this?
> Here is the reason I'm doing it.
> First things first, Tegra194 supports MPS up to 256 bytes.
> Assume there are two endpoints with MPS supported up to
> a) 128 bytes (Ex:- Realtek NIC with 8168 controller)
> b) 256 bytes (Ex:- Kingston NVMe drive)
> Now, leaving "pcie_bus_config" untouched in the driver sets it to
> PCIE_BUS_DEFAULT by default. With this setting, for both (a) and (b),
> MPS is set to 128, which means, even though Tegra194 supports 256 MPS, it is not
> set to 256 even in case of (b) thereby not using RP's 256 MPS feature.
> If I explicitly set pcie_bus_config=PCIE_BUS_PERFORMACE in the code, then 256 MPS is set when
> (b) is connected, but when (a) is connected, for root port MPS 256 is set and for
> endpoint MPS 128 is set, because of which root port tries to send packets with 256
> payload that breaks functionality of Realtek NIC card.
> The best option I've found out is that when I set 256 in PCI_EXP_DEVCTL of root port
> explicitly before link up and use pcie_bus_config=PCIE_BUS_SAFE, then, I get the best of both
> PCIE_BUS_DEFAULT and PCIE_BUS_PERFORMANCE i.e. with (a) connected, MPS is set to 128 in both RP
> and EP and with (b) connected, MPS is set to 256 in both RP and EP.
> 
> So, is it like, pcie_bus_config shouldn't be set to anything explicitly in the driver and depending on the
> platform and what is connected to root port, kernel parameter can be passed with appropriate setting?

Host controller drivers shouldn't change this unless there's some host
controller defect that means the generic code can't do the right
thing.  Even then, I'd prefer that the host controller driver merely
set a quirk bit that describes the defect, e.g., "mps_*_broken".  Then
the generic code could pay attention to that and we wouldn't have to
make "pcie_bus_config" a part of the ABI.

From your description, it sounds like there's nothing actually wrong
with the Tegra194 hardware, but the generic code isn't as smart about
setting MPS as it possibly could be.  My solution to that would be to
make the generic code smarter so everybody can benefit.

Bjorn

> > > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c index
> > > f5ff01dc4b13..731f78508601 100644
> > > --- a/drivers/pci/pci.c
> > > +++ b/drivers/pci/pci.c
> > > @@ -94,6 +94,7 @@ unsigned long pci_hotplug_mem_size =
> > > DEFAULT_HOTPLUG_MEM_SIZE;  unsigned long pci_hotplug_bus_size =
> > > DEFAULT_HOTPLUG_BUS_SIZE;
> > >
> > >  enum pcie_bus_config_types pcie_bus_config = PCIE_BUS_DEFAULT;
> > > +EXPORT_SYMBOL_GPL(pcie_bus_config);
> > >
> > >  /*
> > >   * The default CLS is used if arch didn't set CLS explicitly and not
> > > --
> > > 2.17.1
> > >
