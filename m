From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [RFC 5/5] PCI: tegra: use seq_open_data
Date: Wed, 25 Apr 2018 10:38:08 +0100
Message-ID: <20180425093808.GA15875@e107981-ln.cambridge.arm.com>
References: <20180301233724.20440-1-linux@rasmusvillemoes.dk>
 <20180301233724.20440-5-linux@rasmusvillemoes.dk>
 <20180302104207.GB27178@ulmo>
 <20180307124105.GE15139@e107981-ln.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180307124105.GE15139@e107981-ln.cambridge.arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 07, 2018 at 12:41:05PM +0000, Lorenzo Pieralisi wrote:
> On Fri, Mar 02, 2018 at 11:42:07AM +0100, Thierry Reding wrote:
> > On Fri, Mar 02, 2018 at 12:37:24AM +0100, Rasmus Villemoes wrote:
> > > Simplify the code slightly by having seq_open_data do the ->private
> > > assignment.
> > > 
> > > Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> > > ---
> > >  drivers/pci/host/pci-tegra.c | 11 +----------
> > >  1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > I had to go hunt for patch 1/5 to be able to tell if this is indeed
> > equivalent. It is, so:
> > 
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > Acked-by: Thierry Reding <treding@nvidia.com>
> 
> I can't apply this patch standalone so I assume this will go via
> some other tree; I will drop it from the PCI patch queue, if I
> should not please do let me know.

I would kindly ask you some feedback - where are we with this patch
series ? Please let me know if should consider it for the pci tree
as per my request above.

Thanks,
Lorenzo
