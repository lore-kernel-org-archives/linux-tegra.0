From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/6] PCI: tegra: use new OF interrupt mapping when possible
Date: Fri, 7 Mar 2014 01:25:28 +0100
Message-ID: <201403070125.28582.arnd@arndb.de>
References: <1394025951-32438-1-git-send-email-l.stach@pengutronix.de> <5318B232.2020507@wwwdotorg.org> <1394127555.4582.1.camel@weser.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394127555.4582.1.camel-WzVe3FnzCwFR6QfukMTsflXZhhPuCNm+@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 06 March 2014, Lucas Stach wrote:
> Am Donnerstag, den 06.03.2014, 10:36 -0700 schrieb Stephen Warren:
> > On 03/05/2014 06:25 AM, Lucas Stach wrote:
> > > This is the recommended method of doing the IRQ
> > > mapping. For old devicetrees we fall back to the
> > > previous practice.
> > 
> > Tested-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > 
> > I tested both with and without patch 1/6, and the PCIe-based NIC on
> > Beaver worked fine either way. Without patch 1/6, I do see:
> > 
> > pci 0000:00:01.0: of_irq_parse_pci() failed with rc=-22
> > 
> > ... but that seems reasonable given that the DT that of_irq_parse_pci()
> > parses is missing, and did correctly trigger the fallback path, so
> > everything still worked.
> 
> Yes, this should be normal. It spits this error for old DTs, but keeps
> doing the right thing. I'm not sure if we should downgrade this to info
> or dbg.

No, I think printing an error like this is appropriate: it is an incentive
to update the dts files, but doesn't look too urgent as long as everything
still works.

	Arnd
