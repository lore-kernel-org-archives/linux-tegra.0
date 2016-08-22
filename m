From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 2/4] PCI: Allow driver-specific data in host bridge
Date: Mon, 22 Aug 2016 16:00:42 +0200
Message-ID: <26481704.zoJheIBO1p@wuerfel>
References: <20160815153647.1075-1-thierry.reding@gmail.com> <20160815153647.1075-2-thierry.reding@gmail.com> <20160819165506.GA11823@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819165506.GA11823@red-moon>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday, August 19, 2016 5:55:06 PM CEST Lorenzo Pieralisi wrote:
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index 93583b389058..ecf543014da3 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -521,16 +521,19 @@ static void pci_release_host_bridge_dev(struct device *dev)
> >       kfree(bridge);
> >  }
> >  
> > -static struct pci_host_bridge *pci_alloc_host_bridge(void)
> > +static struct pci_host_bridge *pci_alloc_host_bridge(size_t priv)
> >  {
> >       struct pci_host_bridge *bridge;
> >  
> > -     bridge = kzalloc(sizeof(*bridge), GFP_KERNEL);
> > +     bridge = kzalloc(sizeof(*bridge) + priv, GFP_KERNEL);
> >       if (!bridge)
> >               return NULL;
> >  
> >       INIT_LIST_HEAD(&bridge->windows);
> >  
> > +     if (priv)
> > +             bridge->private = &bridge[1];
> 
> How about making private a zero length array ?

Right, the member can actually be removed here if we want to, this
was just meant as a shorthand so we can avoid the cast or function
call in device drivers. I think either way makes sense.

Also, someone commented on a related issue in the previous version, and I
recommended to align it to ARCH_SLAB_MINALIGN. This might be done more
easily with the zero-length array using

struct pci_host_bridge {
	...

	unsigned long private[0] __attribute__((aligned(ARCH_SLAB_MINALIGN)));
};

Without this, we need a bit more computation, like
	
	bridge = kzalloc(ALIGN(sizeof(*bridge), ARCH_SLAB_MINALIGN) + priv, GFP_KERNEL);
	bridge->private = (void *)bridge + ALIGN(sizeof(*bridge);

or

static inline void *pci_bridge_private(struct pci_host_bridge *bridge)
{
	return (void *)bridge + ALIGN(sizeof(*bridge);
}
static inline struct pci_host_bridge *pci_bridge_from_private(void *priv)
{
	return priv - ALIGN(sizeof(*bridge);
}

The alignment is needed if the private structure contains any data that
we may want to transfer using DMA.

	Arnd
