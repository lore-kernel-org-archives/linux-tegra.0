From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH V7 02/15] PCI: Disable MSI for Tegra194 root port
Date: Tue, 21 May 2019 14:36:16 -0500
Message-ID: <20190521193616.GE57618@google.com>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-3-vidyas@nvidia.com>
 <20190521102729.GB29166@ulmo>
 <f63051b0-a220-125b-219e-25156d65ea6d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <f63051b0-a220-125b-219e-25156d65ea6d@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, kishon@ti.com, kthota@nvidia.com, Thierry Reding <thierry.reding@gmail.com>, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On Tue, May 21, 2019 at 10:17:26PM +0530, Vidya Sagar wrote:
> On 5/21/2019 3:57 PM, Thierry Reding wrote:
> > On Fri, May 17, 2019 at 06:08:33PM +0530, Vidya Sagar wrote:
> > > Tegra194 rootports don't generate MSI interrupts for PME events and hence
> > > MSI needs to be disabled for them to avoid root ports service drivers
> > > registering their respective ISRs with MSI interrupt.

The service drivers (AER, hotplug, etc) don't know whether the
interrupt is INTx or MSI; they just register their ISRs with
pcie_device.irq.

The point of this patch is that the PCI core doesn't support devices
that use MSI and INTx at the same time, and since this device can't
generate MSI for PME, we have to use INTx for *all* its interrupts.

> > > Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> > > ---
> > > Changes since [v6]:
> > > * This is a new patch
> > > 
> > >   drivers/pci/quirks.c | 14 ++++++++++++++
> > >   1 file changed, 14 insertions(+)
> > > 
> > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > index 0f16acc323c6..28f9a0380df5 100644
> > > --- a/drivers/pci/quirks.c
> > > +++ b/drivers/pci/quirks.c
> > > @@ -2592,6 +2592,20 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA,
> > >   			PCI_DEVICE_ID_NVIDIA_NVENET_15,
> > >   			nvenet_msi_disable);
> > > +/*
> > > + * Tegra194's PCIe root ports don't generate MSI interrupts for PME events
> > > + * instead legacy interrupts are generated. Hence, to avoid service drivers
> > > + * registering their respective ISRs for MSIs, need to disable MSI interrupts
> > > + * for root ports.
> > > + */
> > > +static void disable_tegra194_rp_msi(struct pci_dev *dev)
> > > +{
> > > +	dev->no_msi = 1;
> > > +}
> > > +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad0, disable_tegra194_rp_msi);
> > > +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad1, disable_tegra194_rp_msi);
> > > +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x1ad2, disable_tegra194_rp_msi);
> > > +
> > 
> > Later functions in this file seem to use a more consistent naming
> > pattern, according to which the name for this would become:
> > 
> > 	pci_quirk_nvidia_tegra194_disable_rp_msi
> > 
> > Might be worth considering making this consistent.
> > 
> > This could also be moved to the DWC driver to restrict this to where it
> > is needed. In either case, this seems like a good solution, so:
> > 
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > 
> Ok. I'll move it to DWC driver along with name change for the quirk API.

Is there any possibility this hardware would be used in an ACPI
system?  If so, the quirk should probably stay in drivers/pci/quirks.c
because the DWC driver would not be present.

Either way, please also add some PCIe spec references about this in
the changelog and a comment in the code about working around this
issue.  I think the MSI/MSI-X sections that prohibit a device from
using both INTx and MSI/MSI-X are probably the most pertinent.

The reason I want a comment about this is to discourage future
hardware from following this example because every device that *does*
follow this example requires a kernel update that would be otherwise
unnecessary.

Bjorn
