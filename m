From: Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>
Subject: Re: [PATCH 1/7] PCI: tegra: replace devm_request_and_ioremap by
 devm_ioremap_resource
Date: Mon, 19 Aug 2013 14:07:54 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1308191405450.2313@hadrien>
References: <1376911241-27720-1-git-send-email-Julia.Lawall@lip6.fr> <1376911241-27720-2-git-send-email-Julia.Lawall@lip6.fr> <20130819120249.GA5740@ulmo>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130819120249.GA5740@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On Mon, 19 Aug 2013, Thierry Reding wrote:

> On Mon, Aug 19, 2013 at 01:20:35PM +0200, Julia Lawall wrote:
> > From: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> >
> > Use devm_ioremap_resource instead of devm_request_and_ioremap.
> >
> > This was done using the semantic patch
> > scripts/coccinelle/api/devm_ioremap_resource.cocci
> >
> > Error-handling code was manually removed from the associated calls to
> > platform_get_resource.
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
> >
> > ---
> > The first block of modified code is followed by a call to
> > devm_request_mem_region for pcie->cs with no associated ioremap.  Should
> > ioremap be used in this case as well?
>
> No. The pcie->cs resource is 256 MiB so it's challenging to map it at
> once. Furthermore it requires a non-linear mapping so we do it on
> demand.

OK, thanks for the explanation.  Is the comment, though, a little
misleading, since the mapping is not done here?

/* request and remap configuration space */

julia
