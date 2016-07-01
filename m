From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 1/2] PCI: Add new method for registering PCI hosts
Date: Fri, 01 Jul 2016 16:24:50 +0200
Message-ID: <6212651.41bebQZ9BM@wuerfel>
References: <20160630151931.29216-1-thierry.reding@gmail.com> <5307392.exoejlJp9x@wuerfel> <20160701141447.GB8609@e106497-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160701141447.GB8609-2JSQmVVBSi7ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Tomasz Nowicki <tn-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday, July 1, 2016 3:14:47 PM CEST Liviu Dudau wrote:
> 
> I'm confused. Why are we butchering the old pci_alloc_host_bridge() function
> to then go back and add re-add it in a different form?

Good point, we could just keep the existing implementation and make it
an exported function without the bus argument.

> The old pci_alloc_host_bridge() was doing mostly what the above
> function does minus the bridge->private line. And the &bridge[1] construct
> could very well be pointing to the next struct pci_host_bridge aligned address,
> which means parts of priv area are ignored.

I don't know what you mean with that. Would you rather write this as?

	bridge->private = bridge + 1;

or leave it out and add a helper function

void *pci_host_bridge_private(struct pci_host_bridge *bridge)
{
	return &bridge[1];
}

or do you mean we should have extra alignment in there so the
private pointer has a minimum alignment higher than the
alignment of struct pci_host_bridge?

I'm absolutely fine with any of those suggestions, whichever
makes the nicest API.

	Arnd
