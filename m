From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 6/6] PCI: designware: use new OF interrupt mapping
 when possible
Date: Fri, 4 Apr 2014 11:05:17 -0600
Message-ID: <20140404170517.GH9007@google.com>
References: <1394025951-32438-1-git-send-email-l.stach@pengutronix.de>
 <1394025951-32438-7-git-send-email-l.stach@pengutronix.de>
 <20140305184219.GA29903@obsidianresearch.com>
 <20140404170341.GG9007@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140404170341.GG9007-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 04, 2014 at 11:03:41AM -0600, Bjorn Helgaas wrote:
> On Wed, Mar 05, 2014 at 11:42:19AM -0700, Jason Gunthorpe wrote:
> > On Wed, Mar 05, 2014 at 02:25:51PM +0100, Lucas Stach wrote:
> > > -	return pp->irq;
> > > +	irq = of_irq_parse_and_map_pci(dev, slot, pin);
> > > +	if (!irq)
> > > +		irq = pp->irq;
> > 
> > In light of the two bugs that Tim found, it might be wise to throw a
> > 'dev_warn(FW_BUG "Missing DT interrupt mapping")' in the fall back
> > path, so it doesn't continue to silently cover up errors on the OF/DT
> > side..
> 
> This sounds like a reasonable thing to do, but I didn't see a response to
> this comment.  Should I merge it as-is, or do you want to add the message?

Oh, and I suppose the same question applies to the other host drivers in
this series (tegra, rcar)?
