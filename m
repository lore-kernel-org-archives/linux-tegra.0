From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 01 Jul 2016 17:58:50 +0200
Message-ID: <5683703.E1NK8ak7mr@wuerfel>
References: <20160630151931.29216-1-thierry.reding@gmail.com> <14945085.QO6LcyFgTY@wuerfel> <20160701154046.GE8609@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160701154046.GE8609-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday, July 1, 2016 4:40:46 PM CEST Liviu Dudau wrote:
> On Fri, Jul 01, 2016 at 05:17:11PM +0200, Arnd Bergmann wrote:
> > On Friday, July 1, 2016 3:52:44 PM CEST Liviu Dudau wrote:
> > > 
> > > > 
> > > > or do you mean we should have extra alignment in there so the
> > > > private pointer has a minimum alignment higher than the
> > > > alignment of struct pci_host_bridge?
> > > 
> > > but this ^. bridge pointer arithmetic means +1 is not necessarily +sizeof(struct pci_host_bridge)
> > > bytes. AFAIK that can be rounded to the nearest natural alignment for pointers on that
> > > architecture.
> > 
> > No, that's not how it works.
> 
> Really? If struct foo takes 31 bytes, and struct foo *p = (struct foo*)64, what's p's
> value after p++ ? 95? I thought the compiler is allowed to consider the structure padded so that
> p++ is 96.

In that example, sizeof(struct foo) is 32, so we get to the right result,
for any type, this is true:

	(char *)((struct foo *)p + 1) == (char *)p + sizeof(struct foo);

However, there is indeed a problem in the case that the private structure
requires a larger alignment than struct pci_host_bridge, so adding some
bytes for alignment the way that alloc_etherdev() does is probably
a good idea to be on the safe side, so we could do

	bridge = kzalloc(ALIGN(sizeof(struct pci_host_bridge), ARCH_KMALLOC_MINALIGN) +
					     sizeof_priv, GFP_KERNEL);
	priv = PTR_ALIGN(bridge + 1, ARCH_KMALLOC_MINALIGN);

which will guarantee that both bridge and priv are aligned to
ARCH_KMALLOC_MINALIGN and the allocation is large enough to hold
both.

	Arnd
