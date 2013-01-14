From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Mon, 14 Jan 2013 09:57:07 +0000
Message-ID: <20130114095706.GA23467@arm.com>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130111154516.GA25335@avionic-0098.adnet.avionic-design.de>
 <20130112123640.GA22505@avionic-0098.adnet.avionic-design.de>
 <201301122112.25772.arnd@arndb.de>
 <20130113095806.GA31966@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130113095806.GA31966-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jan 13, 2013 at 09:58:06AM +0000, Thierry Reding wrote:
> On Sat, Jan 12, 2013 at 09:12:25PM +0000, Arnd Bergmann wrote:
> > On Saturday 12 January 2013, Thierry Reding wrote:
> > > > I already hinted at that in one of the other subthreads. Having such a
> > > > multiplex would also allow the driver to be built as a module. I had
> > > > already thought about this when I was working on an earlier version of
> > > > these patches. Basically these would be two ops attached to the host
> > > > bridge, and the generic arch_setup_msi_irq() could then look that up
> > > > given the struct pci_dev that is passed to it and call this new per-
> > > > host bridge .setup_msi_irq().
> > > 
> > > struct pci_ops looks like a good place to put these. They'll be
> > > available from each struct pci_bus, so should be easy to call from
> > > arch_setup_msi_irq().
> > > 
> > > Any objections?
> > > 
> > 
> > struct pci_ops has a long history of being specifically about
> > config space read/write operations, so on the one hand it does
> > not feel like the right place to put interrupt specific operations,
> > but on the other hand, the name sounds appropriate and I cannot
> > think of any other place to put this, so it's fine with me.
> > 
> > The only alternative I can think of is to introduce a new
> > structure next to it in struct pci_bus, but that feels a bit
> > pointless. Maybe Bjorn has a preference one way or the other.
> 
> The name pci_ops is certainly generic enough. Also the comment above the
> structure declaration says "Low-level architecture-dependent routines",
> which applies to the MSI functions as well.

I've previously looked into this. It seems that architectures handle this
in different ways, some use vector tables, others use a multiplex and others
just let the end user implement the callback directly.

I've made an attempt to find a more common way. Though my implementation, which
I will try to share later today for reference provides a registration function
in drivers/pci/msi.c to provide implementations of the
(setup|teardown)_msi_irq(s) ops. This seems slightly better than the current
approach and doesn't break existing users - but is still ugly.

At present the PCI and MSI frameworks are largely uncoupled from each other and
so I was keen to not pollute PCI structures (e.g. pci_ops) with MSI ops. Just
because most PCI host bridges also provide MSI support I don't think there is a
reason why they should always come as a pair or be provided by the same chip.

Perhaps the solution is to support MSI controller drivers and a means to
associate them with PCI host controller drivers?

Andrew Murray
