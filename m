From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 01 Jul 2016 17:17:11 +0200
Message-ID: <14945085.QO6LcyFgTY@wuerfel>
References: <20160630151931.29216-1-thierry.reding@gmail.com> <6212651.41bebQZ9BM@wuerfel> <20160701145244.GD8609@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160701145244.GD8609-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday, July 1, 2016 3:52:44 PM CEST Liviu Dudau wrote:
> 
> > 
> > or do you mean we should have extra alignment in there so the
> > private pointer has a minimum alignment higher than the
> > alignment of struct pci_host_bridge?
> 
> but this ^. bridge pointer arithmetic means +1 is not necessarily +sizeof(struct pci_host_bridge)
> bytes. AFAIK that can be rounded to the nearest natural alignment for pointers on that
> architecture.

No, that's not how it works.

> > I'm absolutely fine with any of those suggestions, whichever
> > makes the nicest API.
> 
> Does anyone need to subclass the pci_host_bridge structure? And is appending data right
> after the structure useful?

I was basically following the way alloc_etherdev() and a lot of other
subsystems handle it.

	Arnd
