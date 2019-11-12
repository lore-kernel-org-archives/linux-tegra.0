From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mailbox: tegra: Fix superfluous IRQ error message
Date: Tue, 12 Nov 2019 15:07:46 +0100
Message-ID: <20191112140746.GA1333127@kroah.com>
References: <20191011083459.11551-1-jonathanh@nvidia.com>
 <20191014132458.GG422231@ulmo>
 <f5cd4647-4349-f20c-bc16-da9291fc9329@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f5cd4647-4349-f20c-bc16-da9291fc9329@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 12, 2019 at 12:02:02PM +0000, Jon Hunter wrote:
> Hi Greg,
> 
> On 14/10/2019 14:24, Thierry Reding wrote:
> > On Fri, Oct 11, 2019 at 09:34:59AM +0100, Jon Hunter wrote:
> >> Commit 7723f4c5ecdb ("driver core: platform: Add an error message to
> >> platform_get_irq*()") added an error message to avoid drivers having
> >> to print an error message when IRQ lookup fails. However, there are
> >> some cases where IRQs are optional and so new optional versions of
> >> the platform_get_irq*() APIs have been added for these cases.
> >>
> >> The IRQs for Tegra HSP module are optional because not all instances
> >> of the module have the doorbell and all of the shared interrupts.
> >> Hence, since the above commit was applied the following error messages
> >> are now seen on Tegra194 ...
> >>
> >>  ERR KERN tegra-hsp c150000.hsp: IRQ doorbell not found
> >>  ERR KERN tegra-hsp c150000.hsp: IRQ shared0 not found
> >>
> >> The Tegra HSP driver deliberately does not fail if these are not found
> >> and so fix the above errors by updating the Tegra HSP driver to use
> >> the platform_get_irq_byname_optional() API.
> >>
> >> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >> ---
> >>  drivers/mailbox/tegra-hsp.c | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > Perhaps Greg should pick up this patch because he's carrying the patch
> > that adds the platform_get_irq_byname_optional() patch for v5.5.
> > 
> > Greg, would you prefer a copy of this in your mailbox, or does the
> > following patchwork link suffice:
> > 
> > 	http://patchwork.ozlabs.org/patch/1175012/
> > 
> > Either way, this patch:
> > 
> > Acked-by: Thierry Reding <treding@nvidia.com>
> > 
> > Thierry
> 
> Are you OK to pick this up? Do you need Jassi's ACK as well?

Sorry, I'll take it as-is, it should be fine.

greg k-h
