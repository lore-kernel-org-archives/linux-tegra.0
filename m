From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Use different MSI target address for Tegra20
Date: Thu, 28 Sep 2017 21:57:19 -0500
Message-ID: <20170929025719.GZ15970@bhelgaas-glaptop.roam.corp.google.com>
References: <20170923061740.6012-1-treding@nvidia.com>
 <CAN7O0+JyG3XT5SsWGsiZs0vrk0ha1vQ5N7rjYxs3tM_NvdONdw@mail.gmail.com>
 <20170928141912.GB28022@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170928141912.GB28022@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: vidya sagar <sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 28, 2017 at 04:19:12PM +0200, Thierry Reding wrote:
> On Mon, Sep 25, 2017 at 10:44:29AM +0530, vidya sagar wrote:
> > Inline...
> > 
> > On Sat, Sep 23, 2017 at 11:47 AM, Thierry Reding
> > <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >
> > > The Tegra20 PCIe controller has a different address range for MSI, so
> > > select a different target address.
> > >
> > > Fixes: d7bd554f27c9 ("PCI: tegra: Do not allocate MSI target memory")
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/pci/host/pci-tegra.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > > index e8e1ddbaabc9..5b02ea59524b 100644
> > > --- a/drivers/pci/host/pci-tegra.c
> > > +++ b/drivers/pci/host/pci-tegra.c
> > > @@ -1563,8 +1563,18 @@ static int tegra_pcie_enable_msi(struct tegra_pcie *pcie)
> > >          * none of the Tegra SoCs that contain this PCI host bridge can
> > >          * address more than 16 GiB of system memory, the last 4 KiB of
> > >          * these 1012 GiB is a good candidate.
> > > +        *
> > > +        * Unfortunately, Tegra20 is slightly different in that the physical
> > > +        * address for this MSI region is limited to the lower 32 bits of the
> > > +        * address map, so the address that we pick is going to have to be
> > > +        * located somewhere within the region addressable by the CPU and
> > > +        * on-SoC controllers. To be on the safe side, we select an address
> > > +        * from a region that is marked unused (0xf0010000 - 0xfffeffff).
> > >          */
> > > -       msi->phys = 0xfcfffff000;
> > > +       if (soc->msi_base_shift > 0)
> > > +               msi->phys = 0xfcfffff000;
> > > +       else
> > > +               msi->phys = 0x00f0010000;
> > 
> > Can we use this for later Tegra chip versions as well?
> > Reason being, if an end point's config space says that it cannot
> > support >32-bit MSI addresses (Marvel SATA controller being one
> > example), with the current code, we still allocate an address of
> > >32-bits, resulting in end point not being able to generate MSI
> > interrupt (as it discards >32-bits where generating upstream memory
> > write transaction for MSI)
> 
> Looks like the universal fix for this may not be trivial, so perhaps in
> the meantime this one could go in in order to restore MSI for TrimSlice
> (and other Tegra20 boards)?
> 
> Bjorn: do you have any objections to taking this into v4.13 via a stable
> backport? 32-bit only MSI were never guaranteed to work because prior to
> this patch the address was taken from an allocated page, which may or
> may not have been > 4 GiB.
> 
> We could then go and fix 32-bit MSI hopefully in time for 4.14, but it'd
> be a shame if v4.13 keeps being broken just because we're trying to
> settle on the right solution for 32-bit MSI.

I don't know your hardware, so I don't have any suggestions about your
strategy for choosing addresses.

To me it looks slightly obscure to use "soc->msi_base_shift == 0" to
identify SoCs that can only use 32-bit MSI, but maybe that makes sense
if you know the hardware.

The stable backport policy is that the fix must first exist in Linus'
tree.  The normal path is for fixes to be merged for v4.15, so they
wouldn't appear in Linus' tree until after v4.14 releases.

If I merge a fix via for-linus, it could be merged to Linus' tree
before v4.14 and could be backported to v4.13 before v4.14.  But we'd
have to make a case for doing that, e.g., this fixes a regression or
something we broke during the v4.14 merge window, or it's some other
serious bug fix.

Bjorn
