From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: PCI: tegra: Add device tree support
 for T194
Date: Tue, 2 Apr 2019 14:21:50 -0500
Message-ID: <20190402192150.GF141706@google.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-6-git-send-email-vidyas@nvidia.com>
 <20190328131508.GB5518@ulmo>
 <e5a12742-2dfa-e8c8-2a29-24838f4fa939@nvidia.com>
 <20190401150740.GB4874@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190401150740.GB4874@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Vidya Sagar <vidyas@nvidia.com>, mark.rutland@arm.com, heiko@sntech.de, hayashi.kunihiko@socionext.com, maxime.ripard@bootlin.com, catalin.marinas@arm.com, spujar@nvidia.com, will.deacon@arm.com, kthota@nvidia.com, mperttunen@nvidia.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com, stefan.wahren@i2se.com, lorenzo.pieralisi@arm.com, krzk@kernel.org, kishon@ti.com, tiwai@suse.de, jagan@amarulasolutions.com, linux-pci@vger.kernel.org, andy.gross@linaro.org, shawn.lin@rock-chips.com, devicetree@vger.kernel.org, mmaddireddy@nvidia.com, marc.w.gonzalez@free.fr, liviu.dudau@arm.com, yue.wang@amlogic.com, enric.balletbo@collabora.com, robh+dt@kernel.org, horms+renesas@verge.net.au, bjorn.andersson@linaro.org, ezequiel@collabora.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 01, 2019 at 05:07:40PM +0200, Thierry Reding wrote:
> On Mon, Apr 01, 2019 at 03:31:54PM +0530, Vidya Sagar wrote:
> > On 3/28/2019 6:45 PM, Thierry Reding wrote:
> > > On Tue, Mar 26, 2019 at 08:43:22PM +0530, Vidya Sagar wrote:
> > > > Add support for Tegra194 PCIe controllers. These controllers are based
> > > > on Synopsys DesignWare core IP.

> > > > +- nvidia,disable-aspm-states : controls advertisement of ASPM states
> > > > +    bit-0 to '1' : disables advertisement of ASPM-L0s
> > > > +    bit-1 to '1' : disables advertisement of ASPM-L1. This also disables
> > > > +                 advertisement of ASPM-L1.1 and ASPM-L1.2
> > > > +    bit-2 to '1' : disables advertisement of ASPM-L1.1
> > > > +    bit-3 to '1' : disables advertisement of ASPM-L1.2
> > > 
> > > These seem more like configuration options rather than hardware
> > > description.
> > Yes. Since the platforms like Jetson-Xavier based on T194 are going to go in
> > open market, we are providing these configuration options and hence they are
> > optional
> 
> Under what circumstances would we want to disable certain ASPM states?
> My understanding is that PCI device drivers can already disable
> individual ASPM states if they don't support them, so why would we ever
> want to disable advertisement of certain ASPM states?

The PCI core (not individual device drivers) configures ASPM, and if both
ends of the link implement the spec correctly, there is nothing the device
driver needs to do.

There *are* a few drivers that fiddle with ASPM-related things.  I think
this is because either the core isn't doing things correctly and we haven't
bothered to fix the root cause, or the device itself is broken and we need
to disable something the hardware claims to support.

Bjorn
