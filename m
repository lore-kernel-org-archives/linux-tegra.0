From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/2] PCI: tegra: apply relaxed ordering fixup only on
 Tegra
Date: Wed, 10 Dec 2014 15:15:55 +0100
Message-ID: <1418220955.7616.9.camel@pengutronix.de>
References: <1415907457-3147-1-git-send-email-l.stach@pengutronix.de>
	 <1415907457-3147-2-git-send-email-l.stach@pengutronix.de>
	 <CAAVeFu+sYnhMEmDSPvinbP-BQQnqAu6rpEVgaLx25Y3UtGVUwQ@mail.gmail.com>
	 <1418120897.2741.1.camel@pengutronix.de>
	 <20141210121339.GA23558@ulmo.nvidia.com>
	 <1418214220.7616.7.camel@pengutronix.de>
	 <20141210141130.GG23558@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141210141130.GG23558-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Mittwoch, den 10.12.2014, 15:11 +0100 schrieb Thierry Reding:
> On Wed, Dec 10, 2014 at 01:23:40PM +0100, Lucas Stach wrote:
> > Am Mittwoch, den 10.12.2014, 13:13 +0100 schrieb Thierry Reding:
> > > On Tue, Dec 09, 2014 at 11:28:17AM +0100, Lucas Stach wrote:
> > > > Am Dienstag, den 09.12.2014, 12:23 +0900 schrieb Alexandre Courbot:
> > > > > Hi Lucas,
> > > > > 
> > > > > Apologies for taking so long to come back to this. The patch looks ok
> > > > > to me, just a minor comment about the Tegra PCI detection:
> > > > > 
> > > > > On Fri, Nov 14, 2014 at 4:37 AM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> > > > > > The fixup to enable relaxed ordering on all PCI devices was
> > > > > > executed unconditionally if the Tegra PCI host driver was
> > > > > > built into the kernel. This doesn't play nice with a
> > > > > > multiplatform kernel executed on other platforms which
> > > > > > may not need this fixup.
> > > > > >
> > > > > > Make sure to only apply the fixup if the root port is
> > > > > > a Tegra.
> > > > > >
> > > > > > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > > > ---
> > > > > >  drivers/pci/host/pci-tegra.c | 26 +++++++++++++++++++++++++-
> > > > > >  1 file changed, 25 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > > > > > index 3d43874319be..d5a14f22ebb8 100644
> > > > > > --- a/drivers/pci/host/pci-tegra.c
> > > > > > +++ b/drivers/pci/host/pci-tegra.c
> > > > > > @@ -647,10 +647,34 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0bf1, tegra_pcie_fixup_class);
> > > > > >  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1c, tegra_pcie_fixup_class);
> > > > > >  DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_NVIDIA, 0x0e1d, tegra_pcie_fixup_class);
> > > > > >
> > > > > > +static int tegra_pcie_root_is_tegra(struct pci_dev *dev)
> > > > > > +{
> > > > > > +       struct pci_bus *bus = dev->bus;
> > > > > > +       struct pci_dev *root_bridge;
> > > > > > +
> > > > > > +       /* walk up the PCIe hierarchy to the first level below the root bus */
> > > > > > +       while (bus->parent && bus->parent->self)
> > > > > > +               bus = bus->parent;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * If there is no bridge on the bus the passed device is the root
> > > > > > +        * bridge itself.
> > > > > > +        */
> > > > > > +       root_bridge = bus->self ? bus->self : dev;
> > > > > > +       if (root_bridge->vendor == PCI_VENDOR_ID_NVIDIA &&
> > > > > > +           (root_bridge->device == 0x0bf0 || root_bridge->device == 0x0bf1 ||
> > > > > > +            root_bridge->device == 0x0e1c || root_bridge->device == 0x0e1d ||
> > > > > > +            root_bridge->device == 0x0e12 || root_bridge->device == 0x0e13))
> > > > > > +               return 1;
> > > > > 
> > > > > I am not very familiar with PCI so sorry if these are stupid
> > > > > questions, but where do these device IDs come from? Are they needed at
> > > > > all, e.g. can't you just test against root_bridge->vendor ==
> > > > > PCI_VENDOR_ID_NVIDIA to detect a NVIDIA root? Is the list susceptible
> > > > > to increase as new chips get released? If that's the case, how can we
> > > > > make sure we won't forget to update it?
> > > > > 
> > > > 
> > > > The device IDs are assigned by NVIDIA HW for the different Tegra PCI
> > > > generation/link width combinations. Note that the K1 TRM is wrong as it
> > > > still lists the T30 device IDs, instead of the ones used on K1.
> > > > 
> > > > While we technically could test only against vendor==nvidia I don't
> > > > think it is entirely safe. As this is a PCI fixup it will get executed
> > > > on every device running a kernel including this PCI host bridge driver. 
> > > > 
> > > > So only testing for the vendor assumes that every ARM device with a PCI
> > > > host bridge built by NVIDIA will be a Tegra. Do you think this is a
> > > > reasonable assertion? I'm on the fence here.
> > > >  
> > > > > If you need to test against the device ID, it might be more legible
> > > > > (and easier to update) if you use a switch case, e.g:
> > > > > 
> > > > >     if (root_bridge->vendor != PCI_VENDOR_ID_NVIDIA)
> > > > >         return 0;
> > > > >     switch (root_bridge->device) {
> > > > >     case 0x0bf0:
> > > > >     case 0x0bf1:
> > > > >     case 0x0e1c:
> > > > >     case 0x0e1d:
> > > > >     case 0x0e12:
> > > > >     case 0x0e12:
> > > > >         return 1;
> > > > >     default:
> > > > >         return 0;
> > > > >     }
> > > > > 
> > > > Right, this looks nicer and easier to extend. I'll have to think about
> > > > if we need the device IDs at all and respin accordingly.
> > > 
> > > I think using the device ID is fine. If nothing else it'll at least
> > > document the various device IDs. Perhaps you could extend this patch
> > > with comments as to which device ID maps to which SoC. Or better yet
> > > add them to include/linux/pci_ids.h with names matching the SoC.
> > > 
> > The IDs used by the Tegra root ports are not shared between multiple
> > drivers, so no way for them to go into that file.
> 
> Since when has that been a requirement? Randomly grepping for a couple
> of the IDs defined in that file they are either not used at all or in a
> single driver.
> 
It's stated right in the header of that file and I've seen quite a few
occasions where this rule has been enforced. If there are entries in
there that are only used by a single driver that's either legacy entries
or bad review.

Regards,
Lucas

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |
