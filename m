From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 09/10] PCI: tegra: Add Tegra194 PCIe support
Date: Wed, 3 Apr 2019 12:36:41 -0500
Message-ID: <20190403173641.GI141706@google.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-10-git-send-email-vidyas@nvidia.com>
 <20190329203159.GG24180@google.com>
 <5eb9599c-a6d6-d3a3-beef-5225ed7393f9@nvidia.com>
 <20190402183110.GE141706@google.com>
 <dcbfbb32-9980-7ee4-89cd-baedfe624ce5@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <dcbfbb32-9980-7ee4-89cd-baedfe624ce5@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.com, yue.wang@amlogic.com, shawn.lin@rock-chips.com, xiaowei.bao@nxp.com, devicetree@vger.ker
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 03, 2019 at 03:13:09PM +0530, Vidya Sagar wrote:
> On 4/3/2019 12:01 AM, Bjorn Helgaas wrote:
> > On Tue, Apr 02, 2019 at 12:47:48PM +0530, Vidya Sagar wrote:
> > > On 3/30/2019 2:22 AM, Bjorn Helgaas wrote:
> > > > On Tue, Mar 26, 2019 at 08:43:26PM +0530, Vidya Sagar wrote:
> > > > > Add support for Synopsys DesignWare core IP based PCIe host controller
> > > > > present in Tegra194 SoC.
> > 
> >    - Why does this chip require pcie_pme_disable_msi()?  The only other
> >      use is a DMI quirk for "MSI Wind U-100", added by c39fae1416d5
> >      ("PCI PM: Make it possible to force using INTx for PCIe PME
> >      signaling").
>
> Because Tegra194 doesn't support raising PME interrupts through MSI line.

What does the spec say about this?  Is hardware supposed to support
MSI for PME?  Given that MSI Wind U-100 and Tegra194 are the only two
cases we know about where PME via MSI isn't supported, it seems like
there must be either a requirement for that or some mechanism for the
OS to figure this out, e.g., a capability bit.

> > > > I see that an earlier patch added "bus" to struct pcie_port.
> > > > I think it would be better to somehow connect to the
> > > > pci_host_bridge struct.  Several other drivers already do
> > > > this; see uses of pci_host_bridge_from_priv().
> > >
> > > All non-DesignWare based implementations save their private data
> > > structure in 'private' pointer of struct pci_host_bridge and use
> > > pci_host_bridge_from_priv() to get it back. But, DesignWare
> > > based implementations save pcie_port in 'sysdata' and nothing in
> > > 'private' pointer. So,  I'm not sure if
> > > pci_host_bridge_from_priv() can be used in this case. Please do
> > > let me know if you think otherwise.
> > 
> > DesignWare-based drivers should have a way to retrieve the
> > pci_host_bridge pointer.  It doesn't have to be *exactly* the same
> > as non-DesignWare drivers, but it should be similar.
>
> I gave my reasoning as to why with the current code, it is not
> possible to get the pci_host_bridge structure pointer from struct
> pcie_port pointer in another thread as a reply to Thierry Reding's
> comments. Since Jishen'g changes to support remove functionality are
> accepted, I think using bus pointer saved in struct pcie_port
> pointer shouldn't be any issue now. Please do let me know if that is
> something not acceptable.
>
> > > > That would give you the bus, as well as flags like
> > > > no_ext_tags, native_aer, etc, which this driver, being a host
> > > > bridge driver that's responsible for this part of the
> > > > firmware/OS interface, may conceivably need.

I think saving the pp->root_bus pointer as Jisheng's patch does is a
sub-optimal solution.  If we figure out how to save the
pci_host_bridge pointer, we automatically get the root bus pointer as
well.

It may require some restructuring to save the pci_host_bridge pointer,
but I doubt it's really *impossible*.

> > > > > +static int tegra_pcie_dw_runtime_suspend(struct device *dev)
> > > > > +{
> > > > > +	struct tegra_pcie_dw *pcie = dev_get_drvdata(dev);
> > > > > +
> > > > > +	tegra_pcie_downstream_dev_to_D0(pcie);
> > > > > +
> > > > > +	pci_stop_root_bus(pcie->pci.pp.bus);
> > > > > +	pci_remove_root_bus(pcie->pci.pp.bus);
> > > > 
> > > > Why are you calling these?  No other drivers do this except in
> > > > their .remove() methods.  Is there something special about
> > > > Tegra, or is this something the other drivers *should* be
> > > > doing?
> > >
> > > Since this API is called by remove, I'm removing the hierarchy
> > > to safely bring down all the devices. I'll have to re-visit this
> > > part as Jisheng Zhang's patches
> > > https://patchwork.kernel.org/project/linux-pci/list/?series=98559
> > > are now approved and I need to verify this part after
> > > cherry-picking Jisheng's changes.
> > 
> > Tegra194 should do this the same way as other drivers, independent
> > of Jisheng's changes.
>
> When other Designware implementations add remove functionality, even
> they should be calling these APIs (Jisheng also mentioned the same
> in his commit message)

My point is that these APIs should be called from driver .remove()
methods, not from .runtime_suspend() methods.

Bjorn
