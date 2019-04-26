From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V5 11/16] dt-bindings: PHY: P2U: Add Tegra 194 P2U block
Date: Fri, 26 Apr 2019 13:05:09 -0500
Message-ID: <20190426180509.GB19329@bogus>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-12-vidyas@nvidia.com>
 <20190426154519.GA19329@bogus>
 <20190426160723.GB3204@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190426160723.GB3204@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, lorenzo.pieralisi@arm.com, bhelgaas@google.com, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 26, 2019 at 06:07:23PM +0200, Thierry Reding wrote:
> On Fri, Apr 26, 2019 at 10:45:19AM -0500, Rob Herring wrote:
> > On Wed, Apr 24, 2019 at 10:49:59AM +0530, Vidya Sagar wrote:
> > > Add support for Tegra194 P2U (PIPE to UPHY) module block which is a glue
> > > module instantiated one for each PCIe lane between Synopsys Designware core
> > > based PCIe IP and Universal PHY block.
> > 
> > Missing Sob.
> > 
> > > ---
> > > Changes since [v4]:
> > > * None
> > > 
> > > Changes since [v3]:
> > > * None
> > > 
> > > Changes since [v2]:
> > > * Changed node label to reflect new format that includes either 'hsio' or
> > >   'nvhs' in its name to reflect which UPHY brick they belong to
> > > 
> > > Changes since [v1]:
> > > * This is a new patch in v2 series
> > > 
> > >  .../bindings/phy/phy-tegra194-p2u.txt         | 28 +++++++++++++++++++
> > >  1 file changed, 28 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> > > 
> > > diff --git a/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> > > new file mode 100644
> > > index 000000000000..8b543cba483b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/phy-tegra194-p2u.txt
> > > @@ -0,0 +1,28 @@
> > > +NVIDIA Tegra194 P2U binding
> > > +
> > > +Tegra194 has two PHY bricks namely HSIO (High Speed IO) and NVHS (NVIDIA High
> > > +Speed) each interfacing with 12 and 8 P2U instances respectively.
> > > +A P2U instance is a glue logic between Synopsys DesignWare Core PCIe IP's PIPE
> > > +interface and PHY of HSIO/NVHS bricks. Each P2U instance represents one PCIe
> > > +lane.
> > > +
> > > +Required properties:
> > > +- compatible: For Tegra19x, must contain "nvidia,tegra194-p2u".
> > > +- reg: Should be the physical address space and length of respective each P2U
> > > +       instance.
> > > +- reg-names: Must include the entry "ctl".
> > 
> > -names is pointless when there is only 1.
> 
> We've occasionally done this in the past for other types of resources.
> When we did it was to preempt having to verbosely describe exactly what
> order -names entries need to be in if ever a new entry was required.
> 
> For example, if we document only one clock for a module and leave out
> the clock-names property, then if ever we need to add another clock, it
> means that clock-names must be documented in such a way that the "main"
> clock (the one that was always documented) would need to be first in the
> list of clock-names, so that it's matching entry in the clocks property
> is at index 0, because that's effectively what the ABI is.

The original clock at index 0 is part of the ABI with or without names 
as long as that clock is always required.

The purpose of '*-names' was to handle cases with multiple combinations 
of optional entries. That's the exception though and shouldn't be 
necessary too often. Clocks was an exception because the kernel's 
clock api required clock names (though only for more than 1). For the 
rest, everyone loves making up names and bloating their DT. (The last 
Plumbers had a discussion about replacing DT strings with numbers to 
shrink them, so it's not a non-issue for some.)

In any case, I only point this out if I have other comments and you all 
can keep it if you want. I'm just not a fan.

Rob
