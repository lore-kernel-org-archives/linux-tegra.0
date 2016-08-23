From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 4/4] PCI: tegra: Use new pci_register_host_bridge()
 interface
Date: Tue, 23 Aug 2016 15:01:37 +0100
Message-ID: <20160823140137.GC9953@red-moon>
References: <20160815153647.1075-1-thierry.reding@gmail.com>
 <20160815153647.1075-4-thierry.reding@gmail.com>
 <20160819171300.GB11823@red-moon>
 <2181889.X0BmtRgjvi@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2181889.X0BmtRgjvi@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 22, 2016 at 03:50:54PM +0200, Arnd Bergmann wrote:
> On Friday, August 19, 2016 6:13:00 PM CEST Lorenzo Pieralisi wrote:
> > On Mon, Aug 15, 2016 at 05:36:47PM +0200, Thierry Reding wrote:
> > > From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > 
> > > Tegra is one of the remaining platforms that still use the traditional
> > > pci_common_init_dev() interface for probing PCI host bridges.
> > > 
> > > This demonstrates how to convert it to the pci_register_host interface
> > > I just added in a previous patch. This leads to a more linear probe
> > > sequence that can handle errors better because we avoid callbacks into
> > > the driver, and it makes the driver architecture independent.
> > > 
> > > As a side note, I should mention that I noticed this driver does not
> > > register any IORESOURCE_IO resource with the bus, but instead registers
> > > the I/O port window as a memory resource, which is surely a bug.
> > 
> > I do not think that's true (and these comments do not belong in
> > a commit log anyway). It registers both; granted the way
> > the resources are named is a bit misleading, but by looking
> > at the code it seems correct to me (struct tegra_pcie.{io/pio}).
> 
> Hmm, I don't remember when or why I wrote this comment, but it seems
> you are right. This was apparently fixed by 5106787a9e08 ("PCI: tegra:
> Use physical range for I/O mapping"), which I reviewed and which
> has been applied a long time ago, surely before I sent the first
> version of this patch.
> 
> > > Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/pci/host/pci-tegra.c | 99 +++++++++++++++++++++++---------------------
> > >  1 file changed, 52 insertions(+), 47 deletions(-)
> > > 
> > > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > > index 2d520755b1d7..6737d1be9798 100644
> > > --- a/drivers/pci/host/pci-tegra.c
> > > +++ b/drivers/pci/host/pci-tegra.c
> > > @@ -260,6 +260,7 @@ static inline struct tegra_msi *to_tegra_msi(struct msi_controller *chip)
> > >  }
> > >  
> > >  struct tegra_pcie {
> > > +     struct pci_host_bridge *bridge;
> > 
> > If we go for the zero length array approach we would remove this
> > pointer too, since it would be superfluos, a container_of would
> > just do, right ?
> 
> Regardless of whether we have a zero-length array or the current
> code, we can provide a helper function that computes the pointer
> to the pci_host_bridge from the tegra_pcie pointer.

Yes, that's true as I said it is just a matter of choosing the
best way to implement it but the mechanism is pretty much identical.

Lorenzo
